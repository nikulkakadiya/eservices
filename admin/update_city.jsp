<%@include file="check_login.jsp"%>
<%
		String updateCity=request.getParameter("update_city");
		
		if (updateCity!=null) {

			String id=request.getParameter("city_id");
			String cityName=request.getParameter("city_name");

			ps = con.prepareStatement("update city set name=? where id=?");
			
			ps.setString(1,cityName);
			ps.setString(2,id);

			int editedCity=ps.executeUpdate();
		
			if(editedCity==1)
			{
				response.sendRedirect("view_city.jsp");
			}
			else
			{
				out.println("<script>alert('Record Not Add')</script>");
			}
		}

%>