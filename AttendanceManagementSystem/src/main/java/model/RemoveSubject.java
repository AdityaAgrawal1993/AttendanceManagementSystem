package model;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
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
public class RemoveSubject {
	@RequestMapping("removesubject")
	public ModelAndView viewfaculty(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String subdep = request.getParameter("subdep");
		String subsem = request.getParameter("subsem");
		
    	Configuration con = new Configuration().configure().addAnnotatedClass(Faculty.class).addAnnotatedClass(Subject.class).addAnnotatedClass(Attendance.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();
		Transaction tx = session.beginTransaction();

    	Query q = session.createQuery("from Subject WHERE subdepartment = '"+subdep+"' AND subsem = '"+subsem+"'");
    	List<Subject> sa = q.list();

    	for(Subject s2: sa){
    		int subid = s2.getSubid();
        	Query q2 = session.createQuery("from Attendance WHERE subjectid = '"+subid+"'");
        	List<Attendance> aa = q2.list();
        	for(Attendance a2: aa){
        		session.delete(a2);
        	}
    		session.delete(s2);
    	}    	
    	tx.commit();

    	String out = "<script type=\"text/javascript\"> alert('Subject Removed'); </script>";

		ModelAndView mv = new ModelAndView();
    	mv.setViewName("removesubject.jsp");
    	mv.addObject("result", out);
		return mv;

	}
}
