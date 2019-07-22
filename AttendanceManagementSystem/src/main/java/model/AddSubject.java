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
public class AddSubject {
	@RequestMapping("addsubject")
	public ModelAndView addsubject(HttpServletRequest request,HttpServletResponse response)
	{
    	ModelAndView mv = new ModelAndView();

    	Configuration con = new Configuration().configure().addAnnotatedClass(Faculty.class).addAnnotatedClass(Subject.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();

    	Subject[] sub = new Subject[7];
		Faculty[] fa = new Faculty[7];
		
		for(int i =1;i<=6;i++) {
			sub[i] = new Subject();
			fa[i] = session.get(Faculty.class, Integer.parseInt(request.getParameter("subfid"+i)));
			sub[i].setSubid(Integer.parseInt(request.getParameter("subid"+i)));
			sub[i].setSubname(request.getParameter("subject"+i));
			sub[i].setSubdepartment(request.getParameter("subdepartment"));
			sub[i].setSubsem(request.getParameter("subsem"));
			sub[i].setFac(fa[i]);
		}
						
    	try {
    	Transaction tx = session.beginTransaction();
    	for(int i =1;i<=6;i++) {
    		session.save(sub[i]);
    	}    		
    	tx.commit();
    	
    	String out = "<script type=\"text/javascript\"> alert('Subject Added'); </script>";
    	mv.setViewName("addsubject.jsp");
    	mv.addObject("result", out);
		return mv;
    	}
    	catch (Exception e)
    	{
        	String out = "<script type=\"text/javascript\"> alert('Subject Not Added: Duplicate Subject ID'); </script>";
        	mv.setViewName("addsubject.jsp");
        	mv.addObject("result", out);
    		return mv;
    	}
	}
}