package com.course.dao;

import java.util.List;

import com.course.entity.Classroom;

public interface ClassroomDao extends BaseDao<Classroom>{

	/**
	 * 更新表中的classid
	 */
	void updateClassId(Long id, Long class_id);
	
	/**
	 * 获取所有的数据
	 */
	List<Classroom> getList();
}
