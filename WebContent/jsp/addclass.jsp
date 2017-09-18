<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>添加班级</title>
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
		function openStudent(student){
			window.open("${pageContext.request.contextPath}/StudentAction_getStudent?cclass.c_id=&students="+student+"&select=true","","width=1300,height=500");
		}
		$(function(){
			$.extend($.validator.defaults,{ignore:""});
			//表单验证
    	  $("#classForm").validate({
				rules:{
					s_name:{
						required:true,
						minlength:2
					},
					s_birth:{
						required:true
					},
					s_tel:{
						required:true,
						digits:true,
						maxlength:11,
						minlength:11
					},
					s_address:{
						required:true
					}
				},
				messages:{
					s_name:{
						required:"用户名不能为空!",
						minlength:"至少为两个字符!"
					},
					s_birth:{
						required:"出生日期不能为空!"
					},
					s_tel:{
						required:"手机号码不能为空！",
						digits:"只能输入数字!",
						maxlength:"手机号码为11位!",
						minlength:"手机号码为11位!"
					},
					s_address:{
						required:"请选择地区!"
					}
				},
				errorElement:"label",
				success:function(label){
					label.addClass("success");
				}
			});
		});
	</script>
    <script type="text/javascript">
		layui.use(['element', 'form'], function() {
            var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
            // var form = layui.form();
            //监听导航点击
            element.on('nav(demo)', function(elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
		
    	layui.use(['form', 'layedit', 'laydate'], function(){
    		  var $ = layui.$ //重点处
	    	  var form = layui.form
	    	  ,layer = layui.layer
	    	  ,layedit = layui.layedit
	    	  ,laydate = layui.laydate;
	    	  
	    	  //日期
	    	  laydate.render({
	    	    elem: '#date'
	    	  });
	    	  laydate.render({
	    	    elem: '#date1'
	    	  });
    	});
    </script>
</head>

<body>
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
                <dd><a href="${pageContext.request.contextPath}/ClassAction_list">查看所有班级</a></dd>
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
        <legend>添加班级</legend>
    </fieldset>
     <form class="layui-form layui-form-pane" id="classForm" action="${pageContext.request.contextPath}/ClassAction_save" method="post" style="margin:20px">

       	<div class="layui-form-item">
		    <label class="layui-form-label" style="width: 130px;">班级名称</label>
		    <div class="layui-input-inline">
		      <input type="text" name="c_name" placeholder="请输入班级名称" autocomplete="off" class="layui-input">
		    </div>
		</div>
		
		<div class="layui-form-item">
               <label class="layui-form-label" style="width: 130px;">班主任</label>
               <div class="layui-input-inline">
               	   <input type="hidden" id="teacher_1_flag" name="classteacher.t_id">
                   <input type="text" id="teacher_name_1_flag" onfocus="window.open('${pageContext.request.contextPath}/TeacherAction_getTeacher?t_type=1&select=flag','','width=1300,height=500')" placeholder="没有则不填" autocomplete="off" class="layui-input">
               </div>
           </div>
           
           <div class="layui-form-item">
               <label class="layui-form-label" style="width: 130px;">技术教学人员</label>
               <div class="layui-input-inline">
               	   <input type="hidden" id="teacher_2_flag" name="skillteacher.t_id">
                   <input type="text" id="teacher_name_2_flag" onfocus="window.open('${pageContext.request.contextPath}/TeacherAction_getTeacher?t_type=2&select=flag','','width=1300,height=500')" placeholder="没有则不填" autocomplete="off" class="layui-input">
               </div>
           </div>
           
		<div class="layui-form-item">
              <label class="layui-form-label" style="width: 130px;">学生</label>
              <div class="layui-input-inline">
                  <input type="text" id="s_students_true" name="student" onfocus="openStudent(this.value)" readonly="readonly" placeholder="没有则不填" autocomplete="off" class="layui-input">
              </div>
          </div>
        <div class="layui-form-item">
             <div style="margin:20px 0px 0px 50px">
		        <input type="submit" class="layui-btn layui-btn-normal" value="提交"/>
		        <a href="javascript:window.history.go(-1)" class="layui-btn layui-btn-warm">返回</a>
		    </div>
		 </div>
    </form>
</body>
</html>