<%@include file="check_login.jsp"%>
<%

String cityId = request.getParameter("city_id");

if(cityId!=null)
	{
		ps = con.prepareStatement("delete  from city where id=?");

		ps.setString(1,cityId);
		
		int deletedRows = ps.executeUpdate();
		if(deletedRows==1)
		{
			response.sendRedirect("view_city.jsp");
		}
		else
		{
			response.sendRedirect("view_city.jsp");			
		}

	}	
	
	%>