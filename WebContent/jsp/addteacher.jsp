<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>添加教师</title>
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
		$(function(){
			$.extend($.validator.defaults,{ignore:""});
			//表单验证
    	  $("#teacherForm").validate({
				rules:{
					t_name:{
						required:true,
						minlength:2
					},
					t_birth:{
						required:true
					},t_tel:{
						required:true,
						digits:true,
						maxlength:11,
						minlength:11
					},t_idcard:{
						required:true,
						maxlength:18,
						minlength:18
					},t_address:{
						required:true
					}
				},
				messages:{
					t_name:{
						required:"用户名不能为空!",
						minlength:"至少为两个字符!"
					},
					t_birth:{
						required:"出生日期不能为空!"
					},t_tel:{
						required:"手机号码不能为空！",
						digits:"只能输入数字!",
						maxlength:"手机号码为11位!",
						minlength:"手机号码为11位!"
					},t_idcard:{
						required:"身份证号码不能为空!",
						maxlength:"身份证长度为18位!",
						minlength:"身份证长度为18位!"
					},t_address:{
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
    	var provinces = new Array(3);
    	provinces[0] = "北京市";
    	provinces[1] = "上海市";
    	provinces[2] = "广东省";
	    var cities = new Array(3);
		cities[0] = new Array("东城区","西城区","崇文区","宣武区");
		cities[1] = new Array("黄浦区","卢湾区","徐汇区","长宁区");
		cities[2] = new Array("广州市","韶关市","深圳市","珠海市");
		
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
	    	 form.on('select(province)', function(data){
	    		 var val = $("#province").val();
	    		 var $city = $("#city");
	    		 $city.empty();
	    		 $.each(cities, function(i, city){
	    			if(val == i){
	    				$.each(city, function(i, city){
	    					var $opt = $("<option>"+city+"</option>");
							$city.append($opt);
							form.render('select'); //这个很重要
	    				});
	    			} 
	    		 });
	    		$.each(provinces, function(i, province){
	    			if(val == i){
	    				p_val = province;
	    			}
	    		});
	    		$("#t_address").attr("value",p_val+$("#city").val());
	    	}); 
	    	
	    	 form.on('select(city)', function(data){
	    		 var val = $("#city").val();
	    		 $.each(provinces, function(i, province){
		    			if(val == i){
		    				p_val = province;
		    			}
		    		});
	    		 $("#t_address").attr("value",p_val+data.value);
	    	}); 
    	});
    </script>
</head>
<body>
    <ul class="layui-nav">
        <li class="layui-nav-item">
            <span style="font-size: 20px">卓越教务管理系统</span>
        </li>

        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/ClassroomAction_list">课表</a></li>
        <li class="layui-nav-item  layui-this">
            <a href="javascript:;">教学团队管理</a>
            <dl class="layui-nav-child">
                 <dd><a href="${pageContext.request.contextPath}/TeacherAction_list">教师管理</a></dd>
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
        <legend>添加教师</legend>
    </fieldset>
    <form class="layui-form layui-form-pane" id="teacherForm" action="${pageContext.request.contextPath}/TeacherAction_save" method="post" style="margin:20px">

        <div class="layui-form-item">
            <div class="layui-inline">
			    <label class="layui-form-label">姓名</label>
			    <div class="layui-input-inline">
			      <input type="text" name="t_name" placeholder="请输入姓名" autocomplete="off" class="layui-input">
			    </div>
			</div>
           <div class="layui-inline">
		      <label class="layui-form-label">出生日期</label>
		      <div class="layui-input-inline">
		        <input type="text" name="t_birth" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
		      </div>
		    </div>
            <div class="layui-inline">
                <label class="layui-form-label">老师类型</label>
                <div class="layui-input-inline">
                    <select name="t_type" lay-filter="aihao">                      
                      <option value="1" selected="">班主任</option>
                      <option value="2">技术教学人员</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <select name="t_sex" lay-filter="aihao">
                       <option value="男" selected="">男</option>
                        <option value="女">女</option>
                    </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input type="text" name="t_tel" placeholder="请输入联系电话" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证号码</label>
            <div class="layui-input-block">
                <input type="text" name="t_idcard" placeholder="请输入身份证号码" autocomplete="off" class="layui-input">
            </div>
        </div>
         <div class="layui-form-item">
         	<div class="layui-inline">
			    <label class="layui-form-label">居住地址</label>
			    <div class="layui-input-inline">
			      <select id="province" lay-filter="province">
			        <option value="3"></option>
			        <option value="0">北京市</option>
			        <option value="1">上海市</option>
			        <option value="2">广东省</option>
			      </select>
			   </div>
			</div>			
			<div class="layui-inline">
			    <div class="layui-input-inline">
			      <select id="city" lay-filter="city">
			      </select>
			   </div>
			</div>
			<input type="text" id="t_address" name="t_address" style="display: none;">
		</div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">所学专业</label>
                <div class="layui-input-inline">
                    <input type="text" name="t_major" placeholder="没有则不填" autocomplete="off" class="layui-input">
                </div>
            </div>
            
            <div class="layui-inline">
                <label class="layui-form-label">毕业院校</label>
                <div class="layui-input-inline">
                    <input type="text" name="t_school" placeholder="没有则不填" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
                </div>
            </div>
             <div style="margin:0px 0px 0px 50px">
		        <input type="submit" class="layui-btn layui-btn-normal" value="提交"/>
		        <a href="javascript:window.history.go(-1)" class="layui-btn layui-btn-warm">返回</a>
		    </div>
		 </div>
    </form>
</body>

</html>