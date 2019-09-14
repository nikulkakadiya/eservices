<%@include file="check_login.jsp"%>
<%
String updateBookingStatus=request.getParameter("update_booking_status");

if (updateBookingStatus!=null) {

String id=request.getParameter("status_id");
String statusName=request.getParameter("status_name");

ps = con.prepareStatement("update booking_status set name=? where id=?");

ps.setString(1,statusName);
ps.setString(2,id);

int editedCity=ps.executeUpdate();

if(editedCity==1)
{
	response.sendRedirect("view_booking_status.jsp");
}
else
{
	out.println("<script>alert('Record Not Add')</script>");
}
}

%>