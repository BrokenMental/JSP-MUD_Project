<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>가족공유 신청</title>
</head>
<body>

	<center>
		<%@ include file="../Main/TopLogo.jsp"%>
		<%@ include file="../Login/Login_Status.jsp"%>
		<%@ include file="../Main/MenuBar.jsp"%>

		<h2>게시물 작성</h2>
		<hr align="center" style="border: solid 1px skyblue; width: 60%">
		<br>
		<form method="post" action="Menu4_InsertDB.jsp" name="insertDB">
			<table align="center" cellspacing="3" border="1">
				<tr>
					<td align="center">제 목</td>
					<td><input type=text name="title" size="59"></td>
				</tr>
				<tr height=300>
					<td colspan=2><textarea rows="30" cols="66" name="content"></textarea></td>
				</tr>
			</table>
			<br> <input type="submit" value="작성완료">
		</form>
		<hr align="center" style="border: solid 1px skyblue; width: 60%">
		<hr>
	</center>

</body>
</html>