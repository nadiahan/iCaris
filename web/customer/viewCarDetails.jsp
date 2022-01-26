<%-- 
    Document   : carDetails
    Created on : Jan 25, 2022, 4:03:00 PM
    Author     : Asus
--%>
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
        <link rel="stylesheet" href="bookCar.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />   
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="customerHeader.jsp" %>
     <div class="container mt-5 mb-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-10">
                <%
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "rentalproject";
                        String userid = "root";
                        String password = "";
                        
                        String id = request.getParameter("id");
                        //int i=Integer.parseInt(request.getParameter("id"));
                        
                        
                        try {
                            //int i=request.Integer.parseInt(request.getParameter("id"));  
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                           
                            //prepared statement
                             
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
   
                            ResultSet rs = ps.executeQuery();
                            
                            //if vehicle id == 
                            //rs.getString ("vehicleID");
                            while(rs.next()){
                                
                            %>    
<!--                <div class="row p-2 bg-white border rounded mt-2">
                    <div class="col-md-3 mt-1">
                        <img class="img-fluid img-responsive rounded product-image"  src = "../view_image.jsp?vehicleID=<%=rs.getString("vehicleID")%>"></div>
                    <div class="col-md-6 mt-1">
                        <h5><%= rs.getString("brand")%><%out.print(" ");%><%= rs.getString("model")%> </h5>
                        <div class="d-flex flex-row">
                            <div class="ratings mr-2">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <span><%=rs.getString("transmission")%></span>
                        </div>
                        <div class="mt-1 mb-1 spec-1">
                            <span><%= rs.getString("seats") %>&nbsp;seater</span>
                            <span class="dot"></span>
                        </div>
                    </div>
                    <div class="align-items-center align-content-center col-md-3 border-left mt-1">
                        <div class="d-flex flex-row align-items-center">
                            <h4 class="mr-1">RM<%=rs.getString("price")%>/day</h4>
                        </div>
                        <h6 class="text-success">Including Tax</h6>
                        <div class="d-flex flex-column mt-4">
                            <a class="btn btn-primary" href="../view_image.jsp?vehicleID=<%=rs.getString("vehicleID")%>" role="button" style="margin: 5px;">Book</a>
                            <a class="btn btn-outline-secondary" href="#" role="button" style="margin: 5px;">View Details</a>
                        </div>
                    </div>
                </div>-->
                


            </div>
        </div>
        </div>
                    
       <div class="container d-flex justify-content-center">
           
            <figure class="card card-product-grid card-lg"> <a href="#" class="img-wrap" data-abc="true"> <span onclick="history.back()" class="close">&times;</span><img src = "../view_image.jsp?vehicleID=<%=rs.getString("vehicleID")%>""> </a>
                <figcaption class="info-wrap">
                    <div class="row">
                        <div class="col-md-9 col-xs-9"> <a href="#" class="title" data-abc="true"><%= rs.getString("brand")%><%out.print(" ");%><%= rs.getString("model")%></a> <span class="rated"><%=rs.getString("transmission")%> Transmission</span> </div>
                        <div class="col-md-3 col-xs-3">
                            <div class="rating text-right"> 
                                <i class="fa fa-star"></i> 
                                <i class="fa fa-star"></i> 
                                <i class="fa fa-star"></i> 
                                <i class="fa fa-star"></i> 
                                <span class="rated">Rated 4.0/5</span>
                            </div>
                        </div>
                    </div>
                </figcaption>
                <div class="bottom-wrap-payment">
                    <figcaption class="info-wrap">
                        <div class="row">
                            <div class="col-md-9 col-xs-9"> <a href="#" class="title" data-abc="true">Total</a> 
                                <span class="rated">2 days rental</span><br>
                                <span class="rated">Service Tax</span><br>
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <div class="rating text-right"> RM300.00</div>
                                <span class="rated">RM282.00</span><br>
                                <span class="rated">RM18.00</span><br>
                            </div>
                           
                        </div>
                    </figcaption>
                </div>
                <div class="bottom-wrap-payment">
                    <figcaption class="info-wrap">
                        <div class="row">
                            <div class="col-md-9 col-xs-9"> <a href="#" class="title" data-abc="true">Pick-up Location</a> 
                               
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <div class="rating text-right"> Jalan Duta</div>
                            </div>
                           
                        </div>
                    </figcaption>
                </div>
                
                
                <div class="bottom-wrap"> <a href="#" class="btn btn-primary float-right" data-abc="true"> Book now </a>
                    <div class="price-wrap"> <a href="javascript:history.back()" class="btn btn-outline-secondary float-left" data-abc="true"> Cancel </a> </div>
                </div>
            </figure>
                <%
                            }
       
                        }
                        catch(Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
        </div>
    </body>
</html>
