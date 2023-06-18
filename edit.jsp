<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.model.Student,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: rgb(255, 255, 128);">

	<center >

		<%Student s=(Student)request.getAttribute("student");
		
		List<String> city=new ArrayList();
		city.add("Latur");
		city.add("Pune");
		city.add("Akola");
		city.add("Mumbai");
		city.add("Ausa");
		city.add("Nanded");
		
		List<String> stream=new ArrayList();
		stream.add("SSC");
		stream.add("HSC");
		stream.add("UG");
		stream.add("PG");
		stream.add("PHD");
		
		List<String> hobby=new ArrayList();
		hobby.add("Cricket");
		hobby.add("Reading");
		hobby.add("Writing");
		hobby.add("Cooking");
		hobby.add("Riding");
		
		%>
		<h1 >Student Details</h1>
		<hr>
		<form action="StudentServlet" method="post" style="background-color: rgb(255, 255, 128);">
		
		<table border="1"  style="background-color:rgba(255, 127, 80, 0.58);">
			<tr>
				<td>ID:</td>
				<td><input type="text" name="sid" value="<%=s.getSid() %>"></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="sname" value="<%=s.getSname()%>"></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><% if(s.getSgender().equalsIgnoreCase("male"))
				{%>
					<input type="radio" name="sgender" value="Male" checked="checked">Male
					<input type="radio" name="sgender" value="Female">Female
				<% }
				else{%>
					<input type="radio" name="sgender" value="Male">Male
					<input type="radio" name="sgender" value="Female" checked="checked">Female
				<%}
				%>
				</td>
			</tr>
			<tr>
				<td>City:</td>
				<td><select name="scity">
						<%for(String s1:city)
							{
								if(s.getScity().equalsIgnoreCase(s1))
								{%>
									<option value="<%=s1 %>" selected="selected"><%=s1 %></option>
								<% }
								else{ %>
									<option value="<%=s1 %>"><%=s1 %></option>
								<%}
							}%>
				</select></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><textarea name="saddress" rows="5" cols="15"><%=s.getSaddress() %></textarea></td>
			</tr>
			<tr>
				<td>Stream:</td>
				<td><select name="sstream">
				<%for(String s1:stream)
					{
						if(s.getSstream().equalsIgnoreCase(s1))
						{%>
							<option value="<%=s1 %>" selected="selected"><%=s1 %></option>
						<%}
						else{%>
							<option value="<%=s1 %>" selected="selected"><%=s1 %></option>
						<%}
					}%> 
				</select></td>
			</tr>
			<tr>
				<td>PerCentage:</td>
				<td><input type="text" name="sper" value=<%=s.getSper() %>></td>
			</tr>
			<tr>
				<td>Hobbies:</td>
				<td>
				<% int count=0;
				for(String s1:hobby)
					{
						count++;
						if(s.getShobbies().contains(s1))
						{%>
							<input type="checkbox" name="shobbies" value="<%=s1 %>" checked="checked" ><%=s1 %>
						<% }
						else{%>
							<input type="checkbox" name="shobbies" value="<%=s1 %>"><%=s1 %>	
						<% }
						if(count%3==0)
						{
							%><br><%
						}
					
					}%>
				</td>
			</tr>
			<tr>
			<td colspan="2" align="center"><input type="submit" name="b1" value="Update">	
			
			</td>
			</tr>

		</table>
	</form>
	</center>
</body>
</html>