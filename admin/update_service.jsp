<%@include file="check_login.jsp"%>
<%

String contentType = request.getContentType();
if (contentType!=null && (contentType.indexOf("multipart/form-data") >= 0)) {

	File file ;
	int maxFileSize = 5000 * 1024 * 1024;
	int maxMemSize = 5000 * 1024 * 1024;
	String imagePathToSave = "C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\eservices\\images\\";
	// Path to store in DB
	String imagePath = "http://localhost:8080/eservices/images/";

	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(maxMemSize);
	factory.setRepository(new File(imagePathToSave));
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax( maxFileSize );

	try{ 
		List fileItems = upload.parseRequest(request);
		Iterator itr = fileItems.iterator();
		String serviceId = null;
		String imageId = null;
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
		     		} else if("service_id".equals(fieldName)) {
		     			serviceId = fieldValue;
		     		} else if("image_id".equals(fieldName)) {
		     			imageId = fieldValue;
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

}%>