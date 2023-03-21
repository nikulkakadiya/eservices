<%@include file="connection.jsp"%>
<%
	String status="1";
	String mo="7874634643";
	ps = con.prepareStatement("select status_id from user where mobile_no = ?");
	ps.setString(1,mo);
	// ps.setString(2,"Service Provider");
	rs = ps.executeQuery();
	if(rs.next())
	{
		if(status.equals(rs.getString(1)))
			out.println("block");
	}else{
		if(mo==null)
	   {
			out.println("login");
	   }
	}

	/*
	String status="1";
String molile=(String) session.getAttribute("mobile");

ps = con.prepareStatement("select status_id from user where mobile_no = ?");
ps.setString(1,molile);
rs = ps.executeQuery();

if(rs.next()){
	if(status.equals(rs.getString(1)))
    	response.sendRedirect("login.jsp");
			
}else{
	if(molile==null)
	{
    	response.sendRedirect("login.jsp");
	}
}*/
%>
