
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
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
        <title>Vehicles List</title>
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <h1>Vehicles List</h1>
        
        <div class="addsearch">
        <div class="searchinformation">
            <form class="searchinfo" action="search_vehicle.jsp" method="post">
                <div class="search">
                    <input name="searchinfo" type="text">
                    <button type="submit" class="submit">Search</button>
                </div>
                 </form>
        </div>
        
        <div class="addinformation">
            <form class="addinfo" action="svlt4" method="post">
                <button type="submit" class="add">Add new vehicle</button>
            </form>
        </div>
        </div>
        
        <div class="container">
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Brand</th>
                    <th scope="col">Vehicle Model</th>
                    <th scope="col">Registration No</th>
                    <th scope="col">Transmission</th>
                    <th scope="col">Price (RM)</th>
                    <th scope="col">RoadTax Expiry Date</th>
                    <th scope="col">View</th>
                </tr>
            </thead>
        
            <tbody>
                    <%
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "rentalproject";
                        String userid = "root";
                        String password = "";
                        String searchStr = request.getParameter("searchinfo");
                     
                        try {
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                           
                            //prepared statement
                            String sqlselect = "select * from vehicle where brand=? or model=? or vehicleNo=? or transmission=?";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
                            ps.setString(1, searchStr);
                            ps.setString(2, searchStr);
                            ps.setString(3, searchStr);
                            ps.setString(4, searchStr);
                           
                            ResultSet rs = ps.executeQuery();
                            
                            while(rs.next()){
                                
                            %>    
                    <tr>
                        <th scope="row"> <%=rs.getString("vehicleID")%></th>
                        <td> <%= rs.getString("brand") %> </td>
                        <td> <%= rs.getString("model") %> </td>
                        <td> <%= rs.getString("vehicleNo") %> </td>
                        <td> <%= rs.getString("transmission") %> </td>
                        <td> <%= rs.getInt("price") %> </td>
                        <td> <%= rs.getString("rdTaxExpiry") %> </td>
                        <th scope="row"> <a href="viewVehicle.jsp?vehicleID=<%=rs.getString("vehicleID")%>"> > </th>
                    </tr>
                            <%
                            }
       
                        }
                        catch(Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
                   
                </tbody>
        </table>
        </div>    
        
    </body>
</html>
