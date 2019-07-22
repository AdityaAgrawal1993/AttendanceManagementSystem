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
	</style>
<script>  
	function editform()
	{  
		var element = document.getElementsByClassName("lab");
		for(var x=1;x<element.length;x++){
			element[x].readOnly = false; 
		}
		document.getElementById("b1").style.visibility="hidden";
		document.getElementById("b2").style.visibility="visible";
		return false;				
	}
	
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
		<th align="left"><a href="/AttendanceManagementSystem/facultyhome.jsp"><img src="http://cdn.onlinewebfonts.com/svg/img_509765.png" width="65" height="65"></a></th>
		<th style="font-size: 60px">${username}
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
	%>

<form name="myform" action ="editfaculty" method ="post" onsubmit="return validateform()">
	<table id="t2" align="center" >	
		<tr>
			<th colspan="2" align="right"><button id="b1" onclick="return editform()">Edit</button>
		<tr>
			<td>Faculty ID:
			<td><input class="lab" type="number" value="<%=fa.getFid()%>" name = "fid" required readonly>
		<tr>
			<td>Faculty Name:
			<td><input class="lab" type="text" value="<%=fa.getFname()%>" name = "fname" required readonly>
		<tr>
			<td>Password:
			<td><input class="lab" type="text" value="<%=fa.getFpassword()%>" name = "fpassword" required readonly>
		<tr>
			<td>E-mail:
			<td><input class="lab" type="text" value="<%=fa.getFemail()%>" name = "femail" required readonly>
			<td><label id="l1" style="color:red;visibility: hidden"></label>
		<tr>
			<td>Mobile:
			<td><input class="lab" type="number" value="<%=fa.getFmobile()%>" name = "fmobile" required readonly>
			<td><label id="l2" style="color:red;visibility: hidden"></label>
		<tr>
			<th colspan="2"><button id="b2" style="visibility: hidden">Save</button>
	</table>	
</form>
${result}

</body>
</html>