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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />    
<!--        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,500;1,500&display=swap');
            *{  
                margin: 0;
                padding: 0;


            }

            body{
                background: url("../img/bg.png")no-repeat;
                background-size: cover;
            }

            .backBtn{
                font-family: "Montserrat", sans-serif;
                font-weight: 500;
                font-size: 25px;
                color: #edf0f1;
                margin: 30px 0px 0px 30px;
                letter-spacing: 2px;
                text-decoration: none;
                display: inline-block;
            }

            .backBtn:hover{
                color: #edf0f1;
                border-bottom: 1px solid white;
            }

            .summaryCard{

/*                height: 300px;*/
                background-color: white;
                margin: 5% 35%;
                border-radius: 15px;
                padding: 2%;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.6);
            }

            .place{
                font-family: "Montserrat", sans-serif;
                font-weight: bold;
                font-size: 18px;
                padding-top: 15px;
                color: #0052A2;


            }

            .timeDetail{
                font-family: "Montserrat", sans-serif;
                font-weight: 500;
                font-size: 16px;
                padding: 10px 0px 0px; 
                color: grey;

            }

            .dateDetail{
                font-family: "Montserrat", sans-serif;
                font-weight: bold;
                font-size: 16px;
                padding-bottom: 15px;

                color: grey;

            }



            .lineBox1{
                height: 25px;
                width: 2px;
                background-color: #0052A2;
                margin-left: 10px; 
            }

            .lineBox2{
                height: 3px;

                background-color: #0052A2;

            }
            .imgCar{
                height: 100px;
                width: 150px;
                

            }
            
            .carFrame{
                width: 100%;
/*                background-color: red;*/
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 0px 0px 15px;
                flex-direction: column;
            }
            
            .carName{
                font-family: "Montserrat", sans-serif;
                font-size: 24px;
                color: black;
                font-weight: bold;
                letter-spacing: 2px;
                padding: 8px 0px 0px;
            }
            
             .bookingId{
                 font-family: "Montserrat", sans-serif;
                font-size: 16px;
                color: #0052A2;

            }
            
            .totContainer{
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }
            
            .totText{
                font-family: "Montserrat", sans-serif;
                font-weight: 500;
                font-size: 16px;
                padding: 10px 0px 0px; 
                color: #0052A2;
                
                
            }
            
            .totPrice{
                font-family: "Montserrat", sans-serif;
                font-weight: bold;
                font-size: 16px;
                padding: 10px 0px 0px; 
                color: black;
            }
            
            .sizedBox1{
                height: 30px;
            }
            
            .button{
                text-align: center;
            }




        </style>
    </head>
    <body>
        <%
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "rentalproject";
                        String userid = "root";
                        String password = "";
                        String vehicleID = request.getParameter("vehicleID");
                        String bookingID = request.getParameter("bookingID");
                        
                        String id = request.getParameter("id");
                        String returnDate = null;
                        //int i=Integer.parseInt(request.getParameter("id"));
                        
                        
                        try {
                            //int i=request.Integer.parseInt(request.getParameter("id"));  
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                           
                            //prepared statement wher   
                            String sqlselect = "select * from booking where bookingID ='"+bookingID+"'";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
   
                            ResultSet rs = ps.executeQuery();
                            
                            
                        //    vehicleID = rs.getString("vehicleID");
//                            String sqlselect2 = "select * from vehicle where vehicleID = '3'";
//                            PreparedStatement ps2 = conn.prepareStatement(sqlselect2);
//                            
//                            ResultSet rs2 = ps2.executeQuery();
//                            
//                            String name = rs2.getString("brand");
//                            String model = rs2.getString("model");
                            
                            //if vehicle id == 
                            //rs.getString ("vehicleID");
                                
                            while(rs.next()){
                   
                            String sqlselect2 = "select * from vehicle where vehicleID ='"+vehicleID+"'";
                            PreparedStatement ps2 = conn.prepareStatement(sqlselect2);
   
                            ResultSet rs2 = ps2.executeQuery();
                            while(rs2.next()){
                                float total = rs.getFloat("totalPrice")+rs.getFloat("extraFee");
                              //  String returnDate = rs.getString ("returnDate");
                                
                                String rd = rs.getString("returnDate");
                                String erd = rs.getString("extendReturnDate");  
                                
                                returnDate = rs.getString("returnDate");
                                
                                if (rs.getString("extendReturnDate")!= null){
                                returnDate = rd;
                                
                                } else {
                                returnDate =  erd;
                                }
                            %>

        <div class="header">

            <a href="currentBooking.jsp"><p class="backBtn"><img src = "../img/back.png" width="30px">&nbsp Return</p></a>

        </div>
 
        <div class="summaryCard">
            <div class="carFrame">
                <img class="imgCar" src="../view_image.jsp?vehicleID=<%=rs2.getString("vehicleID")%>" alt="Car picture">
                <p class="carName"><%= rs2.getString("brand")%><%out.print(" ");%><%= rs2.getString("model") %></p>
                <p class="bookingId">Booking Ref : IC<%= rs.getString ("bookingID")%></p>
            </div>
            
            
            <div class="lineBox2"></div>
            <p class="place"><%= rs.getString ("pickupLocation")%></p>
            <p class="timeDetail"><%= rs.getString ("pickupTime")%></p>
            <p class="dateDetail"><%= rs.getString ("pickupDate")%></p>
            <div class="lineBox1"></div>
            <p class="place"><%= rs.getString ("returnLocation")%><p>
            <p class="timeDetail"><%= rs.getString ("returnTime")%></p>
            <p class="dateDetail"><%= returnDate %></p>
<!--            <div class="sizedBox1"></div>-->
            <div class="lineBox2"></div>
            <div class="totContainer">
                <p class="totText">Total</p>
                <p class="totPrice">RM<%= total%></p>
                
                
                
            </div>
            <div class = "button">
                <a href="extendDate.jsp?bookingID=<%= rs.getString ("bookingID")%>&returndate=<%= rs.getString ("returnDate")%>&price=<%= rs.getString ("totalPrice")%>" class="btn btn-outline-warning btn-lg btn-block"><B>EXTEND RETURN DATE</B></a>
            </div>
        </div>
            
<%;
                            }
}
       
                        }
                        catch(Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
    </body>
</html>
