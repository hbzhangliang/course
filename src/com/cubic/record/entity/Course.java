package com.cubic.record.entity;

import com.cubic.base.entity.BizEntity;

import javax.persistence.*;

@Entity
@Table(name="t_biz_course")
public class Course extends BizEntity{

	private String name;//null

	private String code;//null

	private String introduce;//null

	private String remark;//null

	private String type;//null

	private Integer seq;//null

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setCode(String code){
		this.code = code;
	}

	public String getCode(){
		return code;
	}

	public void setIntroduce(String introduce){
		this.introduce = introduce;
	}

	public String getIntroduce(){
		return introduce;
	}

	public void setRemark(String remark){
		this.remark = remark;
	}

	public String getRemark(){
		return remark;
	}

	public void setType(String type){
		this.type = type;
	}

	public String getType(){
		return type;
	}

	public void setSeq(Integer seq){
		this.seq = seq;
	}

	public Integer getSeq(){
		return seq;
	}

}