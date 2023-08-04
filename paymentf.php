<style>
  #payment-form {
    max-width: 400px;
    margin: 0 auto;
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 10px;
  }
  #payment-form label {
    display: block;
    margin-bottom: 10px;
  }
  #payment-form input[type="text"],
  #payment-form #cardNumber,
  #payment-form #expiryDate,
  #payment-form #cvc {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 5px;
    margin-bottom: 10px;
  }
  #payment-form button {
    background-color: #007bff;
    border: none;
    color: #fff;
    padding: 10px 20px;
    border-radius: 5px;
  }
  #payment-form button:hover {
    background-color: #0069d9;
    cursor: pointer;
  }
</style>
<?php
if(isset($_REQUEST['id'])) {
  
    $total= $_REQUEST['id'];
    $useremail = $_REQUEST['idn'];
    $vehicle = $_REQUEST['idv'];
    $status = $_REQUEST['status'];
    $fromdate = $_REQUEST['fromdate'];
    $todate = $_REQUEST['todate'];
    $message = $_REQUEST['message'];

?>


<form id="payment-form" method="POST" action="payment.php" style="margin: auto; max-width: 400px; margin-top: 50px;">
<div style="display: flex; align-items: center;">
<h3 height="50px" style="margin-right: 10px; font-size: 24px;">E-BIKE RENTAL</h3>


  <h1 style="margin: 0;">Payment details</h1>
</div>
<hr style="margin: 10px auto; width: 100%;">
    <div class="form-group">
    <label for="cardNumber">Card number</label>
    <input type="text" id="cardNumber" name="card" placeholder="XXXXXXXXXXXX" class="form-control" maxlength="12" pattern="[0-9]*" required>

    <input type="hidden" name="idn" value="<?php echo $useremail ;?>">
    <input type="hidden" name="idv" value="<?php  echo $vehicle ;?>">
    <input type="hidden" name="status" value="<?php echo $status ;?>">
    <input type="hidden" name="fromdate" value="<?php  echo $fromdate ;?>">
    <input type="hidden" name="todate" value="<?php  echo $todate ;?>">
    <input type="hidden" name="message" value="<?php echo $message;?>">
    
</div>


<div class="form-group">
  <label for="name">Name on card</label>
  <div style="display: flex;">
    <input type="text" id="name" name="name" class="form-control" style="margin-right: 10px;">
    <img src="includes/qr1.jpg" style="height: 150px; margin-left: 60px;">

  </div>
</div>
<div class="form-group">
    <label for="expiryDate">Expiry Date</label>
    <input type="text" id="expiryDate" placeholder="MM/YY" name="expiry" class="form-control">
    
</div>
    <div class="form-group">
        <label for="cvc">CVV</label>
        <input type="text" id="cvv" placeholder="cvv" name="cv" class="form-control" >
    </div>
    <hr style="margin: 10px auto; width: 100%;">
    <br>
    <div class="form-group">
        <label   for="total">Total Amount: Rs.<?php echo $total ;?>
        <input type="hidden" name="amount" value="<?php echo $total; ?>">
        </label>
    </div>
    <br>
    <div style="text-align: center;">
    <button type="submit" class="btn btn-primary" name="submit" style=" background-color: #428bca; border-color: #357ebd; color: white; padding: 10px; font-size: 16px; border-radius: 5px; width: 100%;">Pay</button>

</div>
</form>
<?php } else {
    echo "Error: No ID specified.";
} ?>
