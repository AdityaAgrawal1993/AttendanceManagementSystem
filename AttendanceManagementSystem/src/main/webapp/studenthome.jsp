<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance Management System</title>
	<style type="text/css">
	body{background-image:url("http://schoolmanagementsystem.nktechhub.com/adminpanel/assets/img/login-bg/bg-1.jpg");
		top:20px;
		position:relative;}
	a:link, a:visited {color: black;
		text-decoration: none;}
	a:hover, a:active {color: blue;
		text-decoration: none;}
	div{top:160px;
		left:80%;
		position:fixed;
		font-size: 20px;}
	</style>
</head>
<body>

	<%
		if(session.getAttribute("username")==null)
			response.sendRedirect("student.jsp");
	%>

<table align="center" width=80%>
	<tr>
		<th align="left"><a href="/AttendanceManagementSystem/studenthome.jsp"><img src="http://cdn.onlinewebfonts.com/svg/img_509765.png" width="65" height="65"></a></th>
		<th style="font-size: 60px">Welcome ${username}
		<th align="right"><form action = "logout">
		<input type="image" src="https://cdn0.iconfinder.com/data/icons/large-glossy-icons/512/Logout.png" alt="Submit" width="70" height="70">
		</form></th>
</table>

<div>
	<a href="/AttendanceManagementSystem/viewattendance.jsp">View Attendance</a><br>
	<a href="/AttendanceManagementSystem/displaytotalattendance.jsp">View Total Attendance</a><br>
	<a href="/AttendanceManagementSystem/displaysubjectdetail.jsp">View Subjects</a><br>
	<a href="/AttendanceManagementSystem/displaystudentdetail.jsp">${username} Details</a>
</div>

</body>
</html>