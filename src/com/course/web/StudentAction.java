package com.course.web;

import org.apache.commons.lang3.StringUtils;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import com.course.entity.Student;
import com.course.service.StudentService;
import com.course.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentAction extends ActionSupport implements ModelDriven<Student>{

	private Student student = new Student();
	
	private StudentService studentService;

	//当前页数
	private Integer currentPage;
	
	//每页显示条数
	private Integer pageSize;

	/**
	 * 查询所有记录
	 */
	public String list() throws Exception {
		//离线查询
		DetachedCriteria dc = DetachedCriteria.forClass(Student.class);
		//判断条件是否为空
		if(StringUtils.isNotBlank(student.getS_name())){
			dc.add(Restrictions.like("s_name", "%"+student.getS_name()+"%"));
		}
		//获得分页查询对象
		PageBean pb = studentService.getPageBean(dc, currentPage, pageSize);
		//保存对象
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}
	
	/**
	 * 根据学生id获得列表
	 */
	public String getStudent() throws Exception {
		//离线查询
		DetachedCriteria dc = DetachedCriteria.forClass(Student.class);
		//获得分页查询对象
		PageBean pb = studentService.getStudentById(dc, currentPage, pageSize, student.getCclass().getC_id());
		//保存对象
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}
	
	/**
	 * 保存或更新学生
	 */
	public String save() throws Exception {
		if(student.getCclass().getC_id() == null){
			student.setCclass(null);
		}
		studentService.saveOrUpdate(student);
		return "toList";
	}

	/**
	 * 删除学生
	 */
	public String delete() throws Exception {
		studentService.delete(student);
		return "toList";
	}
	
	@Override
	public Student getModel() {
		return student;
	}
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
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
