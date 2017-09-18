package com.course.dao.impl;

import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;

import com.course.dao.StudentDao;
import com.course.entity.Student;

public class StudentDaoImpl extends BaseDaoImpl<Student> implements StudentDao {

	@Override
	public List<Student> getListByIdInIds(DetachedCriteria dc) {
		List<Student> list = (List<Student>) getHibernateTemplate().findByCriteria(dc);
		dc.add(null);
		return list;
	}

	@Override
	public List<Student> getListByClassId(Long class_id) {
		List<Student> list = getHibernateTemplate().execute(new HibernateCallback<List<Student>>() {
			@Override
			public List<Student> doInHibernate(Session session) throws HibernateException {
				String sql = "select * from c_student where c_classid = ?";
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.setParameter(0, class_id);
				sqlQuery.addEntity(Student.class);				
				return sqlQuery.list();
			}
		});
		return list;
	}

	@Override
	public List<Student> getList(Long class_id) {
		List<Student> list = getHibernateTemplate().execute(new HibernateCallback<List<Student>>() {
			@Override
			public List<Student> doInHibernate(Session session) throws HibernateException {
				String sql = "select * from c_student where c_classid is null or c_classid = ?";
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.setParameter(0, class_id);
				sqlQuery.addEntity(Student.class);				
				return sqlQuery.list();
			}
		});
		return list;
	}
}
