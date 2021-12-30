
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Booking</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="admin.css">
        <style>
            .addform {
                width: 75%;
                height: 100%;
                background-color: white;
                margin: auto;
                border-radius: 15px;
            }
        </style>
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <h1>New Booking Form</h1>
        <div class="addform">
        <div class="container">
            <form class="well form-horizontal" action="svlt5" method="post">
                <fieldset>
                    <!-- Form Name -->
                    <legend>Make A New Booking</legend>
                   
                    <div class="form-group">
                        <label class="col-md-4 control-label">Pickup Date</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="pickupDate" class="form-control"  type="date">
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label">Return Date</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="returnDate" class="form-control"  type="date">
                            </div>
                        </div>
                    </div>

                    <div class="form-group"> 
                        <label class="col-md-4 control-label">Pickup Location</label>
                        <div class="col-md-4 selectContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <select name="pickupLocation" class="form-control selectpicker">
                                    <option value="Senai International Airport">Senai International Airport</option>
                                    <option value="Larkin Sentral">Larkin Sentral</option>
                                    <option value="JB Sentral CIQ">JB Sentral CIQ</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group"> 
                        <label class="col-md-4 control-label">Return Location</label>
                        <div class="col-md-4 selectContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <select name="returnLocation" class="form-control selectpicker">
                                    <option value="Senai International Airport">Senai International Airport</option>
                                    <option value="Larkin Sentral">Larkin Sentral</option>
                                    <option value="JB Sentral CIQ">JB Sentral CIQ</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-success" >Submit Form</button>
                            <button type="reset" class="btn btn-warning" >Reset Form</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        </div>
    </body>
</html>
