<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>DB변경</title>
</head>
<body>

<%
 	int share3 = Integer.parseInt(request.getParameter("share1"));
	int share4 = Integer.parseInt(request.getParameter("share2"));
%>


<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/mud";

	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","1234");
	
	try {
		
		Statement stmt=conn.createStatement();
		stmt.executeUpdate("update user set share="+share3+" where share="+share4);
		stmt.executeUpdate("update fileup set port="+share3+" where port="+share4);	
		
		pstmt.close();
		conn.close();
		
	}
	catch(Exception e) {
		System.out.println(e);
	}
%>
	<script>
			alert("공유번호변경 완료.!");
			location.href="../Menu1/Menu1.jsp";
</script>
</body>
</html>