<%@include file="connection.jsp"%>
<%
ps = con.prepareStatement("SELECT * FROM user ");

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

			<h1>nikul</h1>
			<table align="center" border="1">
				<tr>
					<th>Mobile-No</th>
					<th>Password</th>
					<th>Name</th>
					<th>E-mail-id</th>
					<th>Status-id</th>
					<th>User-type-id</th>
				</tr>
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
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(6)%></td>
							<!-- <td><a href="update.jsp?ed=<%=rs.getString(1)%>">Edit</a> -->
								
							</tr>
							<%
						}
						%>
					</table>
					<!-- Main content -->
					<!-- /.content-wrapper -->
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