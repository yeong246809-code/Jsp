<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//로그아웃 처리 -> 클라이언트의 세션값 삭제, 세션 초기화
	session.removeAttribute("sessUser");
	session.invalidate();
	
	//로그인 폼 이동
	response.sendRedirect("./loginform.jsp?logout=success");

%>
