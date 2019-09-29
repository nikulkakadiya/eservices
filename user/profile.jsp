<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
   <%@include file="head_tag.jsp"%>
</head>
<style type="text/css">
   .toppadding{
      padding-top: 150px;
      position:fixed; left:80px; top:20px;
   }
   .topaddress{
      padding-top: 50px;      
      position:absolute; right:100px; top:20px;
      width: 500px;
      
   }
   .ProfileImage{
    padding-top: 150px;
    padding-left: 200px;
     position:fixed;
   }
</style>
<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
   </div>

   <!--profile-->
    <div class="ProfileImage">
      <img src="images/profile.png" height="100px" width="100px">
    </div>
   <div class="toppadding">   
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3" id="exampleModal">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">My Profile :<%=session.getAttribute("userType")
                  %></h5>             
            </div>
            <div class="modal-body">
               <div class="register-form">
                  <form action="#" method="post">
                     <div class="fields-grid">
                        <div class="styled-input">                           
                           <input type="text" readonly="readonly" placeholder="Your  Name" name="username" value="<%=session.getAttribute("name")%>">
                        </div>                        
                        <div class="styled-input">
                           <input type="text" readonly="readonly" placeholder="Your Mobile Number" name="mobileno" value="<%=session.getAttribute("mobile")%>" required="">
                        </div>                        
                        <div class="styled-input">
                           <input type="email" readonly="readonly" placeholder="password" name="password" value="<%=session.getAttribute("email")%>" required="">
                        </div>                      
                        
                     </div>
                  </form>
               </div>
            </div>           
         </div>
      </div>
   </div>
</div>

<!----top Address-------------->

<%
  String userId=(String)session.getAttribute("mobile");   
  ps = con.prepareStatement("select line_1,line_2,pincode,city_id,a.name,c.name from address a inner join city c on a.city_id=c.id where a.user_id=?");
  ps.setString(1,userId);
%>

<div class="topaddress">
 <div class="container py-lg-5 py-md-4 py-sm-4 py-3" id="exampleModal">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">My Address :<%=session.getAttribute("userType")
            %></h5>
              <!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button> -->
            </div>
            <div class="modal-body">
               <div class="register-form">
                  <form>
                     <div class="fields-grid">  
                        <%
                        rs=ps.executeQuery();
                        if(rs.next())
                           {                            
                              %>      

                              <div class="form-group">
                                 <label for="inputAddress">Address 1</label>
                                 <input type="text" name="line_1" value="<%=rs.getString(1)%>" class="form-control" id="inputAddress" readonly="readonly">
                              </div>
                              <div class="form-group">
                                 <label for="inputAddress2">Address 2</label>
                                 <input type="text" value="<%=rs.getString(2)%>" class="form-control" id="inputAddress2" readonly="readonly">
                              </div>
                              <div class="form-group">
                                 <label for="inputState">City</label>
                                 <input type="text" value="<%=rs.getString(6)%>" class="form-control" id="inputAddress2" readonly="readonly">
                                
                                 </div>
                                 <div class="form-group">
                                    <label for="inputZip">Zip</label>
                                    <input type="text" value="<%=rs.getString(3)%>" class="form-control" id="inputZip" readonly="readonly">
                                 </div>
                                 <div class="form-group">
                                    <label for="inputZip">Name</label>
                                    <input type="text" value="<%=rs.getString(5)%>" class="form-control" id="inputZip" readonly="readonly">
                                 </div>
                                 <div class="col-sm-10">
                                    <button class="btn btn-primary"><a href="edit_address.jsp">Edit</a></button>
                                 </div><br>
                                 <%
                              } else {
                              %>
                              <div class="col-sm-10">
                                <button class="btn btn-primary"> <a href="add_address.jsp">Add</a></button>               
                             </div>  
                             <%
                            }
                              %>                               
                          </div>
                       </form>
                    </div>
                 </div>           
              </div>
           </div>
        </div>   
     </div>
  </body>
  </html>