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
	#t2{top:75px;
		position:relative;
		font-size: 30px;}
	</style>
<script>  
	function validateform()
	{  
		var email=document.myform.femail.value;
		var mobile=document.myform.fmobile.value;
		
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

<form name="myform" action ="addfaculty" method ="post" onsubmit="return validateform()">
	<table id="t2" align="center">
		<tr>
			<td align="center">Add Faculty
		<tr>
			<td><input type="number" placeholder="Faculty ID" name = "fid" required>
		<tr>
			<td><input type = "text" placeholder="Faculty Name" name = "fname" required>
		<tr>
			<td><input type = "password" placeholder="Faculty Password" name = "fpassword" required>
		<tr>
			<td><input type = "text" placeholder="Faculty E-mail" name = "femail" required>
			<td><label id="l1" style="color:red;visibility: hidden"></label>
		<tr>
			<td><input type = "number" placeholder="Faculty Mobile" name = "fmobile" required>
			<td><label id="l2" style="color:red;visibility: hidden"></label>
		<tr>
			<td align="center"><input type = "Submit" value="Add">
	</table>	
</form>
${result}
</body>
</html>