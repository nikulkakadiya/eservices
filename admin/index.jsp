<%@include file="connection.jsp"%>
<%
	
	String sub = request.getParameter("sub");
	

	//int mobile_no=null;
	if(sub!=null)
	{
		// name=Character.parseChar(request.getParameter("name"));
		String mobileNo = request.getParameter("mobile_no").toString();
		//char[] mobile_no=name.toCharArray();
		String password = request.getParameter("password");

		ps = con.prepareStatement("select * from user where password = ? && mobile_no = ?");

		ps.setString(1,password);
		ps.setString(2,mobileNo);
		
		rs = ps.executeQuery();
		if(rs.next())
		{
			
			session.setAttribute("name",rs.getString(3));
			//session.setAttribute("password",rs.getString(2));				
			response.sendRedirect("home.jsp");
		}
		else
		{
				out.println("<script>alert('Enter Correct User or Password')</script>");
		}		
	}	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<%@include file="css.jsp"%>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<b>Admin</b>Panel
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">Sign in to start your session</p>

			<form  method="post">

				<div class="form-group has-feedback">
					<input type="number" name="mobile_no" class="form-control"
						placeholder="Number"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="password" class="form-control"
						placeholder="Password"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<!-- <div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox"> Remember Me
							</label>
						</div>
					</div> -->
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat" name="sub">Sign
							In</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

			<a href="#">I forgot my password</a><br>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 3 -->
	<%@include file="js_script.jsp"%>
</body>
</html>
