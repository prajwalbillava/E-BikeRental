<?php
ob_start();
session_start();
require_once('admin/inc/config.php');
require_once('admin/inc/functions.php');

if(isset($_POST['pay']))
{
 
    $card= $_POST['card'];
    $name= $_POST['name'];
    $expiry= $_POST['expiry'];
    $cvv= $_POST['cv'];
    $amount=$_POST['amount'];
    //$total= $_POST['total'];

    $payment_date = date('Y-m-d H:i:s');
	$payment_id = time();

    $statement = $pdo->prepare("INSERT INTO tbl_payment (
        customer_id,
        customer_name,
        customer_email,
        payment_date,
        paid_amount,
        payment_method,
        payment_status,
        shipping_status,
        payment_id,
        card_number,
        name_card,
        expiry_date,
        cvv

    ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
$statement->execute(array(
        $_SESSION['customer']['cust_id'],
        $_SESSION['customer']['cust_name'],
        $_SESSION['customer']['cust_email'],
        $payment_date,
        $amount,
        'PayPal',
        'Pending',
        'Pending',
        $payment_id,
        $card,
        $name,
        $expiry,
        $cvv
    ));
   // $payment_id = $pdo->lastInsertId();

// Insert product details into the order table
foreach ($_SESSION['cart_p_id'] as $key => $value) {
    $statement = $pdo->prepare("INSERT INTO tbl_order (
        product_id,
        product_name,
        quantity, 
        unit_price, 
        payment_id
    ) VALUES (?,?,?,?,?)");

    $statement->execute(array(
        $_SESSION['cart_p_id'][$key],
        $_SESSION['cart_p_name'][$key],
        $_SESSION['cart_p_qty'][$key],
        $_SESSION['cart_p_current_price'][$key],
        $payment_id
    ));
}


foreach ($_SESSION['cart_p_id'] as $key => $value) {
    $product_id = $_SESSION['cart_p_id'][$key];
    $product_qty = $_SESSION['cart_p_qty'][$key];

    
    $statement = $pdo->prepare("SELECT * FROM tbl_product WHERE p_id=?");
    $statement->execute(array($product_id));
    $product = $statement->fetch(PDO::FETCH_ASSOC);

   
    $new_qty = $product['p_qty'] - $product_qty;

    
    $statement = $pdo->prepare("UPDATE tbl_product SET p_qty=? WHERE p_id=?");
    $statement->execute(array($new_qty, $product_id));
    
}

    unset($_SESSION['cart_p_id']);
    unset($_SESSION['cart_size_id']);
    unset($_SESSION['cart_size_name']);
    unset($_SESSION['cart_color_id']);
    unset($_SESSION['cart_color_name']);
    unset($_SESSION['cart_p_qty']);
    unset($_SESSION['cart_p_current_price']);
    unset($_SESSION['cart_p_name']);
    unset($_SESSION['cart_p_featured_photo']);
    
    echo "Payment successful...";
    echo '<script>';
    echo 'setTimeout(function() {';
    echo '  window.opener.location.reload();';
    echo '  window.close();';
    echo '}, 5000);';
    echo '</script>';
    
}


?>