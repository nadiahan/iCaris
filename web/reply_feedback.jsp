
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reply Feedback</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="admin.css">
        <style>
            .view {
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
        <%
            int feedbackID = Integer.parseInt(request.getParameter("feedbackID"));
        %>
        <h1>Feedback # <%= feedbackID %></h1>
        <%
                session.setAttribute("feedbackID",feedbackID);
        %>
        <div class="view">
        <div class="container">
            <form class="well form-horizontal" action="svlt15" method="post">
                <fieldset>
                    <!-- Form Name -->
                    <legend>Reply Inquiry</legend>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Message</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <textarea name="reply" class="form-control" rows="5">
                                    
                                </textarea>
                            </div>
                        </div>
                    </div>
                            
                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary" >Submit</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        </div>
    </body>
</html>
