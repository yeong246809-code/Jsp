<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
		<h3>3. pageContext 객체</h3>
		
		<h4>forward</h4>
		
		<a href="./proc/forward1.jsp">포워드1 페이지 요청</a>
		<a href="./proc/forward2.jsp">포워드2 페이지 요청</a>
		
		<h4>include</h4>
		
		<%
			//동적 인클루드
			pageContext.include("./inc/_header.jsp");
			pageContext.include("./inc/_footer.jsp");
		%>
		
		<!-- 정적 인클루드 -->
		<%@ include file="./inc/_header.jsp" %>
		<%@ include file="./inc/_footer.jsp" %>
		
	</body>
</html>