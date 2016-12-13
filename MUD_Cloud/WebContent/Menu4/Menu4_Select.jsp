<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<center>
		<%@ include file="../Main/TopLogo.jsp"%>
		<%@ include file="../Login/Login_Status.jsp"%>
		<%@ include file="../Main/MenuBar.jsp"%>

		<h1>검색 결과</h1>
		<%
	String SR_serch = request.getParameter("title");
	String ID1 = (String)session.getAttribute("userid");
%>
		<table align="center" cellspacing="10" bgcolor="white" border="1">
			<tr>
				<td width="100" bgcolor="yellow" cellspadding="10">번호</td>
				<td width="500" bgcolor="yellow">제목</td>
				<td width="100" bgcolor="yellow" cellspadding="10">아이디</td>
			</tr>
			<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/mud";

	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","1234");
	String title;
	int share2=0;
	
	try{
		String sql="select * from sharerequest where title like '%"+SR_serch+"%';";
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		
		int number;
		String title2,ID2,date;
		while(rs.next()){
			number = rs.getInt("number");
			title2 = rs.getString("title");
			ID2 = rs.getString("ID");
%>
			<tr>
				<td><%=number%></td>
				<td><a href="Menu4_Showcontent.jsp?number=<%=number%>"><%=title2%></a></td>
				<td><%=ID2%></td>
			</tr>
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
		</table>
		<br>
		<form method="post" action="Menu4_Select.jsp" name="select">
			<input type="test" name="title" size="50"> <input
				type="submit" value="검색">
		</form>
		<br>
		<form method="post" action="Menu4_Makecontent.jsp" name="makecontent">
			<input type="submit" value="글쓰기">
		</form>
		<br>
		<hr align="center" style="border: solid 1px skyblue; width: 60%">
		<br> <img src="../img/Music4.jpeg" width="700">
	</center>
	<hr>
</body>
</html>