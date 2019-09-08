<%@include file="connection.jsp"%>
<%
String name=(String) session.getAttribute("admin_name");

if(name==null)
	{
		response.sendRedirect("index.jsp");
	}
%>