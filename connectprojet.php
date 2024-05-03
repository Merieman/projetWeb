<?php 
try {
    $bd=new PDO("mysql:host=localhost;dbname=projet","root","");
} catch (PDOException $e) {
    echo "error". $e->getMessage();
}
?>