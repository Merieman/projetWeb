<?php
// Informations de connexion à la base de données
$serveur = "localhost"; // Hôte de la base de données
$utilisateur = "root"; // Nom d'utilisateur MySQL
$motDePasse = ""; // Mot de passe MySQL
$baseDeDonnees = "projet"; // Nom de la base de données

// Connexion à la base de données
$connexion = mysqli_connect($serveur, $utilisateur, $motDePasse, $baseDeDonnees);

// Vérification de la connexion
if (!$connexion) {
    die("La connexion à la base de données a échoué : " . mysqli_connect_error());
} else {
   // echo "Connexion réussie à la base de données.";
    // Vous pouvez effectuer des opérations sur la base de données ici
}

?>
