

<%@page import="sub1.User2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 목록 출력 리스트
	List<User2> user2list = new ArrayList<>();
	//--------------------------
	// 데이터베이스 저장
	//--------------------------
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "yeong246809" ;
	String pass = "246809";

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		//1)데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);

		//2)SQL 실행객체 생성
		Statement stmt = conn.createStatement();
		
		//3)SQL 실행
		String sql = "select * from `user2`;";
		ResultSet rs = stmt.executeQuery(sql);
		
		//4)결과셋(resultset)처리
		while(rs.next()){
			
			User2 user2 = new User2();
			user2.setUserid(rs.getString(1));
			user2.setName(rs.getString(2));
			user2.setBirth(rs.getString(3));
			user2.setAddr(rs.getString(4));
			
			
			user2list.add(user2);
		}
		//5)데이터베이스 종료
		rs.close();
		stmt.close();
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
		<h3>user2 목록</h3>
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user2/register.jsp">등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<%
				for(User2 user2 : user2list){
					
				
			%>
			<tr>
				<td><%= user2.getUserid() %></td>
				<td><%= user2.getName() %></td>
				<td><%= user2.getBirth() %></td>
				<td><%= user2.getAddr() %></td>
				<td>
					<a href="/ch05/user2/modify.jsp?userid=<%= user2.getUserid() %>">수정</a>
					<a href="/ch05/user2/proc/delete.jsp?userid=<%= user2.getUserid() %>">삭제</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>