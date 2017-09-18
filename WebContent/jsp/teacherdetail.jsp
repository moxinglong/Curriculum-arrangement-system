<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>老师教学经验</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/layui/images/favicon.ico">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/js/jquery-1.8.3.js"></script>
</head>

<body>
	<fieldset class="layui-elem-field layui-field-title">
        <legend>所带班级</legend>
    </fieldset>
    <div style="margin: 0px 20px 0px 20px ">
        <table class="layui-table">
            <thead>
               <tr>
                    <th>班级名称</th>
                    <th>技术教学人员</th>
                    <th>班主任</th>
                    <th>班级详情</th>                   
                </tr>
            </thead>
            <tbody>
           <s:iterator value="#classes">
                <tr>
                    <td><s:property value="c_name"/></td>
                    <td><s:property value="skillteacher.t_name"/></td>
                    <td><s:property value="classteacher.t_name"/></td>
                    <td><button data-method="setTop" onclick="window.open('${pageContext.request.contextPath}/ClassAction_detail?teachers=<s:property value="classteacher.t_id"/>,<s:property value="skillteacher.t_id"/>&c_id=<s:property value="c_id"/>','','width=1300,height=500')" class="layui-btn layui-btn-mini">查看详情</button>                
           		</tr>
           </s:iterator>
         </tbody>
        </table>
      </div>
     <fieldset class="layui-elem-field layui-field-title">
        <legend>学生评价</legend>
    </fieldset>
     <div style="margin: 0px 20px 0px 20px ">
     	<s:iterator value="#comments">
           	<p><s:property value="c_context"/></p>
			<p>匿名用户:发表于<s:property value="c_time"/></p>
			<hr/>                 
        </s:iterator>   	
    </div>
    <fieldset class="layui-elem-field layui-field-title">
        <legend>进行评价</legend>
         <div style="margin: 30px 20px 0px 20px ">
         	<form action="${pageContext.request.contextPath}/CommentAction_save" method="post">
         		<input type="hidden" name="teacher.t_id" value="<s:property value="#parameters.t_id"/>">
				<textarea name="c_context" rows="5" cols="10" style="width: 100%;border: 3px solid gray;" placeholder="请注意言辞，不要使用过激词语"></textarea>
				<input type="submit" onclick="closeWin()" value="提交" class="layui-btn layui-btn-mini" style="width: 100px;height: 50px;background-color: #1AA094;float: right;">
    		</form>
    	</div>
    </fieldset>
</body>
	<script type="text/javascript">
		function closeWin(){
			window.close();
		}
	</script>
</html>