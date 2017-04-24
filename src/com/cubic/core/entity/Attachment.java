package com.cubic.core.entity;

import com.cubic.base.entity.BaseEntity;
import org.apache.commons.lang.StringUtils;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_core_attachment")
public class Attachment extends BaseEntity {

  @Column(name = "display_name")
  private String displayName;//显示的文件名

  private String filename;//文件名

  private String filepath;//文件路径

  private String filetype;//文件类型

  private Integer filesize;//文件大小

  private String objectId;//对象ID

  private Integer count = 0;//下载次数,默认0

  private String category;

  @Column(name = "upload_date")
  private Date uploadDate = new Date();//上次时间

  @ManyToOne
  @JoinColumn(name = "uploader")
  private SysUser uploader;//上传人

  public void setFilename(String filename) {
    this.filename = filename;
  }

  public String getFilename() {
    return filename;
  }

  public void setFilepath(String filepath) {
    this.filepath = filepath;
  }

  public String getFilepath() {
    return filepath;
  }

  public void setFiletype(String filetype) {
    this.filetype = filetype;
  }

  public String getFiletype() {
    return filetype;
  }

  public String getObjectId() {
    return objectId;
  }

  public void setObjectId(String objectId) {
    this.objectId = objectId;
  }

  public Integer getCount() {
    return count;
  }

  public void setCount(Integer count) {
    this.count = count;
  }

  public String getDisplayName() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }

  public Integer getFilesize() {
    return filesize;
  }

  public void setFilesize(Integer filesize) {
    this.filesize = filesize;
  }

  public Date getUploadDate() {
    return uploadDate;
  }

  public void setUploadDate(Date uploadDate) {
    this.uploadDate = uploadDate;
  }

  public String getFixedSize() {
    if (this.filesize == null)
      return "";
    else {
      if (this.filesize > (1024d * 1024))
        return String.format("%.2f", this.filesize / (1024d * 1024)) + "MB";
      else if (this.filesize > 1024d)
        return String.format("%.2f", this.filesize / 1024d) + "KB";
      else
        return this.filesize + "B";
    }
  }

  public String getFileNameOnServer() {
    return StringUtils.isNotEmpty(getFilepath()) ? getFilepath().substring(getFilepath().lastIndexOf("/") + 1) : null;
  }

  public SysUser getUploader() {
    return uploader;
  }

  public void setUploader(SysUser uploader) {
    this.uploader = uploader;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }
}