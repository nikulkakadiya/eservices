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
               <a class="nav-link" href="product.html">Profile</a>
               <a class="nav-link " href="product.html">Login</a>
               <a class="nav-link " href="product.html">Log-out</a>
            </div>
         </li>

         <%
         if(session.getAttribute("name")!=null)
            {
               %>
               <li class="nav-item">
                  <a href="contact.jsp" class="nav-link">Profile</a>
               </li>
               <li class="nav-item">
                  <a href="logout.jsp" class="nav-link">Log-Out</a>
               </li>
               <%
            }
            else
               {
                  %>
                  <li class="nav-item">
                     <a href="login.jsp" class="nav-link">Log-in</a>
                  </li>
                  <%
               }
               %>
            </ul>
         </div>
      </nav>
