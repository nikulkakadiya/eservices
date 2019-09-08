<%@include file="check_login.jsp"%>

<%


String addService = request.getParameter("add_service");

if(addService!=null)
   {
      String serviceName = request.getParameter("service_name");
      String description = request.getParameter("description");      
      String serviceImage = request.getParameter("service_image");
      //out.println(serviceName+" "+description+" "+serviceImage);

      
 //     String usertype = request.getParameter("usertype");
   //   ps =con.prepareStatement("insert into user(mobile_no,password,name,email_id,status_id,user_type_id)values(?,?,?,?,1,?)");
     // ps.setString(1,mobileno);
      //ps.setString(2,password);
      //ps.setString(3,name);
      //ps.setString(4,email);
      //ps.setString(5,num);
      //ps.setString(5,usertype);
      //int i=ps.executeUpdate();
      
      //if(i==1)
      //{
        // response.sendRedirect("login.jsp");
      //}
      //else
      //{
        // out.println("<script>alert('Record Not Add')</script>");
      //}
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
					Add Data <small>Add Service</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-pencil-square-o"></i> Home</a></li>
					<li class="active">Add Data</li>
				</ol>
			</section>

			
			<!-- Main content -->
			<!-- /.content-wrapper -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Add Services</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<form role="form">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Service Name</label>
							<input type="text" class="form-control" name="service_name" placeholder="Service Name">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Description</label>
							<input type="text" class="form-control" name="description" placeholder="Description">
						</div>
						<div class="form-group">
							<label for="exampleInputFile">Service Image</label>
							<input type="file" name="service_image">


						</div>

					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button name="add_service" type="submit" class="btn btn-primary">Submit</button>
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