package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RemoveFaculty {
	@RequestMapping("removefaculty")
	public ModelAndView viewfaculty(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();

		int userid = Integer.parseInt(request.getParameter("fid"));
		
    	Configuration con = new Configuration().configure().addAnnotatedClass(Faculty.class).addAnnotatedClass(Subject.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();

    	Faculty sa = (Faculty)session.get(Faculty.class, userid);

    	try {
    		Transaction tx = session.beginTransaction();
    		session.delete(sa);
    		tx.commit();

    		String out = "<script type=\"text/javascript\"> alert('Faculty Removed'); </script>";
    		mv.setViewName("removefaculty.jsp");
    		mv.addObject("result", out);
    		return mv;
    	}
    	catch (Exception e)
    	{
    		String out = "<script type=\"text/javascript\"> alert('Faculty Can Not Be Removed: Linked To Subject'); </script>";
    		mv.setViewName("removefaculty.jsp");
    		mv.addObject("result", out);
    		return mv;
    	}

	}
}
