<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>查看班级</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/layui/images/favicon.ico">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/jquery-2.1.1.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/jquery.validate.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/messages_zh.js" ></script>
    <style type="text/css">
	.mask{
		z-index: 900;
		position: fixed;
		position: absolute;
		left: 0px;
		top: 0px;
		width: 100%;
		height: 100%;
		background: #000;
		filter:alpha(opacity=45);
		opacity: 0.45;
		-moz-opacity:0.45;
		-khtml-opacity:0.45;
	}
	label.error{
		background:url(${pageContext.request.contextPath}/layui/images/unchecked.gif) no-repeat 10px 3px;
		padding-left: 30px;
		font-family:georgia;
		font-size: 15px;
		font-style: normal;
		color: red;
	}
	
	label.success{
		background:url(${pageContext.request.contextPath}/layui/images/checked.gif) no-repeat 10px 3px;
		padding-left: 30px;
	}
</style>
    <script type="text/javascript">
	    function openStudent(student, c_id){	    	
	    	window.open("${pageContext.request.contextPath}/StudentAction_getStudent?cclass.c_id="+c_id+"&students="+student+"&select="+c_id+"","","width=1300,height=500");
		}
    	function selectClass(c_id, c_name){
    		//获得添加页面的window对象
    		var win = window.opener;
    		//获得添加页面的document对象
    		var doc = win.document;
    		//获得隐藏域,和 文本框,并赋值
    		doc.getElementById("c_id_<s:property value='#parameters.select'/>").value = c_id;
    		doc.getElementById("c_name_<s:property value='#parameters.select'/>").value = c_name;
    		//关闭当前窗口
    		window.close();
    	}
    	
    	function isDel(c_id){
			var flag = window.confirm("您确定要删除该班级吗？");
			if(flag == true){
				location.href="${pageContext.request.contextPath}/ClassAction_delete?c_id="+c_id+"";
			}
		}	
		function openDiv(e){
			document.getElementById("mask").style.display = "block";
			document.getElementById(e).style.display = "block";
			var value = document.getElementById("c_"+e+"").value;
	    	var arr = value.split("");
	    	var str;
	    	str = arr[0];
	    	for(var i = 1;i < arr.length;i++){
	    		str = str + "," + arr[i];
	    	}
	    	if(str){
	    		
	    	}else{
	    		str = "";  		
	    	}
	    	document.getElementById("s_students_"+e+"").value = str;
		}
		
		function closeDiv(e){
			document.getElementById(e).style.display = "none";
			document.getElementById("mask").style.display = "none";			
		}
		layui.use(['element', 'form'], function() {
            var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
            // var form = layui.form();
            //监听导航点击
            element.on('nav(demo)', function(elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
    </script>
</head>

<body>
	<div id="mask" class="mask" style="display: none;z-index: 1"></div>
    <ul class="layui-nav" lay-filter="nav">
        <li class="layui-nav-item">
            <span style="font-size: 20px">卓越教务管理系统</span>
        </li>

        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/ClassroomAction_list">课表</a></li>
        <li class="layui-nav-item ">
            <a href="javascript:;">教学团队管理</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/TeacherAction_list">教师管理</a></dd>
                <dd><a href="${pageContext.request.contextPath}/jsp/addteacher.jsp">添加教师</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item ">
            <a href="javascript:;">学生管理</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/StudentAction_list">查看全部学生信息</a></dd>
                <dd><a href="${pageContext.request.contextPath}/jsp/addstudent.jsp">添加学生</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item  layui-this">
            <a href="javascript:;">班级管理</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/jsp/addclass.jsp">添加班级</a></dd>
            </dl>
        </li>
		<li class="layui-nav-item">
            <a href="javascript:;">排课管理</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/jsp/addpke.jsp">开始排课</a></dd>
            </dl>
        </li>
    </ul>

    <fieldset class="layui-elem-field layui-field-title">
        <legend>班级列表</legend>
    </fieldset>
	<form id="searchForm" action="${pageContext.request.contextPath}/ClassAction_list" method="post">
	    <!-- 搜索功能 -->
	    <div class="layui-form-item" style="margin-left: 20px;">
		    <div class="layui-inline">
			    <div class="layui-input-inline">
			    	<input type="text" name="c_name" placeholder="请输入班级名称" class="layui-input">
			    </div>
			</div>
			<div class="layui-inline">
			    <div class="layui-input-inline">
			      <input type="submit" class="layui-btn layui-btn-mini" value="筛选" style="width: 80px;height: 30px;cursor: pointer;">
			    </div>
			</div>
		</div>
	</form>
    <div style="margin: 0px 20px 0px 20px ">
        <table class="layui-table">
            <thead>
                <tr>
                    <th>班级名称</th>
                    <th>技术教学人员</th>
                    <th>班主任</th>
                    <th>班级详情</th>                   
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            <s:iterator value="#pageBean.list">
                <tr>
                    <td><s:property value="c_name"/></td>
                    <td><s:property value="skillteacher.t_name"/></td>
                    <td><s:property value="classteacher.t_name"/></td>             
                    <td><button data-method="setTop" onclick="window.open('${pageContext.request.contextPath}/ClassAction_detail?teachers=<s:property value="classteacher.t_id"/>,<s:property value="skillteacher.t_id"/>&c_id=<s:property value="c_id"/>','','width=1300,height=500')" class="layui-btn layui-btn-mini">查看详情</button></td>
                    <td>
                    	<s:if test="#parameters.select==null">
                    		<a href="javascript:openDiv(<s:property value="c_id"/>)" class="layui-btn layui-btn-mini">修改</a>
                    		<a href="javascript:isDel(<s:property value="c_id"/>)" class="layui-btn layui-btn-mini">删除</a>
                    	</s:if>
                    	<s:else>
                    		<input type="button" class="layui-input" value="选择" onclick="selectClass(<s:property value="c_id" />,'<s:property value="c_name" />')" />
                    	</s:else>
                    </td>
                </tr>
                <div class="layui-form layui-form-pane" id="<s:property value="c_id"/>" style="display: none;position: fixed;z-index: 2;background: white;;width: 80%;height: 420px;margin-left: 8%;margin-top: 2%;">
	                <form action="${pageContext.request.contextPath}/ClassAction_save" method="post" style="margin:20px">
				       	<input type="hidden" name="c_id" value="<s:property value="c_id"/>">
				       	<div class="layui-form-item">
						    <label class="layui-form-label" style="width: 130px;">班级名称</label>
						    <div class="layui-input-inline">
						      <input type="text" name="c_name" value="<s:property value="c_name"/>" placeholder="请输入班级名称" autocomplete="off" class="layui-input">
						    </div>
						</div>
						
						<div class="layui-form-item">
				               <label class="layui-form-label" style="width: 130px;">班主任</label>
				               <div class="layui-input-inline">
				               	   <input type="hidden" id="teacher_1_<s:property value="c_id"/>" name="classteacher.t_id" value="<s:property value="classteacher.t_id"/>">
				                   <input type="text" id="teacher_name_1_<s:property value="c_id"/>" value="<s:property value="classteacher.t_name"/>" onfocus="window.open('${pageContext.request.contextPath}/TeacherAction_getTeacher?t_type=1&select=<s:property value="c_id"/>','','width=1300,height=500')" placeholder="没有则不填" autocomplete="off" class="layui-input">
				               </div>
				           </div>
				           
				           <div class="layui-form-item">
				               <label class="layui-form-label" style="width: 130px;">技术教学人员</label>
				               <div class="layui-input-inline">
				               	   <input type="hidden" id="teacher_2_<s:property value="c_id"/>" name="skillteacher.t_id" value="<s:property value="skillteacher.t_id"/>">
				                   <input type="text" id="teacher_name_2_<s:property value="c_id"/>" value="<s:property value="skillteacher.t_name"/>" onfocus="window.open('${pageContext.request.contextPath}/TeacherAction_getTeacher?t_type=2&select=<s:property value="c_id"/>','','width=1300,height=500')" placeholder="没有则不填" autocomplete="off" class="layui-input">
				               </div>
				           </div>
				           
						<div class="layui-form-item">
							  <input type="hidden" id="c_<s:property value='c_id'/>" value="<s:iterator value='students'><s:property value='s_id'/></s:iterator>">
				              <label class="layui-form-label" style="width: 130px;">学生</label>
				              <div class="layui-input-inline">
				                  <input type="text" id="s_students_<s:property value="c_id"/>" name="student" onfocus="openStudent(this.value,<s:property value="c_id"/>)" readonly="readonly" placeholder="没有则不填" autocomplete="off" class="layui-input">
				              </div>
				          </div>
				        <div class="layui-form-item">
				             <div style="margin:20px 0px 0px 50px">
						        <input type="submit" class="layui-btn layui-btn-normal" value="提交"/>
						        <a href="javascript:closeDiv(<s:property value="c_id"/>)" class="layui-btn layui-btn-warm">返回</a>
						    </div>
						 </div>
				    </form>
				</div>
            </s:iterator>
            </tbody>
        </table>
    </div>
</body>
</html>