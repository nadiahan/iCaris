<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="inquiry.css">
</head>
<body>


<%@include file="../customer/customerHeader.jsp" %>
<div class="container">
  <form action="/action_page.php">
      <h3>Inquiry Form</h3>
      <div class="container2">
    <label for="fname">Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name..">

    <label for="lname">Title</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name..">

    <label for="subject">Inquiries</label>
    <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="Submit">
  </form>
    </div>
</div>

</body>
</html>