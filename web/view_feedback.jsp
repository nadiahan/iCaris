
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
        <title>Customer's Feedback</title>
        <link rel="stylesheet" href="admin.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            .view {
                width: 75%;
                height: 100%;
                background-color: transparent;
                margin: auto;
                border: solid;
                border-color: white;
                border-width: 2px;
                border-radius: 15px;
            }
            .info {
                padding: 20px;
            }
            .feedback {
                width: 100%;
                padding: 10px;
                background-color: white;
                border-radius: 15px;
            }
        </style>
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <%
            String vehicleID = session.getAttribute("vehicleID").toString();
        %>
        <h1>Reviews for Vehicle # <%= vehicleID %> </h1>
        <div class="view">
            <div class="info">
                <div class="container">
                    <table class="table table-light">
                        <thead>
                            <tr>
                                <th scope="col">BookingID</th>
                                <th scope="col">Stars</th>
                                <th scope="col">Comment</th>
                                <th scope="col">Reply</th>
                                <th scope="col"> </th>
                            </tr>
                        </thead>
                        <tbody>
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
                    String sqlselect = "select * from feedback where vehicleID=?";
                    PreparedStatement ps = conn.prepareStatement(sqlselect);
                    ps.setString(1, vehicleID);
                    ResultSet rs = ps.executeQuery();
                            
                    while(rs.next()){           
            %>
                    <tr>
                        <th scope="row"> <%=rs.getString("bookingID")%></th>
                        <td> <%= rs.getInt("stars") %> </td>
                        <td> <%= rs.getString("comment") %> </td>
                        <td> <%= rs.getString("reply") %> </td>
                        <th scope="row"> <a href="reply_feedback.jsp?feedbackID=<%=rs.getInt("feedbackID")%>"><i class="material-icons" style="font-size:24px; color:black;">chevron_right</i></th>
                    </tr>
            <%  
                    }
                }
                catch(Exception ex) {
                    ex.printStackTrace();
                }
            %>
            </div>
        </div>
    </body>
</html>
