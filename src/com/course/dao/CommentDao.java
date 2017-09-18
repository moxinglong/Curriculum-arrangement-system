package com.course.dao;

import java.util.List;

import com.course.entity.Comment;

public interface CommentDao extends BaseDao<Comment>{
	
	/**
	 * 根据教师的id获取班级
	 */
	List<Comment> getCommentById(Long teacher_id);
}
