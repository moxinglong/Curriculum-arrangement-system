package com.course.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.course.entity.Comment;
import com.course.service.CommentService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CommentAction extends ActionSupport implements ModelDriven<Comment>{

	private Comment comment = new Comment();

	private CommentService commentService;
	
	public String save() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowTime = new Date();
		String time = sdf.format(nowTime);
		comment.setC_time(time);
		commentService.save(comment);
		return null;
	}

	@Override
	public Comment getModel() {
		return comment;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
}
