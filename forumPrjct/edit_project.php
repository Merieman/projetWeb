<?php
// Inclure le fichier de connexion à la base de données
require_once 'connecterBase.php';

// Vérifier si les données nécessaires ont été envoyées via la requête POST
if (isset($_POST['projectName']) && isset($_POST['newProjectName']) && isset($_POST['newProjectStatus'])) {
    // Récupérer les données du formulaire
    $projectName = $_POST['projectName'];
    $newProjectName = $_POST['newProjectName'];
    $newProjectStatus = $_POST['newProjectStatus'];
    
    // Préparer la requête SQL pour mettre à jour le projet
    $sql = "UPDATE projet SET NomProjet = ?, Statut = ? WHERE NomProjet = ?";

    // Préparer et exécuter la déclaration SQL
    $stmt = mysqli_prepare($connexion, $sql);
    mysqli_stmt_bind_param($stmt, "sss", $newProjectName, $newProjectStatus, $projectName);
    $success = mysqli_stmt_execute($stmt);

    // Vérifier si la mise à jour s'est bien déroulée
    if ($success) {
        // Envoyer une réponse de succès
        echo "le projet : $newProjectName a changé d'état avec success 
"; 
        echo "Etat: $newProjectStatus";
    } else {
        // En cas d'erreur, renvoyer un message d'erreur
        echo "Erreur lors de la mise à jour du projet : " . mysqli_error($connexion);
    }

    // Fermer la déclaration et la connexion à la base de données
    mysqli_stmt_close($stmt);
   // mysqli_close($connexion);
} else {
    // Si des données sont manquantes, renvoyer un message d'erreur
    //echo "Données manquantes pour la mise à jour du projet.";
}
?>
