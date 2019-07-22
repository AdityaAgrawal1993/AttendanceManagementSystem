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
public class FacultyLogin {
	@RequestMapping("facultylogin")
	public ModelAndView adminlogin(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		
		int userid = Integer.parseInt(request.getParameter("fid"));
		String upass = request.getParameter("fpassword");

		ModelAndView mv = new ModelAndView();
		HttpSession sess = request.getSession();

    	Configuration con = new Configuration().configure().addAnnotatedClass(Faculty.class).addAnnotatedClass(Subject.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();
    	
    	Query q = session.createQuery("from Faculty");
    	List<Faculty> faculty = q.list();

    	for(Faculty f: faculty){
    		if((userid==f.getFid()) && upass.equals(f.getFpassword())) 
    		{
    			sess.setAttribute("userid", userid);
    			sess.setAttribute("username", f.getFname());
    			mv.setViewName("facultyhome.jsp");
    			return mv;
    		}
    	}    	
	    String out = "<script type=\"text/javascript\"> alert('The Faculty ID or Password you have entered does not match any account'); </script>";
	   	mv.addObject("result", out);
	   	mv.setViewName("facultylogin.jsp");
		return mv;
	}	
}