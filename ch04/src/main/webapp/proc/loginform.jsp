<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 자동 로그인 여부 검사
	Cookie[] cookies = request.getCookies();
	
	for(Cookie cookie : cookies){
	
	String cookiename = cookie.getName();
	if(cookie.getName().equals("auto")){
		
		String userid = cookie.getValue();
		
		session.setAttribute("sessUser", userid);
		
		response.sendRedirect("./loginsuccess.jsp?login=auto");
		return;
	}
}

%>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>로그인</h3>
		<form action="./loginproc.jsp" method="post">
			<input type="text" name="userid" placeholder="아이디 입력"><br>
			<input type="password" name="pass" placeholder="비밀번호 입력"><br>
			<label><input type="checkbox" name="auto">자동로그인</label>
			<input type="submit" value="전송"><br>
		</form>
	</body>
</html>