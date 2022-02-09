
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Booking Form</title>
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
            String bookingID = session.getAttribute("bookingID").toString();
            
        %>
        <h1>Booking # <%= bookingID %> </h1>
        
        <div class="addform">
        <div class="container">
            <form class="well form-horizontal" action="svlt1" method="post">
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
                            String sqlselect = "select * from booking where bookingID=?";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
                            ps.setString(1, bookingID);
                            ResultSet rs = ps.executeQuery();

                            while(rs.next()){
                    %>
                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Pickup Date</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="pickupDate" value="<%= rs.getString("pickupDate")%>" class="form-control"  type="date" readonly>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Return Date</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="returnDate" value="<%= rs.getString("returnDate")%>" class="form-control"  type="date" readonly>
                            </div>
                        </div>
                    </div>  
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Pickup Time</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="pickupTime" value="<%= rs.getString("pickupTime")%>" class="form-control"  type="time" required>
                            </div>
                        </div>
                    </div>        
                            
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Return Time</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="returnTime" value="<%= rs.getString("returnTime")%>" class="form-control"  type="time" required>
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Pickup Location</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="pickupLocation" value="<%= rs.getString("pickupLocation")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>        
                            
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Return Location</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="returnLocation" value="<%= rs.getString("returnLocation")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Booking Status</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="status" value="<%= rs.getString("status")%>" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>   
                            
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Total Price</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="totalPrice" value="<%= rs.getInt("totalPrice")%>" class="form-control"  type="text" required>
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
