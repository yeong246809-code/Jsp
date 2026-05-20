
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>scope result</title>
	</head>
	<body>
	
		<h3>6.내장 객체 범위</h3>
		<%
			//내장객체 값 설정
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "강감찬");
		
		
		%>
		
		<h3>내장 객체 설정값 확인</h3>
		<p>
			pageContext 값: <%= pageContext.getAttribute("name") %><br>
			request 값: <%= request.getAttribute("name") %><br>
			session 값: <%= session.getAttribute("name") %><br>
			application 값: <%= application.getAttribute("name") %><br>
		
		</p>
		
		<%
			pageContext.forward("./proc/scoperesult.jsp");
		
		
		%>
	</body>
</html>