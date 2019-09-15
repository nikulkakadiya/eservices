<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@include file="check_login.jsp"%>

<%
String serviceId=request.getParameter("service_id");
if(serviceId != null){	
	ps = con.prepareStatement("select s.id,name,description,i.path,s.image_id from service s inner join image i on s.image_id=i.id where s.id=?");

	ps.setString(1,serviceId);

	rs = ps.executeQuery();

		if(!rs.next()){
			response.sendRedirect("view_service.jsp");
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

				<form action="update_service.jsp" method="POST" enctype="multipart/form-data">
					<div class="box-body">
						<input type="hidden" name="service_id" value="<%=rs.getString(1)%>"/>
						<input type="hidden" name="image_id" value="<%=rs.getString(5)%>"/>
						<div class="form-group">
							<label for="exampleInputEmail1">Service Name</label>
							<input type="text" class="form-control" name="service_name" placeholder="Service Name" value="<%=rs.getString(2)%>">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Description</label>
							<input type="text" class="form-control" name="description" placeholder="Description" value="<%=rs.getString(3)%>">
						</div>
						<div class="form-group">
							<img src="<%=rs.getString(4)%>" height="40px" width="50px" /><br>
							<label for="exampleInputFile">Service Image</label>
							<input type="file" name="service_image">

						</div>
						
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Update</button>
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