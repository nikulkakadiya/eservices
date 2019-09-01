<%@include file="conn.jsp"%>
<%
	
	String sub = request.getParameter("sub");
	


	if(sub!=null)
	{
		String unm = request.getParameter("unm");
		String pass = request.getParameter("pass");

		ps = con.prepareStatement("select * from reg where uname='"+unm+"' and pass ='"+pass+"'");
		//ps.setString(1,unm);
		//ps.setString(2,pass);
		//out.println("name"+unm+"passss"+pass);
		rs = ps.executeQuery();
		if(rs.next())
		{
			
			session.setAttribute("uid",rs.getString(1));							
			response.sendRedirect("profile.jsp");
		}
		else
		{
				out.println("<script>alert('Enter Correct User or Password')</script>");
		}		
	}	
	
%>
<html>
	<head>
	<title></title>
	</head>
	<body>
	<h1 align="Center">Login Form</h1> 
	<form>
		<table align="center" border="1">
		<tr>
		<td>User</td>
		<td><input type="text" name="unm"></td>
		</tr>
		<tr>
		<td>Password</td>
		<td><input type="password" name="pass"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><input type="submit" name="sub" value="LogIn">
		</tr>
		</table>
		
	</form>
	</body>
</html>
