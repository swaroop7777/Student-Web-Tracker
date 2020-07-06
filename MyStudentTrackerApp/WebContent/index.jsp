<%@ page import="java.util.*,com.myversion.app.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Home Page</title>
<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body>
	<%
		List<Student> list = (ArrayList<Student>) request.getAttribute("studentDetails");
	%>
<div class="container">
	<div class="header center-align indigo darken-1" style="
		margin-bottom:20px;padding-bottom:10px;padding-top:10px;margin-top:20px;">
		<h2><span class="lime-text text-lighten-5">FooBar University</span></h2>
	</div>
	<a class="waves-effect waves-light btn-large" onclick="window.location.href='add-student-form.jsp'; return false;">Add Student</a>
</div>	
	<div class="container" style="
		margin-bottom:20px;padding-bottom:10px;padding-top:10px;margin-top:20px;">
		<table class="striped">
			<c:forEach var="tempStudent" items="${studentDetails}">
					
					<!-- set up a link for each student -->
					<c:url var="updateLink" value="StudentServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="studentId" value="${tempStudent.id}" />
					</c:url>

					<!--  set up a link to delete a student -->
					<c:url var="deleteLink" value="StudentServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="studentId" value="${tempStudent.id}" />
					</c:url>
																		
					<tr>
						<td> ${tempStudent.first_name} </td>
						<td> ${tempStudent.last_name} </td>
						<td> ${tempStudent.email} </td>
						<td> 
							<a class="waves-effect waves-light btn-small"  href="${updateLink}">Update</a>
							 |
							 <a class="waves-effect waves-light btn-small" href="${deleteLink}" 
							 onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">Delete</a> 	
						</td>
					</tr>
				
				</c:forEach>
		</table>
		
	</div>
</body>
</html>