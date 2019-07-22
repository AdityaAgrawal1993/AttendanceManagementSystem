package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UpdateAttendance1 {
	@RequestMapping("updateattendance1")
	public void updateattendance1(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		
		int sid = Integer.parseInt(request.getParameter("upsubject"));

    	Configuration con = new Configuration().configure().addAnnotatedClass(Faculty.class).addAnnotatedClass(Subject.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();

    	Subject sa = (Subject) session.get(Subject.class,sid);
		
    	HttpSession sess = request.getSession();
		sess.setAttribute("sid", sa.getSubid());
		sess.setAttribute("sname", sa.getSubname());
		sess.setAttribute("sdepartment", sa.getSubdepartment());
		sess.setAttribute("ssem", sa.getSubsem());
		response.sendRedirect("updateattendance2.jsp");
		
	}
}