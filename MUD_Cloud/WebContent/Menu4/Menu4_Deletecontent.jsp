<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int D_number = (int)session.getAttribute("D_number");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/mud";

	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","1234");
	
	try {
		
		Statement stmt=conn.createStatement();
		stmt.executeUpdate("delete from sharerequest where number="+D_number);	

		pstmt.close();
		conn.close();
		
	}
	catch(Exception e) {
		System.out.println(e);
	}
%>
<script>
	alert("삭제완료~!");
	location.href="Menu4.jsp";
</script>