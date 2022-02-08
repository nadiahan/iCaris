<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Vehicle Form</title>
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
            String vehicleID = session.getAttribute("vehicleID").toString();
        %>
        <h1>Vehicle # <%= vehicleID %> </h1>
        <div class="addform">
        <div class="container">
            <form class="well form-horizontal" action="svlt6" method="post">
                <fieldset>
                    <!-- Form Name -->
                    <legend>Edit Vehicle Info</legend>
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
                            String sqlselect = "select * from vehicle where vehicleID=?";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
                            ps.setString(1, vehicleID);
                            ResultSet rs = ps.executeQuery();

                            while(rs.next()){
                                int year = LocalDate.now().getYear()- rs.getInt("age");
                    %>
                  
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Type (Car/Motorcycle)</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="type" value="<%= rs.getString("type")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Brand</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="brand" value="<%= rs.getString("brand")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>

                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Model</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="model" value="<%= rs.getString("model")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>

                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Registration No.</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="vehicleNo" value="<%= rs.getString("vehicleNo")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>

                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Colour</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="colour" value="<%= rs.getString("colour")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Number of seats</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="seats" value="<%= rs.getInt("seats")%>" class="form-control" type="text" required>
                            </div>
                        </div>
                    </div>

                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Model</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="transmission" value="<%= rs.getString("transmission")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>

                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Trunk Size/Capacity</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="trunkSize" value="<%= rs.getString("trunkSize")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Rent Price</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="price" value="<%= rs.getFloat("price")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>

                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Manufacture Year</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="year" value="<%= year %>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">RoadTax Expiry Date</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="rdTaxExpiry" value="<%= rs.getString("rdTaxExpiry")%>" class="form-control"  type="text" required>
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
                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-success" >Save</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        </div>
    </body>
</html>
