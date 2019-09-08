<%@include file="check_login.jsp"%>
<%

String serviceId = request.getParameter("service_id");

if(serviceId!=null)
	{
		ps = con.prepareStatement("delete  from service where id=?");

		ps.setString(1,serviceId);
		
		int deletedRows = ps.executeUpdate();
		if(deletedRows==1)
		{
			response.sendRedirect("view_service.jsp");
		}
		else
		{
			response.sendRedirect("view_service.jsp");			
		}

	}	
	
	%>