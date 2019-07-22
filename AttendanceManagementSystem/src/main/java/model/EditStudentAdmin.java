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
public class EditStudentAdmin {
	@RequestMapping("editstudentadmin")
	public ModelAndView editstudentadmin(HttpServletRequest request,HttpServletResponse response)
	{				
    	ModelAndView mv = new ModelAndView();

    	Configuration con = new Configuration().configure().addAnnotatedClass(Student.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();

		int userid = Integer.parseInt(request.getParameter("sroll"));
		Student sa = (Student)session.get(Student.class, userid);  
		
		sa.setSname(request.getParameter("sname"));
		sa.setSpassword(request.getParameter("spassword"));
		sa.setSbranch(request.getParameter("sbranch"));
		sa.setSsem(request.getParameter("ssem"));
		sa.setSdob(request.getParameter("sdob"));
		sa.setSemail(request.getParameter("semail"));
		sa.setSmobile(request.getParameter("smobile"));
		
    	Transaction tx = session.beginTransaction();
    	session.save(sa);
    	tx.commit();

        String out = "<script type=\"text/javascript\"> alert('Edit Successfully'); </script>";
       	mv.setViewName("displaystudentadmin.jsp");
       	mv.addObject("userid", userid);
        mv.addObject("result", out);
    	return mv;
	}
}