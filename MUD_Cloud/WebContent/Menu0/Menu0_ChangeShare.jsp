<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공유번호 변경</title>
</head>
<body>
	<center>

		<%@ include file="../Main/TopLogo.jsp"%>
		<%@ include file="../Login/Login_Status.jsp"%>
		<%@ include file="../Main/MenuBar.jsp"%>

		<h1>공유번호 변경</h1>

		<form method="post" action="Menu0_ChangeShareDB.jsp"
			name="ChangeShareDB">
			<table>
				<tr>
					<td>기준이될 공유번호 :</td>
					<td><input type="text" name="share1" size=15></td>
				</tr>
				<tr>
					<td>변경할 공유번호</td>
					<td><input type="text" name="share2" size=15></td>
				</tr>
			</table>
			<input type="submit" value="변경하기">
		</form>

	</center>
</body>
</html>