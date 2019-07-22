package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewStudent {
	@RequestMapping("viewstudent")
	public ModelAndView viewstudent(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		int userid = Integer.parseInt(request.getParameter("stuid"));
    	mv.addObject("userid", userid);
		mv.setViewName("displaystudentadmin.jsp");
		return mv;
	}
}
