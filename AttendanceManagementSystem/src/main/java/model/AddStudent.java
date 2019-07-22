package model;

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
public class AddStudent {
	@RequestMapping("addstudent")
	public ModelAndView addstudent(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv = new ModelAndView();
		Student sa = new Student();
		
		sa.setSroll(Integer.parseInt(request.getParameter("sroll")));
		sa.setSname(request.getParameter("sname"));
		sa.setSpassword(request.getParameter("spassword"));
		sa.setSbranch(request.getParameter("sbranch"));
		sa.setSsem(request.getParameter("ssem"));
		sa.setSdob(request.getParameter("sdob"));
		sa.setSemail(request.getParameter("semail"));
		sa.setSmobile(request.getParameter("smobile"));
		
    	Configuration con = new Configuration().configure().addAnnotatedClass(Student.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();
    	try {
    	Transaction tx = session.beginTransaction();
    	session.save(sa);
    	tx.commit();

    	String out = "<script type=\"text/javascript\"> alert('Student Added'); </script>";
    	mv.setViewName("addstudent.jsp");
    	mv.addObject("result", out);
		return mv;
    	}
    	catch (Exception e)
    	{
        	String out = "<script type=\"text/javascript\"> alert('Student Not Added: Duplicate Student ID'); </script>";
        	mv.setViewName("addstudent.jsp");
        	mv.addObject("result", out);
    		return mv;
    	}
	}
}