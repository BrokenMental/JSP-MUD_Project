<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>가족공유게시판 수정</title>
</head>
<body>

	<center>
		<%@ include file="../Main/TopLogo.jsp"%>
		<%@ include file="../Login/Login_Status.jsp"%>
		<%@ include file="../Main/MenuBar.jsp"%>
		<br>
		<h1>게시물 수정</h1>
		<table border="1">
			<%	
	int C_number=Integer.parseInt(request.getParameter("number"));

	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/mud";

	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","1234");
	String title, content;
	
	try{
		String sql="select * from sharerequest where number ="+C_number;
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		
		int number;
		String title2,ID2,date;
		while(rs.next()){
			title = rs.getString("title");
			content = rs.getString("content");
%>

			<form method="post" action="Menu4_ChangeDB.jsp?number=<%=C_number%>"
				name="ChangeDB">
				<table align="center" cellspacing="3" border="1">
					<tr>
						<td align="center">제 목</td>
						<td><input type=text name="title" size="59"
							value="<%=title%>"></td>
					</tr>
					<tr height=300>
						<td colspan=2><textarea rows="30" cols="66" name="content"><%=content%></textarea></td>
					</tr>
				</table>

				<%
		}
		rs.close();
		pstmt.close();
		conn.close();
	}
	catch(Exception e) {
		System.out.println(e);
	}
%>
				<br> <input type="submit" value="수정완료">
			</form>
			<br>
			<hr>
			</center>
</body>
</html>