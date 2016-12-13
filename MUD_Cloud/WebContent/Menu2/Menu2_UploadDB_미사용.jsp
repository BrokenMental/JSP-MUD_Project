<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" import="java.io.*" pageEncoding="UTF-8"%>
<!-- InputStream 타입은 import="java.io.*" 에 포함 -->
<% request.setCharacterEncoding("utf-8"); %>
<%
	InputStream inputstream = null;
	OutputStream outputstream = null;
	String m_name = request.getParameter("m_name");
	
	/* String title=(request.getParameter("title"));
	Part filePart = request.getPart("file_uploaded"); */
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<%-- <%
	String ID = (String)session.getAttribute("userid");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/mud";

	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","1234");
	
	try {
		
		Statement stmt=conn.createStatement();
		stmt.executeUpdate("insert into music (m_name,type,size,share,date,download,data) values('"+m_name+"','mp3',0,curdate(),0,?)");	

		pstmt.close();
		conn.close();
		
	}
	catch(Exception e) {
		System.out.println(e);
	}
%> --%>

<body>
	<%=m_name %><br>
</body>
</html>