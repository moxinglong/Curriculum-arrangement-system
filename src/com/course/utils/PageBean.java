package com.course.utils;

import java.util.List;
/**
 * 
 * @author 封装分页查询
 *
 */
public class PageBean {

	//当前页数
	private Integer currentPage;
	//每页显示条数
	private Integer pageSize;
	//总记录数
	private Integer totalCount;
	//总页数
	private Integer totalPage;
	//List集合
	private List list;
	
	public PageBean(Integer currentPage, Integer totalCount, Integer pageSize){
		
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		
		//判断如果当前页为空，置于第一页
		if(this.currentPage == null){
			this.currentPage = 1;
		}
		
		//判断如果每页显示条数为空，置于每页显示10条记录
		if(this.pageSize == null){
			this.pageSize = 10;
		}
		
		//计算总页数
		this.totalPage = (this.totalCount+this.pageSize-1)/this.pageSize;
		
		//判断当前页是否超出范围
		if(this.currentPage < 1){
			this.currentPage = 1;
		}
		
		if(this.currentPage > this.totalPage){
			this.currentPage = this.totalPage;
		}
	}
	
	//起始索引
	public Integer getStart(){
		return (this.currentPage - 1)*this.pageSize;
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

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
}
