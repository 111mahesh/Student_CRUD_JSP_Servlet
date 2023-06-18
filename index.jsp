<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.model.Student,com.dao.StudentDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: rgb(255, 255, 128);">

	<center >

		<h1 >Student Form</h1>
		<hr>
		<form action="StudentServlet" method="post" enctype="multipart/form-data" style="background-color: rgb(255, 255, 128);" >
		
		<table border="1"  style="background-color:rgba(255, 127, 80, 0.58);">
			<tr>
				<td>ID:</td>
				<td><input type="text" name="sid" value="0"></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="sname"></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><input type="radio" name="sgender" value="Male">Male
				<input type="radio" name="sgender" value="Female">Female</td>
			</tr>
			<tr>
				<td>City:</td>
				<td><select name="scity">
						<option value="Latur">Latur</option>
						<option value="Pune">Pune</option>
						<option value="Akola">Akola</option>
						<option value="Mumbai">Mumbai</option>
						<option value="Ausa">Ausa</option>
						<option value="Nanded">Nanded</option>
				</select></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><textarea name="saddress" rows="5" cols="15"></textarea></td>
			</tr>
			<tr>
				<td>Stream:</td>
				<td><select name="sstream">
				<option value="SSC">SSC</option> 
				<option value="HSC">HSC</option> 
				<option value="UG">UG</option> 
				<option value="PG">PG</option> 
				<option value="PHD">PHD</option> 
				</select></td>
			</tr>
			<tr>
				<td>PerCentage:</td>
				<td><input type="text" name="sper"></td>
			</tr>
			<tr>
				<td>Hobbies:</td>
				<td><input type="checkbox" name="shobbies" value="Cricket">Cricket
				<input type="checkbox" name="shobbies" value="Reading">Reading
				<input type="checkbox" name="shobbies" value="Writing">Writing
				<br>
				<input type="checkbox" name="shobbies" value="Cooking">Cooking
				<input type="checkbox" name="shobbies" value="Riding">Riding
				</td>
			</tr>
			<tr>
			<td>Upload Image</td>
			<td><input type="file" name="simage" ></td>
			</tr>
			<tr>
			<td>Upload Resume</td>
			<td><input type="file" name="sresume" ></td>
			</tr>
			
			<tr>
			<td colspan="2" align="center"><input type="submit" name="b1" value="Add">	
			<input type="submit" name="b1" value="Delete">
			<input type="submit" name="b1" value="display">
			</td>
			</tr>

		</table>
	</form>
	<hr>
	<h1>Student List</h1>
	<hr>
	<table border="1" style="background: rgba(0, 128, 0, 0.3)">
		<th>ID</th>
		<th>Image</th>
		<th>Name</th>
		<th>City</th>
		<th>Gender</th>
		<th>Address</th>
		<th>Stream</th>
		<th>Percentage</th>
		<th>Hobbies</th>
		<th>View Resume</th>
	
	<% for(Student s:new StudentDao().findAllStudent())
		{%>
			<tr>
			<td><%=s.getSid() %></td>
			<td><img src="image.jsp?sid=<%=s.getSid() %>" height="100" width="100"></td>
			<td><%=s.getSname() %></td>
			<td><%=s.getScity()%></td>
			<td><%=s.getSgender() %></td>
			<td><%=s.getSaddress() %></td>
			<td><%=s.getSstream() %></td>
			<td><%=s.getSper() %></td>
			<td><%=s.getShobbies() %></td>
			<td ><a href="resume.jsp?sid=<%=s.getSid() %>">Click Here</a> </td>
			</tr>
		<%}%>
	</table>
	
	</center>
</body>
</html>