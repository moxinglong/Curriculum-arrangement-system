package com.course.entity;


import java.util.HashSet;
import java.util.Set;

public class Teacher {

	/*
	 * CREATE TABLE IF NOT EXISTS `c_teacher` (
	  `t_id` bigint(20) NOT NULL AUTO_INCREMENT,
	  `t_name` varchar(20) NOT NULL COMMENT '姓名',
	  `t_birth` varchar(4) NOT NULL COMMENT '出生日期',
	  `t_type` int(11) NOT NULL COMMENT '1 班主任 2 授课老师',
	  `t_sex` varchar(2) NOT NULL COMMENT '性别',
	  `t_tel` varchar(20) NOT NULL COMMENT '电话',
	  `t_idcard` varchar(30) NOT NULL COMMENT '身份证号',
	  `t_address` varchar(100) NOT NULL COMMENT '家庭住址',
	  `t_major` varchar(30) NOT NULL COMMENT '专业',
	  `t_school` varchar(50) NOT NULL COMMENT '毕业院校',
	  `t_jobtime` datetime NOT NULL COMMENT '入职时间',
	  PRIMARY KEY (`t_id`)
	) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='教师表';
	 */
	private Long   t_id;
	private String t_name;
	private String t_birth;
	private String t_type;
	private String t_sex;
	private String t_tel;
	private String t_idcard;
	private String t_address;
	private String t_major;
	private String t_school;
	private String t_jobtime;
	
	//一对多关联
	private Set<CClass> skillTeacher = new HashSet<CClass>();
	private Set<CClass> classTeacher = new HashSet<CClass>();
	private Set<Comment> comments = new HashSet<Comment>();
	
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public Set<CClass> getSkillTeacher() {
		return skillTeacher;
	}
	public void setSkillTeacher(Set<CClass> skillTeacher) {
		this.skillTeacher = skillTeacher;
	}
	public Set<CClass> getClassTeacher() {
		return classTeacher;
	}
	public void setClassTeacher(Set<CClass> classTeacher) {
		this.classTeacher = classTeacher;
	}
	public Long getT_id() {
		return t_id;
	}
	public void setT_id(Long t_id) {
		this.t_id = t_id;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_birth() {
		return t_birth;
	}
	public void setT_birth(String t_birth) {
		this.t_birth = t_birth;
	}
	public String getT_type() {
		return t_type;
	}
	public void setT_type(String t_type) {
		this.t_type = t_type;
	}
	public String getT_sex() {
		return t_sex;
	}
	public void setT_sex(String t_sex) {
		this.t_sex = t_sex;
	}
	public String getT_tel() {
		return t_tel;
	}
	public void setT_tel(String t_tel) {
		this.t_tel = t_tel;
	}
	public String getT_idcard() {
		return t_idcard;
	}
	public void setT_idcard(String t_idcard) {
		this.t_idcard = t_idcard;
	}
	public String getT_address() {
		return t_address;
	}
	public void setT_address(String t_address) {
		this.t_address = t_address;
	}
	public String getT_major() {
		return t_major;
	}
	public void setT_major(String t_major) {
		this.t_major = t_major;
	}
	public String getT_school() {
		return t_school;
	}
	public void setT_school(String t_school) {
		this.t_school = t_school;
	}
	public String getT_jobtime() {
		return t_jobtime;
	}
	public void setT_jobtime(String t_jobtime) {
		this.t_jobtime = t_jobtime;
	}
}
