<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.io.File, java.util.Enumeration, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
    com.oreilly.servlet.MultipartRequest, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3; url=Menu2.jsp">
</head>

<%@ include file="../Main/TopLogo.jsp"%>
<%@ include file="../Login/Login_Status.jsp"%>
<%@ include file="../Main/MenuBar.jsp"%>

<body>
	<center>
	<br/>
	<h1>저장 내용</h1>
	<br/>
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
String now = formatter.format(new java.util.Date());
String writer = String.valueOf(session.getAttribute("name"));
String port = String.valueOf(session.getAttribute("share"));

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/mud";
Class.forName(jdbc_driver);

try{
	
	String saveDir=application.getRealPath("upload");
	int maxPostSize=1024*1024*20;
	
	MultipartRequest mr = new MultipartRequest(request,saveDir,maxPostSize,"utf-8",new DefaultFileRenamePolicy());
	
	Enumeration<?> files=mr.getFileNames();
	String filename = (String)files.nextElement();
	
	File obj=mr.getFile(filename);
	if(obj.exists()){
		out.print("파일명 : "+obj.getName() +"<br/>");
		out.print("파일크기 : "+obj.length() +"<br/>");
		//out.print("경로+파일명: "+obj.getPath()+"<br/>");
	}
	%>
		<form action="Menu2.jsp" method="post">
			작성자 : <%=writer %><br />
			<!--파일명 : <%=mr.getOriginalFileName(filename) %><br /> -->
			공유번호 : <%=port %><br />
			날짜 : <%=now %><br />
			<!--<input type="submit" value="확인" /> -->
		</form>

		<%
	Connection conn = DriverManager.getConnection(jdbc_url, "root", "1234");
	String sql = "insert into fileup(writer,port,location,date) values(?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, writer);
	pstmt.setString(2, port);
	pstmt.setString(3, obj.getName());
	pstmt.setString(4, now);
	
	pstmt.execute();
	pstmt.close();
	conn.close();
	
}catch(Exception e){
	out.print(e);
	out.print("<br/>파일저장 실패");
	out.print("<a href='javascript:history.back()'>[다시시도]</a>");
}
%>
	</center>
</body>
</html>