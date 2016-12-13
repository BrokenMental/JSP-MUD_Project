<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = null;
	id=(String)session.getAttribute("userid");
	
	if (id.equals("root")){
		response.sendRedirect("Menu0_ChangeShare.jsp");
	}
	
	else {
%>
	<script>
			alert("권한이 없습니다.");
			location.href="../Menu1/Menu1.jsp";
	</script>
<%
	}
%>