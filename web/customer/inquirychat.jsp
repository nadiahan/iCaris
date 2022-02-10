<%-- 
    Document   : inquirylist
    Created on : Feb 9, 2022, 7:19:40 PM
    Author     : Asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
            background:#eee;
            display: grid;
          height: 100%;
          place-items: center;
          text-align: center;
          background: url("../img/bg.png")no-repeat;
          background-size: cover;
        }
        .chat-list {
            padding: 0;
            font-size: .8rem;
        }

        .chat-list li {
            margin-bottom: 10px;
            overflow: auto;
            color: #ffffff;
        }

        .chat-list .chat-img {
            float: left;
            width: 70px;
            padding-left: 20px;
        }

        .chat-list .chat-img img {
            -webkit-border-radius: 50px;
            -moz-border-radius: 50px;
            border-radius: 50px;
            width: 100%;
        }

        .chat-list .chat-message {
            -webkit-border-radius: 50px;
            -moz-border-radius: 50px;
            border-radius: 50px;
            background: #5a99ee;
            display: inline-block;
            padding: 10px 20px;
            position: relative;
        }

        .chat-list .chat-message:before {
            content: "";
            position: absolute;
            top: 15px;
            width: 0;
            height: 0;
        }

        .chat-list .chat-message h5 {
            margin: 0 0 5px 0;
            font-weight: 600;
            line-height: 100%;
            font-size: .9rem;
        }

        .chat-list .chat-message p {
            line-height: 18px;
            margin: 0;
            padding: 0;
        }

        .chat-list .chat-body {
            margin-left: 20px;
            float: left;
            width: 70%;
        }

        .chat-list .in .chat-message:before {
            left: -12px;
            border-bottom: 20px solid transparent;
            border-right: 20px solid #5a99ee;
        }

        .chat-list .out .chat-img {
            float: right;
        }

        .chat-list .out .chat-body {
            float: right;
            margin-right: 20px;
            text-align: right;
        }

        .chat-list .out .chat-message {
            background: #fc6d4c;
        }

        .chat-list .out .chat-message:before {
            right: -12px;
            border-bottom: 20px solid transparent;
            border-left: 20px solid #fc6d4c;
        }

        .card .card-header:first-child {
            -webkit-border-radius: 0.3rem 0.3rem 0 0;
            -moz-border-radius: 0.3rem 0.3rem 0 0;
            border-radius: 0.3rem 0.3rem 0 0;
        }
        .card .card-header {
            background: #17202b;
            border: 0;
            font-size: 1rem;
            padding: .65rem 1rem;
            position: relative;
            font-weight: 600;
            color: #ffffff;
        }

        .content{
            
            margin-top:40px;
            width: 500px;
            background-color:#ffffff;
            border-radius: 5px;
        }
        
        .backBtn{
                font-family: "Montserrat", sans-serif;
                font-weight: 500;
                font-size: 25px;
                color: #edf0f1;
                margin: 30px 0px 0px 30px;
                letter-spacing: 2px;
                text-decoration: none;
                display: inline-block;
                float: left;
            }

            .backBtn:hover{
                color: #edf0f1;
                border-bottom: 1px solid white;
            }
        </style>
    
    </head>
    <body>
        <div class="header">

            <a href="currentBooking.jsp"><p class="backBtn"><img src = "../img/back.png" width="30px">&nbsp Return</p></a>

        </div>
    <div class="container content">
    <div class="row">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
        	<div class="card">
        		<div class="card-header">Inquiries</div>
        		<div class="card-body height3">
                             <%
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "rentalproject";
                        String userid = "root";
                        String password = "";
                      //  int A_ID= Integer.parseInt(session.getAttribute("A_ID").toString());
                        
                        //String id = " ";
                        
                        String sreturnDate=(String)session.getAttribute("sreturnDate");
                        String spickupDate=(String)session.getAttribute("spickupDate");
                        
                        
                        try {
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                           
                            //prepared statement
                            String sqlselect = "select * from inquiry where inquiryID = '1'";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
   
                            ResultSet rs = ps.executeQuery();
                            
                            
                            
                            String sqlselect2 = "select * from reply where inquiryID = '1'";
                            PreparedStatement ps2 = conn.prepareStatement(sqlselect2);
   
                            ResultSet rs2 = ps2.executeQuery();
                            while(rs2.next()){
                                 while(rs.next()){
           
                            %>    
        			<ul class="chat-list">
        				<li class="out">
        					<div class="chat-img">
        						<img alt="Avtar" src="https://i.pinimg.com/originals/0c/3b/3a/0c3b3adb1a7530892e55ef36d3be6cb8.png" width>
        					</div>
        					<div class="chat-body">
        						<div class="chat-message">
        							<h5>You</h5>
        							<p><%= rs.getString("message")%></p>
        						</div>
        					</div>
        				</li>
                                        <li class="in">
        					<div class="chat-img">
        						<img alt="Avtar" src="../img/iCARis logo.png">
        					</div>
        					<div class="chat-body">
        						<div class="chat-message">
        							<h5>iCaris</h5>
        							<p><%= rs2.getString("message")%></p>
        						</div>
        					</div>
        				</li>
        			</ul>
                                <%
                            
                            }
                       }
}
                        catch(Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
        		</div>
        	</div>
        </div>
    </div>
    </div>
    </body>
</html>
