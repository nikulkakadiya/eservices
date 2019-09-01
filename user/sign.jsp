<%@include file="conn.jsp"%>
<%

	
	String sub = request.getParameter("sub");
	if(sub!=null)
	{
		String unm = request.getParameter("unm");
		String pass = request.getParameter("pass");
		String gen = request.getParameter("gen");

		String hb1 = request.getParameter("hb1");
		String hb2 = request.getParameter("hb2");
		String hb3 = request.getParameter("hb3");

		StringBuilder sb = new StringBuilder();
		if(hb1!=null)
		{
			sb.append(hb1);
			sb.append(",");
		}
		if(hb2!=null)
		{
			sb.append(hb2);
			sb.append(",");
		}
		if(hb3!=null)
		{
			sb.append(hb3);
		}
		
		//String[] hobby = sb.toString().split(",");
		String city = request.getParameter("city");
		
		ps =con.prepareStatement("insert into user(uname,pass,gen,hobby,city)values(?,?,?,?,?)");
		ps.setString(1,unm);
		ps.setString(2,pass);
		ps.setString(3,gen);
		ps.setString(4,sb.toString());
		ps.setString(5,city);
		int i=ps.executeUpdate();
		
		if(i==1)
		{
			response.sendRedirect("login.jsp");
		}
		else
		{
			out.println("<script>alert('Record Not Add')</script>");
		}
	}
	
%>
<html>
<head>
	<title>register</title>
</head>
<body>
<h1 align="Center">Registration Form</h1> 
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
		<td>Gendar</td>
		<td>
		<input type="radio" name="gen" value="Male">Male
		<input type="radio" name="gen" value="FeMale">FeMale
		</td>
		</tr>
		<td>Hobbies</td>
		<td>
		<input type="checkbox" name="hb1" value="Read">Read
		<input type="checkbox" name="hb2" value="Write">Write		
		<input type="checkbox" name="hb3" value="Play">Play
		</td>
		</tr>
		<tr>
		<td>City</td>
		<td>
			<select name="city">
			<option value="select">Select City</option>
			<option value="Rajkot">Rajkot</option>
			<option value="Surat">Surat</option>
			<option value="Baroda">Baroda</option>
			</select>
		</td>
		</tr>

		<tr>
			<td colspan="2" align="center"><input type="submit" name="sub" value="SignUp">
		</tr>
		</table>
		
	</form>
</body>
</html>