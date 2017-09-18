package com.course.entity;

public class Student {

	/**
	 * CREATE TABLE IF NOT EXISTS `c_student` (
	  `s_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
	  `s_name` varchar(20) NOT NULL COMMENT '姓名',
	  `s_sex` varchar(20) NOT NULL COMMENT '性别',
	  `s_birth` varchar(50) NOT NULL COMMENT '出生日期',
	  `s_tel` varchar(20) NOT NULL COMMENT '电话',
	  `s_address` varchar(100) NOT NULL COMMENT '地址',
	  `s_major` varchar(20) DEFAULT NULL COMMENT '所学专业',
	  `s_school` varchar(50) DEFAULT NULL COMMENT '所在院校',
	  `class_id` varchar(20) DEFAULT NULL,
	  PRIMARY KEY (`s_id`)
	) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='学生表';
		 */
	
	private Long 	s_id;
	private String 	s_name;
	private String 	s_sex;
	private String 	s_birth;
	private String 	s_tel;
	private String 	s_address;
	private String 	s_major;
	private String 	s_school;
	private CClass	cclass;
	
	public Long getS_id() {
		return s_id;
	}
	public void setS_id(Long s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_sex() {
		return s_sex;
	}
	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}
	public String getS_birth() {
		return s_birth;
	}
	public void setS_birth(String s_birth) {
		this.s_birth = s_birth;
	}
	public String getS_tel() {
		return s_tel;
	}
	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public String getS_major() {
		return s_major;
	}
	public void setS_major(String s_major) {
		this.s_major = s_major;
	}
	public String getS_school() {
		return s_school;
	}
	public void setS_school(String s_school) {
		this.s_school = s_school;
	}
	public CClass getCclass() {
		return cclass;
	}
	public void setCclass(CClass cclass) {
		this.cclass = cclass;
	}
}
