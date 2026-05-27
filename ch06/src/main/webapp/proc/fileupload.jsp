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
		파일 업로드 처리
	*/
	
	
	// 파일 업로드 경로 구하기
	String savedDirectory = application.getRealPath("/upload");
	System.out.println("savedDirectory : " + savedDirectory);
	//파일 업로드 디렉토리가 없으면 생성하기
	File sfile = new File(savedDirectory);
	
	if(!sfile.exists()){
		sfile.mkdir();
	}
	//첨부파일 정보 구하기
	
	Part part = request.getPart("fname"); //업로드한 파일 정보객체
	String partheader = part.getHeader("content-disposition");
	System.out.println("partheader : " + partheader);// "form-data" 로 출력
	
	String[] filenames = partheader.split("filename=");
	String filename = filenames[1].trim().replace("\"","");
	System.out.println("filename : " + filename);
	
	//중복될수 없는 파일명 생성
	int idx = filename.lastIndexOf(".");
	String ext = filename.substring(idx); //확장자 구하기
	
	String savename = UUID.randomUUID().toString() + ext;//(universal unique ID)
	System.out.println("savename : " + savename);
	//업로드한 파일 저장
	if(!filename.isEmpty()){
		part.write(savedDirectory + File.separator + filename);
	}
	//파일명 수정
	File ofile = new File(savedDirectory + File.separator + filename);
	File Sfile = new File(savedDirectory + File.separator + savename);
	ofile.renameTo(Sfile);

	/*
		데이터 베이스 작업 처리
	*/
	String userid = request.getParameter("userid");
	String name = request.getParameter("name");
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		
		String sql = "insert into filetable (userid,name,ofname,sfname,rdate) values(?,?,?,?,now());";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,userid);
		psmt.setString(2,name);
		psmt.setString(3,filename);
		psmt.setString(4,savename);
		
		psmt.executeUpdate();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//이동
	response.sendRedirect("../1_fileUpload.jsp");
%>
