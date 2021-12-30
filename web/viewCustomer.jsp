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
            String userID = request.getParameter("id");
            //String vehicleID = session.getAttribute("vehicleID").toString();
            
        %>
        
        <div class="view">
            <div class="info">
            <%
                String driver = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/";
                String database = "icaris";
                String userid = "root";
                String password = "";
                        
                try {
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                           
                    //prepared statement
                    String sqlselect = "select * from user where id=?";
                    PreparedStatement ps = conn.prepareStatement(sqlselect);
                    ps.setString(1, userID);
                    ResultSet rs = ps.executeQuery();
                            
                    while(rs.next()){
                                 
            %>
                        <h2 style='text-align:center'>UserID # <%= userID %></h2>
                        <hr class="mb-6">
                        <p>Full Name : <%= rs.getString("name") %> </p>
                        <p>Email : <%= rs.getString("email") %> </p>
                        <p>Phone Number : <%= rs.getString("phonenum") %> </p>
                        <p>Password : <%= rs.getString("password") %> </p>
                        <p>Address : <%= rs.getString("address") %> </p>
                        <p>IC : <%= rs.getString("ic") %> </p>
            <%
                    }
       
                }
                catch(Exception ex) {
                    ex.printStackTrace();
                }
            %>
            <%
                session.setAttribute("userID",userID);
            %>
            <div class="container">
                <form class="well form-horizontal">
                <fieldset>
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="button" name="edit" class="btn btn-success" onclick="window.location.href='edit_cust_form.jsp'">Edit Info</button>
                            <button type="button" name="delete" class="btn btn-danger" onclick="window.location.href='delete_cust.jsp'">Delete</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        </div>
        </div>
    </body>
</html>
