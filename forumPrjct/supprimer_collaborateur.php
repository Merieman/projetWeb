<?php
// Inclure le fichier de connexion à la base de données
require_once 'connecterBase.php';

// Récupérer les données du formulaire
$collaboratorId = mysqli_real_escape_string($connexion, $_POST['collaboratorId']); // Échapper les caractères spéciaux pour éviter les injections SQL
$projectName = mysqli_real_escape_string($connexion, $_POST['projectName']); // Récupérer le nom du projet

// Requête SQL pour supprimer le collaborateur de la table collaborateurs_projet
$sql = "DELETE FROM collaborateurs_projet WHERE idCollaborateur = '$collaboratorId' AND idProjet = (SELECT idProjet FROM projet WHERE NomProjet = '$projectName')";

// Exécuter la requête
if (mysqli_query($connexion, $sql)) {
    echo "Collaborateur supprimé avec succès !";
} else {
    echo "Erreur lors de la suppression du collaborateur : " . mysqli_error($connexion);
}
?>
