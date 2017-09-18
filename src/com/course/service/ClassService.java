package com.course.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.course.entity.CClass;
import com.course.entity.Student;
import com.course.entity.Teacher;
import com.course.utils.PageBean;

public interface ClassService {

	/**
	 * 更新表中的condition
	 */
	void updateCondition(Long id);
	
	/**
	 * 增加或修改班级
	 */
	void saveOrUpdate(CClass cclass);
	
	/**
	 * 根据id获得教师
	 */
	Teacher getTeacherById(Long teacher_id);
	
	/**
	 * 删除班级
	 */
	void delete(CClass cclass);
	
	/**
	 * 根据班级id获得学生列表
	 */
	List<Student> getListById(Long class_id);
	
	/**
	 * 查询所有记录
	 */
	PageBean getPageBean(DetachedCriteria dc,Integer currentPage,Integer pageSize);
	
	/**
	 * 获取已经进行排课的班级数量
	 * @return
	 */
	Integer getTotalCount();
	
	/**
	 * 获取尚未排课的班级
	 */
	PageBean getPageBeanByCondition(DetachedCriteria dc,Integer currentPage,Integer pageSize);
}
