<%@include file="check_login.jsp"%>
<%

String statusId = request.getParameter("status_id");

if(statusId!=null)
	{
		ps = con.prepareStatement("delete  from booking_status where id=?");

		ps.setString(1,statusId);
		
		int deletedRows = ps.executeUpdate();
		if(deletedRows==1)
		{
			response.sendRedirect("view_booking_status.jsp");
		}
		else
		{
			response.sendRedirect("view_booking_status.jsp");			
		}

	}	
	
	%>