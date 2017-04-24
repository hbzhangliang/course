package com.cubic.core.action;

import com.cubic.base.action.BaseAct;
import com.cubic.core.entity.Attachment;
import com.cubic.core.manager.AttachmentMng;
import com.cubic.core.manager.SysConfigMng;
import com.cubic.core.util.FtpTools;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/sys/attr")
public class AttachmentAct extends BaseAct {

  private final static Logger logger = LogManager.getLogger();

  @RequestMapping("list")
  public ModelAndView list(Attachment queryBean) {
    logger.debug("Attachment list fired...");
    if (StringUtils.isEmpty(queryBean.getOrderBy()))
      queryBean.setOrderBy("uploadDate desc");
    return new ModelAndView("sys/attr/list")
        .addObject("queryBean", queryBean)
        .addObject("list", attachmentMng.mergeHQL(queryBean, ""));
  }

  @RequestMapping("getAttr")
  @ResponseBody
  public String getAttr(String id) {
    try {
      logger.debug("Attachment getAttr fired");
      List<Attachment> list = attachmentMng.findByObjectId(id);
      JsonConfig jc = new JsonConfig();
	  jc.setExcludes(new String[]{"uploadDate","uploader"});
	  return JSONArray.fromObject(list,jc).toString();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }


  @RequestMapping("getAttrCate")
  @ResponseBody
  public String getAttrCate(String id,String category) {
    try {
      logger.debug("Attachment getAttr fired");
      List<Attachment> list = attachmentMng.findByObjectIdandCate(id, category);
      JsonConfig jc = new JsonConfig();
      jc.setExcludes(new String[]{"uploadDate","uploader"});
      return JSONArray.fromObject(list,jc).toString();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }


  @RequestMapping("ajaxUp")
  @ResponseBody
  public String ajaxUp(String displayName,String category, @RequestParam(value = "upload", required = false)MultipartFile file, HttpSession s) {
    logger.debug("Attachment aj save fired");
    String resourceBase = sysConfigMng.getCacheValue("sys.upload.tempFolder");
    String pattern = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
    long filesize = file.getSize();
    String fileName = file.getOriginalFilename();
    String suffix = fileName.substring(fileName.lastIndexOf("."));
    String newFileName = UUID.randomUUID() + suffix;
    File targetFile = new File(resourceBase + "/" + pattern + "/", newFileName);
    if (!targetFile.exists()) {
      targetFile.mkdirs();
    }
    try {
      file.transferTo(targetFile);
    } catch (Exception e) {
      e.printStackTrace();
    }
    Attachment att = new Attachment();
    att.setFilename(newFileName);
    att.setDisplayName((StringUtils.isEmpty(displayName) ? fileName : displayName+suffix));
    att.setCategory(category);
    att.setFilepath("/" + pattern + "/" + newFileName);
    att.setFiletype(file.getContentType());
    att.setFilesize(Integer.parseInt(String.valueOf(filesize)));
    att.setUploader(getCurrentUser(s));
    att = attachmentMng.save(att);
    return att.getId();
  }

  @RequestMapping("/download")
  public void download(@RequestParam(value = "id") String id,
                       final HttpServletResponse response) throws IOException {
    logger.debug("Attachment download fired");
    Attachment att = attachmentMng.load(id);
    att.setCount(att.getCount() + 1);
    attachmentMng.saveOrUpdate(att);
    OutputStream os = response.getOutputStream();
    try {
      response.reset();
      response.setHeader("Content-Disposition", "attachment; filename=" + new String(att.getDisplayName().getBytes("utf-8"), "iso-8859-1"));
      response.setContentType("application/octet-stream; charset=utf-8");
      os.write(FileUtils.readFileToByteArray(new File(sysConfigMng.getCacheValue("sys.upload.tempFolder") + att.getFilepath())));
      os.flush();
    } finally {
      if (os != null) {
        os.close();
      }
    }
  }

  @RequestMapping(value = "ajDel")
  @ResponseBody
  public String ajDel(String id) {
    attachmentMng.del(id);
    return "ok";
  }

  @RequestMapping("checkFileExist")
  @ResponseBody
  public String checkFileExistByName(String fileName) {
    if (attachmentMng.findBy("fileNameDisplay", fileName, "").size() > 0) {
      return "true";
    }
    return "false";
  }

  @ExceptionHandler(Exception.class)
  public ModelAndView handleException(Exception ex, HttpServletRequest request) {
    Map<Object, Object> model = new HashMap<Object, Object>();
    if (ex instanceof MaxUploadSizeExceededException) {
      logger.error("文件过大！！！");
      model.put("errors", "文件应不大于 " +
          getFileMB(((MaxUploadSizeExceededException) ex).getMaxUploadSize()));
    } else {
      model.put("errors", "不知错误: " + ex.getMessage());
    }
    return new ModelAndView("index", (Map) model);
  }

  private String getFileMB(long byteFile) {
    if (byteFile == 0)
      return "0MB";
    long mb = 1024 * 1024;
    return "" + byteFile / mb + "MB";
  }

  @Resource
  private AttachmentMng attachmentMng;

  @Resource
  private SysConfigMng sysConfigMng;

  @Resource
  private FtpTools ftpTools;
}
