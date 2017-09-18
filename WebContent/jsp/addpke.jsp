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
    <title>开始排课</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/layui/images/favicon.ico">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
    	function validate(){  		
    		var class_id = document.getElementById("class_id");
    		if(class_id.value == ""){
    			alert("所选班级不能为空!");
    			class_id.focus();
    			return false;
    		}
    	}
	    function openClass(classes){
			window.open("${pageContext.request.contextPath}/ClassAction_choose?classes="+classes+"","","width=1300,height=500");
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
        <li class="layui-nav-item">
            <a href="javascript:;">班级管理</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/ClassAction_list">查看所有班级</a></dd>
            	<dd><a href="${pageContext.request.contextPath}/jsp/addclass.jsp">添加班级</a></dd>
            </dl>
        </li>
		<li class="layui-nav-item  layui-this">
            <a href="javascript:;">排课管理</a>
        </li>
    </ul>

    <fieldset class="layui-elem-field layui-field-title">
        <legend>进行排课</legend>
    </fieldset>
	 <form align="center" class="layui-form layui-form-pane" onsubmit="return validate()" action="${pageContext.request.contextPath}/ClassroomAction_pke" method="post" style="margin:20px">        
		<div class="layui-form-item" align="center">
              <label class="layui-form-label" style="width: 130px;margin-left: 48%;">请选择班级：</label>
        </div>
        <div class="layui-form-item">
              <div class="layui-input-inline">
                <input type="text" id="class_id" name="ids" onfocus="openClass(this.value)" style="width: 1000px;height: 200px;margin-left: 90%;border: 3px solid;gray;" readonly="readonly" autocomplete="off" class="layui-input">
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