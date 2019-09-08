<%@include file="check_login.jsp"%>
<%
ps = con.prepareStatement("SELECT mobile_no,name,email_id,status,type FROM user u inner join user_type ut on u.user_type_id = ut.id inner join user_status us on u.status_id = us.id ");

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
					Dashboard <small>user</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>

			
			<!-- Main content -->
			<!-- /.content-wrapper -->
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">User</h3>

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
									<th>Mobile Number</th>
									<th>Name</th>
									<th>E-Mail Id</th>
									<th>Status</th>
									<th>User Type</th>
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
											<td><span class="label label-success"><%=rs.getString(4)%></span></td>
											<td><%=rs.getString(5)%></td>
											<td class="center">
												<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">
													<i class="glyphicon glyphicon-edit icon-white"></i> Edit
												</button>
												<a class="btn btn-danger"
												href="/admin/delete_city?city_id=${city.cityId}"> <i
												class="glyphicon glyphicon-trash icon-white"></i> Delete
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