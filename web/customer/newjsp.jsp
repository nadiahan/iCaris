<%-- 
    Document   : newjsp
    Created on : Jan 23, 2022, 5:36:44 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
      h1{
        color: white;
        text-align: center;
        position: absolute;
        top: 38%;
        left: 38%;
      
      }
      div.one{
        margin-top: 40px;
        text-align: center;
      }
      button{
        margin-top: 10px;
        border-radius: 30px;
        
      }
      
      .headcustomer {
        padding-top: 10px;
        margin: 0;
        color: white;
        font-family: Arial;
        font-size: 23px;
        font-weight: bold;
        display: flex;
        justify-content: center;
    
       }

    a:link{
        color: white;
        text-decoration: none;
       }

    a:visited{
        color: white;
        text-decoration: none;
        font-style: italic;
       }

    .menu {
        width: 1260px;
        display: flex;
        justify-content: space-between;
       }
        
    body {
        background-image: url("img/bg.png");
        }
        
    .one {
        position: absolute;
        top: 40%;
        left: 30%;
        }

        
    </style>
  </head>
  <body>
   <div class="headcustomer">
        <div class="menu">
            <a href="mainAdmin.jsp">&nbsp<img src="img/iCARis logo.png" style="width:70px; height:70px"></a>
            <div class="MyBooking"><a href="#">My Booking</a></div>
            <div class="NewBooking"><a href="vehicle_list.jsp">New Booking</a></div>
            <div class="Vehicles"><a href="customer_list.jsp">Vehicles</a></div>
            <div class="inquiries"><a href="inquiry_list.jsp">Inquiries</a></div>
            <div class="profile"><a href="login_register/login.jsp" style="font-size: 15px">Login | </a> 
            <a href="login_register/register.jsp" style="font-size: 15px">Register &nbsp&nbsp&nbsp</a></div>
        </div>
    </div>
    </body>
</html>
