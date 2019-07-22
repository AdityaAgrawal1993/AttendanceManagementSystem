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
	#t2{top:60px;
		position:relative;
		font-size: 22px;}
	.lab{font-size: 12pt; height: 20px; width:200px;text-align:center;}
	.lab3{font-size: 12pt; height: 20px; width:100px;text-align-last:center;}
	</style>
</head>
<body>

<table align="center" width=80%>
	<tr>
		<th align="left"><a href="/AttendanceManagementSystem/studenthome.jsp"><img src="http://cdn.onlinewebfonts.com/svg/img_509765.png" width="65" height="65"></a></th>
		<th style="font-size: 60px">Subject Details
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

	<%
	Configuration con = new Configuration().configure().addAnnotatedClass(model.Faculty.class).addAnnotatedClass(model.Subject.class);
	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
	SessionFactory sf = con.buildSessionFactory(reg);
	Session sess = sf.openSession(); 	
	
	HttpSession session2 = request.getSession();
	String d = (String)session2.getAttribute("dept");
	String s = (String)session2.getAttribute("sem");

	Query q = sess.createQuery("from Subject WHERE subdepartment = '"+d+"' AND subsem = '"+s+"'");
	List<model.Subject> subject = q.list();
	%>

	<table id="t2" align="center">
	<%
	if(subject.isEmpty()){		
		%>
		<tr>
			<th colspan="3">No Subject Assigned Till Now
		<%
		}
		else{
		%>
		<tr>
			<td colspan="2">Department: <input class="lab3" type="text" value="${dept}" readonly>
			<td align="right">Semester: <input class="lab3" type="text" value="${sem}" readonly>	
		<tr>
			<th>Subject ID
			<th>Subject Name
			<th>Faculty
	<% int i=1;
	for(model.Subject s2: subject){	%>
		<tr>
			<th><input class="lab3" type="text" value="<%=s2.getSubid()%>" readonly> 
			<th><input class="lab" type="text" value="<%=s2.getSubname()%>" readonly> 
			<th><input class="lab" type="text" value="<%=s2.getFac().getFname()%>" readonly> 
	<%
	i++;
	}
	%>
	</table>	
	<%
	}
	%>

</body>
</html>