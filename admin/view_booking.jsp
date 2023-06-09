<%@include file="check_login.jsp"%>
<%
ps = con.prepareStatement("select b.id,b.service_id,b.service_provider_id,b.customer_id,b.date,bs.name from booking b inner join booking_status bs on b.booking_status_id=bs.id");

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
					Dashboard <small>View Booking</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">View Booking</li>
				</ol>
			</section>

			
			<!-- Main content -->
			<!-- /.content-wrapper -->
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">Booking</h3>

					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin">
							<thead>
								<tr>
									<th>Id</th>
									<th>Service Id</th>
									<th>Service Provider Id</th>
									<th>Customer Id</th>
									<th>Date</th>
									<th>Booking Satus</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								rs = ps.executeQuery();

								while(rs.next())
									{
										%>
										<tr>
											<td><%=rs.getString(1)%></td>
											<td><%=rs.getString(2)%></td>
											<td><%=rs.getString(3)%></td>
											<td><%=rs.getString(4)%></td>
											<td><%=rs.getDate(5)%></td>
											<td><%=rs.getString(6)%></td>
											<td class="center">			
												<a class="btn btn-info"
												href="edit_booking.jsp?booking_id=<%=rs.getString(1)%>"><i class="glyphicon glyphicon-edit icon-white"></i> Edit
											</a>					

							</td>
									</tr>
									<%
								}
								%>

							</tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>

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