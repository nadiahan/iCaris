
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <title>Booking List</title>
        <link rel="stylesheet" href="admin.css">
        
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        
        <h1>Booking List</h1>
        
        <div class="addsearch">
        <div class="searchinformation">
            <form class="searchinfo" action="svlt1" method="post">
                <div class="search">
                    <input name="searchinfo" type="text">
                    <button type="submit" class="submit">Search</button>
                </div>
                 </form>
        </div>
        
        <div class="addinformation">
            <form class="addinfo" action="svlt2" method="post">
                <button type="submit" class="add">Add new booking</button>
            </form>
        </div>
        </div>
        
        <div class="container">
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Vehicle Model</th>
                    <th scope="col">Pickup Date</th>
                    <th scope="col">Return Date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Extended Return Date Request</th>
                    <th scope="col">Extension Status</th>
                </tr>
            </thead>
            <tbody>
      
            </tbody>
        </table>
        </div>    
    </body>
</html>
