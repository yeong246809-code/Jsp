<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch06.FileDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
		List<FileDTO> fileList = new ArrayList<>();
try {
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT * FROM FileTable;"; 
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		FileDTO file = new FileDTO();
		file.setNo(rs.getInt(1));
		file.setUserid(rs.getString(2));
		file.setName(rs.getString(3));
		file.setOfname(rs.getString(4));
		file.setSfname(rs.getString(5));
		file.setRdate(rs.getString(6));
		fileList.add(file);
	}
	rs.close();
	stmt.close();
	conn.close();		
}catch (Exception e){
	e.printStackTrace();
}

%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>2.file download</title>
	</head>
	<body>
		<h3>2.file download</h3>
		
		
		<table border="1">
			<tr>
				<th>번호</th>	
				<th>아이디</th>	
				<th>이름</th>	
				<th>원본파일명</th>	
				<th>저장파일명</th>
				<th>등록일</th>
				<th>관리</th>
			</tr>
			<% for(FileDTO file : fileList){ %>
			<tr>
				<td><%= file.getNo() %></td>
				<td><%= file.getUserid()%></td>
				<td><%=file.getName()%></td>
				<td><%=file.getOfname()%></td>
				<td><%=file.getSfname()%></td>
				<td><%=file.getRdate()%></td>
				<td>
				<a href="./proc/filedelete.jsp?no=<%= file.getNo()%>">삭제</a>
				<a href="./proc/filedownload.jsp?no=<%= file.getNo()%>">다운</a>
				</td>
			</tr>
		<% }%>
		
		
		</table>
		
	</body>
</html>