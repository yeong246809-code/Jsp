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
import kr.co.jboard.dto.PageGroupDTO;
import kr.co.jboard.service.ArticleService;

@WebServlet("/article/search.do")
public class SearchController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String searchType = req.getParameter("searchType"); 
		String keyword = req.getParameter("keyword"); 
		String page = req.getParameter("page");
		
		ArticleDTO dto = new ArticleDTO();
		dto.setSearchType(searchType);
		dto.setKeyword(keyword);		
		
		int total = service.getCountSearch(dto);
		int currentPage = service.getCurrentPage(page);
		int lastPageNum = service.getLastPageNum(total);
		int start = service.getStart(currentPage);
		int pagestart = service.getCurrentStartNum(total, currentPage);
		PageGroupDTO pagegroupdto = service.getCurrentPageGroup(currentPage, lastPageNum);
		
		List<ArticleDTO> dtolist = service.findAllSearch(dto, start);
		
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);		
		req.setAttribute("pagestart", pagestart);
		req.setAttribute("pagegroupdto", pagegroupdto);
		req.setAttribute("dtolist", dtolist);		
		req.setAttribute("total", total);		
		req.setAttribute("searchType", searchType);
		req.setAttribute("keyword", keyword);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/article/searchList.jsp");
		dispatcher.forward(req, resp);	
	}
}