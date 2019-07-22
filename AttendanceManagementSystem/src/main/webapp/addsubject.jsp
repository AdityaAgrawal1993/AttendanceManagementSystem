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
	#t2{top:75px;
		position:relative;
		font-size: 30px;}
	</style>
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
	Query q = sess.createQuery("from Faculty");
	List<model.Faculty> faculty = q.list();
	%>
	
<form action ="addsubject" method ="post">
	<table id="t2" align="center">
		<tr>
			<td colspan="3" align="center">Add Subject
		<tr>
			<td><select name="subdepartment" required>
				<option value="" disabled selected hidden>Department</option>
		    	<option value="CSE">CSE</option>
		    	<option value="ECE">ECE</option>
		  	</select></td>
			<td>
			<td  align="right"><select name="subsem" required>
				<option value="" disabled selected hidden>Semester</option>
		    	<option value="First">First</option>
		    	<option value="Second">Second</option>
		 	</select></td>
		<tr>
			<td><input type = "number" placeholder="Subject1 ID" name = "subid1" required>
			<td><input type = "text" placeholder="Subject1 Name" name = "subject1" required>
			<td><select name="subfid1" required>
				<option value="" disabled selected hidden>Faculty</option>
					<% for(model.Faculty s: faculty){%>
					<option value="<%=s.getFid()%>">[ID:<%=s.getFid()%>] <%=s.getFname()%></option><%}%>
				</select>
		<tr>
			<td><input type = "number" placeholder="Subject2 ID" name = "subid2" required>
			<td><input type = "text" placeholder="Subject2 Name" name = "subject2" required>
			<td><select name="subfid2" required>
				<option value="" disabled selected hidden>Faculty</option>
					<% for(model.Faculty s: faculty){%>
					<option value="<%=s.getFid()%>">[ID:<%=s.getFid()%>] <%=s.getFname()%></option><%}%>
				</select>
		<tr>
			<td><input type = "number" placeholder="Subject3 ID" name = "subid3" required>
			<td><input type = "text" placeholder="Subject3 Name" name = "subject3" required>
			<td><select name="subfid3" required>
				<option value="" disabled selected hidden>Faculty</option>
					<% for(model.Faculty s: faculty){%>
					<option value="<%=s.getFid()%>">[ID:<%=s.getFid()%>] <%=s.getFname()%></option><%}%>
				</select>
		<tr>
			<td><input type = "number" placeholder="Subject4 ID" name = "subid4" required>
			<td><input type = "text" placeholder="Subject4 Name" name = "subject4" required>
			<td><select name="subfid4" required>
				<option value="" disabled selected hidden>Faculty</option>
					<% for(model.Faculty s: faculty){%>
					<option value="<%=s.getFid()%>">[ID:<%=s.getFid()%>] <%=s.getFname()%></option><%}%>
				</select>
		<tr>
			<td><input type = "number" placeholder="Subject5 ID" name = "subid5" required>
			<td><input type = "text" placeholder="Subject5 Name" name = "subject5" required>
			<td><select name="subfid5" required>
				<option value="" disabled selected hidden>Faculty</option>
					<% for(model.Faculty s: faculty){%>
					<option value="<%=s.getFid()%>">[ID:<%=s.getFid()%>] <%=s.getFname()%></option><%}%>
				</select>
		<tr>
			<td><input type = "number" placeholder="Subject6 ID" name = "subid6" required>
			<td><input type = "text" placeholder="Subject6 Name" name = "subject6" required>
			<td><select name="subfid6" required>
				<option value="" disabled selected hidden>Faculty</option>
					<% for(model.Faculty s: faculty){%>
					<option value="<%=s.getFid()%>">[ID:<%=s.getFid()%>] <%=s.getFname()%></option><%}%>
				</select>
		<tr>
			<td colspan="3" align="center"><input type = "Submit" value="Add">
	</table>	
</form>
	
${result}

</body>
</html>