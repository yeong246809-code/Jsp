package sub2;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;



public class Afilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain ch) throws IOException, ServletException {
		//해당 필터에서 수행되어야할 처리
		System.out.println("Afilter dofilter");
		
		// 필터 체인 연결(다음필터 호출)
		ch.doFilter(req, resp);
		
		
	}

}
