<%@include file="conn.jsp"%>
<%
	session.invalidate();
	response.sendRedirect("login.jsp");	
	
%>
