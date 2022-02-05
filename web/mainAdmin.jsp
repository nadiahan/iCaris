
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
        <link rel="stylesheet" href="admin.css">
        <style>
            .box {
                margin-top: 20px;
                padding: 5px;
                display: flex;
                justify-content: space-around;
            }
            .cust {
                width: 300px;
                height: 350px; 
                padding-top: 50px;
                background-color: #376b9c;
            }
            .book {
                width: 300px;
                height: 350px; 
                padding-top: 50px;
                background-color: #376b9c;
            }
            .vehicle {
                width: 300px;
                height: 350px; 
                padding-top: 50px;
                background-color: #376b9c;
            }
            .star {
                width: 300px;
                height: 350px; 
                padding-top: 50px;
                background-color: #376b9c;
            }
            .logo {
                width: 160px;
                height: 160px; 
                margin: auto;
                border-radius: 100px;
                background-color: white;
                display: flex;
                justify-content: center;
                align-items: center; 
            }
            h2 {
                display: flex;
                justify-content: center;
                color: white;
                font-family: Arial;
                font-style: italic;
                font-size: 20px;
            }
            .chart {
                background-color: white;
                width: 900px;
                margin: auto;
            }
        </style>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
<!--        <h1>Main</h1>-->

        <div class="box">
            <div class="cust">
                <div class="logo">
                    <img src="img/user.png" style="width:150px;height:150px"/>
                </div>
                <div class="value">
                    <%
                    String driver = "com.mysql.jdbc.Driver";
                    String url = "jdbc:mysql://localhost:3306/";
                    String database = "rentalproject";
                    String userid = "root";
                    String password = "";
                    int usercount=0;
                        
                    try {
                        Class.forName(driver);
                        Connection conn = DriverManager.getConnection(url+database, userid, password);
                        String sqlselect = "select * from users";
                        PreparedStatement ps = conn.prepareStatement(sqlselect);    
                        ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                            usercount++;
                        }
                        usercount = usercount-1;
                        %>
                        <h1><%= usercount%> </h1>
                        <h2>customers</h2>
                        <%
                    }
                    catch(Exception ex){
                        ex.printStackTrace();
                    }
                %>
                </div>
            </div>
            
            <div class="book">
                <div class="logo">
                    <img src="img/key.png" style="width:120px;height:120px"/>
                </div>
                <div class="value">
                    <%
                    int bookcount=0;
                        
                    try {
                        Class.forName(driver);
                        Connection conn = DriverManager.getConnection(url+database, userid, password);
                        String sqlselect = "select * from booking";
                        PreparedStatement ps = conn.prepareStatement(sqlselect);    
                        ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                            bookcount++;
                        }
                        %>
                        <h1><%= bookcount %> </h1>
                        <h2>bookings</h2>
                        <%
                    }
                    catch(Exception ex){
                        ex.printStackTrace();
                    }
                %>
                </div>
            </div>
            
            <div class="vehicle">
                <div class="logo">
                    <img src="img/sedan.png" style="width:150px;height:150px"/>
                </div>
                <div class="value">
                    <%
                    int vehiclecount=0;
                        
                    try {
                        Class.forName(driver);
                        Connection conn = DriverManager.getConnection(url+database, userid, password);
                        String sqlselect = "select * from vehicle";
                        PreparedStatement ps = conn.prepareStatement(sqlselect);    
                        ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                            vehiclecount++;
                        }
                        %>
                        <h1><%= vehiclecount %> </h1>
                        <h2>vehicles</h2>
                        <%
                    }
                    catch(Exception ex){
                        ex.printStackTrace();
                    }
                %>
                </div>
            </div>
            
            <div class="star">
                <div class="logo">
                    <img src="img/stars.png" style="width:130px;height:130px"/>
                </div>
                <div class="value">
                    <%
                    int starscount=0;
                        
                    try {
                        Class.forName(driver);
                        Connection conn = DriverManager.getConnection(url+database, userid, password);
                        String sqlselect = "select * from feedback where stars=?";
                        PreparedStatement ps = conn.prepareStatement(sqlselect);    
                        ps.setInt(1, 5);
                        ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                            starscount++;
                        }
                        %>
                        <h1><%= starscount %> </h1>
                        <h2>total of 5 stars</h2>
                        <%
                    }
                    catch(Exception ex){
                        ex.printStackTrace();
                    }
                %>
                </div>
            </div>
            
        </div>
                <%
                    int five=0;
                    int four=0;
                    int three=0;
                    int two=0;
                    int one=0;
                        
                    try {
                        Class.forName(driver);
                        Connection conn = DriverManager.getConnection(url+database, userid, password);
                        String sqlselect = "select * from feedback";
                        PreparedStatement ps = conn.prepareStatement(sqlselect);    
                        ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                            int star = rs.getInt("stars");
                            if (star == 5)
                            {
                                five++;
                            }
                            else if (star == 4)
                            {
                                four++;
                            }
                            else if (star == 3)
                            {
                                three++;
                            }
                            else if (star == 2)
                            {
                                two++;
                            }
                            else 
                            {
                                one++;
                            }
                        }
                    }
                    catch(Exception ex){
                        ex.printStackTrace();
                    }
                %>
        <div class="chart">        
        <canvas id="myChart" style="width:100%;max-width:800px;margin: auto;"></canvas>
        <script>
            var xValues = ["5 stars", "4 stars", "3 stars", "2 stars", "1 star"];
            var yValues = [<%=five%>, <%=four%>, <%=three%>, <%=two%>, <%=one%>];
            var barColors = [
              "#00ff33",
              "yellow",
              "blue",
              "orange",
              "red"
            ];

            new Chart("myChart", {
              type: "doughnut",
              data: {
                labels: xValues,
                datasets: [{
                  backgroundColor: barColors,
                  data: yValues
                }]
              },
              options: {
                title: {
                  display: true,
                  text: "Customer Reviews"
                }
              }
            });
        </script>
        </div>
    </body>
</html>
