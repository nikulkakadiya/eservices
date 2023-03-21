<%@include file="check_login.jsp"%>

<%

	boolean isCorrectAddCity=true;
String addCity = request.getParameter("add_city");

if(addCity!=null)
	{
		String cityName=request.getParameter("city_name");
		ps =con.prepareStatement("insert into city(name) values(?)");
		
		ps.setString(1,cityName);

		int result = ps.executeUpdate();
		
		if(result == 1)
		{
			response.sendRedirect("view_city.jsp");
		}
		else
		{
			isCorrectAddCity=false;
		}
		
	}
	%>



	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>AdminLTE 2 | Dashboard</title>

		<!-- Tell the browser to be responsive to screen width -->
		<meta
		content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
		name="viewport">

		<!-- Css -->
		<%@include file="css.jsp"%>

	</head>

	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">

			<!-- Header Navbar: style can be found in header.less -->
			<%@include file="topheader.jsp"%>

			<!-- Left side column. contains the logo and sidebar -->
			<%@include file="sidebar.jsp"%>
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<h1>
						Add Data <small>Add City</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="home.jsp"><i class="fa fa-pencil-square-o"></i>Home</a></li>
						<li class="active">Add City</li>
					</ol>
				</section>
				<%
					if (!isCorrectAddCity) {
				%>
					<div class="alert alert-info alert-dismissible">
	                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                <h4 align="center"><i class="icon fa fa-info"></i> Alert!</h4>
	                <p align="center">Record Not Add.</p>
	              	</div>
	            <%
	            	}
	            %>				
				<!-- Main content -->
				<!-- /.content-wrapper -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Add City</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form role="form">
						<div class="box-body">						
							<div class="form-group">
								<label for="exampleInputPassword1">City</label>
								<input type="text" class="form-control" name="city_name" placeholder="City" required="">
							</div>						
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<button name="add_city" type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
				<!-- Control Sidebar -->
				.
				<%@include file="control_sidebar.jsp"%>
				<!-- /.control-sidebar -->
			<!-- Add the sidebar's background. This div must be placed
				immediately after the control sidebar -->
				<div class="control-sidebar-bg"></div>
			</div>
		</div>
		<!-- ./wrapper -->

		<!-- Java Script -->
		<%@include file="js_script.jsp"%>
	</body>
	</html>