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
    <title>课程表</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/layui/images/favicon.ico">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>

<body>
    <ul class="layui-nav" lay-filter="nav">
        <li class="layui-nav-item">
            <span style="font-size: 20px">卓越教务管理系统</span>
        </li>

        <li class="layui-nav-item layui-this"><a>课表</a></li>
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
		<li class="layui-nav-item">
            <a href="javascript:;">排课管理</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/jsp/addpke.jsp">开始排课</a></dd>
            </dl>
        </li>
    </ul>

    <fieldset class="layui-elem-field layui-field-title">
        <legend>Copyright © 2016 - 2017 Mo XingLong Inc. All Rights Reserved</legend>
    </fieldset>

    <div style="margin: 0px 20px 0px 20px ">
        <table class="layui-table">
            <thead>
                <tr>
                    <th> 教室/日期</th>
                    <th colspan="3">星期一 (2017.7.24)</th>
                    <th colspan="3">星期二 (2017.7.25)</th>
                    <th colspan="3">星期三 (2017.7.26)</th>
                    <th colspan="3">星期四 (2017.7.27)</th>
                    <th colspan="3">星期五 (2017.7.28)</th>
                    <th colspan="3">星期六 (2017.7.29)</th>
                    <th colspan="3">星期日 (2017.7.30)</th>
                </tr>
                <tr>
                    <th>班级</th>
                    <th>上午课程</th>
                    <th>下午课程</th>
                    <th>晚上课程</th>
                    <th>上午课程</th>
                    <th>下午课程</th>
                    <th>晚上课程</th>
                    <th>上午课程</th>
                    <th>下午课程</th>
                    <th>晚上课程</th>
                    <th>上午课程</th>
                    <th>下午课程</th>
                    <th>晚上课程</th>
                    <th>上午课程</th>
                    <th>下午课程</th>
                    <th>晚上课程</th>
                    <th>上午课程</th>
                    <th>下午课程</th>
                    <th>晚上课程</th>
                    <th>上午课程</th>
                    <th>下午课程</th>
                    <th>晚上课程</th>
                </tr>


            </thead>
            <tbody>
                <tr>
                    <td>101教室</td> 
	                <s:iterator value="#list1">
	                	<td><s:property value="cclass.c_name"/></td>
	                </s:iterator>                 
                </tr>
                <tr>
                    <td>102教室</td>
	                <s:iterator value="#list2">
	                	<td><s:property value="cclass.c_name"/></td>
	                </s:iterator>                     
                </tr>
				<tr>
                    <td>103教室</td>
	                 <s:iterator value="#list3">
	                	<td><s:property value="cclass.c_name"/></td>
	                </s:iterator>                    
                </tr>
                <tr>
                    <td>104教室</td> 
	                <s:iterator value="#list4">
	                	<td><s:property value="cclass.c_name"/></td>
	                </s:iterator>                 
                </tr>
                <tr>
                    <td>105教室</td>  
	                <s:iterator value="#list5">
	                	<td><s:property value="cclass.c_name"/></td>
	                </s:iterator>                  
                </tr>
                <tr>
                    <td>106教室</td> 
	                <s:iterator value="#list6">
	                	<td><s:property value="cclass.c_name"/></td>
	                </s:iterator>                 
                </tr>
                <tr>
                    <td>107教室</td>  
	                <s:iterator value="#list7">
	                	<td><s:property value="cclass.c_name"/></td>
	                </s:iterator>                
                </tr>
            </tbody>
        </table>
    </div>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script>
        layui.use('element', function() {
            var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function(elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
    </script>

</body>
</html>