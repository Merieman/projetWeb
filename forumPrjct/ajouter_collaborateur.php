<?php
// Inclure le fichier de connexion à la base de données
require_once 'connecterBase.php';

// Récupérer les données du formulaire
$collaboratorEmail = mysqli_real_escape_string($connexion, $_POST['email']); // Échapper les caractères spéciaux pour éviter les injections SQL
$collaboratorRole = mysqli_real_escape_string($connexion, $_POST['role']); // Échapper les caractères spéciaux pour éviter les injections SQL
$collaboratorId = mysqli_real_escape_string($connexion, $_POST['collaboratorId']); // Échapper les caractères spéciaux pour éviter les injections SQL
$projectName = mysqli_real_escape_string($connexion, $_POST['projectName']); // Récupérer le nom du projet

// Requête SQL pour récupérer l'ID du projet en fonction de son nom
$sql = "SELECT idProjet FROM projet WHERE NomProjet = '$projectName'";

// Exécuter la requête
$result = mysqli_query($connexion, $sql);

// Vérifier s'il y a des résultats
if ($result && mysqli_num_rows($result) > 0) {
    // Récupérer l'ID du projet
    $row = mysqli_fetch_assoc($result);
    $projectId = $row['idProjet'];

    // Requête SQL pour insérer le collaborateur dans la table collaborateurs_projet
    $sql = "INSERT INTO collaborateurs_projet (idCollaborateur, idProjet, Role, Date_Association) 
            VALUES ('$collaboratorId', 
                    '$projectId', 
                    '$collaboratorRole', 
                    NOW())";

    // Exécuter la requête
    if (mysqli_query($connexion, $sql)) {
        echo "Collaborateur ajouté avec succès !";
    } else {
        echo "Erreur lors de l'ajout du collaborateur : " . mysqli_error($connexion);
    }
} else {
    // Gérer l'erreur si aucun projet correspondant n'est trouvé
    echo "Erreur : Aucun projet correspondant trouvé.";
    exit; // Arrêter l'exécution du script
}
?>
