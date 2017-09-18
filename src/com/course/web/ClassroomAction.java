package com.course.web;

import java.util.List;

import com.course.entity.Classroom;
import com.course.service.ClassService;
import com.course.service.ClassroomService;
import com.course.utils.MyPke;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ClassroomAction extends ActionSupport{

	//接收班级id集合
	private String ids;
	
	private ClassroomService classroomService;
	private ClassService classService;
	
	/**
	 * 遍历
	 */
	public String list() throws Exception {
		List<Classroom> list = classroomService.getList();
		List<Classroom> list1 = list.subList(0, 21);
		List<Classroom> list2 = list.subList(21, 42);
		List<Classroom> list3 = list.subList(42,63 );
		List<Classroom> list4 = list.subList(63, 84);
		List<Classroom> list5 = list.subList(84, 105);
		List<Classroom> list6 = list.subList(105, 126);
		List<Classroom> list7 = list.subList(126, 147);
		ActionContext.getContext().put("list1", list1);
		ActionContext.getContext().put("list2", list2);
		ActionContext.getContext().put("list3", list3);
		ActionContext.getContext().put("list4", list4);
		ActionContext.getContext().put("list5", list5);
		ActionContext.getContext().put("list6", list6);
		ActionContext.getContext().put("list7", list7);
		return "list";
	}
	
	public String pke() throws Exception {
		//用来存放classroom表中的数据
		int a[] = new int[147];
		//用来获取随机抽取的12个数
		int b[] = new int[12];
		//用来存放班级id
		String[] classes = ids.split(",");
		//遍历班级
		for(int i = 0;i < classes.length; i++){
			//获取已经进行排课的班级数量
			Integer totalCount = classService.getTotalCount();
			//获取classroom中的数据
			List<Classroom> classrooms = classroomService.getList();
			//遍历classroom并赋值给数组
			int index = 0;
			for(Classroom classroom : classrooms){
				if(classroom.getCclass() == null){
					a[index] = new Long(classroom.getC_id()).intValue();
					index ++;
				}else{
					a[index] = 0;
					index ++;
				}
			}
			//根据已排课班级的数量选择哪种排序
			if(totalCount < 7){		//已排课班级数量少于7
				b = MyPke.start(a, 0);
			}else{					//已排课班级数量大于7
				b = MyPke.start(a, 1);
			}
			//将classroom表中的状态更新
			for(int j = 0;j < b.length; j++){
				classroomService.updateClassId(new Long((long)b[j]),Long.parseLong(classes[i]));
			}
			//将class表的condition状态更新
			classService.updateCondition(Long.parseLong(classes[i]));
		}
		return "toList";
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	public void setClassroomService(ClassroomService classroomService) {
		this.classroomService = classroomService;
	}

	public void setClassService(ClassService classService) {
		this.classService = classService;
	}
}
