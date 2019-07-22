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
public class EditFaculty {
	@RequestMapping("editfaculty")
	public ModelAndView editfaculty(HttpServletRequest request,HttpServletResponse response)
	{				
    	ModelAndView mv = new ModelAndView();

    	Configuration con = new Configuration().configure().addAnnotatedClass(Faculty.class).addAnnotatedClass(Subject.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();

		int userid = Integer.parseInt(request.getParameter("fid"));
    	Faculty fa = (Faculty)session.get(Faculty.class, userid);  
		
		fa.setFname(request.getParameter("fname"));
		fa.setFpassword(request.getParameter("fpassword"));
		fa.setFemail(request.getParameter("femail"));
		fa.setFmobile(request.getParameter("fmobile"));
		
    	Transaction tx = session.beginTransaction();
    	session.save(fa);
    	tx.commit();

        String out = "<script type=\"text/javascript\"> alert('Edit Successfully'); </script>";
       	mv.setViewName("displayfacultydetail.jsp");
       	mv.addObject("userid", userid);
        mv.addObject("result", out);
    	return mv;
	}
}