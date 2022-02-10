<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="inquiry.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta charset="UTF-8">
<!--bawah ni punca dia jadi indented-->
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"> -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <%@include file="../customer/customerHeader.jsp" %>
    <% 
        String inqCount = (String)(session.getAttribute("inqCount").toString());
        String fname = (String)(session.getAttribute("fname"));
        String lname = (String)(session.getAttribute("lname"));
    %>

        <script type="text/javascript">
           
            $(document).ready(function(){
                if (<%=inqCount%>>0)
            $("#Inquiry").modal('show');
            });
        </script>
        <div id="Inquiry" class="modal fade">
                    <div class="modal-dialog modal-confirm">
                        <div class="modal-content">
                                <div class="modal-header">
                                        <div class="icon-box">
                                            <img src ="https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/White_check.svg/768px-White_check.svg.png" width="50px">
                                        </div>				
                                        
                                    <h4 class="modal-title w-100">Awesome!</h4>	
                                </div>
                                <div class="modal-body">
                                        <p class="text-center">Your inquiry has been sent. <br>We will give you a reply very soon. Thank you.</p>
                                </div>
                                <div class="modal-footer">
                                        <button type="button" class="btn btn-primary btn-lg btn-block" onClick="refreshPage()" >Okay</button>
<!--                                        <button class="btn btn-success btn-block"  data-dismiss="modal">OK</button>-->
                                </div>
                        </div>
                </div>
        </div>  
<br><br>
<div class="inquiryform">
  <form action="../addInquiry" method="post">
      <h3>Inquiry Form</h3>
      <div class="container2">
          <label for="fname">Name</label>
          <input type="text" id="name" name="name" value="<% out.print(fname + " " + lname);   %>" disabled>

        <label for="lname">Title</label>
        <input type="text" id="title" name="title" placeholder="Title.." required>

        <label for="subject">Inquiries</label>
        <input type="text" id="inquiry" name="inquiry" placeholder="Write something.."  style="height:200px" required>
    <!--    <textarea type="text" id="subject" name="subject" placeholder="Write something.."></textarea>-->
     </div>
      
      <div class="container3">
        <button class="login-button" name="login" type="submit">Submit</button>
      </div>
  </form>
     
  
</div>
<% session.setAttribute("inqCount", 0); 
// response.setIntHeader("Refresh", 1);
%> 
    <script>
    function refreshPage(){
                window.location.reload();
            } 
    </script>
</body>
</html>