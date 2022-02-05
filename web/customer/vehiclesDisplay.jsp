<%-- 
    Document   : vehiclesDisplay
    Created on : Feb 5, 2022, 2:16:16 PM
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
<!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />   -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <title>JSP Page</title>
        <style>
            h3{
                text-align: center;
                font-size: 30px;
                margin: 0;
                padding-top: 10px;
            }
            
            
            a{
                text-decoration: none;
            }
            .gallery{
                display: flex;
                flex-wrap: wrap;
                width: 100%;
                justify-content: center;
                align-items: center;
                margin: 50px 0;
                
            }
            
            .content{
                width: 24%;
                margin: 15px;
                box-sizing: border-box;
                float: left;
                text-align: center;
                border-radius:10px;
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
                padding-top: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                transition: .4s;
                background-color: white;
            }
            
            .content:hover{
                box-shadow: 0 0 11px rgba(33,33,33,.2);
                transform: translate(0px, -8px);
                transition: .6s;
            }
            
            img{
                width: 300px;
                text-align: center;
                margin: 0 auto;
                display: block;
            }
            
            p{
                text-align: center;
                color: #b2bec3;
                padding: 0 8px;
            }
            
            h6{
                font-size: 26px;
                text-align: center;
                color: #222f3e;
                margin: 0;
            }
            
            ul{
                list-style-type: none;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 0px;
            }
            
            li{
                padding: 5px;
            }
            
            .fa{
                color: #ff9f43;
                font-size: 26px;
                transition: .4s;
            }
            
            .fa:hover{
                transform: scale(1.3);
                transition: .6s;
            }
            
            button{
                text-align: center;
                font-size: 24px;
                color: #fff;
                width: 100%;
                padding: 15px;
                border:0px;
                outline: none;
                cursor: pointer;
                margin-top: 5px;
                border-bottom-right-radius: 10px;
                border-bottom-left-radius: 10px;
            }
            
            .buy-1{
                background-color: #2183a2;
            }
            
            .buy-2{
                background-color: #3b3e6e;
            }
            
            .buy-3{
                background-color: #0b0b0b;
            }
            
            @media(max-width: 1000px){
            .content{
                width: 46%;
                }
            }
            
            @media(max-width: 750px){
            .content{
                width: 100%;
                }
            }
        </style>
    </head>
    <%@include file="customerHeader.jsp" %>
    <body>
        <%
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "rentalproject";
                        String userid = "root";
                        String password = "";
                      //  int A_ID= Integer.parseInt(session.getAttribute("A_ID").toString());
                        
                        //String id = " ";
                        
                        String sreturnDate=(String)session.getAttribute("sreturnDate");
                        String spickupDate=(String)session.getAttribute("spickupDate");
                        
                        try {
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                           
                            //prepared statement
                            String sqlselect = "select * from vehicle";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
   
                            ResultSet rs = ps.executeQuery();
                            
                          
                           
                
                            
                            int j = 0;
                            
                            String[] arr = null;
                            while(rs.next()){

                            %>    
        <div class="gallery">
            <div class="content">
              <img src = "../view_image.jsp?vehicleID=<%=rs.getString("vehicleID")%>">
              <h3><%= rs.getString("brand")%><%out.print(" ");%><%= rs.getString("model") %></h3>
           
        
<!--              <ul>
                <li><i class="fa fa-star" aria-hidden="false"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
              </ul>-->
              <button class="buy-1" onclick="location.href='bookDateLoc.jsp';" >Book Now</button>
            </div>
            <div class="content">
              <img src = "../view_image.jsp?vehicleID=<%=rs.getString("vehicleID")%>">
              <h3><%= rs.getString("brand")%><%out.print(" ");%><%= rs.getString("model") %></h3>
           
        
<!--              <ul>
                <li><i class="fa fa-star" aria-hidden="false"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
              </ul>-->
              <button class="buy-2" onclick="location.href='bookDateLoc.jsp';" >Book Now</button>
            </div>
            <div class="content">
              <img src = "../view_image.jsp?vehicleID=<%=rs.getString("vehicleID")%>">
              <h3><%= rs.getString("brand")%><%out.print(" ");%><%= rs.getString("model") %></h3>
           
        
<!--              <ul>
                <li><i class="fa fa-star" aria-hidden="false"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                <li><i class="fa fa-star" aria-hidden="true"></i></li>
              </ul>-->
              <button class="buy-3" onclick="location.href='bookDateLoc.jsp';" >Book Now</button>
            </div>
        </div>
        <%
                            
                            
                       }
}
                        catch(Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
        
    </body>
</html>
