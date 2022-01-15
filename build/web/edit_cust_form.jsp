<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customer Form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="admin.css">
        <style>
            .addform {
                width: 75%;
                height: 100%;
                background-color: white;
                margin: auto;
                border-radius: 15px;
            }
        </style>
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <%
            String userID = session.getAttribute("userID").toString();
            
        %>
        <div class="addform col-md-5">
        <div class="container center">
            <form class="well form-horizontal" action="svlt9" method="post">
                <fieldset>
                     <!--Form Name--> 
                    <legend style='text-align:center'>Edit Customer Info</legend>
                    <%
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "rentalproject";
                        String userid = "root";
                        String password = "";

                        try {
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);

                            //prepared statement
                            String sqlselect = "select * from users where userID=?";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
                            ps.setString(1, userID);
                            ResultSet rs = ps.executeQuery();

                            while(rs.next()){
                                //int year = LocalDate.now().getYear()- rs.getInt("age");
                    %>
                    <h2 style='text-align:center'>UserID # <%= userID %></h2>
                    <hr class="mb-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label" >First Name</label> 
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="fname" value="<%= rs.getString("fname")%>" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Last Name</label> 
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="lname" value="<%= rs.getString("lname")%>" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label">Email</label>
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="email" value="<%= rs.getString("email")%>" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-group">
                        <label class="col-md-4 control-label">Password</label>  
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="password" value="<%= rs.getString("password")%>" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" >Phone Number</label> 
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="phone" value="<%= rs.getString("phone")%>" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-group">
                        <label class="col-md-4 control-label">Drive Class : </label>
                        <div class="col-md-12 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="driveclass" value="<%= rs.getString("driveclass")%>" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" >Address</label> 
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="address" value="<%= rs.getString("address")%>" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label">IC/Passport No</label>  
                        <div class="col-md-10 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="nric" value="<%= rs.getString("nric")%>" class="form-control" type="text">
                            </div>
                        </div>
                    </div>

                    <%
                            }
                        }
                        catch(Exception ex) {
                            ex.printStackTrace();
                        }
                    %> 
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-10">
                            <button type="submit" class="btn btn-success" >Save</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        </div>
    </body>
</html>
