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

<form name="myform" action ="addstudent" method ="post" onsubmit="return validateform()">
	<table id="t2" align="center">
		<tr>
			<td colspan="2" align="center">Add Student
		<tr>
			<td colspan="2" align="center"><input type = "number" placeholder="Student Roll No" name = "sroll">
		<tr>
			<td colspan="2" align="center"><input type = "text" placeholder="Student Name" name = "sname">
		<tr>
			<td colspan="2" align="center"><input type = "password" placeholder="Student Password" name = "spassword">
		<tr>
			<td align="left"><select name="sbranch" required>
				<option value="" disabled selected hidden>Branch</option>
		   		<option value="CSE">CSE</option>
		    	<option value="ECE">ECE</option>
		  	</select></td>
			<td align="right"><select name="ssem" required>
				<option value="" disabled selected hidden>Semester</option>
			    <option value="First">First</option>
			    <option value="Second">Second</option>
		  	</select></td>
		<tr>
			<td colspan="2" align="center"><input type = "text" placeholder="DOB(dd/mm/yyyy)" name = "sdob">
		<tr>
			<td colspan="2" align="center"><input type = "text" placeholder="E-mail" name = "semail">
			<td><label id="l1" style="color:red;visibility: hidden"></label>
		<tr>
			<td colspan="2" align="center"><input type = "number" placeholder="Mobile" name = "smobile">
			<td><label id="l2" style="color:red;visibility: hidden"></label>
		<tr>
			<td colspan="2" align="center"><input type = "Submit" value="Add">
	</table>	
</form>

${result}

</body>
</html>