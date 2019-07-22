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
	Configuration con = new Configuration().configure().addAnnotatedClass(model.Student.class);
	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
	SessionFactory sf = con.buildSessionFactory(reg);
	Session sess = sf.openSession();
	Query q = sess.createQuery("from Student");
	List<model.Student> stu = q.list();
	%>

<form action ="updateattendance2" method ="post">
	<table id="t2" align="center" width=40%>
		<%HttpSession session2 = request.getSession();
		
		String d = (String)session2.getAttribute("sdepartment");
		String se = (String)session2.getAttribute("ssem");

		int i=0;
		for(model.Student s: stu){
		if(s.getSbranch().equals(d) && s.getSsem().equals(se)){
			i++;
			if(i==1){
			%>
		<tr>
			<td colspan="3" align="center">Select Date
		<tr>
			<td colspan="3" align="center"><input type = "date" name = "adate" required>
		<tr>
			<td align="center">StudentID
			<td align="center">StudentName
			<td align="center">Present			
			<%
			}
			%>
		<tr>
			<td align="center"><input style="text-align:center" name="stuid<%=i%>" size="4" value="<%=s.getSroll()%>" readonly>
			<td align="center"><input style="text-align:center" size="20" value="<%=s.getSname()%>" readonly>
			<td align="center"><input type="checkbox" name="attend<%=i%>" value="present">
				<%
				}
			}
			session2.setAttribute("size",i+1);
		if(i==0){
		%>
		<tr>
			<td colspan="3" align="center">No Student Assigned Till Now
		<%
		}else{			
		%>
		<tr>
			<td colspan="3" align="center"><input type = "Submit" value="Submit">
		<%
		}
		%>
	
	</table>
</form>

</body>
</html>