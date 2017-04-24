package com.cubic.core.entity;

import com.cubic.base.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_core_role_group")
public class RoleGroup extends BaseEntity {

  @Column(name = "group_code")
  private String groupCode;//角色组代码

  private String name;//角色组名称

  private String remark;//备注

  private String seq;//排序号

  public RoleGroup() {
  }

  public RoleGroup(String code, String name, String seq) {
    this.groupCode = code;
    this.name = name;
    this.seq = seq;
  }

  public String getGroupCode() {
    return groupCode;
  }

  public void setGroupCode(String groupCode) {
    this.groupCode = groupCode;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public String getRemark() {
    return remark;
  }

  public String getSeq() {
    return seq;
  }

  public void setSeq(String seq) {
    this.seq = seq;
  }
}