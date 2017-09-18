package com.course.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.course.dao.ClassroomDao;
import com.course.entity.Classroom;
import com.course.service.ClassroomService;
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=true)
public class ClassroomServiceImpl implements ClassroomService {

	private ClassroomDao classroomDao;
	
	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
	public void updateClassId(Long id, Long class_id) {
		classroomDao.updateClassId(id, class_id);
	}
	
	@Override
	public List<Classroom> getList() {		
		return classroomDao.getList();
	}

	public void setClassroomDao(ClassroomDao classroomDao) {
		this.classroomDao = classroomDao;
	}
}
