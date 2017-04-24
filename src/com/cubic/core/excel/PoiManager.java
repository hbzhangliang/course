package com.cubic.core.excel;


import com.cubic.core.excel.annotations.Excel;
import com.cubic.core.excel.annotations.ExcelTemplete;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Service;

import java.io.*;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class PoiManager {
  public List excelImpt(Integer sheetNum, InputStream is, Class entityClass) throws Exception {
    if (!entityClass.isAnnotationPresent(ExcelTemplete.class))
      return Collections.EMPTY_LIST;
    List excelList = new ArrayList();
    ExcelTemplete excelTemplete = (ExcelTemplete) entityClass
        .getAnnotation(ExcelTemplete.class);
    Workbook wb = WorkbookFactory.create(is);
    Sheet sheet = wb.getSheetAt(sheetNum);
    int rows = sheet.getPhysicalNumberOfRows();
    int rowStartNum = excelTemplete.rowStartNum();
    for (int r = rowStartNum; r < rows; r++) {
      Row row = sheet.getRow(r);
      if (row == null) {
        continue;
      }
      Object obj = entityClass.newInstance();
      for (Field field : entityClass.getDeclaredFields()) {
        if (field.isAnnotationPresent(Excel.class)) {
          Excel excel = field.getAnnotation(Excel.class);
          Cell cell = row.getCell(excel.cell());
          field.setAccessible(true);
          if (cell == null) {
            continue;
          }
          switch (cell.getCellType()) {
            case Cell.CELL_TYPE_FORMULA:
              field.set(obj, cell.getNumericCellValue() + "");
              break;
            case Cell.CELL_TYPE_NUMERIC:
              if (HSSFDateUtil.isCellDateFormatted(cell))
                field.set(obj, cell.getDateCellValue());
              else
                field.set(obj, cell.getNumericCellValue() + "");
              break;
            case Cell.CELL_TYPE_STRING:
              field.set(obj, cell.getStringCellValue());
              break;
            default:
          }
        }
      }
      excelList.add(obj);
    }
    return excelList;
  }

  public InputStream excelExp(Integer sheetNum, List<?> list, InputStream is) throws Exception {
    if (list != null && list.size() > 0) {
    } else {
      return null;
    }
    Class entityClass = list.get(0).getClass();
    ExcelTemplete excelTemplete = (ExcelTemplete) entityClass
        .getAnnotation(ExcelTemplete.class);

    URL base = Thread.currentThread().getContextClassLoader().getResource(
        "");
    Workbook wb = null;
    if (is == null) {
      File file = new File(base.getFile(), "../template/"
          + excelTemplete.name());
      if (!file.exists()) {
        return null;
      }
      FileInputStream fis = new FileInputStream(file);
      wb = WorkbookFactory.create(fis);
    } else {
      wb = WorkbookFactory.create(is);
    }
    Sheet sheet = wb.getSheetAt(sheetNum);
    int rows = sheet.getPhysicalNumberOfRows();
    int rowStartNum = excelTemplete.rowStartNum();
    Iterator iter = list.iterator();
    while (iter.hasNext()) {
      Object obj = iter.next();
      Row row = sheet.getRow(rowStartNum);
      if (row == null) {
        row = sheet.createRow(rowStartNum);
      }
      for (Field field : obj.getClass().getDeclaredFields()) {
        if (field.isAnnotationPresent(Excel.class)) {
          field.setAccessible(true);
          Excel excel = (Excel) field.getAnnotation(Excel.class);
          Cell cell = null;
          cell = row.getCell(excel.cell());
          if (cell == null) {
            cell = row.createCell(excel.cell());
            Row tempRow = sheet.getRow(rowStartNum - 1);
            cell.setCellStyle(tempRow.getCell(excel.cell())
                .getCellStyle());
          }
          Object cellValue = field.get(obj);
          if (cellValue != null)
            cell.setCellValue(cellValue.toString());
        }
      }
      rowStartNum++;
    }
    ByteArrayOutputStream os = new ByteArrayOutputStream(256);
    wb.write(os);
    ByteArrayInputStream bis = new ByteArrayInputStream(os.toByteArray());
    os.close();
    bis.close();
    return bis;
  }


  /**
   * 取得单元格的值
   *
   * @param cell
   * @return
   * @throws IOException
   */
  private static Object getCellValue(HSSFCell cell) throws IOException {
    Object value = "";
    if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
      value = cell.getRichStringCellValue().toString();
    } else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
      if (HSSFDateUtil.isCellDateFormatted(cell)) {
        Date date = cell.getDateCellValue();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        value = sdf.format(date);
      } else {
        double value_temp = (double) cell.getNumericCellValue();
        BigDecimal bd = new BigDecimal(value_temp);
        BigDecimal bd1 = bd.setScale(3, bd.ROUND_HALF_UP);
        value = bd1.doubleValue();
                 
                /*
                DecimalFormat format = new DecimalFormat("#0.###");
                value = format.format(cell.getNumericCellValue());
                */
      }
    } else if (cell.getCellType() == Cell.CELL_TYPE_FORMULA) {
      value = cell.getNumericCellValue();
    }
    if (cell.getCellType() == HSSFCell.CELL_TYPE_BLANK) {
      value = "";
    }
    return value;
  }

  /**
   * 判断单元格在不在合并单元格范围内，如果是，获取其合并的列数。
   *
   * @param sheet   工作表
   * @param cellRow 被判断的单元格的行号
   * @param cellCol 被判断的单元格的列号
   * @return
   * @throws IOException
   */
  private static int getMergerCellRegionCol(HSSFSheet sheet, int cellRow, int cellCol) throws IOException {
    int retVal = 0;
    int sheetMergerCount = sheet.getNumMergedRegions();
    for (int i = 0; i < sheetMergerCount; i++) {
      CellRangeAddress cra = (CellRangeAddress) sheet.getMergedRegion(i);
      int firstRow = cra.getFirstRow();  // 合并单元格CELL起始行
      int firstCol = cra.getFirstColumn(); // 合并单元格CELL起始列
      int lastRow = cra.getLastRow(); // 合并单元格CELL结束行
      int lastCol = cra.getLastColumn(); // 合并单元格CELL结束列
      if (cellRow >= firstRow && cellRow <= lastRow) { // 判断该单元格是否是在合并单元格中
        if (cellCol >= firstCol && cellCol <= lastCol) {
          retVal = lastCol - firstCol + 1; // 得到合并的列数
          break;
        }
      }
    }
    return retVal == 0 ? 1 : retVal;
  }

  /**
   * 判断单元格是否是合并的单格，如果是，获取其合并的行数。
   *
   * @param sheet   表单
   * @param cellRow 被判断的单元格的行号
   * @param cellCol 被判断的单元格的列号
   * @return
   * @throws IOException
   */
  private static int getMergerCellRegionRow(HSSFSheet sheet, int cellRow, int cellCol) throws IOException {
    int retVal = 0;
    int sheetMergerCount = sheet.getNumMergedRegions();
    for (int i = 0; i < sheetMergerCount; i++) {
      CellRangeAddress cra = (CellRangeAddress) sheet.getMergedRegion(i);
      int firstRow = cra.getFirstRow();  // 合并单元格CELL起始行
      int firstCol = cra.getFirstColumn(); // 合并单元格CELL起始列
      int lastRow = cra.getLastRow(); // 合并单元格CELL结束行
      int lastCol = cra.getLastColumn(); // 合并单元格CELL结束列
      if (cellRow >= firstRow && cellRow <= lastRow) { // 判断该单元格是否是在合并单元格中
        if (cellCol >= firstCol && cellCol <= lastCol) {
          retVal = lastRow - firstRow + 1; // 得到合并的行数
          break;
        }
      }
    }
    return retVal == 0 ? 1 : retVal;
  }

  /**
   * 单元格背景色转换
   *
   * @param hc
   * @return
   */
  private String convertToStardColor(HSSFColor hc) {
    StringBuffer sb = new StringBuffer("");
    if (hc != null) {
      int a = HSSFColor.AUTOMATIC.index;
      int b = hc.getIndex();
      if (a == b) {
        return null;
      }
      sb.append("#");
      for (int i = 0; i < hc.getTriplet().length; i++) {
        String str;
        String str_tmp = Integer.toHexString(hc.getTriplet()[i]);
        if (str_tmp != null && str_tmp.length() < 2) {
          str = "0" + str_tmp;
        } else {
          str = str_tmp;
        }
        sb.append(str);
      }
    }
    return sb.toString();
  }

  /**
   * 单元格小平对齐
   *
   * @param alignment
   * @return
   */
  private String convertAlignToHtml(short alignment) {
    String align = "left";
    switch (alignment) {
      case HSSFCellStyle.ALIGN_LEFT:
        align = "left";
        break;
      case HSSFCellStyle.ALIGN_CENTER:
        align = "center";
        break;
      case HSSFCellStyle.ALIGN_RIGHT:
        align = "right";
        break;
      default:
        break;
    }
    return align;
  }

  /**
   * 单元格垂直对齐
   *
   * @param verticalAlignment
   * @return
   */
  private String convertVerticalAlignToHtml(short verticalAlignment) {
    String valign = "middle";
    switch (verticalAlignment) {
      case HSSFCellStyle.VERTICAL_BOTTOM:
        valign = "bottom";
        break;
      case HSSFCellStyle.VERTICAL_CENTER:
        valign = "center";
        break;
      case HSSFCellStyle.VERTICAL_TOP:
        valign = "top";
        break;
      default:
        break;
    }
    return valign;
  }


}
