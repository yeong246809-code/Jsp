

<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="sub1.User1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 목록 출력 리스트
	List<User1> user1list = new ArrayList<>();
	//--------------------------
	// 데이터베이스 저장
	//--------------------------
	//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	//String user = "yeong246809" ;
	//String pass = "246809";

	try{// 일반 jdbc 접속방식
		//Class.forName("com.mysql.cj.jdbc.Driver");
		//1)데이터베이스 접속
		//Connection conn = DriverManager.getConnection(host, user, pass);
		//--------------------------
		// dbcp접속 방식
		//--------------------------
		
		//1.JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");		
		
		//2.커넥션풀 데이터 베이스 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		//3)SQL 실행객체 생성
		Statement stmt = conn.createStatement();
		
		//4)SQL 실행
		String sql = "select * from `user1`;";
		ResultSet rs = stmt.executeQuery(sql);
		
		//4)결과셋(resultset)처리
		while(rs.next()){
			
			User1 user1 = new User1();
			user1.setUserid(rs.getString(1));
			user1.setName(rs.getString(2));
			user1.setHp(rs.getString(3));
			user1.setAge(rs.getInt(4));
			
			
			user1list.add(user1);
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
		<h3>user1 목록</h3>
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user1/register.jsp">등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<%
				for(User1 user1 : user1list){
					
				
			%>
			<tr>
				<td><%= user1.getUserid() %></td>
				<td><%= user1.getName() %></td>
				<td><%= user1.getHp() %></td>
				<td><%= user1.getAge() %></td>
				<td>
					<a href="/ch05/user1/modify.jsp?userid=<%= user1.getUserid() %>">수정</a>
					<a href="/ch05/user1/proc/delete.jsp?userid=<%= user1.getUserid() %>">삭제</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>