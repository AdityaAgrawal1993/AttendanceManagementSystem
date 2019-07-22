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
	.lab{font-size: 12pt; height: 20px; width:100px;text-align:center;}
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
	Query q = sess.createQuery("from Attendance");
	List<model.Attendance> att = q.list();
	int attend=0;
	int total=0;
	int ave = 0;
	for(model.Attendance a: att){
		if(a.getStudentid()==(stuid)){
			if(a.getPresent().equals("present")){
				attend++;
			}
			total++;
			model.Subject sub = (model.Subject)sess.get(model.Subject.class, a.getSubjectid());
			}	
		}
	%>	

	<table id="t2" align="center">
	<%
	if(total==0){
	%>
		<tr>
			<th colspan="2">No Lecture Conducted Till Now
	<%
	}
	else{
		if(attend !=0)
			ave = (attend*100)/total;
	%>	
		<tr>
			<td>Lecture Attended
			<td><input class="lab" type="text" value="<%=attend%>" readonly> 
		<tr>
			<td>Total Lecture
			<td><input class="lab" type="text" value="<%=total%>" readonly>
		<tr>
			<td>Average
			<td><input class="lab" type="text" value="<%=ave%> %" readonly>
	</table>
	<%
	}
	%>
</body>
</html>