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
	.lab{font-size: 12pt; height: 20px; width:280px;text-align:center;}
	.lab2{font-size: 12pt; height: 26px; width:283px;text-align-last:center;}
	.lab3{font-size: 12pt; height: 20px; width:100px;text-align-last:center;}
	</style>
<script>  
	function editform()
	{  
		var element = document.getElementsByClassName("lab");
		for(var x=0;x<element.length;x++){
			element[x].readOnly = false; 
		}
		var element = document.getElementsByClassName("lab2");
		for(var y=0;y<element.length;y++){
			element[y].disabled=false; 
		}
		document.getElementById("b1").style.visibility="hidden";
		document.getElementById("b2").style.visibility="visible";
		return false;				
	}
	</script> 
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
	String d = (String)request.getAttribute("dept");
	String s = (String)request.getAttribute("sem");

	Query q = sess.createQuery("from Subject WHERE subdepartment = '"+d+"' AND subsem = '"+s+"'");
	List<model.Subject> subject = q.list();
	Query q2 = sess.createQuery("from Faculty");
	List<model.Faculty> faculty = q2.list();
	%>

<form name="myform" action ="editsubjectadmin" method ="post" onsubmit="return validateform()">
	<table id="t2" align="center">
		<tr>
			<td colspan="2">Department: <input class="lab3" type="text" value="${dept}" name = "subdepartment" readonly>
			<td align="right">Semester: <input class="lab3" type="text" value="${sem}" name = "subsem" readonly>
		<tr>
			<td colspan="3" align="right"><button id="b1" onclick="return editform()">Edit</button>
		<tr>
			<th>Subject ID
			<th>Subject Name
			<th>Faculty
	<% int i=1;
	for(model.Subject s2: subject){	%>
		<tr>
			<td><input class="lab3" type="text" value="<%=s2.getSubid()%>" name = "subid<%=i%>" readonly>
			<td><input class="lab" type="text" value="<%=s2.getSubname()%>" name = "subject<%=i%>" required readonly>
			<td><select class="lab2" name="subfid<%=i%>" disabled>
				<option value="<%=s2.getFac().getFid()%>" selected hidden>[ID:<%=s2.getFac().getFid()%>] <%=s2.getFac().getFname()%></option>
					<% for(model.Faculty f: faculty){%>
					<option value="<%=f.getFid()%>">[ID:<%=f.getFid()%>] <%=f.getFname()%></option><%}%>
				</select>
	<%
	i++;
	}
	%>
		<tr>
			<th colspan="3"><button id="b2" style="visibility: hidden">Save</button>
	</table>	
</form>
${result}

</body>
</html>