package chap11;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class InitialMember implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce)  { 
		ServletContext application =  sce.getServletContext();
		ArrayList<Member> members = new ArrayList<>();
		
		for(int i = 0; i < 8; i++) {
			members.add(new Member("박찬호" + i, "park" + i + "@daum.net"));
		}
		
		members.add(new Member("김연아", null));
		members.add(new Member("김연경", null));
		
		application.setAttribute("members", members);
		application.setAttribute("member", new Member());
		
        System.out.println("Initialized Start!");
    }
    public void contextDestroyed(ServletContextEvent sce)  { 
    	 System.out.println("Initialized Destroyed!");
    }
}
