package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewAttendance {	
	@RequestMapping("viewattendance")
	public void viewattendance(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String date = request.getParameter("adate");
		HttpSession session = request.getSession();
		session.setAttribute("date", date);
		response.sendRedirect("displayattendance.jsp");
	}
}