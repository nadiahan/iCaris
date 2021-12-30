

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <title>JSP Page</title>
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <h1>Inquiry List Page</h1>
        
        <div class="addsearch">
        <div class="searchinformation">
            <form class="searchinfo" action="svlt1" method="post">
                <div class="search">
                    <input name="searchinfo" type="text">
                    <button type="submit" class="submit">Search</button>
                </div>
                 </form>
        </div>
        
        </div>
        
        <div class="container">
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Title</th>
                    <th scope="col">Date</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
      
            </tbody>
        </table>
        </div>    
        
    </body>
</html>
