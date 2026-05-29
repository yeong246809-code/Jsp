<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1.servlet 실습</title>
	</head>
	<body>
		<h3>1.servlet 실습</h3>
		
		<a href="/ch08/hello.do">Helloservlet</a><br>
		<a href="/ch08/welcome.do">welcomeservlet</a><br>
		<a href="/ch08/greeting.do">greetingservlet</a><br>
		
		<form action="./hello.do" method="post">
			<input type="text" name="userid"/><br>
			<input type="password" name="pass"/><br>
			<input type="submit" value="전송"/><br>
		
		
		</form>
	
	
	</body>
</html>