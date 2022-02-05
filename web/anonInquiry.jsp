<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="customer/inquiry.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta charset="UTF-8">
<!--bawah ni punca dia jadi indented-->
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"> -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <%@include file="indexheader.jsp" %>
<br><br>
<div class="inquiryform">
  <form action="" method="post">
      <h3>Inquiry Form</h3>
      <div class="container2">
          <label for="fname">Name </label>
          <input type="text" id="name" name="name" placeholder="Your name...">

        <label for="lname">Title</label>
        <input type="text" id="title" name="title" placeholder="Title.." required>

        <label for="subject">Inquiries</label>
        <input type="text" id="inquiry" name="inquiry" placeholder="Write something.."  style="height:200px" required>
    <!--    <textarea type="text" id="subject" name="subject" placeholder="Write something.."></textarea>-->
     </div>
      
      <div class="container3">
        <button class="login-button" id="button" name="login" type="submit">Submit</button>
      </div> 
  </form>
    
<!--        <div id="Inquiry" class="modal fade">
                    <div class="modal-dialog modal-confirm">
                            <div class="modal-content">
                                    <div class="modal-header">
                                            <div class="icon-box">
                                                <img src ="https://media.istockphoto.com/vectors/green-tick-checkmark-vector-icon-for-checkbox-marker-symbol-vector-id1079725292?k=20&m=1079725292&s=612x612&w=0&h=PQB6T2JxK4NILecaf1MBcuZmvP2G5wYKNJ3doMsGVrk=" width="50px">
                                            </div>				

                                        <h4 class="modal-title w-100">Awesome!</h4>	
                                    </div>
                                    <div class="modal-body">
                                            <p class="text-center">Your inquiry has been sent. Click "OK" to confirm.</p>
                                    </div>
                                    <div class="modal-footer">
                                            <button type="button" class="btn btn-primary btn-lg btn-block" onClick="refreshPage()" >Ocayy you, maceh</button>
                                            <button class="btn btn-success btn-block"  data-dismiss="modal">OK</button>
                                    </div>
                            </div>
                    </div>
        </div> -->
<!--     <script>
    // Get the modal
    var modal = document.getElementById("Inquiry");

    // Get the button that opens the modal
    var btn = document.getElementById("button");

   

    // When the user clicks the button, open the modal 
    btn.onclick = function() {
      modal.style.display = "block";
    }

    

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target === modal) {
        modal.style.display = "none";
      }
    }
    </script>-->
  
</div>


</body>
</html>