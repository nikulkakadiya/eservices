<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
	String spi=(String)session.getAttribute("mobile");
	ps=con.prepareStatement("delete from service_provider_skill where service_provider_id=?");
	ps.setString(1,spi);

	int result=ps.executeUpdate();
	if(result==1)
	{
		response.sendRedirect("view_skill.jsp");
	}
	else
	{
         out.println("<script>alert('Record Not Add')</script>");

	}
%>