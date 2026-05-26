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

	//업로드한 파일 저장
	if(!filename.isEmpty()){
		part.write(savedDirectory + File.separator + filename);
	}
	
	//이동
	response.sendRedirect("../1_fileUpload.jsp");
%>
