<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@include file="check_login.jsp"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%

File file ;
int maxFileSize = 5000 * 1024 * 1024;
int maxMemSize = 5000 * 1024 * 1024;
String imagePathToSave = "C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\eservices\\images\\";
// Path to store in DB
String imagePath = "http://localhost:8080/eservices/images";

String contentType = request.getContentType();
if (contentType!=null && (contentType.indexOf("multipart/form-data") >= 0)) {

	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(maxMemSize);
	factory.setRepository(new File(imagePathToSave));
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax( maxFileSize );
	
	try{ 
		List fileItems = upload.parseRequest(request);
		Iterator itr = fileItems.iterator();
		String serviceId = UUID.randomUUID().toString();
		String imageId = UUID.randomUUID().toString();
		String imageName = null;
		String serviceName = null;
		String description = null;

			while ( itr.hasNext () ) 
			{
				FileItem fi = (FileItem)itr.next();
				
				if ( !fi.isFormField () )  {
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					imageName = fileName;

					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					file = new File( imagePathToSave + fileName) ;
					fi.write( file ) ;
					
				} else {
					String fieldName = fi.getFieldName();
		     		String fieldValue = fi.getString();

		     		if("service_name".equals(fieldName)) {
		     			serviceName = fieldValue;
		     		} else if("description".equals(fieldName)) {
		     			description = fieldValue;
		     		}
		     	}
			}

		// inserting image
		 ps =con.prepareStatement("insert into image(id, path) values(?,?)");
		      ps.setString(1,imageId);
		      ps.setString(2,imagePath+imageName);

		      ps.executeUpdate();

		// Inserting service
		 ps =con.prepareStatement("insert into service(id, name, image_id, description) values(?,?,?,?)");
		      ps.setString(1,serviceId);
		      ps.setString(2,serviceName);
		      ps.setString(3,imageId);
		      ps.setString(4,description);

		      int result = ps.executeUpdate();
		      
		      if(result == 1)
		      {
		         response.sendRedirect("view_service.jsp");
		      }
		      else
		      {
		        out.println("<script>alert('Record Not Add')</script>");
		      }
	}catch(Exception ex) {
		System.out.println(ex);
	}

}  %>



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
  				<form action="add_services.jsp" method="POST" enctype="multipart/form-data">
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
  						<button name = "add_service" type="submit" class="btn btn-primary">Submit</button>
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