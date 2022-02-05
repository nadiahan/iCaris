
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Profile</title>
        <link rel="stylesheet" href="admin.css">
        <link rel="stylesheet" href="customer/profile.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"> 
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        
        <% 
            String name = (String) session.getAttribute("fname");
            String _email = (String) session.getAttribute("name");
            String _userid = (String) session.getAttribute("userID");
            String _fname = (String) session.getAttribute("fname");
            String _lname = (String) session.getAttribute("lname");
            String _password = (String) session.getAttribute("password");
            String _nric = (String) session.getAttribute("nric");
            String _driveclass = (String) session.getAttribute("driveclass");
            String _phone = (String) session.getAttribute("phone");
            String _address = (String) session.getAttribute("address");
            
            String count = (String)(session.getAttribute("count").toString());
        %> 
        
        <script type="text/javascript">
            $(document).ready(function(){
                if (<%=count%>>0)
            $("#myModal").modal('show');
            });
        </script>
        
        <!-- Modal HTML -->
        <div id="myModal" class="modal fade">
                <div class="modal-dialog modal-confirm">
                        <div class="modal-content">
                                <div class="modal-header">
                                        <div class="icon-box">
                                                <i class="material-icons">&#xE876;</i>
                                        </div>				
                                        <h4 class="modal-title w-100">Awesome!</h4>	
                                </div>
                                <div class="modal-body">
                                        <p class="text-center">Your profile has updated. Click "OK" to confirm.</p>
                                </div>
                                <div class="modal-footer">
                                        <button class="btn btn-success btn-block" onClick="refreshPage()" data-dismiss="modal">OK</button>
                                </div>
                        </div>
                </div>
        </div>
        <%
                        Connection conn= null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;
                        
                        String driver = "com.mysql.jdbc.Driver";
                        String url = "jdbc:mysql://localhost:3306/";
                        String database = "rentalproject";
                        String userid = "root";
                        String password = "";
                        String userID = (String) session.getAttribute("userID");
                        
                        
                        String sqlselect = "select*from users where userID = '"+userID+"'" ;

                        try{
                            Class.forName(driver);
                            conn = DriverManager.getConnection(url+database,userid,password);
                            ps = conn.prepareStatement(sqlselect);
                            rs = ps.executeQuery();

                            if(rs.next()){ 
                                _userid = rs.getString ("userID");
                                _fname = rs.getString ("fname");
                                _lname = rs.getString ("lname");
                                _password = rs.getString ("password");
                                _nric = rs.getString ("nric");
                                _driveclass = rs.getString ("driveclass");
                                _phone = rs.getString ("phone");
                                _address = rs.getString ("address");

                                    session.setAttribute("name",_email);
                                    session.setAttribute("fname",_fname);
                                    session.setAttribute("lname",_lname);
                                    session.setAttribute("userID",_userid);
                                    session.setAttribute("password",_password);
                                    session.setAttribute("nric",_nric);
                                    session.setAttribute("driveclass",_driveclass);
                                    session.setAttribute("phone",_phone);
                                    session.setAttribute("address",_address);
                          
                                conn.close();
                                log(sqlselect);
                            }
                        }catch(Exception ex)
                        {
                            ex.printStackTrace();
                        }                 
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
                                    <p>I'm <% out.print(_fname + " " + _lname); %>. Full time UTM Degree Student, delightful and animal and human experiences.</p>
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
                                        <input type="text" name="fname" class="form-control" id="fname" value="<% out.print(_fname);%>">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">Last Name</label>
                                        <input type="text" class="form-control" id="lname" value="<% out.print(_lname);%>">
                                    </div>

                                </div>

                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Email</label>
                                        <input type="text" class="form-control" id="email" value="<% out.print(_email);%>" disabled>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Phone Number</label>
                                        <input type="text" class="form-control" id="phone" value="<% out.print(_phone);%>">
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
                                        <input type="text" class="form-control" id="address" value="<% out.print(_address );%>">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="NRIC">IC Number</label>
                                        <input type="text" class="form-control" id="nric" value="<% out.print(_nric);%>">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="driveclass">Driving Class</label>
                                        <input type="text" class="form-control" id="driveclass" value="<% out.print(_driveclass);%>">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="text-right">
                                        <button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
                                        <a class="btn btn-primary" href="javascript:;" 
                                           onclick = "this.href='UpdateProfile?id=<%=_userid%>&fname=' + document.getElementById('fname').value + 
                                                       '&lname='+ document.getElementById('lname').value + 
                                                       '&phone='+ document.getElementById('phone').value +
                                                       '&address='+ document.getElementById('address').value + 
                                                       '&nric='+ document.getElementById('nric').value +
                                                       '&driveclass='+ document.getElementById('driveclass').value + 
                                                       '&password='+ document.getElementById('password').value " role="button">Update</a>
<!--                                        <a class="btn btn-primary" href="UpdateProfile?id" role="button">Update</a>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%  
    session.setAttribute("count", 0); 
%>        
          <script>    
            function refreshPage(){
                window.location.reload();
            } 
            
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
