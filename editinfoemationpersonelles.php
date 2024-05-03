<?php
session_start(); // Démarrer la session



require("connectprojet.php");
$UserName=$_POST['UserName'];
$EmailCollaborateur=$_POST['EmailCollaborateur'];
$PhoneCollaborateur=$_POST['PhoneCollaborateur'];
$AdresseCollaborateur=$_POST['AdresseCollaborateur'];



$insertion = $bd->prepare("INSERT INTO collaborateur (UserName,EmailCollaborateur,PhoneCollaborateur,AdresseCollaborateur) VALUES (?,?,?,?)");
$par=array($UserName,$EmailCollaborateur,$PhoneCollaborateur,$AdresseCollaborateur);
$insertion->execute($par);
header("location:profil.php");
?>