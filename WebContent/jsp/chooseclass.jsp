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
    <script type="text/javascript">
	    window.onload=function(){
	    	var t_count = <s:property value="#totalCount"/>;
	    	//超过9个班级无法勾选
	    	if(t_count == 9){
	    		var sts = document.getElementsByName("classes");
	    		for(var i = 0; i < sts.length ;i++){
					sts[i].display = false;				
				}
	    	}else{
	    		var sts = document.getElementsByName("classes");
				var arr = new Array();
				var str = document.getElementById("s_stu").value;
				arr = str.split(",");
				for(var i = 0; i < sts.length ;i++){
					for(var j = 0; j < arr.length ;j++){
						if(sts[i].value == arr[j]){
							sts[i].checked = true;				
						}
					}
				}
	    	}		
		};
    	function selectClass(){
    		var value;
			var sts = document.getElementsByName("classes");
			for(var i = 0; i < sts.length ;i++){
				if(sts[i].checked){
					if(value == null){
						value = sts[i].value;
					}else{
						value = value + "," + sts[i].value;
					}				
				}
			}
			var classes = document.getElementsByName("classes");
			var num = 0;
			for(var i = 0; i < classes.length ;i++){
				if(classes[i].checked){
					num ++;			
				}
			}
			if(num == <s:property value="9 - #totalCount"/>){
				var st_1 = document.getElementsByName("classes");
				for(var i = 0; i < st_1.length ;i++){
					if(st_1[i].checked){							
					}else{
						st_1[i].disabled=true;
					}
				}
			}else{
				var st_2 = document.getElementsByName("classes");
				for(var i = 0; i < st_2.length ;i++){
					if(st_2[i].checked){							
					}else{
						st_2[i].disabled=false;
					}
				}
			}
			
			//获得添加页面的window对象
    		var win = window.opener;
    		//获得添加页面的document对象
    		var doc = win.document;
    		//获文本框,并赋值
    		if(value){
    			doc.getElementById("class_id").value = value;
    		}else{
    			doc.getElementById("class_id").value = "";	
    		}  	
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
	<s:if test="#parameters.classes != null">
		<input type="hidden" id="s_stu" value="<s:property value="#parameters.classes"/>">
	</s:if>
    <ul class="layui-nav" lay-filter="nav">
        <li class="layui-nav-item">
            <span style="font-size: 20px">卓越教务管理系统</span>
        </li>

        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/PkeAction_list">课表</a></li>
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
                <dd><a href="startPke.ppx?condition=0">开始排课</a></dd>
            </dl>
        </li>
    </ul>

    <fieldset class="layui-elem-field layui-field-title">
        <legend>班级列表<font color="red">(最多可选<s:property value="9 - #totalCount"/>个班级)</font></legend>
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
                    	<input type="checkbox" name="classes" class="layui-input" value="<s:property value="c_id"/>" onclick="selectClass()" />
                    </td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
</body>
</html>