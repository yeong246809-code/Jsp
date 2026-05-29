package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * 서블릿 등록(주소맵핑)
 * 	1) xml 설정
 * 	2) 어노테이션 설정방법
 * 		@WebServlet("주소") 선언
 *	
 */
@WebServlet("/hello.do")
public class Helloservlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		//서블릿이 최초 실행될때 한번만 실행
		System.out.println("HelloServlet init");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get 요청 처리
		System.out.println("HelloServlet doGet");
		
		//HTML 생성
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'/>");
		writer.println("<title>helloservlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>HelloServlet</h3>");
		writer.println("<a href='./1_servletTest.jsp'>메인</h3><br>");
		writer.println("<a href='./welcome.do'>welcomeservlet</h3><br>");
		writer.println("<a href='./greeting.do'>greetingservlet</h3><br>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//post 요청 처리
		String userid = req.getParameter("userid");
		String pass = req.getParameter("pass");
		
		System.out.println("아이디 : " + userid);
		System.out.println("비밀번호 : " + pass);
		
		resp.sendRedirect("./welcome.do");
	}
	
	@Override
	public void destroy() {
		//서블릿 종료될때(WAS가 종료될때)
		System.out.println("HelloServlet destroy");
	}
}
