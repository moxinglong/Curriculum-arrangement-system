<%@page import="java.text.SimpleDateFormat"%>
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
    <title>查看教师</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/layui/images/favicon.ico">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
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
		function selectTeacher(t_id, t_name){
			//获得添加页面的window对象
			var win = window.opener;
			//获得添加页面的document对象
			var doc = win.document;
			//获得隐藏域,和 文本框,并赋值
			doc.getElementById("teacher_<s:property value='#parameters.t_type'/>_<s:property value='#parameters.select'/>").value = t_id;
			doc.getElementById("teacher_name_<s:property value='#parameters.t_type'/>_<s:property value='#parameters.select'/>").value = t_name;
			//关闭当前窗口
			window.close();
		}
		function isDel(t_id){
			var flag = window.confirm("您确定要删除该老师吗？");
			if(flag == true){
				location.href="${pageContext.request.contextPath}/TeacherAction_delete?t_id="+t_id+"";
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
	<div id="mask" class="mask" style="display: none;z-index: 1"></div>
    <ul class="layui-nav">
        <li class="layui-nav-item">
            <span style="font-size: 20px">卓越教务管理系统</span>
        </li>

		<!-- *待改区 -->
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/ClassroomAction_list">课表</a></li>
        <li class="layui-nav-item  layui-this">
            <a href="javascript:;">教学团队管理</a>
            <dl class="layui-nav-child">
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
        <legend>教学老师列表</legend>
    </fieldset>
	<form id="searchForm" action="${pageContext.request.contextPath}/TeacherAction_list" method="post">
	    <!-- 搜索功能 -->
	    <div class="layui-form-item" style="margin-left: 20px;">
		    <div class="layui-inline">
			    <div class="layui-input-inline">
			    	<input type="text" name="t_name" placeholder="请输入姓名" class="layui-input">
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
                    <th>操作</th>

                </tr>
            </thead>
            <tbody>
            <s:iterator value="#pageBean.list">
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
                    <td>
                    	<s:if test="#parameters.t_type==null">
                    		<a href="javascript:openDiv(<s:property value="t_id"/>)" class="layui-btn layui-btn-mini">修改</a>
                    		<a href="javascript:isDel(<s:property value="t_id"/>)" class="layui-btn layui-btn-mini">删除</a>
                    	</s:if>
                    	<s:else>
                    		<input type="button" class="layui-input" value="选择" onclick="selectTeacher(<s:property value="t_id" />,'<s:property value="t_name"/>')" />
                    	</s:else>
                   </td>
                </tr>     
                <div class="layui-form layui-form-pane" id="<s:property value="t_id"/>" style="display: none;position: fixed;z-index: 2;background: white;;width: 80%;height: 420px;margin-left: 8%;margin-top: 2%;">
	                <form id="<s:property value="t_id"/>" action="${pageContext.request.contextPath}/TeacherAction_save" method="post" style="margin:20px">
				        <input type="hidden" name="t_id" value="<s:property value="t_id"/>">
				        <div class="layui-form-item">
				            <div class="layui-inline">
							    <label class="layui-form-label">姓名</label>
							    <div class="layui-input-inline">
							      <input type="text" name="t_name" value="<s:property value="t_name"/>" placeholder="请输入姓名" autocomplete="off" class="layui-input">
							    </div>
							</div>
				           <div class="layui-inline">
						      <label class="layui-form-label">出生日期</label>
						      <div class="layui-input-inline">
						        <input type="text" name="t_birth" id="date" value="<s:property value="t_birth"/>" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
						      </div>
						    </div>
				            <div class="layui-inline">
				                <label class="layui-form-label">老师类型</label>
				                <div class="layui-input-inline">				                	
				                    <select name="t_type" lay-filter="aihao"> 
				                    	<option value="1" <s:if test="t_type == 1">selected="selected"</s:if>>班主任</option>
				                      	<option value="2" <s:if test="t_type == 2">selected="selected"</s:if>>技术教学人员</option>            				                      
				                    </select>
				                </div>
				            </div>
				        </div>
				        <div class="layui-form-item">
				            <label class="layui-form-label">性别</label>
				            <div class="layui-input-inline">
				                <select name="t_sex" lay-filter="aihao">
				                       <option value="男" <s:if test="t_sex == '男'.toString()">selected="selected"</s:if>>男</option>
				                       <option value="女" <s:if test="t_sex == '女'.toString()">selected="selected"</s:if>>女</option>
				                    </select>
				            </div>
				        </div>
				
				        <div class="layui-form-item">
				            <label class="layui-form-label">联系电话</label>
				            <div class="layui-input-block">
				                <input type="text" name="t_tel" value="<s:property value="t_tel"/>" placeholder="请输入联系电话" class="layui-input">
				            </div>
				        </div>
				        <div class="layui-form-item">
				            <label class="layui-form-label">身份证号码</label>
				            <div class="layui-input-block">
				                <input type="text" name="t_idcard" value="<s:property value="t_idcard"/>" placeholder="请输入身份证号码" autocomplete="off" class="layui-input">
				            </div>
				        </div>
				        <input type="text" name="t_address" value="<s:property value="t_address"/>" style="display: none;">
				        <div class="layui-form-item">
				            <div class="layui-inline">
				                <label class="layui-form-label">所学专业</label>
				                <div class="layui-input-inline">
				                    <input type="text" name="t_major" value="<s:property value="t_major"/>" placeholder="没有则不填" autocomplete="off" class="layui-input">
				                </div>
				            </div>
				            
				            <div class="layui-inline">
				                <label class="layui-form-label">毕业院校</label>
				                <div class="layui-input-inline">
				                    <input type="text" name="t_school" value="<s:property value="t_school"/>" placeholder="没有则不填" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
				                </div>
				            </div>
				            
				             <div style="margin:20px 0px 0px 50px">
						        <input type="submit" class="layui-btn layui-btn-normal" value="提交"/>
						        <a href="javascript:closeDiv(<s:property value="t_id"/>)" class="layui-btn layui-btn-warm">返回</a>
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