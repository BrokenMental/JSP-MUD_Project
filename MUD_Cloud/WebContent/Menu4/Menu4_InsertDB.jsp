<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String ID = (String)session.getAttribute("userid");
	String Title = request.getParameter("title");
	String Content = request.getParameter("content");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/mud";

	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","1234");
	
	try {
		
		Statement stmt=conn.createStatement();
		stmt.executeUpdate("insert into sharerequest (ID,title,content,date) values('"+ID+"','"+Title+"','"+Content+"',curdate())");	

		pstmt.close();
		conn.close();
		
	}
	catch(Exception e) {
		System.out.println(e);
	}
%>
<script>
	alert("글쓰기 성공!");
	location.href="Menu4.jsp";
</script>
