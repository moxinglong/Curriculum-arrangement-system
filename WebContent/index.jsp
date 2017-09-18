<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <title>欢迎进入卓越教务管理系统...</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/layui/images/favicon.ico">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		body{
			background-image: url(./layui/images/loading.gif);
			background-repeat: no-repeat;
			background-size:100% 100%; 
			background-attachment: fixed;
		}
	</style>
  </head>
  	
  <body>
  
  </body>
  <script type="text/javascript">
	    setTimeout(reDo, 3000);
	    function reDo(){
	        top.location.href = "${pageContext.request.contextPath}/ClassroomAction_list";
	    }
	</script>
</html>
