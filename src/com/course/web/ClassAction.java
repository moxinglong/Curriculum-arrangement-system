package com.course.web;


import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.course.entity.CClass;
import com.course.entity.Student;
import com.course.entity.Teacher;
import com.course.service.ClassService;
import com.course.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ClassAction extends ActionSupport implements ModelDriven<CClass>{

	private CClass cclass = new CClass();
	
	private ClassService classService;

	//当前页数
	private Integer currentPage;
	
	//每页显示条数
	private Integer pageSize;
	
	/**
	 * 保存或更新班级
	 */	
	public String save() throws Exception {
		if(cclass.getClassteacher().getT_id() == null){
			cclass.setClassteacher(null);
		}
		if(cclass.getSkillteacher().getT_id() == null){
			cclass.setSkillteacher(null);
		}
		classService.saveOrUpdate(cclass);
		return "toList";
	}
	
	/**
	 * 删除班级
	 */
	public String delete() throws Exception {
		classService.delete(cclass);
		return "toList";
	}
	
	/**
	 * 查询所有记录
	 */
	public String list() throws Exception {
		//离线查询
		DetachedCriteria dc = DetachedCriteria.forClass(CClass.class);
		//判断条件是否为空
		if(StringUtils.isNotBlank(cclass.getC_name())){
			dc.add(Restrictions.like("c_name", "%"+cclass.getC_name()+"%"));
		}
		//获得分页查询对象
		PageBean pb = classService.getPageBean(dc, currentPage, pageSize);
		//保存对象
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}

	
	/**
	 * 查询所有未排课的班级记录
	 */
	public String choose() throws Exception {
		//获取已排课的班级数量
		Integer totalCount = classService.getTotalCount();
		//离线查询
		DetachedCriteria dc = DetachedCriteria.forClass(CClass.class);
		PageBean pb = classService.getPageBeanByCondition(dc, currentPage, pageSize);
		//保存对象
		ActionContext.getContext().put("totalCount", totalCount);
		ActionContext.getContext().put("pageBean", pb);
		return "choose";
	}
	
	/**
	 * 查询所有学生与老师
	 */
	public String detail() throws Exception {
		//获取教师拼接的id
		String[] str = cclass.getTeachers().split(",");
		if(str.length > 0){
			Long[] ids = new Long[str.length];
			for(int i = 0;i < str.length; i++){
				if(StringUtils.isNotBlank(str[i])){
					ids[i] = Long.parseLong(str[i]);
				}else{
					ids[i] = null;
				}			
			}
			if(ids[0] != null){
				Teacher classTeacher = classService.getTeacherById(ids[0]);
				ActionContext.getContext().put("classTeacher", classTeacher);
			}
			if(ids[1] != null){
				Teacher skillTeacher = classService.getTeacherById(ids[1]);
				ActionContext.getContext().put("skillTeacher", skillTeacher);
			}
		}		
		List<Student> students = classService.getListById(cclass.getC_id());
		ActionContext.getContext().put("students", students);
		return "detail";
	}
	
	@Override
	public CClass getModel() {
		return cclass;
	}

	public void setClassService(ClassService classService) {
		this.classService = classService;
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
