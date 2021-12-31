
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="customer.css">
    </head>
    <body>
        <%@include file="customerHeader.jsp" %>
        
        
        <form class="bookingform" action="svlt3" method="get">
            <h1>Hello <%= request.getParameter("email") %> </h1>
<!--            <b>Book a car now</b>-->
            <br>
            <i>Pick-up Location</i>
            <input  name="pickuploc" type="text">
            <br>
            Return Location<br>
            <input  name="returnloc" type="text">
            <br>
            Pick-up Date<br>
            <input  name="pickupdate" type="date">
            <br>
            Pick-up Time<br>
            <input  name="pickuptime" type="time">
            <br>
            Return Date<br>
            <input  name="returndate" type="date">
            <br>
            Return Time<br>
            <input  name="returntime" type="time">
            <br>
            Additional drivers?<br>
            <input  name="driver" type="text">
            <br>
            <button name="login" type="submit">Submit</button>
        </form>
        
    </body>
</html>
