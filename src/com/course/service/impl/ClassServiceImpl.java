package com.course.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.course.dao.ClassDao;
import com.course.dao.StudentDao;
import com.course.dao.TeacherDao;
import com.course.entity.CClass;
import com.course.entity.Student;
import com.course.entity.Teacher;
import com.course.service.ClassService;
import com.course.utils.PageBean;
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=true)
public class ClassServiceImpl implements ClassService {

	private ClassDao classDao;
	private StudentDao studentDao;
	private TeacherDao teacherDao;
	
	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
	public void updateCondition(Long id) {
		classDao.updateCondition(id);
	}

	
	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
	public void saveOrUpdate(CClass cclass) {
		DetachedCriteria dc = DetachedCriteria.forClass(Student.class);
		if(cclass.getC_id() != null){
			//移除原来的学生
			List<Student> list = studentDao.getListByClassId(cclass.getC_id());
			for(Student stu : list){
				stu.setCclass(null);
			}
		}
		
		if(StringUtils.isNotBlank(cclass.getStudent())){
			//关联选择的学生
			String[] str = cclass.getStudent().split(",");
			Long[] students = new Long[str.length];
			for(int i = 0;i < str.length; i++){
				students[i] = Long.parseLong(str[i]);
			}
			//将id包括在内的学生搜索出来
			dc.add(Restrictions.in("s_id", students));
			List<Student> addList = studentDao.getListByIdInIds(dc);
			//级联更新学生			
			for(Student addStu : addList){
				addStu.setCclass(cclass);
			}			
		}
		//保存班级
		classDao.saveOrUpdate(cclass);				
	}
	

	@Override
	public Teacher getTeacherById(Long teacher_id) {		
		return teacherDao.getById(teacher_id);
	}

	@Override
	public List<Student> getListById(Long class_id) {
		List<Student> list = studentDao.getListByClassId(class_id);
		return list;
	}
	
	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
	public void delete(CClass cclass) {
		//移除原来的学生
		List<Student> list = studentDao.getListByClassId(cclass.getC_id());
		for(Student stu : list){
			stu.setCclass(null);
		}
		classDao.delete(cclass);
	}
	
	@Override
	public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		//调用dao查询总记录数
		Integer totalCount = classDao.getTotalCount(dc);
		//封装pageBean
		PageBean pb = new PageBean(currentPage, totalCount, pageSize);
		//获得list
		List<CClass> list = classDao.getPageList(dc, pb.getStart(),pb.getPageSize());
		pb.setList(list);
		return pb;
	}
	
	@Override
	public Integer getTotalCount() {
		DetachedCriteria dc = DetachedCriteria.forClass(CClass.class);
		dc.add(Restrictions.isNotNull("c_condition"));
		Integer totalCount = classDao.getTotalCount(dc);
		return totalCount;
	}

	@Override
	public PageBean getPageBeanByCondition(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		//调用dao查询总记录数
		Integer totalCount = classDao.getTotalCount(dc);
		//封装pageBean
		PageBean pb = new PageBean(currentPage, totalCount, pageSize);
		//获得list
		List<CClass> list = classDao.getClassByCondition();
		pb.setList(list);
		return pb;
	}

	public void setClassDao(ClassDao classDao) {
		this.classDao = classDao;
	}

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}
}
