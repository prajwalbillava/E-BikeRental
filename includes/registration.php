<?php
//error_reporting(0);
if(isset($_POST['submit']))
{
$fname=$_POST['fullname'];
$email=$_POST['emailid']; 
$mobile=$_POST['mobileno'];
$password=md5($_POST['password']); 
$sql="INSERT INTO  tblusers(FullName,EmailId,ContactNo,Password) VALUES(:fname,:email,:mobile,:password)";
$query = $dbh->prepare($sql);
$query->bindParam(':fname',$fname,PDO::PARAM_STR);
$query->bindParam(':email',$email,PDO::PARAM_STR);
$query->bindParam(':mobile',$mobile,PDO::PARAM_STR);
$query->bindParam(':password',$password,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
echo "<script>alert('Registration successfull. Now you can login');</script>";
}
else 
{
echo "<script>alert('Something went wrong. Please try again');</script>";
}
}

?>


<script>
function checkAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'emailid='+$("#emailid").val(),
type: "POST",
success:function(data){
$("#user-availability-status").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>
<script type="text/javascript">
function valid()
{
if(document.signup.password.value!= document.signup.confirmpassword.value)
{
alert("Password and Confirm Password Field do not match  !!");
document.signup.confirmpassword.focus();
return false;
}
return true;
}
</script>
<div class="modal fade" id="signupform">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Sign Up</h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="signup_wrap">
            <div class="col-md-12 col-sm-6">
            <form action="" method="post" onsubmit="return validateForm()">
   <h3>Register Now</h3>
   <label for="name">Name:</label>
   <input type="text" id="name" name="fullname" required pattern="[A-Za-z ]+" placeholder="Enter your name" maxlength="50">

   <label for="email">Email:</label>
   <input type="email" id="email" name="emailid" required placeholder="Enter your email" maxlength="50">

   <label for="phone">Phone:</label>
   <input type="tel" id="phone" name="mobileno" required placeholder="Enter your phone number" minlength="10" maxlength="10" oninput="this.value = this.value.replace(/\D/g,'')">

   <!--<label for="licence">Liecence:</label>
   <input type="text" id="licience" name="liecence" required placeholder="Enter your Licence number" minlength="10" maxlength="10" >
   <label for="adhar">Adhar NO:</label>
   <input type="text" id="adhar" name="adharno" required placeholder="Enter your Adhar number" minlength="12" maxlength="12" oninput="this.value = this.value.replace(/\D/g,'')" >-->
   
   <label for="password">Password:</label>
   <input type="password" id="password" name="password" required placeholder="Enter your password" minlength="8" maxlength="50">

   <label for="confirm-password">Confirm Password:</label>
   <input type="password" id="confirmpassword" name="confirmpassword" required placeholder="Confirm your password" minlength="8" maxlength="50">

   <input type="submit" value="Register Now" name="submit" class="btn">

   <!--<p>Already have an account? <a href="login.php">Log in now</a></p>-->

   <div id="error-message" style="color:red; display:none;"></div>
</form>

<script>
function validateForm() {
   var nameInput = document.getElementById("name");
   if (!nameInput.checkValidity()) {
      displayErrorMessage("Name should only contain alphabetic characters");
      return false;
   }

   var phoneInput = document.getElementById("phone");
   if (phoneInput.value.length !== 10) {
      displayErrorMessage("Phone number should be exactly 10 digits");
      return false;
   }

   var passwordInput = document.getElementById("password");
   var confirmPasswordInput = document.getElementById("confirm-password");
   if (passwordInput.value !== confirmPasswordInput.value) {
      displayErrorMessage("Passwords do not match");
      return false;
   }

   return true;
}

function displayErrorMessage(message) {
   var errorMessage = document.getElementById("error-message");
   errorMessage.innerHTML = message;
   errorMessage.style.display = "block";
}

</script>
<style>
  form {
   display: flex;
   flex-direction: column;
   align-items: center;
   margin: 50px auto;
   max-width: 500px;
   padding: 20px;
   background-color: #f7f7f7;
   border-radius: 10px;
}

h3 {
   font-size: 28px;
   margin-top: 0;
}

label {
   display: block;
   margin-top: 10px;
}

input[type="text"],
input[type="email"],
input[type="tel"],
input[type="password"] {
   width: 100%;
   padding: 10px;
   margin-top: 5px;
   margin-bottom: 15px;
   border-radius: 5px;
   border: 1px solid #ccc;
}

input[type="submit"] {
   width: 100%;
   padding: 10px;
   margin-top: 15px;
   border-radius: 5px;
   border: none;
   background-color: #4CAF50;
   color: #fff;
   font-size: 16px;
   cursor: pointer;
}

input[type="submit"]:hover {
   background-color: #3e8e41;
}

p {
   margin-top: 15px;
}

#signupform
{
   overflow-y:scroll;
}

#signupform::-webkit-scrollbar
{
   display:none;
}

#error-message {
   margin-top: 15px;
   text-align: center;
}
</style>
            </div>
            
          </div>
        </div>
      </div>
      <div class="modal-footer text-center">
        <p>Already got an account? <a href="#loginform" data-toggle="modal" data-dismiss="modal">Login Here</a></p>
      </div>
    </div>
  </div>
</div>