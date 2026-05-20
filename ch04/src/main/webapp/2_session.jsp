<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2.session</title>
	</head>
	<body>
		
		<h3>2. 세션 실습</h3>
		
		<h4>session id 확인</h4>
		<%= session.getId() %>
		<%= request.getSession().getId() %><br>
		
		<h4>session 로그인</h4>
		<a href="./proc/loginform.jsp">로그인폼</a>
		
		
		
	</body>
</html>