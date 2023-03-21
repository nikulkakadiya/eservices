<%@include file="connection.jsp"%>
<%

String login = request.getParameter("login");
boolean isCorrectLogin = true;
boolean isCorrectBlock = true;
String status="1";


if(login!=null)
   {


      String mobileno = request.getParameter("mobileno").toString();
      String password = request.getParameter("password");
      String userTypeId = request.getParameter("usertype");

      

      ps = con.prepareStatement("select mobile_no, name, email_id, type, status_id from user u inner join user_type ut on u.user_type_id = ut.id where password = ? && mobile_no = ? && user_type_id=?");

      ps.setString(1,password);
      ps.setString(2,mobileno);
      ps.setString(3,userTypeId);
      
      rs = ps.executeQuery();
      if(rs.next())
      {
         if(status.equals(rs.getString(5))){

            session.setAttribute("name",rs.getString(2));
            session.setAttribute("mobile",rs.getString(1));
            session.setAttribute("email",rs.getString(3));
            session.setAttribute("userType",rs.getString(4));

            if(session.getAttribute("userType").equals("Service Provider"))
               response.sendRedirect("profile.jsp");            
            else
               response.sendRedirect("service.jsp");
         }else{
            isCorrectBlock = false;
         }
      }
      else
      {
         isCorrectLogin = false;
      }
       
   }  
      
   %>

<!DOCTYPE html>
<html lang="zxx">
<head>
   <%@include file="head_tag.jsp"%>
</head>
<style type="text/css">
   .toppadding{
      padding-top: 80px;
   }
</style>

<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
   </div>  
   

   <!--Login-->
   <div class="toppadding">            
   <div class="container py-lg-5 py-md-4 py-sm-4 py-3" id="exampleModal">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <%
               if (!isCorrectBlock) {                  
            %>
               <div class="alert alert-info alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info"></i> Alert!</h4>
                Username is blocked.
              </div>
            <% 
               }
            %>
            <%
               if (!isCorrectLogin) {                  
            %>
               <div class="alert alert-info alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info"></i> Alert!</h4>
                Username or password are invalid.
              </div>
            <% 
               }
            %>
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">Login</h5>
             
            </div>
            <div class="modal-body">
               <div class="register-form">
                  <form action="" method="post">
                     <div class="fields-grid">
                        <div class="styled-input">
                           <input type="text" placeholder="Your Mobile Number" name="mobileno" required minlength="10" maxlength="10">
                        </div>                        
                        <div class="styled-input">
                           <input type="password" placeholder="password" name="password" required>
                        </div>
                        <div class="form-group">
                            <select name = "usertype" required="">
                              <%
                              ps = con.prepareStatement("select * from user_type where id !=1");
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
                        <button name="login" type="submit" class="btn subscrib-btnn">Login</button>
                     </div>
                  </form>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" ata-dismiss="modal"><a href="register.jsp">Register</a></button>
            </div>
         </div>
      </div>
   </div>
   </div>   
</body>
</html>