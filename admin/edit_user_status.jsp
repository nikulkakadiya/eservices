<%@include file="check_login.jsp"%>


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
					Update Status <small></small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="home.jsp"><i class="fa fa-pencil-square-o"></i> Home</a></li>
					<li class="active">Update Status</li>
				</ol>
			</section>


			<!-- Main content -->
			<!-- /.content-wrapper -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title"></h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<%
					String mobileNo=request.getParameter("mobile_no");
				%>
				<form action="update_user_status.jsp" method="POST">
					<div class="box-body">
						<div class="form-group">
							<input type="hidden" class="form-control" name="mobileNo" placeholder="Id" value="<%=mobileNo%>">
						</div>

						<div class="form-group">
                            <select name="userStatus" required="">
                              <%
                              ps = con.prepareStatement("select * from user_status");
                              rs = ps.executeQuery();       
                              while(rs.next())
                                 {
                                    %>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                    <%
                                 }
                                 %>
                              </select>
                           </div>   
						
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button name="update_status" type="submit" class="btn btn-primary">Update</button>
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