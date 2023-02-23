package chap04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "계산 결과 서블릿", urlPatterns = { "/CalcServlet" })
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1= Integer.parseInt(request.getParameter("num1"));
		String operator = request.getParameter("operator");
		int num2= Integer.parseInt(request.getParameter("num2"));
		int result = calc(num1, num2, operator);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html><head><meta charset=\"UTF-8\"><title>CalcServlet</title></head>");
		out.println("<body><h2>CalcServlet 계산 결과</h2><hr /><h4>계산 결과: " + result + "</h4></body></html>");
	}
	
	public int calc(int num1, int num2, String operator) {
		int result =0;
		
		if(operator.equals("+")){
			result = num1+num2;
		}
		else if(operator.equals("-")){
			result = num1 - num2;
		}
		else if(operator.equals("*")){
			result = num1 * num2;
		}
		else if(operator.equals("/")){
			result = num1 / num2;
		}
		
		return result;
	}
}
