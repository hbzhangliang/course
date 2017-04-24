package com.cubic.base.entity;

import com.cubic.core.entity.SysUser;
import com.cubic.util.codeHelper.CustomerCoder;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import java.util.Date;

/**
 * Created by liang_zhang on 2015/10/19.
 */
@MappedSuperclass
public class BusinessEntity extends BaseEntity {
  private Boolean flag = true;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "updater")
  private SysUser updater;

  private Date updateTime = new Date();

  public Boolean getFlag() {
    return flag;
  }

  public void setFlag(Boolean flag) {
    this.flag = flag;
  }

  public SysUser getUpdater() {
    return updater;
  }

  public void setUpdater(SysUser updater) {
    this.updater = updater;
  }

  public Date getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(Date updateTime) {
    this.updateTime = updateTime;
  }

  public String getEncodedId() {
    return CustomerCoder.getBASE64(getId());
  }
}
