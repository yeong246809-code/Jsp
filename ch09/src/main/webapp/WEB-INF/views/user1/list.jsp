<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1:목록</title>
	</head>
	<body>
		<h3>User1 목록</h3>
		<a href="/ch09">메인</a>
		<a href="/ch09/user1/register.do">등록</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<c:forEach var="dto" items="${dtoList}">
				<tr>
					<td>${dto.getUserid()}</td>
					<td>${dto.name}</td>
					<td>${dto.hp}</td>
					<td>${dto.age}</td>
					<td>
						<a href="/ch09/user1/modify.do?userid=${dto.userid}">수정</a>
						<a href="/ch09/user1/delete.do?userid=${dto.userid}">삭제</a>
					</td>
				</tr>
			</c:forEach>
			
			
		</table>	
	</body>
</html>









