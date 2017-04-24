package com.cubic.record.entity;

import com.cubic.base.entity.BaseEntity;
import com.cubic.base.entity.BizEntity;
import org.hibernate.annotations.Where;

import javax.persistence.*;

@Entity
@Table(name="t_biz_video")
public class Video extends BizEntity{

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "course_id")
	private Course course;//null

	private String name;//null

	private Float size;//null

	private String introduce;//null

	private String remark;//null

	private String type;//null

	private Integer duration;//null

	@Column(name="start_position")
	private Integer startPosition;//null

	private String path;//null

	private Integer seq;//null

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setSize(Float size){
		this.size = size;
	}

	public Float getSize(){
		return size;
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

	public void setDuration(Integer duration){
		this.duration = duration;
	}

	public Integer getDuration(){
		return duration;
	}

	public void setStartPosition(Integer startPosition){
		this.startPosition = startPosition;
	}

	public Integer getStartPosition(){
		return startPosition;
	}

	public void setPath(String path){
		this.path = path;
	}

	public String getPath(){
		return path;
	}

	public void setSeq(Integer seq){
		this.seq = seq;
	}

	public Integer getSeq(){
		return seq;
	}

}