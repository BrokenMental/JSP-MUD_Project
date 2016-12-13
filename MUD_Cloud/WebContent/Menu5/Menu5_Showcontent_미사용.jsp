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
	
	String title=request.getParameter("title");
	String requestnumber=request.getParameter("number1");
	String ID=(String)session.getAttribute("userid"), content;
	int number3=Integer.parseInt(request.getParameter("number"));
	try{	
		String sql="select * from fq where number="+number3;
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			ID = rs.getString("ID");
			number3 = rs.getInt("number");
			title = rs.getString("title");
			content = rs.getString("content");
%>
			<tr>
				<td width="100"><%=number3%></td>
				<td width="400"><%=title%></td>
				<td width="100"><%=ID%></td>
			</tr>
			<th colspan="3" height="500"><%=content%></th>
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