<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,500;1,500&display=swap');
            *{  
                margin: 0;
                padding: 0;


            }

            html{
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




        </style>
    </head>
    <body>

        <div class="header">

            <a href="currentBooking.jsp"><p class="backBtn">Return</p></a>

        </div>

        <div class="summaryCard">
            <div class="carFrame">
                <img class="imgCar" src="../img/axia.jpg" alt="Car picture">
                <p class="carName">AXIA</p>
                <p class="bookingId">Booking Ref : ICRAX0001</p>
            </div>
            
            
            <div class="lineBox2"></div>
            <p class="place">Paradigm Mall</p>
            <p class="timeDetail">9.45am</p>
            <p class="dateDetail">13 Dec</p>
            <div class="lineBox1"></div>
            <p class="place">Universiti Teknologi Malaysia<p>
            <p class="timeDetail">1.50pm</p>
            <p class="dateDetail">15 Dec</p>
<!--            <div class="sizedBox1"></div>-->
            <div class="lineBox2"></div>
            <div class="totContainer">
                <p class="totText">Total</p>
                <p class="totPrice">RM 150.00</p>
                
                
            </div>
        </div>

    </body>
</html>
