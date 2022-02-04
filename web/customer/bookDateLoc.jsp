<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="booking.css">
    <script>
        function validateForm() {
          let date1 = document.forms["myForm"]["pickupdate"].value;
          let date2 = document.forms["myForm"]["returndate"].value;
          
          int diff = (int) ((date2.getTime() - date1.getTime())/(1000*60*60*24));
          
          if (date2 <= date1) {
            alert("Return Date must be after Pickup Date");
            return false;
          }
          
//          if (diff > 3){
//            alert("Maximum rental days is 3");
//            return false;
//          }
          
          document.write(diff);
        
        }
    </script>
    </head>
    
    <body>
        <%@include file="customerHeader.jsp" %>
        <div class="sizedbox1"></div>
        
        <% 
            //String name=(String)session.getAttribute("fname");
           // String _userid = (String)session.getAttribute("userID");
            String _fname =(String)session.getAttribute("fname");
            String _lname =(String)session.getAttribute("lname");
           // String _password =(String)session.getAttribute("password");
          //  String _nric =(String)session.getAttribute("nric");
         //   String _driveclass =(String)session.getAttribute("driveclass");
          //  String _phone =(String)session.getAttribute("phone");
          //  String _address =(String)session.getAttribute("address");
         Date today = (new java.util.Date());
         DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
         String formattedDate = df.format(today);

        %> 
        <form name = "myForm" class="bookingform" action="../addBooking" method="post" onsubmit="return validateForm()">
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
            <input  name="pickupdate" type="date" min = '<%= formattedDate%>'>
            <br>
            Pick-up Time<br>
            <input  name="pickuptime" type="time">
            <br>
            Return Date<br>
            <input  name="returndate" type="date" min = '<%= formattedDate%>'>
            <br>
            Return Time<br>
            <input  name="returntime" type="time">
            <br>
            Additional drivers?<br>
            <input  name="driver" type="text">
            <br>
            <button class="login-button" name="login" type="submit">Submit</button>
        </form>
<div class="sizedbox2"></div>
    </body>
</html>