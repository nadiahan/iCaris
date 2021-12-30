
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Vehicle</title>
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
        <h1>New Vehicle Form</h1>
        <div class="addform">
        <div class="container">
            <form class="well form-horizontal" action="svlt5" method="post" enctype="multipart/form-data">
                <fieldset>
                    <!-- Form Name -->
                    <legend>Register New Vehicle</legend>

                    <!-- radio checks -->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Type</label>
                        <div class="col-md-4">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="type" value="Car" /> Car
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="type" value="Motorcycle" /> Motorcycle
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Brand</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input  name="brand" placeholder="Brand" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Model</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="model" placeholder="Model" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Registration No.</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="vehicleNo" placeholder="XXX0000" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group"> 
                        <label class="col-md-4 control-label">Colour</label>
                        <div class="col-md-4 selectContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <select name="colour" class="form-control selectpicker">
                                    <option value="White">White</option>
                                    <option value="Black">Black</option>
                                    <option value="Grey">Grey</option>
                                    <option value="Brown">Brown</option>
                                    <option value="Red">Red</option>
                                    <option value="Blue">Blue</option>
                                    <option value="Green">Green</option>
                                    <option value="Maroon">Maroon</option>
                                    <option value="Bronze">Bronze</option>
                                    <option value="Purple">Purple</option>
                                    <option value="Yellow">Yellow</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Number of seats</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="seats" placeholder="5/7" class="form-control" type="text">
                            </div>
                        </div>
                    </div>

                    <!-- radio checks -->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Transmission</label>
                        <div class="col-md-4">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="transmission" value="Auto" /> Auto
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="transmission" value="Manual" /> Manual
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Trunk Size/Capacity</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="trunkSize" placeholder="1 large luggage" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>
                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Rent Price</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="price" placeholder="eg:150" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Manufacture Year</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="year" placeholder="yyyy" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>
                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">RoadTax Expiry Date</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input name="rdTaxExpiry" placeholder="mm/yyyy" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>
                    
                    <!-- input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Upload An Image</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <input type="file" name="image" class="form-control" accept=".jpg, .jpeg, .png">
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
