
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Extension</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="admin.css">
        <style>
            .view {
                width: 50%;
                height: 100%;
                background-color: white;
                margin: 20px auto;
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
            String bookingID = session.getAttribute("bookingID").toString();
            String vehicleID = session.getAttribute("vehicleID").toString();
//            String pickupDate = session.getAttribute("pickupDate").toString();
//            String extendReturnDate = session.getAttribute("extendReturnDate").toString();
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
                        <p>Customer Name : <%= rs.getString("fname") %>  <%= rs.getString("lname") %> (<%= rs.getString("userID") %>)</p>
                        <p>Model Name : <%= rs.getString("model") %> </p>
                        <p>Return Date : <%= rs.getString("returnDate") %> </p>
                        <p>Return Time : <%= rs.getString("returnTime") %> </p>
                        <p>Return Location : <%= rs.getString("returnLocation") %> </p>
                        <p>Additional Price : RM <%= rs.getString("price") %> </p>
                        <p>Requested Extend Return Date  : <%= rs.getString("extendReturnDate") %> </p>
                        <p>Extension Status : <%= rs.getString("extendStatus") %> </p>
                        <p>Total Price : RM <%= rs.getString("totalPrice") %> </p>
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
                //session.setAttribute("vehicleID",session.getAttribute("vehicleID"));
                //session.setAttribute("pickupDate",session.getAttribute("pickupDate"));
                //session.setAttribute("extendReturnDate",session.getAttribute("extendReturnDate"));
            %>
            <div class="container">
                <form class="well form-horizontal">
                <fieldset>
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <!--<button type="button" name="edit" class="btn btn-info" onclick="window.location.href='view_availability.jsp'">Availability</button>-->
                            <button type="button" name="edit" class="btn btn-info"><a href="view_availability.jsp" target="blank">Availability</button>
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
