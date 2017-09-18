<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>班级详情</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/layui/images/favicon.ico">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>

<body>
	<fieldset class="layui-elem-field layui-field-title">
        <legend>教学老师</legend>
    </fieldset>
    <div style="margin: 0px 20px 0px 20px ">
        <table class="layui-table">
            <thead>
               <tr>
                   <tr>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>出生日期</th>    
                    <th>身份证号</th>                
                    <th>老师类型</th>
                    <th>电话号码</th>
                    <th>家庭住址</th>                                                                          
                    <th>所学专业</th>
                    <th>毕业院校</th>
                    <th>入职时间</th>
                    <th>教学经验</th>                 
                </tr>                 
            </thead>
            <tbody>
            	<s:iterator value="#classTeacher">
	           		<tr>
	                    <td><s:property value="t_name"/></td>
	                    <td><s:property value="t_sex"/></td>
	                    <td><s:property value="t_birth"/></td>
	                    <td><s:property value="t_idcard"/></td>
	                    <s:if test="t_type==1">
	                    	<td>班主任</td>
	                    </s:if>
	                    <s:else>
	                    	<td>技术教学人员</td>
	                    </s:else>
	                    <td><s:property value="t_tel"/></td>
	                    <td><s:property value="t_address"/></td>
	                    <td><s:property value="t_major"/></td>
	                    <td><s:property value="t_school"/></td>
	                    <td><s:property value="t_jobtime"/></td>
	                    <td><button data-method="setTop" class="layui-btn layui-btn-mini" onclick="window.open('${pageContext.request.contextPath}/TeacherAction_detail?t_id=<s:property value="t_id"/>','','width=1300,height=500')">查看详情</button></td>
	                </tr> 
                </s:iterator> 
                <s:iterator value="#skillTeacher">
	           		<tr>
	                    <td><s:property value="t_name"/></td>
	                    <td><s:property value="t_sex"/></td>
	                    <td><s:property value="t_birth"/></td>
	                    <td><s:property value="t_idcard"/></td>
	                    <s:if test="t_type==1">
	                    	<td>班主任</td>
	                    </s:if>
	                    <s:else>
	                    	<td>技术教学人员</td>
	                    </s:else>
	                    <td><s:property value="t_tel"/></td>
	                    <td><s:property value="t_address"/></td>
	                    <td><s:property value="t_major"/></td>
	                    <td><s:property value="t_school"/></td>
	                    <td><s:property value="t_jobtime"/></td>
	                    <td><button data-method="setTop" class="layui-btn layui-btn-mini" onclick="window.open('${pageContext.request.contextPath}/TeacherAction_detail?t_id=<s:property value="t_id"/>','','width=1300,height=500')">查看详情</button></td>
	                </tr> 
                </s:iterator>   
         </tbody>
        </table>
      </div>
     <fieldset class="layui-elem-field layui-field-title">
        <legend>班级学生</legend>
    </fieldset>
     <div style="margin: 0px 20px 0px 20px ">
     	<table class="layui-table">
            <thead>
               <tr>
                   	<th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>出生日期</th>
                    <th>联系电话</th>
                    <th>居住地址</th>
                    <th>所学专业</th>
                    <th>所在院校</th>
                    <th>班级</th>                   
                </tr>
            </thead>
            <tbody>
            <s:if test="#students != 0">
            </s:if>
            <s:iterator value="#students">
                <tr>
                    <td><s:property value="s_id"/></td>
                    <td><s:property value="s_name"/></td>
                    <td><s:property value="s_sex"/></td>
                    <td><s:property value="s_birth"/></td>                  
                    <td><s:property value="s_tel"/></td>
                    <td><s:property value="s_address"/></td>                   
                    <td><s:property value="s_major"/></td>
                    <td><s:property value="s_school"/></td>
                    <td><s:property value="cclass.c_name"/></td>
            </s:iterator>
         </tbody>
        </table>	
    </div>
</body>
</html>