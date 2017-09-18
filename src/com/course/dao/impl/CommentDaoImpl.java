package com.course.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;

import com.course.dao.CommentDao;
import com.course.entity.Comment;

public class CommentDaoImpl extends BaseDaoImpl<Comment> implements CommentDao {

	@Override
	public List<Comment> getCommentById(Long teacher_id) {
		List<Comment> list = getHibernateTemplate().execute(new HibernateCallback<List<Comment>>() {
			@Override
			public List<Comment> doInHibernate(Session session) throws HibernateException {
				String sql = "select * from c_comment where c_teacherid = ? order by c_id desc";
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.setParameter(0, teacher_id);
				sqlQuery.addEntity(Comment.class);
				return sqlQuery.list();
			}
		});
		return list;
	}

	
}
