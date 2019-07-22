package model;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentLogin {
	@RequestMapping("studentlogin")
	public ModelAndView adminlogin(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int userid = Integer.parseInt(request.getParameter("sid"));
		String upass = request.getParameter("spassword");

		ModelAndView mv = new ModelAndView();
		HttpSession sess = request.getSession();

    	Configuration con = new Configuration().configure().addAnnotatedClass(Student.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();

    	Query q = session.createQuery("from Student");
    	List<Student> stud = q.list();
    	for(Student s: stud){
    		if((userid==s.getSroll()) && upass.equals(s.getSpassword())) 
    		{
    			sess.setAttribute("userid", userid);
    			sess.setAttribute("username", s.getSname());
    			sess.setAttribute("dept", s.getSbranch());
    			sess.setAttribute("sem", s.getSsem());
    			mv.setViewName("studenthome.jsp");
    			return mv;
    		}
    	}
    	String out = "<script type=\"text/javascript\"> alert('The Student ID or Password you have entered does not match any account'); </script>";
    	mv.addObject("result", out);
    	mv.setViewName("studentlogin.jsp");
		return mv;
	}	
}