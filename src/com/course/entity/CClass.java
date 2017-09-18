package com.course.entity;

import java.util.HashSet;
import java.util.Set;

public class CClass {
	/*
	 * CREATE TABLE IF NOT EXISTS `c_class` (
  `c_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(30) NOT NULL,
  `c_skillteacher_id` varchar(50) NOT NULL COMMENT '技术老师',
  `c_classteacher_id` varchar(20) NOT NULL COMMENT '班主任',
  `c_condition` int(1) NOT NULL DEFAULT '0' COMMENT '0表示未排课，1表示已排课',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='班级表';
 */
	//基本属性
	private Long 	c_id;
	private String 	c_name;
	private String 	c_condition;
	
	//教师属性
	private Teacher	skillteacher;
	private Teacher	classteacher;
	
	//班级包含的多名学生
	private Set<Student> students = new HashSet<Student>();
	
	public Set<Student> getStudents() {
		return students;
	}
	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	
	//只用来接收学生id参数
	private String student;
	
	//只用来接收教师id参数
	private String teachers;
	
	public String getTeachers() {
		return teachers;
	}
	public void setTeachers(String teachers) {
		this.teachers = teachers;
	}
	public String getStudent() {
		return student;
	}
	public void setStudent(String student) {
		this.student = student;
	}
	public Long getC_id() {
		return c_id;
	}
	public void setC_id(Long c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_condition() {
		return c_condition;
	}
	public void setC_condition(String c_condition) {
		this.c_condition = c_condition;
	}
	public Teacher getSkillteacher() {
		return skillteacher;
	}
	public void setSkillteacher(Teacher skillteacher) {
		this.skillteacher = skillteacher;
	}
	public Teacher getClassteacher() {
		return classteacher;
	}
	public void setClassteacher(Teacher classteacher) {
		this.classteacher = classteacher;
	}
}
