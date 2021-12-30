<%-- 
    Document   : maincustomer
    Created on : Dec 8, 2021, 11:21:35 AM
    Author     : DR HANIM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello <%= request.getParameter("email") %> </h1>
        
        <form class="bookingform" action="svlt3" method="get">
            <b>Book a car now</b>
            <br>
            Pick-up Location<br>
            <input  name="pickuploc" type="text">
            <br>
            Return Location<br>
            <input  name="returnloc" type="text">
            <br>
            Pick-up Date<br>
            <input  name="pickupdate" type="text">
            <br>
            Pick-up Time<br>
            <input  name="pickuptime" type="text">
            <br>
            Return Date<br>
            <input  name="returndate" type="text">
            <br>
            Return Time<br>
            <input  name="returntime" type="text">
            <br>
            Additional drivers?<br>
            <input  name="driver" type="text">
            <br><br>
            <button name="login" type="submit">Sign In</button>
        </form>
        
    </body>
</html>
