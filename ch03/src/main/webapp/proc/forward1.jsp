<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forward1</title>
	</head>
	<body>
	
		<h3>forward 페이지</h3>
		<%
			//포워드 - 서버 자원간의 처리 이동
			pageContext.forward("../1_request.jsp");
		
		%>
		
		
	</body>
</html>