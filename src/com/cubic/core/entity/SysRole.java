package com.cubic.core.entity;

import com.cubic.base.entity.BaseEntity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "t_core_role")
public class SysRole extends BaseEntity implements Serializable {

  private String name;//角色名称

  private String code;//角色代码

  private String remark;//描述

  private String seq;//排序

  @ManyToOne
  @JoinColumn(name = "group_id")
  public RoleGroup roleGroup;

  @ManyToMany(targetEntity = SysUser.class, cascade = {CascadeType.PERSIST,
      CascadeType.REFRESH, CascadeType.MERGE})
  @JoinTable(name = "t_core_user_role", joinColumns = {@JoinColumn(name = "role_id")}, inverseJoinColumns = {@JoinColumn(name = "user_id")})
  @OrderBy("account asc")
  private Set<SysUser> users = new HashSet<>();

  @ManyToMany(targetEntity = SysAcl.class, cascade = {CascadeType.PERSIST,
      CascadeType.REFRESH, CascadeType.MERGE})
  @JoinTable(name = "t_core_role_acl", joinColumns = {@JoinColumn(name = "role_id")}, inverseJoinColumns = {@JoinColumn(name = "acl_id")})
  @OrderBy("seq asc")
  private Set<SysAcl> acls = new HashSet<>();

  public SysRole() {
  }

  public SysRole(String code, String name, String seq, RoleGroup group) {
    this.name = name;
    this.code = code;
    this.seq = seq;
    this.roleGroup = group;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getCode() {
    return code;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public String getSeq() {
    return seq;
  }

  public void setSeq(String seq) {
    this.seq = seq;
  }

  @OrderBy("id asc")
  public Set<SysUser> getUsers() {
    return users;
  }

  public void setUsers(Set<SysUser> users) {
    this.users = users;
  }

  @OrderBy("id asc")
  public Set<SysAcl> getAcls() {
    return acls;
  }

  public void setAcls(Set<SysAcl> acls) {
    this.acls = acls;
  }

  public RoleGroup getRoleGroup() {
    return roleGroup;
  }

  public void setRoleGroup(RoleGroup roleGroup) {
    this.roleGroup = roleGroup;
  }

  public String getAclNames() {
    if (acls.size() > 0) {
      StringBuilder an = new StringBuilder();
      for (SysAcl acl : acls) {
        an.append(acl.getName()).append(",");
      }
      return an.toString();
    } else
      return "";
  }
}