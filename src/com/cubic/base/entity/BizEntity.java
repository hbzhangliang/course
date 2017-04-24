package com.cubic.base.entity;

import com.cubic.core.entity.SysUser;
import com.cubic.util.codeHelper.CustomerCoder;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by liang_zhang on 2015/10/19.
 */
@MappedSuperclass
public class BizEntity extends BaseEntity {
  private Boolean flag = true;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "create_by")
  private SysUser creator;

  @Column(name = "create_time")
  private Date createTime;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "modify_by")
  private SysUser modify;
  
  @Column(name = "modify_time")
  private Date modifyTime = new Date();
  
  public Boolean getFlag() {
    return flag;
  }

  public void setFlag(Boolean flag) {
    this.flag = flag;
  }

  

  public SysUser getCreator() {
	return creator;
}

public void setCreator(SysUser creator) {
	this.creator = creator;
}

public Date getCreateTime() {
	return createTime;
}

public void setCreateTime(Date createTime) {
	this.createTime = createTime;
}

public SysUser getModify() {
	return modify;
}

public void setModify(SysUser modify) {
	this.modify = modify;
}

public Date getModifyTime() {
	return modifyTime;
}

public void setModifyTime(Date modifyTime) {
	this.modifyTime = modifyTime;
}

public String getEncodedId() {
    return CustomerCoder.getBASE64(getId());
  }
}
