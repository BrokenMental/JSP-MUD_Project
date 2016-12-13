<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 보기</title>
</head>
<body>

	<center>
		<%@ include file="../Main/TopLogo.jsp"%>
		<%@ include file="../Login/Login_Status.jsp"%>
		<%@ include file="../Main/MenuBar.jsp"%>
		<br>
		<table border="1">
			<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/mud";
	
	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","1234");
	
	String title = request.getParameter("title");
	String ID1 = (String)session.getAttribute("userid");
	String ID2=null , content;
	int number3 = Integer.parseInt(request.getParameter("number"));
	session.setAttribute("D_number", number3); /* 삭제용 게시물 구분 세션. */
	try{	
		String sql="select * from sharerequest where number="+number3;
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			ID2 = rs.getString("ID");
			number3 = rs.getInt("number");
			title = rs.getString("title");
			content = rs.getString("content");
	%>
			<tr>
				<td width="100"><%=number3%></td>
				<td width="350"><%=title%></td>
				<td width="100"><%=ID2%></td>
			</tr>
			<th colspan="3" height="500"><%=content%></th>
	<%
			}
		if (ID1.equals(ID2)||ID1.equals("root")) {
	%>
			<form method="post"
				action="Menu4_Changecontent.jsp?number=<%=number3%>"
				name="makecontent">
				<input type="submit" value="수정">
			</form>
			<form method="post"
				action="Menu4_Deletecontent.jsp?number=<%=number3%>"
				name="deletecontent">
				<input type="submit" value="삭제">
			</form>
	<%
		}
		else {
	%>
				<input type="submit" value="수정" disabled>
				<input type="submit" value="삭제" disabled>
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
		<hr>
	</center>
</body>
</html>