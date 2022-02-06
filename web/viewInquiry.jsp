
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
        <title>View Inquiry</title>
        <link rel="stylesheet" href="admin.css">
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
            .inq {
                width: 100%;
                padding: 10px;
                background-color: white;
                border-radius: 15px;
            }
            .mess {
                width: 100%;
                margin-top: 10px;
                padding: 10px 25px;
                background-color: white;
                border-radius: 15px;
            }
            
            .custmess {
                width: 100%;
                margin-top: 10px;
                padding: 10px 25px;
                background-color: white;
                border-radius: 40px 40px 40px 0px;
            }
            
            .admess {
                width: 100%;
                margin-top: 10px;
                padding: 10px 25px;
                background-color: #2e5984;
                border-radius: 40px 40px 0px 40px;
                color : white;
                text-align: right;
            }
        </style>
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <%
            String inquiryID = request.getParameter("inquiryID");
        %>
        <h1>Inquiry # <%= inquiryID %></h1>
        
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
                    String sqlselect = "select * from inquiry, users where inquiryID=? and inquiry.userID=users.userID";
                    PreparedStatement ps = conn.prepareStatement(sqlselect);
                    ps.setString(1, inquiryID);
                    ResultSet rs = ps.executeQuery();
                            
                    while(rs.next()){           
            %>
                        <div class="inq">
                            <p> <%= rs.getString("date") %> </p>
                            <p><b>From : </b> <%= rs.getString("fname") %> <%= rs.getString("lname") %> <i><<%= rs.getString("email") %>></i> </p>
                            <p><b>Title :</b> <%= rs.getString("title") %> </p>
                        </div>
                        
                        <div class="mess"
                            <p> <%= rs.getString("message") %> </p>
                        </div>
            <%
                    }
       
                }
                catch(Exception ex) {
                    ex.printStackTrace();
                }
            %>
            
            <%
                try {
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
    
                    //prepared statement
                    String sqlselect = "select * from reply, users where inquiryID=? and reply.userID=users.userID";
                    PreparedStatement ps = conn.prepareStatement(sqlselect);
                    ps.setString(1, inquiryID);
                    ResultSet rs = ps.executeQuery();
                            
                    while(rs.next()){
                        String user = rs.getString("userType");
                        if (user.equals("customer"))
                        {
            %>
                        <div class="custmess"
                            <p> <%= rs.getString("message") %> </p>
                        </div>
            <%
                        }
                        else
                        {
            %>
                        <div class="admess"
                            <p> <%= rs.getString("message") %> </p>
                        </div>
            <%
                        }
                        
                    }
       
                }
                catch(Exception ex) {
                    ex.printStackTrace();
                }
            %>
            
            <%
                session.setAttribute("inquiryID",inquiryID);
            %>
            
            <div class="container">
                <form class="well form-horizontal">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-md-4 control-label"></label>
                            <div class="col-md-4">
                                <button type="button" name="reply" class="btn btn-success" onclick="window.location.href='reply_inquiry_form.jsp'">Reply</button>
                                <button type="button" name="delete" class="btn btn-danger" onclick="window.location.href='delete_inquiry.jsp'">Delete</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        </div>
            
    </body>
</html>
