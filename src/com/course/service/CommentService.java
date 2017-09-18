package com.course.service;

import com.course.entity.Comment;

public interface CommentService {

	/**
	 * 添加评论
	 */
	void save(Comment comment);
}
