package com.course.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.course.entity.CClass;
import com.course.entity.Comment;
import com.course.entity.Teacher;
import com.course.service.TeacherService;
import com.course.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherAction extends ActionSupport implements ModelDriven<Teacher>{

	private Teacher teacher = new Teacher();
	
	private TeacherService teacherService;

	//当前页数
	private Integer currentPage;
	
	//每页显示条数
	private Integer pageSize;

	/**
	 * 查询所有记录
	 */
	public String list() throws Exception {
		//离线查询
		DetachedCriteria dc = DetachedCriteria.forClass(Teacher.class);
		//判断条件是否为空
		if(StringUtils.isNotBlank(teacher.getT_name())){
			dc.add(Restrictions.like("t_name", "%"+teacher.getT_name()+"%"));
		}
		//获得分页查询对象
		PageBean pb = teacherService.getPageBean(dc, currentPage, pageSize);
		//保存对象
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}

	/**
	 * 根据教师类型和带班数量查询
	 */
	public String getTeacher() throws Exception {
		//离线查询
		DetachedCriteria dc = DetachedCriteria.forClass(Teacher.class);
		//判断条件是否为空
		dc.add(Restrictions.eq("t_type", teacher.getT_type()));
		//获得分页查询对象
		PageBean pb = teacherService.getTeacherByType(dc, currentPage, pageSize, teacher.getT_type());
		//保存对象
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}
	
	/**
	 * 根据教师的带班情况获取详情
	 */
	public String detail() throws Exception {
		List<CClass> classes = teacherService.getClassById(teacher.getT_id());
		List<Comment> comments = teacherService.getCommentById(teacher.getT_id());
		ActionContext.getContext().put("classes", classes);
		ActionContext.getContext().put("comments", comments);
		return "detail";
	}	
	
	/**
	 * 保存或更新教师
	 */
	public String save() throws Exception {
		Date currentTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = sdf.format(currentTime);
		teacher.setT_jobtime(dateString);
		teacherService.save(teacher);
		return "toList";
	}
	
	/**
	 * 删除教师
	 */
	public String delete() throws Exception {
		teacherService.delete(teacher);
		return "toList";
	}
	
	@Override
	public Teacher getModel() {
		return teacher;
	}
	
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}
