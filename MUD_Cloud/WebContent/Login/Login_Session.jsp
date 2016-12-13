<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String userid2 = request.getParameter("userid");
String passwd2 = request.getParameter("passwd");

String userid3 = null;
String passwd3 = null;
String name = null;
int share;

Connection conn = null;
PreparedStatement pstmt = null;

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/mud";

try{
	Class.forName(jdbc_driver);

	conn=DriverManager.getConnection(jdbc_url,"root","1234");
	String sql="select * from user where id='"+userid2+"'";
	
	pstmt = conn.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();

	while(rs.next()){
		userid3 = rs.getString("id");
		passwd3 = rs.getString("passwd");
		name = rs.getString("name");
		share = rs.getInt("share");
			if (rs.next()==false) {%>
<script>
				alert("로그인 실패");
				history.go(-1);
			</script>
<%			}
		
			if (passwd2.equals(passwd3)&&userid2.equals(userid3)) {
				session.setAttribute("name", name);
				session.setAttribute("userid", userid2);
				session.setAttribute("share", share);
				response.sendRedirect("../Menu1/Menu1.jsp");
				}
		
		}
	
		rs.close();
		pstmt.close();
		conn.close();
		
	}

	catch(Exception e){
	System.out.println(e);
	
}

%>