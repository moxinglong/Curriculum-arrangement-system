package com.course.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.course.entity.Student;

public interface StudentDao extends BaseDao<Student>{

	/**
	 * 根据id是否在ids里查询
	 */
	List<Student> getListByIdInIds(DetachedCriteria dc);
	
	/**
	 * 查询与班级绑定的学生列表
	 */
	List<Student> getListByClassId(Long class_id);
	
	/**
	 * 查询学生班级id为空或为指定数值的列表
	 */
	List<Student> getList(Long class_id);
}
