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
	</style>
<script>  
	function editform()
	{  
		var element = document.getElementsByClassName("lab");
		for(var x=1;x<element.length;x++){
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
	
	function validateform()
	{  
		var email=document.myform.semail.value;
		var mobile=document.myform.smobile.value;
		
		var rege = /^([a-z 0-9\.-]+)@([a-z0-9-]+)\.([a-z]{2,8})(.[a-z]{2,8})?$/
		var regm = /^0\d{9}$/;
		
		if(rege.test(email) && regm.test(mobile))
		{
			return true;
		}
		else if(rege.test(email) == false)
		{
			if(regm.test(mobile)){
				document.getElementById("l2").style.visibility="hidden";
				document.getElementById("l1").innerHTML="Invalid";
				document.getElementById("l1").style.visibility="visible";
				return false;				
			}
			else
			{
				document.getElementById("l1").innerHTML="Invalid";
				document.getElementById("l1").style.visibility="visible";
				document.getElementById("l2").innerHTML="Invalid";
				document.getElementById("l2").style.visibility="visible";
				return false;								
			}
		}
		else{
			document.getElementById("l1").style.visibility="hidden";
			document.getElementById("l2").innerHTML="Invalid";
			document.getElementById("l2").style.visibility="visible";
			return false;
		}
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
	Configuration con = new Configuration().configure().addAnnotatedClass(model.Student.class);
	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
	SessionFactory sf = con.buildSessionFactory(reg);
	Session sess = sf.openSession();
	
	Integer d = (Integer)request.getAttribute("userid");

	model.Student stu = (model.Student) sess.get(model.Student.class,d);
	%>

<form name="myform" action ="editstudentadmin" method ="post" onsubmit="return validateform()">
	<table id="t2" align="center">	
		<tr>
			<th colspan="2" align="right"><button id="b1" onclick="return editform()">Edit</button>
		<tr>
			<td>Roll Number
			<td><input class="lab" type="number" value="<%=stu.getSroll()%>" name = "sroll" required readonly>
		<tr>
			<td>Name
			<td><input class="lab" type="text" value="<%=stu.getSname()%>" name = "sname" required readonly>
		<tr>
			<td>Password
			<td><input class="lab" type="text" value="<%=stu.getSpassword()%>" name = "spassword" required readonly>
		<tr>
			<td>Branch
			<td><select class="lab2" name="sbranch" disabled>
				<option value="<%=stu.getSbranch()%>" selected hidden><%=stu.getSbranch()%></option>
		   		<option value="CSE">CSE</option>
		    	<option value="ECE">ECE</option>
		  	</select></td>
		<tr>
			<td>Sem
			<td><select class="lab2" name="ssem" disabled>
				<option value="<%=stu.getSsem()%>" selected hidden><%=stu.getSsem()%></option>
			    <option value="First">First</option>
			    <option value="Second">Second</option>
		  	</select></td>
		<tr>
			<td>DOB
			<td><input class="lab" type="text" value="<%=stu.getSdob()%>" name = "sdob" required readonly>
		<tr>
			<td>E-mail
			<td><input class="lab" type="text" value="<%=stu.getSemail()%>" name = "semail" required readonly>
			<td><label id="l1" style="color:red;visibility: hidden"></label>
		<tr>
			<td>Mobile
			<td><input class="lab" type="number" value="<%=stu.getSmobile()%>" name = "smobile" required readonly>
			<td><label id="l2" style="color:red;visibility: hidden"></label>
		<tr>
			<th colspan="2"><button id="b2" style="visibility: hidden">Save</button>
	</table>	
</form>
${result}

</body>
</html>