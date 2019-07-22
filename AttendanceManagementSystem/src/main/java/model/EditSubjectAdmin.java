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
public class EditSubjectAdmin {
	@RequestMapping("editsubjectadmin")
	public ModelAndView editsubjectadmin(HttpServletRequest request,HttpServletResponse response)
	{				
    	ModelAndView mv = new ModelAndView();

    	Configuration con = new Configuration().configure().addAnnotatedClass(Faculty.class).addAnnotatedClass(Subject.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();

    	Subject[] sub = new Subject[7];
		Faculty[] fa = new Faculty[7];
		
		String dept = request.getParameter("subdepartment");
		String sem = request.getParameter("subsem");
				
		for(int i =1;i<=6;i++) {
			sub[i] = session.get(Subject.class, Integer.parseInt(request.getParameter("subid"+i)));
			fa[i] = session.get(Faculty.class, Integer.parseInt(request.getParameter("subfid"+i)));
			sub[i].setSubname(request.getParameter("subject"+i));
			sub[i].setFac(fa[i]);
		}
		
    	Transaction tx = session.beginTransaction();
    	for(int i =1;i<=6;i++) {
    		session.save(sub[i]);
    	}
    	tx.commit();

        String out = "<script type=\"text/javascript\"> alert('Edit Successfully'); </script>";
       	mv.setViewName("displaysubjectadmin.jsp");
        mv.addObject("dept", dept);
        mv.addObject("sem", sem);
        mv.addObject("result", out);
    	return mv;
	}
}