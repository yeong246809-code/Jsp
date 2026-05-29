package controller.user1;

import java.io.IOException;

import dto.User1DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User1Service;

@WebServlet("/user1/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	//서비스 불러오기
	private User1Service service = User1Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전송데이터 수신
		String userid = req.getParameter("userid");
		System.out.println(userid);
		
		//수정데이터 조회
		User1DTO dto = service.findbyId(userid);
		
		//view 데이터
		req.setAttribute("User1DTO", dto);
		
		
		// View forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user1/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전송 데이터 수신
		String userid = req.getParameter("userid");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String age = req.getParameter("age");
		
		//서비스 전송 객체 생성
		User1DTO dto = new User1DTO();
		dto.setUserid(userid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);
		System.out.println(dto);
		
		//수정 서비스 메서드 호출
		service.modify(dto);
		
		//목록 리다이렉트
		resp.sendRedirect("/ch09/user1/list.do?modify=success");
		
	
	}
	

}
