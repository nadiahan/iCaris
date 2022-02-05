
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
        <title>View Booking Information</title>
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
            String bookingID = request.getParameter("bookingID");
            String vehicleID = request.getParameter("vehicleID");
            //String pickupDate = request.getParameter("pickupDate");
            //String extendReturnDate = request.getParameter("extendReturnDate");
        %>
        <h1>Booking #<%= bookingID %></h1>
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
                    String sqlselect = "select * from booking, users, vehicle where bookingID=? and booking.userID=users.userID and booking.vehicleID=vehicle.vehicleID";
                    PreparedStatement ps = conn.prepareStatement(sqlselect);
                    ps.setString(1, bookingID);
                    ResultSet rs = ps.executeQuery();
                            
                    while(rs.next()){
                                
            %>
                        <p><i><b>Customer's Info</b></i></p>
                        <p>Customer Name : <%= rs.getString("fname") %>  <%= rs.getString("lname") %> (<%= rs.getString("userID") %>)</p>
                        <p>Email : <%= rs.getString("email") %> </p>
                        <p>Phone Number : <%= rs.getString("phone") %> </p>
                        <hr>
                        <p><i><b>Rented Vehicle Info</b></i></p>
                        <p>Vehicle Name : <%= rs.getString("brand") %> <%= rs.getString("model") %> </p>
                        <p>Vehicle's No. : <%= rs.getString("vehicleNo") %> </p>
                        <hr>
                        <p><i><b>Pickup / Return Info</b></i></p>
                        <p>Pickup Date : <%= rs.getString("pickupDate") %> </p>
                        <p>Pickup Time : <%= rs.getString("pickupTime") %> </p>
                        <p>Return Date : <%= rs.getString("returnDate") %> </p>
                        <p>Return Time : <%= rs.getString("returnTime") %> </p>
                        <p>Pickup Location : <%= rs.getString("pickupLocation") %> </p>
                        <p>Return Location : <%= rs.getString("returnLocation") %> </p>
                        <hr>
                        <p><i><b>Booking Extension Info</b></i></p>
                        <p>Requested Extend Return Date  : <%= rs.getString("extendReturnDate") %> </p>
                        <p>Extension Status : <%= rs.getString("extendStatus") %> </p>
                        
                        <div class="container">
                            <form class="well form-horizontal">
                                <fieldset>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label"></label>
                                        <div class="col-md-4">
                                            <button type="button" name="edit" class="btn btn-info" onclick="window.location.href='view_extension.jsp'">View Extension Details</button>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        
                        <hr>
                        <p><i><b>Total Price</b></i></p>
                        <p>Total Rental : RM <%= rs.getFloat("totalPrice") %> </p>
                        <p>Late Return Fee : RM <%= rs.getFloat("extraFee") %> </p>
                        <%
                            float totall = rs.getFloat("totalPrice") + rs.getFloat("extraFee"); 
                        %>
                        <p><b>Total : RM <%= totall %> </b></p>
            <%
                    }
       
                }
                catch(Exception ex) {
                    ex.printStackTrace();
                }
            %>
            <%
                session.setAttribute("bookingID",bookingID);
                session.setAttribute("vehicleID",vehicleID);
                //session.setAttribute("pickupDate",pickupDate);
                //session.setAttribute("extendReturnDate",extendReturnDate);
            %>
            <div class="container">
                <form class="well form-horizontal">
                <fieldset>
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="button" name="edit" class="btn btn-primary" onclick="window.location.href='return_vehicle.jsp'">Return Vehicle</button>
                            <button type="button" name="edit" class="btn btn-success" onclick="window.location.href='edit_booking_form.jsp'">Update</button>
                            <button type="button" name="delete" class="btn btn-danger" onclick="window.location.href='delete_booking.jsp'">Delete</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        </div>
        </div>
    </body>
</html>
