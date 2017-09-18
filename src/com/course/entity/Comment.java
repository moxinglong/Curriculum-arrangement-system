package com.course.entity;

public class Comment {

	private Long c_id;			//主键
	private String c_context;	//评论内容
	private String c_time;		//评论时间
	
	//引用教师的外键
	private Teacher teacher;	//外键

	public Long getC_id() {
		return c_id;
	}

	public void setC_id(Long c_id) {
		this.c_id = c_id;
	}

	public String getC_context() {
		return c_context;
	}

	public void setC_context(String c_context) {
		this.c_context = c_context;
	}

	public String getC_time() {
		return c_time;
	}

	public void setC_time(String c_time) {
		this.c_time = c_time;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

}
