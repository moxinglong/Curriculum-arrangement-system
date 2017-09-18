package com.course.service;

import java.util.List;

import com.course.entity.Classroom;

public interface ClassroomService {

	/**
	 * 更新表中的classid
	 */
	void updateClassId(Long id, Long class_id);
	
	/**
	 * 获取所有的classroom对象
	 */
	List<Classroom> getList();
}
