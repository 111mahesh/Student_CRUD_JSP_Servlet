<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.OutputStream,com.dao.StudentDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% OutputStream o=response.getOutputStream();
	int id=Integer.parseInt(request.getParameter("sid"));
	byte[] image=new StudentDao().findImageBySid(id);
	response.setContentType("image/jpeg");
	o.write(image);
	o.flush();
	o.close(); 
	
	%>
</body>
</html>