<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/mud";

	request.setCharacterEncoding("UTF-8");
	Class.forName(jdbc_driver);
	String share = String.valueOf(session.getAttribute("share"));
	int num = Integer.parseInt(request.getParameter("num"));

	try {
		Connection conn = DriverManager.getConnection(jdbc_url, "root", "1234");
		Statement stmt = conn.createStatement();
		
		String sql = "DELETE FROM fileup where num="+num;
		stmt.executeUpdate(sql);
		
%>
		<script language="javascript">
			alert("글이 삭제되었습니다.");
			location.href="Menu2.jsp";
		</script>
<%
		stmt.close();
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>