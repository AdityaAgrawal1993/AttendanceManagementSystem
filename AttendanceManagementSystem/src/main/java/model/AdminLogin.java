package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminLogin{
	@RequestMapping("adminlogin")
	public ModelAndView adminlogin(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String user = request.getParameter("aname");
		String upass = request.getParameter("apassword");
		
		ModelAndView mv = new ModelAndView();
		
		if(user.equals("admin") && upass.equals("admin"))
			mv.setViewName("adminhome.jsp");
		else {
	    	String out = "<script type=\"text/javascript\"> alert('The Admin Name or Password you have entered does not match any account'); </script>";
	    	mv.addObject("result", out);
			mv.setViewName("adminlogin.jsp");
		}		
		return mv;
	}	
}