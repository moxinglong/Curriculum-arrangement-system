package com.course.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.course.entity.CClass;
import com.course.entity.Comment;
import com.course.entity.Teacher;
import com.course.utils.PageBean;

public interface TeacherService {

	/**
	 * 保存或更新老师
	 */
	void save(Teacher teacher);
	
	/**
	 * 删除老师
	 */
	void delete(Teacher teacher);
	
	/**
	 * 查询所有记录
	 */
	PageBean getPageBean(DetachedCriteria dc,Integer currentPage,Integer pageSize);
	
	/**
	 * 根据类型获取教师
	 */
	PageBean getTeacherByType(DetachedCriteria dc, Integer currentPage,Integer pageSize, String t_type);
	
	/**
	 * 根据id获取教室带班数据
	 */
	List<CClass> getClassById(Long teacher_id);
	List<Comment> getCommentById(Long teacher_id);
}
