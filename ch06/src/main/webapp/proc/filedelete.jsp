<%@page import="java.sql.Statement"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="ch06.FileDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/*
		파일 다운로드 처리
	*/
	//전송데이터 수신
	String no = request.getParameter("no");
	String sfname = null;
	

	
	/*
		데이터 베이스 삭제 처리
	*/
	
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		
		conn.setAutoCommit(false);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select sfname from filetable where no=" + no);
		if(rs.next()){
			sfname = rs.getString(1);
		}
		
		String sql = "Delete from filetable where no = ?;";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,no);
		psmt.executeUpdate();
		
		conn.commit();
		
		
		rs.close();
		stmt.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	String path = application.getRealPath("/upload");
	File savedfile = new File(path + File.separator + sfname);
	savedfile.delete();
	//이동
	response.sendRedirect("../2_fileDownload.jsp?delete=succesed");
%>
