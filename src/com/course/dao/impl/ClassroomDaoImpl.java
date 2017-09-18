package com.course.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;

import com.course.dao.ClassroomDao;
import com.course.entity.Classroom;

public class ClassroomDaoImpl extends BaseDaoImpl<Classroom> implements ClassroomDao {

	@Override
	public List<Classroom> getList() {
		List<Classroom> list = getHibernateTemplate().execute(new HibernateCallback<List<Classroom>>() {
			@Override
			public List<Classroom> doInHibernate(Session session) throws HibernateException {
				String sql = "select * from c_classroom";
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addEntity(Classroom.class);
				return sqlQuery.list();
			}
		});
		return list;
	}

	@Override
	public void updateClassId(Long id, Long class_id) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "update c_classroom set c_classid = ? where c_id = ?";
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.setParameter(0, class_id);
				sqlQuery.setParameter(1, id);
				sqlQuery.executeUpdate();
				return null;
			}
		});
	}

}
