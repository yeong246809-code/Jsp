
<%@page import="sub1.User3"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 수정 데이터 선언
	User3 user3 = null;
	//전송 데이터 수신
	String userid = request.getParameter("userid");
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "yeong246809" ;
	String pass = "246809";
	//데이터 베이스 작업 - 수정 데이터 조회
	try{
	//1) 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
	//2) 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
	//3) SQL 실행 객체 생성
		String sql = "select * from `user3` where `userid` = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, userid);
	//4) SQL 실행
		ResultSet rs = psmt.executeQuery();
	//5) 결과셋 처리
	if(rs.next()){
		user3 = new User3();
		user3.setUserid(rs.getString(1));
		user3.setName(rs.getString(2));
		user3.setBirth(rs.getString(3));
		user3.setHp(rs.getString(4));
		user3.setAddr(rs.getString(5));
	}
	//6) 데이터 베이스 종료
		rs.close();
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}

%>




<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>list</title>
	</head>
	<body>
		<h3>user3 수정</h3>
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user3/list.jsp">목록</a>
		
		<form action="/ch05/user3/proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" value="<%= user3.getUserid()%>" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= user3.getName()%>"></td>
				<tr>
					<td>생일</td>
					<td><input type="date" name="birth" value="<%= user3.getBirth()%>"></td>
				</tr>
				<tr>
					<td>핸드폰</td>
					<td><input type="text" name="hp" value="<%= user3.getHp()%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="<%= user3.getAddr()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		
		</form>
	</body>
</html>