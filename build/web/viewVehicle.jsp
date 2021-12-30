<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <title>View Vehicle Info</title>
        <link rel="stylesheet" href="admin.css">
        <style>
            .view {
                width: 75%;
                height: 100%;
                background-color: white;
                margin: auto;
                border-radius: 15px;
            }
            .info {
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <%
            String vehicleID = request.getParameter("vehicleID");
            //String vehicleID = session.getAttribute("vehicleID").toString();
            
        %>
        <h1>Vehicle # <%= vehicleID %></h1>
        
        <div class="view">
            <div class="info">
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
                                
            %>
                        <p>Vehicle Type : <%= rs.getString("type") %> </p>
                        <p>Brand : <%= rs.getString("brand") %> </p>
                        <p>Model Name : <%= rs.getString("model") %> </p>
                        <p>Registration No. : <%= rs.getString("vehicleNo") %> </p>
                        <p>Colour : <%= rs.getString("colour") %> </p>
                        <p>Number of seats : <%= rs.getString("seats") %> </p>
                        <p>Transmission type : <%= rs.getString("transmission") %> </p>
                        <p>Trunk size : <%= rs.getString("trunkSize") %> </p>
                        <p>Rental price : RM <%= rs.getString("price") %> </p>
                        <p>Age : <%= rs.getString("age") %> </p>
                        <p>Road Tax expiry date : <%= rs.getString("rdTaxExpiry") %> </p>
            <%
                    }
       
                }
                catch(Exception ex) {
                    ex.printStackTrace();
                }
            %>
            <%
                session.setAttribute("vehicleID",vehicleID);
            %>
            <div class="container">
                <form class="well form-horizontal">
                <fieldset>
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="button" name="edit" class="btn btn-success" onclick="window.location.href='edit_vehicle_form.jsp'">Edit Info</button>
                            <button type="button" name="delete" class="btn btn-danger" onclick="window.location.href='delete_vehicle.jsp'">Delete</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        </div>
        </div>
    </body>
</html>
