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
public class AddFaculty {
	@RequestMapping("addfaculty")
	public ModelAndView addfaculty(HttpServletRequest request,HttpServletResponse response)
	{				
    	ModelAndView mv = new ModelAndView();
		Faculty fa = new Faculty();
		
		fa.setFid(Integer.parseInt(request.getParameter("fid")));
		fa.setFname(request.getParameter("fname"));
		fa.setFpassword(request.getParameter("fpassword"));
		fa.setFemail(request.getParameter("femail"));
		fa.setFmobile(request.getParameter("fmobile"));
		
    	Configuration con = new Configuration().configure().addAnnotatedClass(Faculty.class).addAnnotatedClass(Subject.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();
    	try {
        	Transaction tx = session.beginTransaction();
        	session.save(fa);
        	tx.commit();

        	String out = "<script type=\"text/javascript\"> alert('Faculty Added'); </script>";
        	mv.setViewName("addfaculty.jsp");
        	mv.addObject("result", out);
    		return mv;
    	}
    	catch (Exception e)
    	{
        	String out = "<script type=\"text/javascript\"> alert('Faculty Not Added: Duplicate Faculty ID'); </script>";
        	mv.setViewName("addfaculty.jsp");
        	mv.addObject("result", out);
    		return mv;
    	}
	}
}