<%@include file="connection.jsp"%>
<%
	session.invalidate();
	response.sendRedirect("index.jsp");	
	
%>
