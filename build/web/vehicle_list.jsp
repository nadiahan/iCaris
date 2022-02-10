
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">-->
        <title>Vehicles List</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--                <link rel="stylesheet" href="admin.css">-->
        <style>
            /*            @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,500;1,500&display=swap');*/

            .containerList{
                
                display: flex;
                justify-content: center;

/*                background-color: red;*/
                /*
                                      
                padding-bottom: 100px;*/

            }
            .bigCont{
                
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;

/*                background-color: green;*/
                
            }

            .addsearch{
/*                                background-color: yellow;*/
                display: flex;
                flex-direction: row;
                justify-content: flex-end;
                padding: 2% 2%;
                


            }

            .titleList{
                font-family: "Montserrat", sans-serif;
                font-weight: bold;
                font-size: 40px;
                color: #edf0f1;
                text-decoration: none;
                letter-spacing: 2px;
                text-align: center;
/*                background-color: red;*/
            }

            .sizedBox1{
                width: 15px;
            }

            .inpBox{

                padding: 6px 9px;
                width: 250px;
                border-radius: 5px;

            }

            .searchBtn{
                font-size: 18px;
                padding: 4px 8px;
                transition: all 0.3s ease 0s;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.6);
                border-radius: 5px;
                background-color: #0052A2;
                color: white;
                border-color: transparent;
            }

            .addBtn{

                font-size: 18px;
                padding: 4px 8px;
                transition: all 0.3s ease 0s;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.6);
                border-radius: 5px;
                background-color: #708090;
                color: white;
                border-color: transparent;


            }

            .btn:hover{

                transition: all 0.3s ease 0s;
                border-bottom-left-radius: 0px;
                border-top-left-radius: 20px;
                border-bottom-right-radius: 20px;
                border-top-right-radius: 0px;


            }
            
            .tableList,thead,td,tr,th{
                
                padding:12px 15px;
                font-family: "Montserrat", sans-serif;
                text-align: center;
                color: white;
                font-size: 18px;
/*                border: none;*/
                
                
            }
            
            .tableList{
                border-radius: 30px;
            }
            
            th{
                background-color: #0052A2;
            }
            
            td{
                background-color: #708090;
            }
            
            




        </style>
    </head>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <p class="titleList">Vehicles List</p>
        <div class="bigCont">
        <div class="addsearch">
           
                <form class="searchinfo" action="search_vehicle.jsp" method="post">                  
                    <input class="inpBox" name="searchinfo" type="text">
                    <button class="btn searchBtn" type="submit" class="submit">Search</button>                   
                </form>
          

            <div class="sizedBox1"></div>

    
                <form class="addinfo" action="svlt4" method="post">
                    <button class="btn addBtn" type="submit" class="add">Add new vehicle</button>
                </form>
   
        </div>

        <div class="containerList">
            <table class="tableList">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Brand</th>
                        <th scope="col">Vehicle Model</th>
                        <th scope="col">Registration No</th>
                        <th scope="col">Transmission</th>
                        <th scope="col">Price (RM)</th>
                        <th scope="col">RoadTax Expiry Date</th>
                        <th scope="col">View</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "rentalproject";
                        String userid = "root";
                        String password = "";

                        //String id = " ";
                        try {
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl + database, userid, password);

                            //prepared statement
                            String sqlselect = "select * from vehicle";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);

                            ResultSet rs = ps.executeQuery();

                            while (rs.next()) {

                    %>    
                    <tr>
                        <th scope="row"> <%=rs.getString("vehicleID")%></th>
                        <td> <%= rs.getString("brand")%> </td>
                        <td> <%= rs.getString("model")%> </td>
                        <td> <%= rs.getString("vehicleNo")%> </td>
                        <td> <%= rs.getString("transmission")%> </td>
                        <td> <%= rs.getInt("price")%> </td>
                        <td> <%= rs.getString("rdTaxExpiry")%> </td>
                        <td><a href="viewVehicle.jsp?vehicleID=<%=rs.getString("vehicleID")%>"><i class="material-icons" style="font-size:24px">chevron_right</i></td>
                    </tr>
                    <%
                            }

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>

                </tbody>
            </table>
        </div> 
        </div>

    </body>
</html>
