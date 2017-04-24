package com.cubic.core.entity;

import com.cubic.base.entity.BusinessEntity;
import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "t_core_user")
public class SysUser extends BusinessEntity {

  private String account;//登陆账号

  @Column(name = "real_name")
  private String realName;//真实姓名

  private String pwd;//密码

  private String mail;//电子邮件

  private String type;//账号类型

  private Integer amount;

  private Float correct;

  @ManyToOne
  @JoinColumn(name = "depart_id")
  private SysDepart depart;//所属单位

  @ManyToMany(mappedBy="users", fetch=FetchType.EAGER)
  private Set<SysRole> roles = new HashSet<>();


  @ManyToMany(targetEntity = SysAcl.class, cascade = {CascadeType.PERSIST,
      CascadeType.REFRESH, CascadeType.MERGE}, fetch = FetchType.EAGER)
  @JoinTable(name = "t_core_acl_user", joinColumns = {@JoinColumn(name = "user_id")}, inverseJoinColumns = {@JoinColumn(name = "acl_id")})
  @OrderBy("seq asc")
  private Set<SysAcl> acls = new HashSet<>();

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  public String getRealName() {
    return realName;
  }

  public void setRealName(String realName) {
    this.realName = realName;
  }

  public String getPwd() {
    return pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }

  public String getMail() {
    return mail;
  }

  public void setMail(String mail) {
    this.mail = mail;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public SysDepart getDepart() {
    return depart;
  }

  public void setDepart(SysDepart depart) {
    this.depart = depart;
  }

  public Set<SysRole> getRoles() {
    return roles;
  }

  public void setRoles(Set<SysRole> roles) {
    this.roles = roles;
  }

  public Set<SysAcl> getAcls() {
    return acls;
  }

  public void setAcls(Set<SysAcl> acls) {
    this.acls = acls;
  }

  public Integer getAmount() {
    return amount;
  }

  public void setAmount(Integer amount) {
    this.amount = amount;
  }

  public Float getCorrect() {
    return correct;
  }

  public void setCorrect(Float correct) {
    this.correct = correct;
  }
}