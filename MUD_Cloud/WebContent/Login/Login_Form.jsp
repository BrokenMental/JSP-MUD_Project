<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login_Form</title>
</head>
<Body bgcolor="#FFFFFF">
	<center>
		<hr align="center" style="border: solid 1px gray; width: 75%">
		<form method="post" action="../Login/Login_Session.jsp" name="form1">
			<table width="500" align="center" cellspacing="0">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" size=14></td>
					<td>패스워드</td>
					<td><input type="password" name="passwd" size=14></td>
					<td colspan="4" align="right"><input type="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
		<hr align="center" style="border: solid 1px gray; width: 75%">
	</center>
</body>
</html>