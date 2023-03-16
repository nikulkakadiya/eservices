<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
      
  try{
      String bookingId=request.getParameter("booking_id");
      if(bookingId != null){  
        ps = con.prepareStatement("select * from booking where id=?");
        ps.setString(1,bookingId);
        rs = ps.executeQuery();

        if(!rs.next()){ 
        response.sendRedirect("view_booking.jsp");
        }
      }
    }
    catch(Exception e){}
%>

<!DOCTYPE html>
<html lang="zxx">
<head>
  <%@include file="head_tag.jsp"%>
</head>
<style type="text/css">
  .dropdow
  {
    padding-top: 100px;
    padding-left: 200px; 
  }
</style>
<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
      <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">            
            <div class="row">               
               <div class="left-ads-display col-lg-9">
                <div align="center" class="dropdow">                  
                  <h1>change</h1>
                  <form action="update_booking.jsp">
                    <input type="hidden" class="form-control" name="booking_id" placeholder="Id" value="<%=rs.getString(1)%>">                 
                    <select name="booking_status">
                      <option value="1">Booked</option>
                      <option value="3">Cancel</option>
                    </select>
                    <button name="update_booking" type="submit" class="btn btn-primary">Update</button>
                  </form>
                </div>
                </div>
             </div>
          </div>
       </div>
    </section>    
 </div>      
</body>
</html>