package kr.co.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jboard.dto.ArticleDTO;
import kr.co.jboard.dto.FileDTO;
import kr.co.jboard.service.ArticleService;
import kr.co.jboard.service.FileService;

@WebServlet("/article/write.do")
public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	// 서비스 가져오기(열거상수 객체)
	private ArticleService articleservice = ArticleService.INSTANCE;
	private FileService fileservice = FileService.INSTANCE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// View 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/article/write.jsp");
		dispatcher.forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//전송 파라미터 수신
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String regip = req.getRemoteAddr();
		List<FileDTO> filelist = fileservice.upload(req);
		//DTO 생성
		ArticleDTO dto = new ArticleDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setFile(filelist.size());
		dto.setRegip(regip);
		
		
		
		
		//등록 서비스 요청
		int ano = articleservice.register(dto);
		
		//파일 업로드 처리
		for(FileDTO fileDTO : filelist) {
			fileDTO.setAno(ano);
			
			fileservice.register(fileDTO);
			
		}
		
		//목록 이동
		resp.sendRedirect("/jboard/article/list.do?write=success");
		
	
	}
	

}
