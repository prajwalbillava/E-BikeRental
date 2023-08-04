<?php
session_start();
include('includes/config.php');

if(isset($_POST['submit']))
{
    $card = $_POST['card'];
    $name = $_POST['name'];
    $expiry = $_POST['expiry'];
    $cvv = $_POST['cv'];
    $amount = $_POST['amount'];
    $useremail = $_POST['idn'];
    $vehicle = $_POST['idv'];
    $status = $_POST['status'];
    $fromdate = $_POST['fromdate'];
    $todate = $_POST['todate'];
    $message = $_POST['message'];

    $sql = "INSERT INTO tblbooking (userEmail, VehicleId, FromDate, ToDate, message, Status, card_number, name, expiry_date, cvv, total_amount) VALUES (:useremail, :vehicle, :fromdate, :todate, :message, :status, :card, :name, :expiry, :cvv, :amount)";
    $query = $dbh->prepare($sql);
    $query->bindParam(':useremail',$useremail,PDO::PARAM_STR);
    $query->bindParam(':vehicle',$vehicle,PDO::PARAM_STR);
    $query->bindParam(':fromdate',$fromdate,PDO::PARAM_STR);
    $query->bindParam(':todate',$todate,PDO::PARAM_STR);
    $query->bindParam(':message',$message,PDO::PARAM_STR);
    $query->bindParam(':status',$status,PDO::PARAM_STR);
    $query->bindParam(':card',$card,PDO::PARAM_STR);
    $query->bindParam(':name',$name,PDO::PARAM_STR);
    $query->bindParam(':expiry',$expiry,PDO::PARAM_STR);
    $query->bindParam(':cvv',$cvv,PDO::PARAM_STR);
    $query->bindParam(':amount',$amount,PDO::PARAM_STR);
    $query->execute();

    $lastInsertId = $dbh->lastInsertId();

    if($lastInsertId) {
        echo "<script>alert('Booking successful.'); window.location.href='index.php';</script>";

    } else {
        echo "<script>alert('Something went wrong. Please try again.');</script>";
    }
}
?>

