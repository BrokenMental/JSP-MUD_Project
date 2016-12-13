<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가족공유신청</title>
</head>
<body>

	<center>
		<%@ include file="../Main/TopLogo.jsp"%>
		<%@ include file="../Login/Login_Status.jsp"%>
		<%@ include file="../Main/MenuBar.jsp"%>

		<h1>가족공유신청</h1>
		<hr align="center" style="border: solid 1px skyblue; width: 60%">
		<p>내가 쓴 게시물</p>
		<table align="center" cellspacing="10" bgcolor="white" border="1">
			<tr>
				<td width="100" bgcolor="yellow" cellspadding="10">번호</td>
				<td width="450" bgcolor="yellow">제목</td>
				<td width="100" bgcolor="yellow">공유번호</td>
				<td width="100" bgcolor="yellow" cellspadding="10">작성자</td>
			</tr>

			<%
				String userid1 = (String) session.getAttribute("userid");
				int share = 0;
				try{
					if (!(session.getAttribute("share")).equals(null)) {
						share = (int) session.getAttribute("share");
					}
				}catch(Exception e){
					System.out.println(e);
				}
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				String jdbc_driver = "com.mysql.jdbc.Driver";
				String jdbc_url = "jdbc:mysql://localhost/mud";

				Class.forName(jdbc_driver);
				conn = DriverManager.getConnection(jdbc_url, "root", "1234");

				try {
					String sql1 = "select * from sharerequest where ID='" + userid1 + "'";

					pstmt = conn.prepareStatement(sql1);
					ResultSet rs1 = pstmt.executeQuery();
					int number;
					String title, ID, date;
					while (rs1.next()) {
						number = rs1.getInt("number");
						title = rs1.getString("title");
						ID = rs1.getString("ID");
			%>
			<tr>
				<td><%=number%></td>
				<td><a href="Menu4_Showcontent.jsp?number=<%=number%>"><%=title%></a></td>
				<td><%=share%>
				<td><%=ID%></td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
		<form method="post" action="Menu4_Makecontent.jsp" name="makecontent">
			<input type="submit" value="글쓰기">
		</form>
		<br>
		<form method="post" action="Menu4_Select.jsp" name="select">
			<input type="test" name="title" size="40"> <input
				type="submit" value="전체 게시물 검색">
		</form>
		<br>
		<hr align="center" style="border: solid 1px skyblue; width: 60%">
		<p>다른사람 게시물</p>
		<table align="center" cellspacing="10" bgcolor="white" border="1">
			<tr>
				<td width="100" bgcolor="yellow" cellspadding="10">번호</td>
				<td width="450" bgcolor="yellow">제목</td>
				<td width="100" bgcolor="yellow">공유번호</td>
				<td width="100" bgcolor="yellow" cellspadding="10">아이디</td>
			</tr>
			<%
				rs1.close(); // 내가쓴 게시물 DB종료.

					String sql2 = "select * from sharerequest left join user on sharerequest.ID=user.ID where user.ID<>'"
							+ userid1 + "'";
					int share2 = 0;
					pstmt = conn.prepareStatement(sql2);
					ResultSet rs2 = pstmt.executeQuery();
					int number2;
					String title2, ID2, date2;
					while (rs2.next()) {
						number2 = rs2.getInt(2);
						title2 = rs2.getString(3);
						ID2 = rs2.getString(1);
						share2 = rs2.getInt(10);
			%>
			<tr>
				<td><%=number2%></td>
				<td><a href="Menu4_Showcontent.jsp?number=<%=number2%>"><%=title2%></a></td>
				<td><%=share2%></td>
				<td><%=ID2%></td>
			</tr>
			<%
				}
			%>
		</table>

		<%
			rs2.close(); // 다른사람 게시물 DB종료.
				pstmt.close();
				conn.close();

			}

			catch (Exception e) {
				System.out.println(e);
			}
		%>

		<hr align="center" style="border: solid 1px skyblue; width: 60%">
		<img src="../img/Music4.jpeg" width="700"> <br>
	</center>
	<hr>

</body>
</html>