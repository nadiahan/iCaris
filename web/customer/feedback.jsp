<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Star Rating Form | CodingNepal</title>
    <link rel="stylesheet" href="style.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    
    <style>
    @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
        *{
          margin: 0;
          padding: 0;
          box-sizing: border-box;
          font-family: 'Poppins', sans-serif;
        }
        body{
          display: grid;
          height: 100%;
          place-items: center;
          text-align: center;
          background: url("../img/bg.png")no-repeat;
          
          background-size: cover;
        }
        
        input[type=text], select{
        width: 280px;
        height: 50px;
        /*padding-left: 200px;*/
        padding: 8px;
        margin: 10px;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        text-align: center;
        place-items: center;
        box-sizing: border-box;

      }
              .rating-css {
            margin-top: 50px;
          height: 200px;
          width: 320px;
          background: white;
          border: 2px solid black;
          padding: 20px;
        }
        .rating-css div {
          color: #ffe400;
          font-size: 20px;
          font-family: sans-serif;
          font-weight: 500;
          text-align: center;
          text-transform: uppercase;
          padding: 20px 0;
        }
        .rating-css input {
          display: none;
        }
        .rating-css input + label {
          font-size: 40px;
          text-shadow: 1px 1px 0 #ffe400;
          cursor: pointer;
        }
        .rating-css input:checked + label ~ label {
          color: #838383;
        }
        .rating-css label:active {
          transform: scale(0.8);
          transition: 0.3s ease;
        }
        /*This is my youtube channel link*/
        a {
          position: absolute;
          bottom: 20px;
          font-weight: 600;
          text-decoration: none;
          font-size: 20px;
          font-family: sans-serif;
          right: 20px;
          color: #000;
        }
        a:hover {
          color: red;
        }
        
        
        .login-button {

          background-color: #08689f;
          color: white;
          padding: 8px 20px;
          margin: 8px 0;
          border: none;
          border-radius: 50px;
          cursor: pointer;
          transition: all 0.3s ease 0s;


        }

        .login-button:hover {
         box-shadow: 0 4px 8px 0 rgba(8, 104, 159, 0.6);
        }

    </style>
</head>
  <body>
      <% 
      String bookingID = request.getParameter("bookingID");
      String vehicleID = request.getParameter("vehicleID");
      %>
      <form action="../addFeedback">
    <div class="rating-css">
    <div>Rate your experience<br>(On a scale 1-5)</div>
    <div class="star-icon">
      <input type="radio" name="rating1" id="rating1"  value="1">
      <label for="rating1" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating2"  value="2">
      <label for="rating2" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating3"  value="3">
      <label for="rating3" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating4"  value="4">
      <label for="rating4" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating5"  value="5">
      <label for="rating5" class="fa fa-star"></label>
      
    </div>
    
  </div>
          <input type="text" id="experience" name="experience" placeholder="Tell us your experience"><br>
          <input type="hidden" name="bookingID" value="<%=bookingID%>">
          <input type="hidden" name="vehicleID" value="<%=vehicleID%>">
          
        <input class="login-button" type="submit" id="fname" value="Submit">
      </form>
  

  </body>
</html>