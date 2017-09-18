package com.course.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.course.entity.CClass;

public interface ClassDao extends BaseDao<CClass> {

	/**
	 * 更新表中的condition
	 */
	void updateCondition(Long id);
	
	/**
	 * 根据教师的类型获取班级
	 */
	List<CClass> getClassByType(DetachedCriteria dc);
	
	/**
	 * 根据教师的id获取班级
	 */
	List<CClass> getClassById(Long teacher_id);
	
	/**
	 * 获取尚未排课的班级
	 */
	List<CClass> getClassByCondition();
}
