package com.cubic.core.entity;

import com.cubic.base.entity.BaseEntity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "t_core_acl")
public class SysAcl extends BaseEntity implements Serializable {

  private String name;//资源名称

  @Column(name = "description")
  private String remark;//描述

  private String aclKey;//权限key

  @Column(name = "create_date")
  private Date createDate = new Date();//创建时间

  private Integer seq;//排序号

  @ManyToMany(mappedBy="acls", fetch=FetchType.EAGER)
  public Set<SysRole> roles = new HashSet<>();

  @ManyToMany(mappedBy="acls", fetch=FetchType.EAGER)
  public Set<SysUser> users = new HashSet<>();

  public SysAcl() {
  }

  public SysAcl(String key, String name) {
    this.aclKey = key;
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public String getAclKey() {
    return aclKey;
  }

  public void setAclKey(String aclKey) {
    this.aclKey = aclKey;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public Integer getSeq() {
    return seq;
  }

  public void setSeq(Integer seq) {
    this.seq = seq;
  }

  public Set<SysRole> getRoles() {
    return roles;
  }

  public void setRoles(Set<SysRole> roles) {
    this.roles = roles;
  }

  public Set<SysUser> getUsers() {
    return users;
  }

  public void setUsers(Set<SysUser> users) {
    this.users = users;
  }
}