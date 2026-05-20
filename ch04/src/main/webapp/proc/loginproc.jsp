<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 전송 데이터 수신
	String userid = request.getParameter("userid");
	String pass = request.getParameter("pass");
	
	//데이터 베이스 비교처리 생략
	// abc1234, 1234라고 가정
	if(userid.equals("abc1234") && pass.equals("1234")){
		//회원 맞으면 세션에 사용자 아이디를 sessUser 이름으로 저장
		session.setAttribute("sessUser", userid);
		
		
		//리다이렉트
		response.sendRedirect("./loginsuccess.jsp");
	}else{
		//회원 아닐경우 다시 로그인폼 화면으로 이동
		response.sendRedirect("./loginform.jsp?login=fail");
	}

%>
