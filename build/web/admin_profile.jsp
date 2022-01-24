
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Profile</title>
        <link rel="stylesheet" href="admin.css">
        <link rel="stylesheet" href="customer/profile.css">
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        
        <% 
            String name=(String)session.getAttribute("fname");
            String _email=(String)session.getAttribute("name");
            String _userid = (String)session.getAttribute("userID");
            String _fname =(String)session.getAttribute("fname");
            String _lname =(String)session.getAttribute("lname");
            String _password =(String)session.getAttribute("password");
            String _nric =(String)session.getAttribute("nric");
            String _driveclass =(String)session.getAttribute("driveclass");
            String _phone =(String)session.getAttribute("phone");
            String _address =(String)session.getAttribute("address");
        %> 
        
        <div class="container">
            <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
            <div class="card h-100">
                    <div class="card-body">
                            <div class="account-settings">
                                    <div class="user-profile">
                                            
                                            <h5 class="user-name"><% out.print(_fname + " " + _lname);   %></h5>
                                            <h6 class="user-email"><% out.print(_email);   %></h6>
                                            <div class="user-avatar">
                                                    <img src="https://merriam-webster.com/assets/mw/images/article/art-wap-article-main/egg-3442-e1f6463624338504cd021bf23aef8441@1x.jpg" alt="Maxwell Admin">
                                            </div>
                                    </div>
                                    <div class="about">
                                            <h5>About</h5>
                                            <p>I'm <% out.print(_fname + " " + _lname); %>.</p>
                                    </div>
                            </div>
                    </div>
            </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
            <div class="card h-100">
                    <div class="card-body">
                            <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-2 text-primary">Personal Details <b><i>(User ID: <% out.print(_userid);%>)</i></b></h6>
                                            
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                    <label for="fullName">First Name</label>
                                                    <input type="text" class="form-control" id="fullName" value=<% out.print(_fname);%>>
                                            </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                    <label for="fullName">Last Name</label>
                                                    <input type="text" class="form-control" id="fullName" value=<% out.print(_lname);%>>
                                            </div>
                                            
                                    </div>
                                            
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                    <label for="phone">Email</label>
                                                    <input type="text" class="form-control" id="phone" value=<% out.print(_email);%> disabled>
                                            </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                    <label for="phone">Phone Number</label>
                                                    <input type="text" class="form-control" id="phone" value=<% out.print(_phone);%>>
                                            </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                    <label for="password">Password</label>
                                                     
                                                     <i class="bi bi-eye-slash" id="togglePassword"></i>
                                                     <input type="password" name="password" id="password" class = "form-control" value=<% out.print(_password);%> />
                                            </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                    <label for="Address">Address</label>
                                                    <input type="name" class="form-control" id="address" value=<% out.print(_address);%>>
                                            </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                    <label for="NRIC">IC Number</label>
                                                    <input type="text" class="form-control" id="nric" value=<% out.print(_nric);%>>
                                            </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                    <label for="driveclass">Driving Class</label>
                                                    <input type="text" class="form-control" id="driveclass" value=<% out.print(_driveclass);%>>
                                            </div>
                                    </div>
                            </div>
                        <br>
                            <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="text-right">
                                                    <button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
                                                    <button type="button" id="submit" name="submit" class="btn btn-primary">Update</button>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </div>
            </div>
            </div>
         </div>
          <script>
            const togglePassword = document.querySelector("#togglePassword");
            const password = document.querySelector("#password");

            togglePassword.addEventListener("click", function () {
                // toggle the type attribute
                const type = password.getAttribute("type") === "password" ? "text" : "password";
                password.setAttribute("type", type);

                // toggle the icon
                this.classList.toggle("bi-eye");
            });

            // prevent form submit
            const form = document.querySelector("form");
            form.addEventListener('submit', function (e) {
                e.preventDefault();
            });
        </script>

                           
    </body>
</html>
