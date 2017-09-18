package com.course.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.course.dao.ClassDao;
import com.course.dao.CommentDao;
import com.course.dao.TeacherDao;
import com.course.entity.CClass;
import com.course.entity.Comment;
import com.course.entity.Teacher;
import com.course.service.TeacherService;
import com.course.utils.PageBean;

@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=true)
public class TeacherServiceImpl implements TeacherService {

	private TeacherDao teacherDao;
	private ClassDao classDao;
	private CommentDao commentDao;
	
	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
	public void save(Teacher teacher) {
		teacherDao.saveOrUpdate(teacher);
	}

	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
	public void delete(Teacher teacher) {		
		//级联更新班级
		if(teacher.getSkillTeacher().size() > 0){
			DetachedCriteria dc = DetachedCriteria.forClass(CClass.class);
			dc.add(Restrictions.eq("c_skillteacherid", teacher.getT_id()));
			List<CClass> classes = classDao.getClassByType(dc);
			teacher.getSkillTeacher().removeAll(classes);
		}
		if(teacher.getClassTeacher().size() > 0){
			DetachedCriteria dc = DetachedCriteria.forClass(CClass.class);
			dc.add(Restrictions.eq("c_classteacherid", teacher.getT_id()));
			List<CClass> classes = classDao.getClassByType(dc);
			teacher.getSkillTeacher().removeAll(classes);
		}
		
		teacherDao.delete(teacher);
	}
	
	@Override
	public PageBean getTeacherByType(DetachedCriteria dc, Integer currentPage,Integer pageSize, String t_type) {
		//调用dao查询总记录数
		Integer totalCount = teacherDao.getTotalCount(dc);
		//封装pageBean
		PageBean pb = new PageBean(currentPage, totalCount, pageSize);
		//获得list
		List<Teacher> list = teacherDao.getPageList(dc, pb.getStart(),pb.getPageSize());
		List<Teacher> teacher = new ArrayList<Teacher>();
		for(Teacher t: list){
			if(t_type.equals("1")){		//班主任
				if(t.getClassTeacher().size() < 3){
					teacher.add(t);
				}
			}else{						//技术人员
				if(t.getSkillTeacher().size() < 2){
					teacher.add(t);
				}
			}
		}
		pb.setList(teacher);
		return pb;
	}
	
	@Override
	public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		//调用dao查询总记录数
		Integer totalCount = teacherDao.getTotalCount(dc);
		//封装pageBean
		PageBean pb = new PageBean(currentPage, totalCount, pageSize);
		//获得list
		List<Teacher> list = teacherDao.getPageList(dc, pb.getStart(),pb.getPageSize());
		pb.setList(list);
		return pb;
	}
		
	@Override
	public List<CClass> getClassById(Long teacher_id) {
		//获取班级
		List<CClass> list = classDao.getClassById(teacher_id);
		return list;
	}
	
	@Override
	public List<Comment> getCommentById(Long teacher_id) {
		//获取评论
		List<Comment> list = commentDao.getCommentById(teacher_id);
		return list;
	}
	
	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	public void setClassDao(ClassDao classDao) {
		this.classDao = classDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
}
