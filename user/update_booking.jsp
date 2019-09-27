<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
try{
			String updateBooking=request.getParameter("update_booking");
			if(updateBooking!=null)
			{
				String bookingId=request.getParameter("booking_id");
				String bookingStatus=request.getParameter("booking_status");
				out.println(bookingStatus);
				ps=con.prepareStatement("update booking set booking_status_id=? where id=?");
				ps.setString(1,bookingStatus);
				ps.setString(2,bookingId);

				int result=ps.executeUpdate();
				if(result==1)
				{
					response.sendRedirect("view_booking.jsp");
				}
				else
				{
					out.println("<script>alert('Record Not Add')</script>");
				}
			} 	
		}
		catch(Exception e){}
%>