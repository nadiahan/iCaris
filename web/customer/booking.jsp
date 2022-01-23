<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="customer_styles.css">
    </head>
    
    <body>
        <%@include file="customerHeader.jsp" %>
        <div class="sizedbox1"></div>
        
        <% 
            String name=(String)session.getAttribute("fname");
            String _userid = (String)session.getAttribute("userID");
            String _fname =(String)session.getAttribute("fname");
            String _lname =(String)session.getAttribute("lname");
            String _password =(String)session.getAttribute("password");
            String _nric =(String)session.getAttribute("nric");
            String _driveclass =(String)session.getAttribute("driveclass");
            String _phone =(String)session.getAttribute("phone");
            String _address =(String)session.getAttribute("address");
        %> 
        <form class="bookingform" action="../addBooking" method="get">
            <h1>Hello <% out.print(_fname + " " + _lname);   %> </h1>
<!--            <b>Book a car now</b>-->
            <br>
            Pick-up Location<br>
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
            <button class="login-button" name="login" type="submit">Submit</button>
        </form>


    </body>

</html>