package com.course.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;

import com.course.dao.ClassDao;
import com.course.entity.CClass;

public class ClassDaoImpl extends BaseDaoImpl<CClass> implements ClassDao {

	@Override
	public void updateCondition(Long id) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
		@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "update c_class set c_condition = '1' where c_id = ?";
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.setParameter(0, id);
				sqlQuery.executeUpdate();
				return null;
			}
		});
	}
	
	@Override
	public List<CClass> getClassByType(DetachedCriteria dc) {
		List<CClass> list = (List<CClass>) getHibernateTemplate().findByCriteria(dc);
		dc.add(null);
		return list;
	}

	@Override
	public List<CClass> getClassById(Long teacher_id) {
		List<CClass> list = getHibernateTemplate().execute(new HibernateCallback<List<CClass>>() {
			@Override
			public List<CClass> doInHibernate(Session session) throws HibernateException {
				String sql = "select * from c_class where c_skillteacherid = ? or c_classteacherid = ?";
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.setParameter(0, teacher_id);
				sqlQuery.setParameter(1, teacher_id);
				sqlQuery.addEntity(CClass.class);				
				return sqlQuery.list();
			}
		});
		return list;
	}

	@Override
	public List<CClass> getClassByCondition() {
		List<CClass> list = getHibernateTemplate().execute(new HibernateCallback<List<CClass>>() {
			@Override
			public List<CClass> doInHibernate(Session session) throws HibernateException {
				String sql = "select * from c_class where c_condition is null";
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addEntity(CClass.class);				
				return sqlQuery.list();
			}
		});
		return list;
	}	
}
