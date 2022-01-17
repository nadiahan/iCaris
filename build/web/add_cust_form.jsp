<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add new Customer</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="admin.css">
        <style>
            legend,h3{
                text-align: center;
                padding-bottom: 10px;
            }
            form{
                border-radius: 5%;
                box-shadow: 5px 10px 8px black;
                margin: 10px;
                padding: 10px;
            }
        </style>
        <script>
            function validate()
            {
                if(validateEmail() === false)
                  {
                    return false;
                  }
                 return( true );
            }
            function validateEmail()
            {

                var emailID = document.form.email.value;
                atpos = emailID.indexOf("@");
                dotpos = emailID.lastIndexOf(".");
                if (atpos < 1 || ( dotpos - atpos < 2 ))
                {
                   alert("Please enter correct email ID")

                   return false;
                }
            return( true );
            }
    </script>
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <div class="container col-md-5">
            <form class="well form-horizontal bg-light text-dark" name="form" onsubmit="return(validate());" action="svlt8" method="get">
                <fieldset>
                    <legend>New Customer Form</legend>

                    <div class="form-group">
                        <label class="col-md-4 control-label">First Name : </label>
                        <div class="col-md-12 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="fname" placeholder="First Name" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label">Last Name : </label>
                        <div class="col-md-12 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="lname" placeholder="Last Name" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">Email : </label>
                        <div class="col-md-12 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="email" placeholder="eg: abc@gmail.com" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label">Password : </label>
                        <div class="col-md-12 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="password" placeholder="Password" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-12 control-label">Phone Number : </label>
                        <div class="col-md-12 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="phone" placeholder="eg: 0123456789" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label">Drive Class : </label>
                        <div class="col-md-12 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="driveclass" placeholder="eg: DA" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label">Address : </label>
                        <div class="col-md-12 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="address" placeholder="Address" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label">IC/Passport No : </label>
                        <div class="col-md-12 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="nric" placeholder="eg: 981010031234" class="form-control"  type="text" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <label class="col-md-5 control-label"></label>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-success" >Submit Form</button>
                        </div>
                        <div>
                            <button type="reset" class="btn btn-warning" >Reset Form</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </body>
</html>
