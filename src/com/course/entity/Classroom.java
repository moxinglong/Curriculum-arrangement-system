package com.course.entity;

public class Classroom {

	private Long c_id;		//自增主键
	private String c_time;	//上课时间
	private String c_room;	//上课地点
	
	//关联班级
	private CClass cclass;

	public Long getC_id() {
		return c_id;
	}

	public void setC_id(Long c_id) {
		this.c_id = c_id;
	}

	public String getC_time() {
		return c_time;
	}

	public void setC_time(String c_time) {
		this.c_time = c_time;
	}

	public String getC_room() {
		return c_room;
	}

	public void setC_room(String c_room) {
		this.c_room = c_room;
	}

	public CClass getCclass() {
		return cclass;
	}

	public void setCclass(CClass cclass) {
		this.cclass = cclass;
	}
}
