
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
    </head>
    <body>
    <div class="login">
  
    <form action = "../processRegister" method="post">
        <img src="../img/iCARis logo.png" style="display: block; margin-left: auto; margin-right: auto; width: 45%">
        <h1>iCaris Car Rental</h1>
        <input type="text" name="fname" id="fname" placeholder="First Name" required="required" />
        <input type="text" name="lname" id="lname" placeholder="Last Name" required="required" />
        <input type="text" name="nric" id="nric" placeholder="NRIC/Passport Number" required="required" />
        <input type="text" name="email" id="email" placeholder="Email Address" required="required" />
        <input type="password" name="pw" id="pw" placeholder="Password" required="required" />
        <input type="password" name="pw2" id="pw2" placeholder="Retype Password" required="required" />
        <input type="text" name="phone" id="phone" placeholder="Phone number" required="required" />
        <input type="text" name="driveclass" id="driveclass" placeholder="Driving Class (D / DA)" required="required" />
        <input type="text" name="address" id="address" placeholder="Address" required="required" />
        
        <button type="submit" class="btn btn-primary btn-block btn-large">Register</button>
    </form>
    </div>
    </body>
</html>