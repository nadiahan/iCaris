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
        html,body{  
            margin: 0;
            padding: 0;
            background: url("../img/bg.png")no-repeat;
            background-size: cover;

        }

        li, a, button{
            font-family: "Montserrat", sans-serif;
            font-weight: 500;
            font-size: 25px;
            color: #edf0f1;
            text-decoration: none;

        }

        header{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 30px 10% 0px;
            background-color: transparent;

            width: 80%;
        }

        .sizedbox1{
            height: 70px;
        }

        .logo{
            position: absolute;
            top:10px;

        }

        .logout-button{
            background-color: transparent;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;
        }

        .logout-button:hover{

            opacity: 0.8;
        }

        .nav-links{
            list-style: none;
        }

        .nav-links li{
            display: inline-block;
            padding: 0px 80px;

        }

        .nav-links li {
            transition: all 0.3s ease 0s;
        }

        .nav-links li a:hover{
        /*    color: #08689f;*/
            border-bottom: 1px solid white;
        }

    </style>
  </head>
  
  <body>
   <header>
        <a href="#"><img class="logo" src="../img/iCARis logo.png" alt="logo"style=" width:130px; height:130px"></a>
        <nav>
            <ul class="nav-links">
                <li><a href="profile.jsp">My Profile</a></li>
                <li><a href="bookDateLoc.jsp">Bookings</a></li>
                <li><a href="#">Vehicle</a></li>
                <li><a href="#">Inquiries</a></li>
            </ul>
        </nav>

        <a href="../login_register/logout.jsp"><button class="logout-button"><img src="../img/logout-symbol.svg" alt="logo" style="width:65px; height:65px"></button></a>
    </header>
    </body>
</html>
