package com.cubic.core.entity;

import com.cubic.base.entity.BaseEntity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "t_core_depart")
public class SysDepart extends BaseEntity {

  private String name;//部门名称

  @ManyToOne
  @JoinColumn(name = "parent_id")
  private SysDepart parent;//上级部门

  private String code;//单位代码

  private Boolean flag = true;//是否有效

  private String seq = "00";//排序

  @OneToMany(targetEntity = SysDepart.class, mappedBy = "parent", cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
  @OrderBy(value = "seq")
  private Set<SysDepart> children = new HashSet<>();

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public SysDepart getParent() {
    return parent;
  }

  public void setParent(SysDepart parent) {
    this.parent = parent;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public Boolean getFlag() {
    return flag;
  }

  public void setFlag(Boolean flag) {
    this.flag = flag;
  }

  public String getSeq() {
    return seq;
  }

  public void setSeq(String seq) {
    this.seq = seq;
  }

  public Set<SysDepart> getChildren() {
    return children;
  }

  public void setChildren(Set<SysDepart> children) {
    this.children = children;
  }
}