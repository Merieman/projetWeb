<?php
// Inclure le fichier de connexion à la base de données
require_once 'connecterBase.php';

// Vérifier si le nom du projet a été envoyé via la requête POST
if (isset($_POST['projectName'])) {
    // Récupérer le nom du projet à partir de la requête POST
    $projectName = $_POST['projectName'];

    // Vérifier si le projet existe déjà dans la base de données
    $sql_check = "SELECT * FROM projet WHERE NomProjet = '$projectName'";
    $result_check = mysqli_query($connexion, $sql_check);

    if (mysqli_num_rows($result_check) > 0) {
        // Le projet existe déjà, renvoyer un message d'erreur
        echo "exists";
    } else {
        // Le projet n'existe pas
        echo "not_exists";
    }
} else {
    // Si le nom du projet n'a pas été envoyé via la requête POST, afficher un message d'erreur
    echo "Nom du projet non reçu.";
}
?>
