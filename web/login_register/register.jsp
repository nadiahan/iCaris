
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <link rel="stylesheet" href="login.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
        <script>
        function validateForm() {
            let pw = document.forms["myForm"]["pw"].value;
            let pw2 = document.forms["myForm"]["pw2"].value;
            let dc = document.forms["myForm"][driveclass].value;
            
            if (pw !== pw2) {
              alert("Password does not match!");
              return false;
            }
            
            if (dc.length > 2){
                alert("Invalid license class!");
                return false;
            }
          }
        </script>
    </head>
    <%@include file="loginheader.jsp" %>
    <body>
    <div class="login">
  
    <form name="myForm" action = "../processRegister" method="post" onsubmit="return validateForm()">
        
        <h1>iCaris Car Rental</h1>
        <input type="text" name="fname" id="fname" placeholder="First Name" required="required" />
        <input type="text" name="lname" id="lname" placeholder="Last Name" required="required" />
        <input type="text" name="nric" id="nric" placeholder="NRIC/Passport Number" required="required" />
        <input type="email" name="email" id="email" placeholder="Email Address" required="required" />
        <input type="password" name="pw" id="pw" placeholder="Password" required="required" />
        <input type="password" name="pw2" id="pw2" placeholder="Retype Password" required="required" />
        <input type="text" name="phone" id="phone" placeholder="Phone number" required="required" />
        <input type="text" name="driveclass" id="driveclass" placeholder="Driving Class (D / DA)" required="required" style='text-transform:uppercase'/>
        <input type="text" name="address" id="address" placeholder="Address" required="required" />
        
        <button type="submit" class="btn btn-primary btn-block btn-large" style="margin-bottom: 5px;">Register</button>
        <a href="login.jsp" class = "btn btn-secondary" style="margin-left: 20px;">Already have an account? Login here</a>
    </form>
    </div>
    </body>
</html>