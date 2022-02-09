<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
        <title>JSP Page</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <style>
            .login-button {

              background-color: #08689f;
              color: white;
              padding: 8px 20px;
              margin: 8px 0;
              border: none;
              border-radius: 50px;
              cursor: pointer;
              transition: all 0.3s ease 0s;


            }
            .main-container{
                /*                background-color: red;*/
                height: 30px;
                margin: 0px 25%;
                padding: 30px 8px;
            }
            .booking-card{
                border: 1px solid white;
                display: flex;
                flex-direction: row;
                background: white;
                padding: 12px 15px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.6);
                transition: all 0.3s ease 0s;
                border-radius: 15px;
                justify-content: space-between;
                align-items: center;

            }

            .imgCar{
                height: 100px;
                width: 150px;

            }

            .carName{
                font-size: 24px;
                color: black;
                font-weight: bold;
                letter-spacing: 2px;
                padding-bottom: 5px;
                padding-top: 25px;

            }
            .bookingId{
                font-size: 16px;
                color: #0052A2;

            }

            .sizedBox1{
                width: 25px;

            }
            .sizedBox2{
                width: 50%;
            }

            .cardDesc{
                list-style: none;
            }

            .booking-card:hover{
                box-shadow: 0 4px 8px 0 rgba(255, 255, 255, 0.6);



            }
            .pickupDate{
                color:grey;
                font-size: 20px;
/*                padding: 2% 0px;*/
            }

            ul{
                padding:0;
                margin:0;
            }
            
            .left-side{
                
                display: flex;
                flex-direction: row;
            }
            

        </style>
    </head>
    <body>
        <%@include file="customerHeader.jsp" %>
        <%
                            String driver = "com.mysql.jdbc.Driver";
                            String connectionUrl = "jdbc:mysql://localhost:3306/";
                            String database = "rentalproject";
                            String userid = "root";
                            String password = "";
                            String vehicleID = null;
                            String _userid = (String) session.getAttribute("userID");

                        //int i=Integer.parseInt(request.getParameter("id"));
                        
                        
                        try {
                            //int i=request.Integer.parseInt(request.getParameter("id"));  
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                           
                            //prepared statement wher   

                            
                            
                            String sqlselect = "SELECT * from booking WHERE userID ='"+_userid+"'";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
   
                            ResultSet rs = ps.executeQuery();
                            
                          
                            
                       
                            while(rs.next()){
                             vehicleID = rs.getString("vehicleID");
                            
                            String sqlselect2 = "select * from vehicle where vehicleID ='"+vehicleID+"'";
                            PreparedStatement ps2 = conn.prepareStatement(sqlselect2);
   
                            ResultSet rs2 = ps2.executeQuery();
                            
                            float total = rs.getFloat("totalPrice")+rs.getFloat("extraFee");
                                String returnDate = rs.getString ("returnDate");
                                
                                
                                if (rs.getString("extendReturnDate")!= null){
                                returnDate = rs.getString("extendReturnDate");
                                
                                } else
                                returnDate =  rs.getString("returnDate");
                            while(rs2.next()){
                            %>
        <div class="main-container">
            <a href="summaryBooking.jsp?vehicleID=<%=rs2.getString("vehicleID")%>&bookingID=<%=rs.getString("bookingID")%>">
                <div class="booking-card">
                    
                    <div class="left-side">
                        
                    <img class="imgCar" src="../view_image.jsp?vehicleID=<%=rs.getString("vehicleID")%>" alt="Car picture">
                    <div class="sizedBox1"></div>

                    <div class="textPart">

                        <ul class="cardDesc">
                            <li class="carName"><%= rs2.getString("brand")%><%out.print(" ");%><%= rs2.getString("model") %></li>
                            <li class="bookingId">Booking Ref : IC<%= rs.getString("bookingID")%></li>
                        </ul>


                    </div>
                        
                        
                    </div>


                            <% 
                            
                    if (rs.getString("status").equals("Booked")){%>
<!--                    <div class="sizedBox2"></div>-->
                    <p class="pickupDate"><%=returnDate%></p>
                             
                    <%;  }

                            else if (rs.getString("status").equals("Returned")) {%>
                            
                            <a class="btn btn-primary" href="feedback.jsp?bookingID=<%=rs.getString("bookingID")%>&vehicleID=<%=rs2.getString("vehicleID")%>" role="button" style="margin: 5px;">Give Fedback</a>
                            <%; } %>
                             


                </div>
            </a>
        </div>
                            <br><br><br>
        <%;
        
                            }
                          }
       
                        }
                        catch(Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
        <!--        <a href="summaryBooking.jsp">First booking</a>-->
    </body>
</html>
