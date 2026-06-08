package kr.co.jboard.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.jboard.dto.UserDTO;

@WebFilter(urlPatterns = {"/article/*"})
public class Logincheckfilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		
		HttpSession session = request.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
	
		if(sessUser == null) {
			HttpServletResponse response = (HttpServletResponse) resp;
			response.sendRedirect("/jboard/user/login.do?login=required");
		}else {
			chain.doFilter(req, resp);
		}
	}

}
