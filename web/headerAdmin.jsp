<!DOCTYPE html>
<html lang="en">
  <head>
 
    <!-- Bootstrap CSS -->
   
<!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">-->
    
    <title>Index.html</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,500;1,500&display=swap');
    html,body{  
    margin: 0;
    padding: 0;
    background: url("img/bg.png")no-repeat;
    background-size: cover;

}

li, a, button{
    font-family: "Montserrat", sans-serif;
    font-weight: 500;
    font-size: 25px;
    color: #edf0f1;
    text-decoration: none;

}

header{
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0px 70px 0px;
    background-color: transparent;


}

/*.logo{
    position: absolute;
    top:10px;
    left:100px;

}*/

.logout-button{
    background-color: transparent;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    transition: all 0.3s ease 0s;
}

.logout-button:hover{

    opacity: 0.8;
}

.nav-links{
    list-style: none;
}

.nav-links li{
    display: inline-block;
    padding: 0px 60px;

}

.nav-links li {
    transition: all 0.3s ease 0s;
}

.nav-links li a:hover{

    color: #edf0f1;
    border-bottom: 1px solid white;

}

#loginHeader{

    padding: 0px 0px 0px 10px;
    border-right: 2px solid white;
}

#regHeader{
    padding: 0px 10px 0px 0px;
}

#inquiryHeader{
    padding: 0px 60px 0px 30px;
}

.title{
    font-size: 70px;
    color: white;
    font-family: "Montserrat", sans-serif;
    

}

.container{
/*    background-color: red;*/
    margin-top: 8%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.bookButton{
    
    background-color: #0052A2;
  
    
}



    </style>
  </head>
  <body>


        <header>
            <a href="#"><img class="logo" src="img/iCARis logo.png" alt="logo"style=" width:150px; height:150px"></a>
            <nav>
                <ul class="nav-links">
                    <li><a href="booking_list.jsp">Bookings</a></li>
                    <li><a href="vehicle_list.jsp">Vehicles</a></li>
                    <li><a href="customer_list.jsp">Customers</a></li>
                    <li><a href="inquiry_list.jsp">Inquiries</a></li>
                    
                    
                </ul>
             
            </nav>
            <a href="login_register/logout.jsp"><img src="img/logout-symbol.svg" style="width:50px; height:50px"></a>
           

        </header>
 </body>
</html>

<!--<div class="headadmin">
            <div class="menu">
                <a href="mainAdmin.jsp"><img src="img/iCARis logo.png" style="width:70px; height:70px"></a>
                <div class="bookings"><a href="booking_list.jsp">Bookings</a></div>
                <div class="vehicles"><a href="vehicle_list.jsp">Vehicles</a></div>
                <div class="customers"><a href="customer_list.jsp">Customers</a></div>
                <div class="inquiries"><a href="inquiry_list.jsp">Inquiries</a></div>
                 <div class="profile"><a href="admin_profile.jsp"><img src="img/profile.png" style="width:45px; height:50px"></a></div>
                 <div class="logout"><a href="login_register/logout.jsp"><img src="img/logout-symbol.svg" style="width:50px; height:50px"></a></div>
            </div>
        </div>-->