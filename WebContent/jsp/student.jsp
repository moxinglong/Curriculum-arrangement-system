<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>查看学生</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/layui/images/favicon.ico">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/layui/js/jquery-1.8.3.js"></script>
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
	</style>
	<script type="text/javascript">
		
		window.onload=function(){
			var sts = document.getElementsByName("students");
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
		};
		
		
		function isDel(s_id){
			var flag = window.confirm("您确定要删除该学生吗？");
			if(flag == true){
				location.href="${pageContext.request.contextPath}/StudentAction_delete?s_id="+s_id+"";
			}
		}	
		function openDiv(e){
			document.getElementById("mask").style.display = "block";
			document.getElementById(e).style.display = "block";
		}
		
		function closeDiv(e){
			document.getElementById(e).style.display = "none";
			document.getElementById("mask").style.display = "none";			
		}
		function checkAll(){
			var value;
			var sts = document.getElementsByName("students");
			for(var i = 0; i < sts.length ;i++){
				if(sts[i].checked){
					if(value == null){
						value = sts[i].value;
					}else{
						value = value + "," + sts[i].value;
					}				
				}
			}
			//获得添加页面的window对象
    		var win = window.opener;
    		//获得添加页面的document对象
    		var doc = win.document;
    		//获文本框,并赋值
    		if(value){
    			doc.getElementById("s_students_<s:property value='#parameters.select'/>").value = value;
    		}else{
    			doc.getElementById("s_students_<s:property value='#parameters.select'/>").value = "";	
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
		
    	layui.use(['form', 'layedit', 'laydate'], function(){
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
	<s:if test="#parameters.students != null">
		<input type="hidden" id="s_stu" value="<s:property value="#parameters.students"/>">
	</s:if>
	<div id="mask" class="mask" style="display: none;z-index: 1"></div>
    <ul class="layui-nav">
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
        <li class="layui-nav-item  layui-this">
            <a href="javascript:;">学生管理</a>
            <dl class="layui-nav-child">
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
        <legend>学生列表</legend>
    </fieldset>
    
    <form id="searchForm" action="${pageContext.request.contextPath}/StudentAction_list" method="post">
	    <!-- 搜索功能 -->
	    <div class="layui-form-item" style="margin-left: 20px;">
		    <div class="layui-inline">
			    <div class="layui-input-inline">
			    	<input type="text" name="s_name" placeholder="请输入姓名" class="layui-input">
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
                    <th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>出生日期</th>
                    <th>联系电话</th>
                    <th>居住地址</th>
                    <th>所学专业</th>
                    <th>所在院校</th>
                    <th>班级</th>
                    <th>操作</th>

                </tr>
            </thead>
            <tbody>
           <s:iterator value="#pageBean.list">
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
                    <td>
                    	<s:if test="#parameters.select==null">
	                    	<a href="javascript:openDiv(<s:property value="s_id"/>)" class="layui-btn layui-btn-mini">修改</a> 
	                    	<a href="javascript:isDel(<s:property value="s_id"/>)" class="layui-btn layui-btn-mini">删除</a>
                    	</s:if>
                    	<s:else>
                    		<input type="checkbox" name="students" value="<s:property value="s_id"/>" class="layui-input" onclick="checkAll(<s:property value='#parameters.select'/>)" />
                    	</s:else>
                    </td>
                </tr>
                <div class="layui-form layui-form-pane" id="<s:property value="s_id"/>" style="display: none;position: fixed;z-index: 2;background: white;;width: 80%;height: 400px;margin-left: 8%;margin-top: 2%;">
                <form action="${pageContext.request.contextPath}/StudentAction_save" method="post" style="margin:20px">
			        <input type="hidden" name="s_id" value="<s:property value="s_id"/>">
			        <div class="layui-form-item">
			            <div class="layui-inline">
						    <label class="layui-form-label">姓名</label>
						    <div class="layui-input-inline">
						      <input type="text" name="s_name" value="<s:property value="s_name"/>" placeholder="请输入姓名" autocomplete="off" class="layui-input">
						    </div>
						</div>
			           <div class="layui-inline">
					      <label class="layui-form-label">出生日期</label>
					      <div class="layui-input-inline">
					        <input type="text" name="s_birth" value="<s:property value="s_birth"/>" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
					      </div>
					    </div>
			            <div class="layui-inline">
				            <label class="layui-form-label">性别</label>
				            <div class="layui-input-inline">
				                <select name="s_sex" lay-filter="aihao">
				                       <option value="男" <s:if test="s_sex=='男'.toString()">selected="selected"</s:if>>男</option>
				                       <option value="女" <s:if test="s_sex=='女'.toString()">selected="selected"</s:if>>女</option>
				               </select>
			            	</div>
			        	</div>
			        </div>
			       
			        <div class="layui-form-item">
			            <label class="layui-form-label">联系电话</label>
			            <div class="layui-input-block">
			                <input type="text" name="s_tel" value="<s:property value="s_tel"/>" placeholder="请输入联系电话" class="layui-input">
			            </div>
			        </div>
			         <div class="layui-form-item">
						<input type="text" name="s_address" value="<s:property value="s_address"/>" style="display: none;">
					</div>
			
			        <div class="layui-form-item">
			            <div class="layui-inline">
			                <label class="layui-form-label">所学专业</label>
			                <div class="layui-input-inline">
			                    <input type="text" name="s_major" value="<s:property value="s_major"/>" placeholder="没有则不填" autocomplete="off" class="layui-input">
			                </div>
			            </div>
			            
			            <div class="layui-inline">
			                <label class="layui-form-label">毕业院校</label>
			                <div class="layui-input-inline">
			                    <input type="text" name="s_school" value="<s:property value="s_school"/>" placeholder="没有则不填" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			                </div>
			            </div>
			            
			            <div class="layui-inline">
			                <label class="layui-form-label">所属班级</label>
			                <div class="layui-input-inline">
			                	<input type="hidden" id="c_id_<s:property value="s_id"/>" name="cclass.c_id">
			                    <input type="text" id="c_name_<s:property value="s_id"/>" value="<s:property value="cclass.c_name"/>" onfocus="window.open('${pageContext.request.contextPath}/ClassAction_list?select=<s:property value="s_id"/>','','width=1300,height=500')" placeholder="没有则不填" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">                	
			                </div>
			            </div>
			             <div style="margin:20px 0px 0px 50px">
					        <input type="submit" class="layui-btn layui-btn-normal" value="提交"/>
					        <a href="javascript:closeDiv(<s:property value="s_id"/>)" class="layui-btn layui-btn-warm">返回</a>
					    </div>
					 </div>
			    </form>
                </div>
            </s:iterator>
            </tbody>
        </table>
    </div>
    <div id="demo0"></div>
</body>
</html>