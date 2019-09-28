<%@include file="connection.jsp"%>
<%

boolean isCorrectLogin = true;
String sub = request.getParameter("sub");


	//int mobile_no=null;
if(sub!=null)
	{
		// name=Character.parseChar(request.getParameter("name"));
		String mobileNo = request.getParameter("mobile_no").toString();
		//char[] mobile_no=name.toCharArray();
		String password = request.getParameter("password");

		ps = con.prepareStatement("select * from user where password = ? && mobile_no = ? && user_type_id=1");

		ps.setString(1,password);
		ps.setString(2,mobileNo);
		
		rs = ps.executeQuery();
		if(rs.next())
		{
			
			session.setAttribute("admin_name",rs.getString(3));
			//session.setAttribute("password",rs.getString(2));				
			response.sendRedirect("home.jsp");
		}
		else
		{
			isCorrectLogin = false;
		}		
	}	
	
	%>

	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<title>Admin| Log in</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta
		content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
		name="viewport">
		<!-- Bootstrap 3.3.7 -->
		<%@include file="css.jsp"%>
	</head>
	<body class="hold-transition login-page">
		<div class="login-box">
			<% if(!isCorrectLogin)
				{
			%>
			<div class="alert alert-info alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info"></i> Alert!</h4>
                Username or password are invalid.
              </div>
            <%	}
            %>
			<div class="login-logo">
				<b>Admin</b>Panel
			</div>
			<!-- /.login-logo -->
			<div class="login-box-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<form  method="post">

					<div class="form-group has-feedback">
						<input type="text" name="mobile_no" class="form-control"
						placeholder="Number" minlength="10" maxlength="10" required> <span
						class="glyphicon fa fa-fw-sx fa-phone-square form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" name="password" class="form-control"
						placeholder="Password" required> <span
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
