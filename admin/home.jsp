<%@include file="connection.jsp"%>
<%
String name=(String) session.getAttribute("name");

if(name==null)
	{
		response.sendRedirect("index.jsp");
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
						Dashboard <small>Control panel</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active"> Dashboard</li>
						
					</ol>
				</section>

				<!-- Main content -->
				<!-- /.content-wrapper -->
				<!-- Control Sidebar -->.
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