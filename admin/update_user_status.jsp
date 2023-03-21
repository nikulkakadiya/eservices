<%@include file="check_login.jsp"%>
<%
String updateStatus=request.getParameter("update_status");
// String u=request.getParameter("mobileno");
out.println(updateStatus);
// String userStatus=request.getParameter("userstatus");

if(updateStatus!=null){
	String mobileNo=request.getParameter("mobileNo");
	String status=request.getParameter("userStatus");

	ps = con.prepareStatement("update user set status_id=? where mobile_no=?");

	ps.setString(1,status);
	ps.setString(2,mobileNo);

	int editedCity=ps.executeUpdate();

	if(editedCity==1)
	{
		response.sendRedirect("view_user.jsp");
	}
	else
	{
		out.println("<script>alert('Record Not Add')</script>");
	}
		
}


%>