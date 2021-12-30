
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
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <h1>Customer List Page</h1>
        
        <div class="addsearch">
        <div class="searchinformation">
            <form class="searchinfo" action="svlt1" method="post">
                <div class="search">
                    <input name="searchinfo" type="text">
                    <button type="submit" class="submit">Search</button>
                </div>
                 </form>
        </div>
        
        <div class="addinformation">
            <form class="addinfo" action="svlt2" method="post">
                <button type="submit" class="add">Add new customer</button>
            </form>
        </div>
        </div>
        
        <div class="container">
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Full Address</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String driver = "com.mysql.jdbc.Driver";
                    String url = "jdbc:mysql://localhost:3306/";
                    String database = "rentalproject";
                    String userid = "root";
                    String password = "";
                        
                    try {
                        Class.forName(driver);
                        Connection conn = DriverManager.getConnection(url+database, userid, password);
                        String sqlselect = "select * from user where id > ?";
                        PreparedStatement ps = conn.prepareStatement(sqlselect);
                        ps.setInt(1, 1);
                            
                        ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                        %>
                            <tr>
                                <th scope="row"><%= rs.getString("id") %></th>
                                <td><%= rs.getString("name") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("phonenum") %></td>
                                <td><%= rs.getString("address") %></td>
                                <td><a href="viewCustomer.jsp?id=<%=rs.getString("id")%>"><i class="material-icons" style="font-size:24px">chevron_right</i></td>
                            </tr>
                <%
                        }
                    }
                    catch(Exception ex){
                        ex.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        </div>    
        
    </body>
</html>
