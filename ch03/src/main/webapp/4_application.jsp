<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4.application</title>
	</head>
	<body>
	
		<h3>4.application 내장객체</h3>
		
		<h4>서버정보</h4>
		<p>
			WAS 정보 : <%= application.getServerInfo() %>
			Servlet 정보 : <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %><br>
			JSP 버전 : <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion()%><br>
		</p>
		<h4>환경정보</h4>
		<%
		
			//web.xml 환경 설정파일에 초기 설정값 가져오기
		String host = application.getInitParameter("HOST");
		String user = application.getInitParameter("user");
		String pass = application.getInitParameter("pass");
		
		
		%>
		<p>
			host: <%= host %><br>
			user: <%= user %><br>
			pass: <%= pass %><br>
		</p>
		
		
		<h4>자원경로</h4>
		<!-- WAS의 실제 실행 경로 -->
		<%= application.getRealPath("./4_application.jsp") %>
		
		
		
	</body>
</html>