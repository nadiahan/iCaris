<!DOCTYPE html>
<html lang="en">
  <head>
 
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="indexStyles.css">
<!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">-->
    
    <title>Index.html</title>
    <style>
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

.sizedbox1{
    height: 70px;
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

.faqButton{
    background-color: #708090;
/*    border-bottom-right-radius: 30px;
    border-top-right-radius: 30px;*/
    
}

.twinBtn{
    font-size: 30px;
    padding: 8px 12px;
    transition: all 0.3s ease 0s;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.6);
/*    border-bottom-left-radius: 30px;
    border-top-left-radius: 30px;
    border-bottom-right-radius: 30px;
    border-top-right-radius: 30px;*/
    border-radius: 5px;
}

.twinBtn:hover{
    
/*    border-radius: 0px;*/
/*    box-shadow: 0 4px 8px 0 rgba(8, 104, 159, 0.9);*/
/*   opacity: 0.8;*/
    border-bottom-left-radius: 0px;
    border-top-left-radius: 30px;
    border-bottom-right-radius: 30px;
    border-top-right-radius: 0px;
}

    </style>
  </head>
  <body>


        <header>
            <a href="#"><img class="logo" src="img/iCARis logo.png" alt="logo"style=" width:150px; height:150px"></a>
            <nav>
                <ul class="nav-links">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="vehiclesDisplay.jsp">Vehicles</a></li>
                    <li id="inquiryHeader"><a href="anonInquiry.jsp">Inquiries</a></li>
                    <li id="loginHeader"><a href="login_register/login.jsp">Login &nbsp;</a></li>
                    <li id="regHeader"><a href="login_register/register.jsp">&nbsp;Register</a></li>
                    
                </ul>
            </nav>
           

        </header>
 </body>
</html>