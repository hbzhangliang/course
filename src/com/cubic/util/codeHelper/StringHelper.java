package com.cubic.util.codeHelper;

import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by liang_zhang on 14-7-21.
 */
public class StringHelper {

  /**
   * 将第一个字符替换成小写
   *
   * @param str 字符串
   * @return 字符串
   */
  public static String lowCastFirstChar(String str) {
    StringBuilder sb = new StringBuilder(str);
    sb.setCharAt(0, Character.toLowerCase(sb.charAt(0)));
    return sb.toString();
  }

  /**
   * 年度列表
   *
   * @param length 列表长度
   * @return 年度列表
   */
  public static List<Integer> getYearList(Integer length) {
    Integer currentYear = Calendar.getInstance().get(Calendar.YEAR);
    List<Integer> l = new ArrayList<Integer>();
    for (int i = currentYear - length / 2; i <= currentYear + length / 2; i++)
      l.add(i);
    return l;
  }

  /**
   * 将第一个字符替换成大写
   *
   * @param str 字符串
   * @return 字符串
   */
  public static String upperCastFirstChar(String str) {
    StringBuilder sb = new StringBuilder(str);
    sb.setCharAt(0, Character.toUpperCase(sb.charAt(0)));
    return sb.toString();
  }

  public static String formatDateSql(String fieldName, String publishtime1, String publishtime2) {
    StringBuilder sb = new StringBuilder();
    if (StringUtils.isNotEmpty(publishtime1))
      sb.append(" and ").append(fieldName).append(">=").append("to_date('").append(publishtime1).append("','yyyy-MM-DD') ");
    if (StringUtils.isNotEmpty(publishtime2))
      sb.append(" and ").append(fieldName).append("<=").append("to_date('").append(publishtime2).append("','yyyy-MM-DD') ");
    return sb.toString();
  }

  public static void main(String[] args) {
    System.out.print(formatDateSql("Usedtime", "", "2015-01-01"));
  }

  public static String formatStringSql(String fieldName, String value) {
    StringBuilder sb = new StringBuilder();
    if (StringUtils.isNotEmpty(value))
      sb.append(" and ").append(fieldName).append("='").append(value).append("' ");
    return sb.toString();
  }
}
