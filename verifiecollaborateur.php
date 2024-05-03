<?php 
session_start();
require("connectprojet.php");    
$nom=$_POST['username'];
$pass=$_POST['password'];
$req="SELECT * FROM collaborateur";
$stmt=$bd->prepare($req);
$stmt->execute();
$rep=$stmt->fetchAll(PDO::FETCH_ASSOC);
foreach($rep as $row){
    if($row['EmailCollaborateur']==$nom && $row['PasswordCollaborateur']==$pass)
    {
        $_SESSION['idCollaborateur'] = $row['idCollaborateur'];
        header("location:collaborateur.php");
        exit;
    }
}
header("location:PROJEt_login.php");

?>