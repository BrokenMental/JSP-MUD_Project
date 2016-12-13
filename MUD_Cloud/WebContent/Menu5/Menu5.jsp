<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>F & Q</title>
</head>
<body>

	<center>
		<%@ include file="../Main/TopLogo.jsp"%>
		<%@ include file="../Login/Login_Status.jsp"%>
		<%@ include file="../Main/MenuBar.jsp"%>

		<h1>F & Q</h1>
		<hr align="center" style="border: solid 1px skyblue; width: 60%">
		<br>

		<table align="center" cellspacing="10" bgcolor="white" border="1">
			<tr>
				<td width="100" bgcolor="yellow" cellspadding="10">번호</td>
				<td width="500" bgcolor="yellow">공지사항</td>
				<td width="100" bgcolor="yellow" cellspadding="10">작성자</td>
			</tr>
			
			<tr>
				<td>1</td>
				<td><a href="F&Q_1.jsp">가족공유란 무엇인가요?</a></td>
				<td>관리자</td>
			</tr>
			<tr>
				<td>2</td>
				<td><a href="F&Q_2.jsp">공유신청은 어떻게 하나요?</a></td>
				<td>관리자</td>
			</tr>
			<tr>
				<td>3</td>
				<td><a href="F&Q_3.jsp">가족공유 인정범위가 어떻게되나요?</a></td>
				<td>관리자</td>
			</tr>
		</table>
		<br>
		<hr align="center" style="border: solid 1px skyblue; width: 60%">
		<br> <img src="../img/Music5.JPG" width="700">
	</center>
	<hr>

</body>
</html>