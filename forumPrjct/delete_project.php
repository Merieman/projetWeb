<?php
// Inclure le fichier de connexion à la base de données
require_once 'connecterBase.php';

// Vérifier si le nom du projet a été envoyé via la requête POST
if (isset($_POST['projectName'])) {
    // Récupérer le nom du projet à partir de la requête POST
    $projectName = $_POST['projectName'];

    // Récupérer l'id du projet
    $sql_get_project_id = "SELECT idProjet FROM projet WHERE NomProjet = '$projectName'";
    $result_get_project_id = mysqli_query($connexion, $sql_get_project_id);

    if ($result_get_project_id && mysqli_num_rows($result_get_project_id) > 0) {
        $row = mysqli_fetch_assoc($result_get_project_id);
        $projectId = $row['idProjet'];

        // Supprimer les entrées de la table collaborateurs_projet liées à ce projet
        $sql_delete_collaborators = "DELETE FROM collaborateurs_projet WHERE idProjet = '$projectId'";
        $result_delete_collaborators = mysqli_query($connexion, $sql_delete_collaborators);

        if ($result_delete_collaborators) {
            // Maintenant que toutes les entrées de collaborateurs_projet sont supprimées,
            // on peut supprimer le projet de la table projet
            $sql_delete_project = "DELETE FROM projet WHERE NomProjet = '$projectName'";
            $result_delete_project = mysqli_query($connexion, $sql_delete_project);

            if ($result_delete_project) {
                // Si la suppression s'est bien déroulée, renvoyer une réponse de succès
                echo "success";
            } else {
                // Si une erreur s'est produite lors de la suppression du projet, renvoyer un message d'erreur
                echo "Erreur lors de la suppression du projet de la base de données : " . mysqli_error($connexion);
            }
        } else {
            // Si une erreur s'est produite lors de la suppression des collaborateurs associés au projet, renvoyer un message d'erreur
            echo "Erreur lors de la suppression des collaborateurs associés au projet : " . mysqli_error($connexion);
        }
    } else {
        // Si le projet n'a pas été trouvé dans la base de données, renvoyer un message d'erreur
        echo "Le projet n'existe pas dans la base de données.";
    }
} else {
    // Si le nom du projet n'a pas été envoyé via la requête POST, afficher un message d'erreur
    echo "Nom du projet non reçu.";
}
?>
