<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
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
                text-align: center;
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
                font-size: 20px;
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
                display: none;
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
            
          input[type=date], select{


            padding: 8px 30px;
            margin: 10px 30px;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-align: center;
            box-sizing: border-box;
            justify-content: center;
            text-align: center;

          }




        </style>
        
      
    </head>
    <body>
        

        <div class="header">

            <a href="currentBooking.jsp"><p class="backBtn"><img src = "../img/back.png" width="30px">&nbsp Return</p></a>

        </div>
        <%
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "rentalproject";
                        String userid = "root";
                        String password = "";
                        String vehicleID = null;
                        String _userid = (String) session.getAttribute("userID");
                        

                        
                        String bookingID= request.getParameter("bookingID");
                        float price = Float.parseFloat(request.getParameter("price"));

//                        Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(returnDate);
//                      
                        //int i=Integer.parseInt(request.getParameter("id"));
//                        DecimalFormat pf = new DecimalFormat("#0.00");
                     
                                
                        try {
                            //int i=request.Integer.parseInt(request.getParameter("id"));  
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                           
                            //prepared statement
                            String sqlselect = "select * from booking where bookingID ='"+bookingID+"'";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
   
                            ResultSet rs = ps.executeQuery();
                            
                            //if vehicle id == 
                            //rs.getString ("vehicleID");
                            while(rs.next()){
                                
                            %>    
 
        <div class="summaryCard">
            <div class="carFrame">
                <p class="carName" style="color:#0052A2;">DATE EXTENSION REQUEST</p>
                <p class="bookingId">(Booking Ref : <%= bookingID%>)</p>
            </div>
            
            
            <div class="lineBox2"></div>
            <input type="date" id="extenddate" name="extenddate" required min = "<% rs.getDate("returnDate"); %>">
            
            
            
            <a class="btn btn-primary" href="javascript:;" onclick = "this.href='../updateDate?bookingID=<%=bookingID%>&price=<%= rs.getFloat("totalPrice")%>&extenddate=' 
                                                       + document.getElementById('extenddate').value" role="button">Okay</a>
             <!--<a class="btn btn-primary" href="javascript:;" onclick = "this.href='../UpdateDate?id\ role="button">Update</a>-->
            
<!--            <p id="demo"></p>-->
            
<!--            <div class="sizedBox1"></div>-->
            <div class="lineBox2"></div>
<!--            <div class="totContainer" id="totContainer">
               
                <p class="totText">Total Days</p>
                <p class="totPrice" id="mytext">RM</p>
                 
            </div>-->
            
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
