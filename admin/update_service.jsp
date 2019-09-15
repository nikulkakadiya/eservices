<%@include file="check_login.jsp"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@include file="path.jsp"%>
<%

String contentType = request.getContentType();
if (contentType!=null && (contentType.indexOf("multipart/form-data") >= 0)) {

	File file ;
	int maxFileSize = 5000 * 1024 * 1024;
	int maxMemSize = 5000 * 1024 * 1024;
	
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
					out.println("Image: " + fileName);
					if(imageName == null || imageName.length() == 0) {
						continue;
					}

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

		// updating image
		if(imageName != null && imageName.length() > 0) {
			 ps =con.prepareStatement("update image set path=? where id=?");
			      ps.setString(1,imagePath+imageName);
			      ps.setString(2,imageId);

			      ps.executeUpdate();

		}

		// updating service
		 ps =con.prepareStatement("update service set name=?,description=? where id=?");
		      ps.setString(1,serviceName);
		      ps.setString(2,description);
		      ps.setString(3,serviceId);

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