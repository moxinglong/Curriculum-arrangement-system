package com.course.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public interface BaseDao<T> {

	//保存或更新
	void saveOrUpdate(T t);
	
	//删
	void delete(T t);
	
	//删(根据id删除)
	void delete(Serializable id);
	
	//改
	void update(T t);
	
	//查(根据id查)
	T getById(Serializable id);
	
	//查 符合条件的总记录数
	Integer	getTotalCount(DetachedCriteria dc);
	
	//查(符合条件的总记录)
	List<T> getPageList(DetachedCriteria dc, Integer start, Integer pageSize);
}
