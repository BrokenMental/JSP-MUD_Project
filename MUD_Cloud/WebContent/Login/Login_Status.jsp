<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<%
	String userid = "";
	try {
		userid = (String) session.getAttribute("userid");
		if (userid == null || userid.equals(" ")) {
			response.sendRedirect("../Main/Login_Main.jsp");
		}
	} finally {
		
	}
%>
<body>
	<center>
		<hr align="center" style="border: solid 1px gray; width: 75%">
		<table style="text-align: center;" width="500" cellspacing="0"
			cellpadding="2">
			<tr>
				<td><%=session.getAttribute("name")%> 님이 접속중입니다.</td>
				<td>공유번호 : <%=session.getAttribute("share")%></td>
				<td><form method="post" action="../Login/logout.jsp" name="logout">
						<input type="submit" value="로그아웃">
					</form></td>
				<td><form method="post" action="../Menu0/Menu0_CheckID.jsp" name="checkID">
						<input type="submit" value="공유번호관리">
					</form></td>
			</tr>
		</table>
		<hr align="center" style="border: solid 1px gray; width: 75%">
	</center>
</body>
</html>