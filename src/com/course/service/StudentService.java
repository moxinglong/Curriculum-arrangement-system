package com.course.service;

import org.hibernate.criterion.DetachedCriteria;
import com.course.entity.Student;
import com.course.utils.PageBean;

public interface StudentService {

	/**
	 * 添加或更新学生
	 */
	void saveOrUpdate(Student student);
	
	/**
	 * 删除学生
	 */
	void delete(Student student);
	
	/**
	 * 查询所有记录
	 */
	PageBean getPageBean(DetachedCriteria dc,Integer currentPage,Integer pageSize);
	
	/**
	 * 学生id为空或者为绑定的班级id查询所有记录
	 */
	PageBean getStudentById(DetachedCriteria dc,Integer currentPage,Integer pageSize,Long class_id);
}
