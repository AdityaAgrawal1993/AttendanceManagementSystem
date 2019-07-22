<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ page import="java.util.Collection,java.util.List,org.hibernate.Query,org.hibernate.cfg.Configuration,org.hibernate.service.ServiceRegistry,org.hibernate.boot.registry.StandardServiceRegistryBuilder,org.hibernate.SessionFactory,org.hibernate.Session" %>
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
	#t2{top:60px;
		position:relative;
		font-size: 30px;}
	</style>
</head>
<body>

<table align="center" width=80%>
	<tr>
		<th align="left"><a href="/AttendanceManagementSystem/facultyhome.jsp"><img src="http://cdn.onlinewebfonts.com/svg/img_509765.png" width="65" height="65"></a></th>
		<th style="font-size: 60px">Welcome ${username}
		<th align="right"><form action = "logout">
		<input type="image" src="https://cdn0.iconfinder.com/data/icons/large-glossy-icons/512/Logout.png" alt="Submit" width="70" height="70">
		</form></th>
</table>

<div>
<a href="/AttendanceManagementSystem/updateattendance1.jsp">Update Attendance</a><br>
<a href="/AttendanceManagementSystem/displayfacultydetail.jsp">${username} Details</a>
</div>

	<%
	Configuration con = new Configuration().configure().addAnnotatedClass(model.Faculty.class).addAnnotatedClass(model.Subject.class);
	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
	SessionFactory sf = con.buildSessionFactory(reg);
	Session sess = sf.openSession();
	
	HttpSession session2 = request.getSession();
	Integer d = (Integer)session2.getAttribute("userid");

	model.Faculty fa = (model.Faculty) sess.get(model.Faculty.class,d);
	Collection<model.Subject> su = fa.getSub();
	%>

<form action ="updateattendance1" method ="post">
	<table id="t2" align="center">
		<tr>
			<td align="center">Select Subject
		<tr>
			<td align="center"><select name="upsubject" required>
				<option value="" disabled selected hidden>Subject</option>
				<%for(model.Subject s: su){%>
				<option value="<%=s.getSubid()%>">[ID:<%=s.getSubid()%>] <%=s.getSubname()%></option><%}%>	
			</select></td>
		<tr>
			<td align="center"><input type = "Submit" value="Update">
	</table>
</form>
${result}
		
</body>
</html>