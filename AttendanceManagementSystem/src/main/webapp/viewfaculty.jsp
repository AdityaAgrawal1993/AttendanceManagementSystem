<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ page import="java.util.List,org.hibernate.Query,org.hibernate.cfg.Configuration,org.hibernate.service.ServiceRegistry,org.hibernate.boot.registry.StandardServiceRegistryBuilder,org.hibernate.SessionFactory,org.hibernate.Session" %>
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
	#t2{top:75px;
		position:relative;
		font-size: 30px;}
	</style>
</head>
<body>

<table align="center" width=80%>
	<tr>
		<th align="left"><a href="/AttendanceManagementSystem/adminhome.jsp"><img src="http://cdn.onlinewebfonts.com/svg/img_509765.png" width="65" height="65"></a></th>
		<th style="font-size: 60px">Admin
		<th align="right"><form action = "logout">
		<input type="image" src="https://cdn0.iconfinder.com/data/icons/large-glossy-icons/512/Logout.png" alt="Submit" width="70" height="70">
		</form></th>
</table>

<div>
	<a href="/AttendanceManagementSystem/addfaculty.jsp">Add Faculty</a><br>
	<a href="/AttendanceManagementSystem/addstudent.jsp">Add Student</a><br>
	<a href="/AttendanceManagementSystem/addsubject.jsp">Add Subject</a><br>
	<a href="/AttendanceManagementSystem/viewfaculty.jsp">View Faculty</a><br>
	<a href="/AttendanceManagementSystem/viewstudent.jsp">View Student</a><br>
	<a href="/AttendanceManagementSystem/viewsubject.jsp">View Subject</a><br>
	<a href="/AttendanceManagementSystem/removefaculty.jsp">Remove Faculty</a><br>
	<a href="/AttendanceManagementSystem/removestudent.jsp">Remove Student</a><br>
	<a href="/AttendanceManagementSystem/removesubject.jsp">Remove Subject</a><br>
</div>

	<%
	Configuration con = new Configuration().configure().addAnnotatedClass(model.Faculty.class).addAnnotatedClass(model.Subject.class);
	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
	SessionFactory sf = con.buildSessionFactory(reg);
	Session sess = sf.openSession(); 	
	Query q = sess.createQuery("from Faculty");
	List<model.Faculty> faculty = q.list();
	%>
	
<form action ="viewfaculty" method ="post">
	<table id="t2" align="center">
		<tr>
			<td align="center">Select Faculty
		<tr>
			<td align="center"><select name="fid" required>
				<option value="" disabled selected hidden>Faculty</option>
					<% for(model.Faculty s: faculty){%>
					<option value="<%=s.getFid()%>">[ID:<%=s.getFid()%>] <%=s.getFname()%></option><%}%>
				</select>
		<tr>
			<td align="center"><input type = "Submit" value="View">
	</table>	
</form>
	
</body>
</html>