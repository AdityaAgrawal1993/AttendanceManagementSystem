package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class UpdateAttendance2 {
	@RequestMapping("updateattendance2")
	public ModelAndView updateattendance2(HttpServletRequest request,HttpServletResponse response) throws NullPointerException
	{
		
		
    	HttpSession session2 = request.getSession();
    	Integer size = (Integer)session2.getAttribute("size");
		String att[] = new String[size];
    	Attendance[] aa = new Attendance[size];
		
    	System.out.println(size);
		
		for(int i =1;i<size;i++) {
			aa[i] = new Attendance();
			aa[i].setDate(request.getParameter("adate"));
			aa[i].setStudentid(Integer.parseInt(request.getParameter("stuid"+i)));
			aa[i].setSubjectid((Integer)session2.getAttribute("sid"));
			att[i] = request.getParameter("attend"+i);
			if(att[i]==null)
				att[i]="absent";
			aa[i].setPresent(att[i]);

		}
		
    	Configuration con = new Configuration().configure().addAnnotatedClass(Attendance.class);
    	ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
    	SessionFactory sf = con.buildSessionFactory(reg);
    	Session session = sf.openSession();
    	Transaction tx = session.beginTransaction();
    	for(int i =1;i<size;i++) {
		session.save(aa[i]);
    	}    		
    	tx.commit();
				
    	String out = "<script type=\"text/javascript\"> alert('Attendance Updated'); </script>";
    	
		ModelAndView mv = new ModelAndView();
    	mv.setViewName("updateattendance1.jsp");
    	mv.addObject("result", out);
		return mv;

	}

}
