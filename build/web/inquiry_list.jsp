

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
        <title>JSP Page</title>
        <link rel="stylesheet" href="admin.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <h1>Inquiry List Page</h1>
        
<!--        <div class="addsearch">
        <div class="searchinformation">
            <form class="searchinfo" action="svlt1" method="post">
                <div class="search">
                    <input name="searchinfo" type="text">
                    <button type="submit" class="submit">Search</button>
                </div>
                 </form>
        </div>
        
        </div> -->
        
        <div class="container">
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Customer ID</th>
                    <th scope="col">Title</th>
                    <th scope="col">Date</th>
                    <th scope="col">Status</th>
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
                            String sqlselect = "select * from inquiry";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
   
                            ResultSet rs = ps.executeQuery();
                            
                            while(rs.next()){
                                
                            %>    
                    <tr>
                        <th scope="row"> <%=rs.getString("inquiryID")%></th>
                        <td> <%= rs.getString("userID") %> </td>
                        <td> <%= rs.getString("title") %> </td>
                        <td> <%= rs.getString("date") %> </td>
                        <td> <%= rs.getString("status") %> </td>
                        <th scope="row"> <a href="viewInquiry.jsp?inquiryID=<%=rs.getString("inquiryID")%>"><i class="material-icons" style="font-size:24px">chevron_right</i></th>
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
