<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
	String spi=(String)session.getAttribute("mobile");
	String serviceId=request.getParameter("service_id");
	ps=con.prepareStatement("delete from service_provider_skill where service_provider_id=? && service_id=?");
	ps.setString(1,spi);
	ps.setString(2,serviceId);

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