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
		font-size: 22px;}
	.lab{font-size: 12pt; height: 20px; width:200px;text-align:center;}
	.lab2{font-size: 12pt; height: 20px; width:100px;text-align:center;}
	</style>
</head>
<body>

<table align="center" width=80%>
	<tr>
		<th align="left"><a href="/AttendanceManagementSystem/studenthome.jsp"><img src="http://cdn.onlinewebfonts.com/svg/img_509765.png" width="65" height="65"></a></th>
		<th style="font-size: 60px">Attendance Detail
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
	Configuration con = new Configuration().configure().addAnnotatedClass(model.Attendance.class).addAnnotatedClass(model.Subject.class).addAnnotatedClass(model.Faculty.class);
	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
	SessionFactory sf = con.buildSessionFactory(reg);
	Session sess = sf.openSession();
	
	HttpSession session2 = request.getSession();
	Integer stuid = (Integer)session2.getAttribute("userid");
	String date = (String)session2.getAttribute("date");
	Query q = sess.createQuery("from Attendance");
	List<model.Attendance> att = q.list();
	%>

	<table id="t2" align="center">
	<% int i=0;
	for(model.Attendance a: att){
		String attend="No";
		if(a.getStudentid()==(stuid) && a.getDate().equals(date)){
			if(a.getPresent().equals("present")){
				attend="Yes";
			}
			i++;
			model.Subject sub = (model.Subject)sess.get(model.Subject.class, a.getSubjectid());
		if(i==1){%>
		<tr>
			<th colspan="3">Date: ${date}
		<tr>
			<th>Subject ID
			<th>Subject Name
			<th>Attend
		<%
		}
		%>
		<tr>
			<th><input class="lab2" type="text" value="<%=sub.getSubid()%>" readonly> 
			<th><input class="lab" type="text" value="<%=sub.getSubname()%>" readonly>
			<th><input class="lab2" type="text" value="<%=attend%>" readonly>
		<%
		}
	}
	if(i==0){
	%>
		<tr>
			<th>No Lecture Conducted on <%=date%>
	<%
	}
	%>
	</table>	
		
</body>
</html>