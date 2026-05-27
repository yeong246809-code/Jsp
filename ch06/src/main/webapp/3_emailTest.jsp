<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>3.emailtest</title>
	</head>
	<body>
		<h3>3.emailtest</h3>
		
		<form action="./proc/emailsend.jsp" method="post">
			<table border="1">
            <tr>
               <td>보내는 사람</td>
               <td><input type="text" name="sender"></td>
            </tr>
            <tr>
               <td>받는 사람</td>
               <td><input type="text" name="receiver"></td>
            </tr>
            <tr>
               <td>제목</td>
               <td><input type="text" name="title"></td>
            </tr>
            <tr>
               <td>내용</td>
               <td>
                  <textarea name="content" rows="30" cols="20"></textarea>
               </td>
            </tr>
            <tr>
               <td colspan="2" align="right">
                  <input type="submit" value="전송하기">
               </td>
            </tr>
         </table>
		</form>
	</body>
</html>