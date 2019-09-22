 <nav class="navbar navbar-expand-lg navbar-light">
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
   </button>
   <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
      <ul class="navbar-nav ">
         <li class="nav-item active">
            <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
         </li>
         <li class="nav-item">
            <a href="about.jsp" class="nav-link">About</a>
         </li>
         <li class="nav-item">
            <a href="service.jsp" class="nav-link">Service</a>
         </li>

         <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               Account
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
               <%
         if(session.getAttribute("name")!=null)
            {
               %>
                  <a href="profile.jsp" class="nav-link">Profile</a>
                  <a href="view_booking.jsp" class="nav-link">View Booking</a>
                  <%
                  if(session.getAttribute("userType").equals("Service Provider"))
                     {
                  %>
                  <a href="add_service_skill.jsp" class="nav-link">Add Skill</a>
                  <a href="view_skill.jsp" class="nav-link">view skill</a>
                  <%}%>
                  <a href="logout.jsp" class="nav-link">Log-Out</a>
               <%
            }
            else
               {
                  %>
                     <a href="login.jsp" class="nav-link">Log-in</a>
                  <%
               }
               %>
            </div>
         </li>

        
            </ul>
         </div>
      </nav>
