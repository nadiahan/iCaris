<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%@include file="loginheader.jsp" %>
       
        
        
        
    <div class="login"> 
        <form class = "kotakluar" method="post">
            <img src="../img/iCARis logo.png" style="display: block; margin-left: auto; margin-right: auto; width: 45%">
            <h1>iCaris Car Rental</h1>
          <input type="text" name="u" placeholder="Username" required="required" />
            <input type="password" name="p" placeholder="Password" required="required" />
            <button type="submit" onclick="myFunction()" class="btn btn-primary btn-block btn-large" style="margin-bottom: 5px">Login.</button>
            <a href="register.jsp" class = "btn btn-secondary">Does not have an account? Register here</a>
            <%@include file="loginvalidator.jsp" %>
        </form>
    </div>
    </body>
</html>