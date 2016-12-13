<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int number = (int)session.getAttribute("D_number");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/mud";

	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","1234");
	
	try {
		
		Statement stmt=conn.createStatement();
		stmt.executeUpdate("update sharerequest set title='"+title+"', content='"+content+"' where number = "+number);	

		pstmt.close();
		conn.close();
		
	}
	catch(Exception e) {
		System.out.println(e);
	}
%>
<script>
	alert("게시물 수정 성공!");
	location.href="Menu4.jsp";
</script>
