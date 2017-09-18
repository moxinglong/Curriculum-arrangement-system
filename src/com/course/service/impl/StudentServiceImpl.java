package com.course.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.course.dao.StudentDao;
import com.course.entity.Student;
import com.course.service.StudentService;
import com.course.utils.PageBean;

@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=true)
public class StudentServiceImpl implements StudentService {

	private StudentDao studentDao;
	
	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
	public void saveOrUpdate(Student student) {
		studentDao.saveOrUpdate(student);
	}
	
	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
	public void delete(Student student) {
		studentDao.delete(student);
	}
	
	@Override
	public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		//调用dao查询总记录数
		Integer totalCount = studentDao.getTotalCount(dc);
		//封装pageBean
		PageBean pb = new PageBean(currentPage, totalCount, pageSize);
		//获得list
		List<Student> list = studentDao.getPageList(dc, pb.getStart(),pb.getPageSize());
		pb.setList(list);
		return pb;
	}
	

	@Override
	public PageBean getStudentById(DetachedCriteria dc, Integer currentPage, Integer pageSize,Long class_id) {
		//调用dao查询总记录数
		Integer totalCount = studentDao.getTotalCount(dc);
		//封装pageBean
		PageBean pb = new PageBean(currentPage, totalCount, pageSize);
		//获得list
		List<Student> list = studentDao.getList(class_id);		
		pb.setList(list);
		return pb;
	}
	
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

}
