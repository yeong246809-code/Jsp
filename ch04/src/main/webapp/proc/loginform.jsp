<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<input type="submit" value="전송"><br>
		</form>
	</body>
</html>