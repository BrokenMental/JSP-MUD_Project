<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
	function writeCheck() {
		var form = document.search;
		if (!form.search.value) {
			alert("검색어를 입력해주세요.");
			form.text.focus();
			return;
		}
		form.submit();
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내클라우드</title>
</head>
<%@ include file="../Main/TopLogo.jsp"%>
<%@ include file="../Login/Login_Status.jsp"%>
<%@ include file="../Main/MenuBar.jsp"%>
<body>
	<center>
		<%
		String share = String.valueOf(session.getAttribute("share"));
		String search = request.getParameter("search");
		Connection conn = null;
		PreparedStatement pstmt = null;

		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/mud";
		int total = 0;

		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "1234");
			Statement stmt = conn.createStatement();

			String sqlTotal = "select count(*) from fileup";
			ResultSet rs = stmt.executeQuery(sqlTotal);

			while (rs.next()) {
				total = rs.getInt(1);
			}
			rs.close();

			String sqlsearch = "SELECT * FROM FILEUP WHERE PORT = "+share+" AND LOCATION LIKE '%"+search+"%' ORDER BY NUM DESC";
			rs = stmt.executeQuery(sqlsearch);
	%>
		<h1>내 클라우드</h1>
		<table border="1" width="600px" style="border-collapse: collapse; margin-left:-15px;">
			<tr>
				<th width="50px">번호</th>
				<th width="50px">작성자</th>
				<th width="50px">공유번호</th>
				<th width="150px">파일명</th>
				<th width="100px">날짜</th>
			</tr>
		</table>
		<div style="width:650px; height:300px; border:1px solid black; overflow-y: scroll; margin-top:2px; left:10px;">
		<%
		while (rs.next()) {
				int num = rs.getInt(1);
				String writer = rs.getString(2);
				String port = rs.getString(3);
				String location = rs.getString(4);
				String date = rs.getString(5);
	%>
		<table border="1" width="600px"
			style="border-collapse: collapse; text-align: center; margin-top:2px;"
			onclick="location.href='Menu2_view.jsp?num=<%=num %>'">
			<tr>
				<td width="50px"><%=num%></td>
				<td width="50px"><%=writer%></td>
				<td width="50px"><%=port%></td>
				<td width="150px"><%=location%></td>
				<td width="100px"><%=date%></td>
			</tr>
		</table>
		<%
		}
		%>
		</div>
		<form name="search" method="post" action=Menu2_Write.jsp style=" margin-left:580px; margin-top:2px;">
		<input type="submit" value="파일 추가">
		</form>
	<form name="search" method="post" action=Menu2_Search.jsp>
	<table>
		<tr>
			<td>
				제목 검색 : <input type="text" name="search" />
				&nbsp;<input type="button" value="검색" Onclick="javascript:writeCheck();" />
			</td>
		</tr>
	</table>
	</form>
		<%
		rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
	</center>
</body>
</html>