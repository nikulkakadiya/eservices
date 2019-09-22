<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%
try{
	String bookingId = UUID.randomUUID().toString();
	String serviceProviderId=request.getParameter("service_provider_id");
	String serviceId=request.getParameter("service_id");
	String customerId=(String)session.getAttribute("mobile");
	
	String status="6";	
	ps=con.prepareStatement("insert into booking (id,service_id,service_provider_id,customer_id,booking_status_id)values(?,?,?,?,?)");
	ps.setString(1,bookingId);
	ps.setString(2,serviceId);
	ps.setString(3,serviceProviderId);
	ps.setString(4,customerId);
	ps.setString(5,status);

	int result=ps.executeUpdate();
	if (result==1) {
		response.sendRedirect("view_booking.jsp");
	}
	else
	{
		out.println("<script>alert('Record Not Add')</script>");
	}
}
catch(Exception e)
{
	out.println(e);
}

%>