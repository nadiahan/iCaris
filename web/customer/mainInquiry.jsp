<%-- 
    Document   : mainBooking
    Created on : Feb 5, 2022, 12:52:52 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,500;1,500&display=swap');
            html,body{  
                margin: 0;
                padding: 0;
                background: url("../img/bg.png")no-repeat;
                background-size: cover;


            }

            .main-container{              

                /*                background-color: blue;   */
                margin-top: 10%;
                display: flex;
                align-content: center;
                justify-content: center;


            }

            .optionBtn{
                /*                border: 2px solid white;*/

                width: 250px;
                padding: 15px 8px 0px;
                display: flex;
                flex-direction: column;
                align-items: center;
                background-color: #0052A2;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.6);
                transition: all 0.3s ease 0s;
            }

            .sizedBox1{
                width: 20px;
            }
            .captionBtn{
                font-size: 20px;
                letter-spacing: 2px;

            }
            .imgBtn{
                height:100px;
                width:100px;
            }

            .optionBtn:hover{
                border-bottom-left-radius: 0px;
                border-top-left-radius: 70px;
                border-bottom-right-radius: 70px;
                border-top-right-radius: 0px;
            }
        </style>
    </head>
    <body>
        <%@include file="customerHeader.jsp" %>
        <div class="main-container">
            <a  href="inquiry.jsp">
                <div class="optionBtn new"> 
                    <img class="imgBtn" src="../img/new.svg" alt="Add new logo">
                    <p class="captionBtn">NEW INQUIRY</p>
                </div>
            </a>
            <div class="sizedBox1"></div>
            <a  href="currentinquiry.jsp">
                <div class="optionBtn current">
                    <img class="imgBtn" src="../img/list.svg" alt="Booking logo">
                    <p class="captionBtn">INQUIRY LIST</p>
                </div>
            </a>
        </div>
    </body>
</html>
