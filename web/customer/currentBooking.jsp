<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

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
                font-size: 22px;
                padding: 2% 0px;
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
        <div class="main-container">
            <a href="summaryBooking.jsp">
                <div class="booking-card">
                    
                    <div class="left-side">
                        
                    <img class="imgCar" src="../img/axia.jpg" alt="Car picture">
                    <div class="sizedBox1"></div>

                    <div class="textPart">

                        <ul class="cardDesc">
                            <li class="carName">AXIA</li>
                            <li class="bookingId">ICRAX0001</li>
                        </ul>


                    </div>
                        
                        
                    </div>


                    
<!--                    <div class="sizedBox2"></div>-->
                    <p class="pickupDate">15 Dec</p>



                </div>
            </a>
        </div>
        <!--        <a href="summaryBooking.jsp">First booking</a>-->
    </body>
</html>
