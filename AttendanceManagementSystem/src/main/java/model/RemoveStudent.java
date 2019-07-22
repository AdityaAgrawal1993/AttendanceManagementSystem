package model;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class RemoveStudent {
	@RequestMapping("removestudent")
	public ModelAndView viewstudent(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int userid = Integer.parseInt(request.getParameter("stuid"));
		
    	Configuration con = new Configuration().configure().addAnnotatedClass(Student.class).addAnnotatedClass(Attendance.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();
    	Query q = session.createQuery("from Attendance WHERE studentid = '"+userid+"'");
    	List<Attendance> aa = q.list();

		Student sa = (Student)session.get(Student.class, userid);

		Transaction tx = session.beginTransaction();
    	for(Attendance a2: aa){
    		session.delete(a2);
    	}
    	session.delete(sa);
    	tx.commit();

    	String out = "<script type=\"text/javascript\"> alert('Student Removed'); </script>";

		ModelAndView mv = new ModelAndView();
    	mv.setViewName("removestudent.jsp");
    	mv.addObject("result", out);
		return mv;
	}
}
