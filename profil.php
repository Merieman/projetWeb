<?php
session_start(); // Démarrer la session



require("connectprojet.php");    

// Récupérer l'identifiant du collaborateur de la session
$idCollaborateur = $_SESSION['idCollaborateur'];


 
$req = "SELECT * FROM collaborateur WHERE idCollaborateur = :id";
$stmt = $bd->prepare($req);
$stmt->bindParam(':id', $idCollaborateur, PDO::PARAM_INT); // Lier le paramètre
$stmt->execute();
$collaborateur = $stmt->fetch(PDO::FETCH_ASSOC); // Récupérer le collaborateur connecté

$reqProjet = "SELECT p.nomprojet 
              FROM collaborateurs_projet cp 
              JOIN projet p ON cp.idprojet = p.idprojet 
              WHERE cp.idcollaborateur = :id";
$stmtProjet = $bd->prepare($reqProjet);
$stmtProjet->bindParam(':id', $idCollaborateur, PDO::PARAM_INT);
$stmtProjet->execute();

// Obtenir tous les projets du collaborateur
$projets = $stmtProjet->fetchAll(PDO::FETCH_ASSOC);
$reqCompetence = "SELECT c.nomcompetence, cc.level 
                  FROM collaborateurs_competence cc 
                  JOIN competence c ON cc.idcompetence = c.idcompetence 
                  WHERE cc.idcollaborateur = :id";
$stmtCompetence = $bd->prepare($reqCompetence);
$stmtCompetence->bindParam(':id', $idCollaborateur, PDO::PARAM_INT);
$stmtCompetence->execute();

// Récupérer toutes les compétences associées au collaborateur
$competences = $stmtCompetence->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">


<title>profile edit data and skills - Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style type="text/css">
    body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .sidebar {
            width: 250px;
            background-color: #333;
            color: #fff;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .sidebar li {
            padding: 10px;
            border-bottom: 1px solid #555;
        }
        .sidebar a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
        }
        .logo {
            display: flex;
            flex-direction: column; /* Permet d'aligner l'image et le texte verticalement */
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #555;
        }
        .logo img {
            width: 70%; /* Définissez ici la largeur souhaitée pour l'image */
            height: auto; /* Hauteur automatique pour maintenir les proportions */
            margin-bottom: 10px; /* Espacement entre l'image et le texte */
        }
        .logo h1 {
            margin: 0;
            padding: 0;
            font-size: 20px;
            font-family: Algerian, sans-serif;
        }
        .content {
            margin-left: 25px;
            padding: 20px;
        }
        .panel-content,
.panel-social {
    position: relative;
    border-radius: 0 0 50px 50px;
}

.panel-content {
    border-top: 1px solid #eee;
    padding: 61px 40px 53px;
}
.main-body{
    margin-left: 200px;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid transparent;
    border-radius: .25rem;
    margin-bottom: 1.5rem;
    box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
}
.me-2 {
    margin-right: .5rem!important;
}
.save-changes-btn {
    background-color: #333; /* même couleur que le menu latéral */
    color: #fff; /* texte blanc pour correspondre */
    border: none; /* pas de bordure */
    padding: 10px 20px; /* ajouter du rembourrage */
    border-radius: 4px; /* bords légèrement arrondis */
    cursor: pointer; /* curseur en forme de main pour les boutons */
}

/* Ajout de l'effet au survol */
.save-changes-btn:hover {
    background-color: #444; /* couleur légèrement plus claire au survol */
}
/* Style pour le bouton 'Message' */
/* Couleur du menu latéral */


/* Style pour le bouton 'Message' */
.message-btn {
    background-color: #fcf8f8; /* fond noir */
    color: #333; /* texte de la même couleur que le menu */
    border: 2px solid #333; /* bordure de la même couleur que le menu */
    padding: 10px 20px; /* ajustement du rembourrage */
    border-radius: 4px; /* bordures arrondies */
    cursor: pointer; /* curseur indiquant qu'il est cliquable */
}

/* Effet au survol */
.message-btn:hover {
    background-color: #333; /* couleur du menu au survol */
    color: #fff; /* texte blanc au survol */
}
/* Bordure pour l'image de profil */
.profile-img {
    border: 4px solid #333; /* même couleur que le menu latéral */
    border-radius: 50%; /* forme circulaire */
    padding: 2px; /* espacement entre la bordure et l'image */
}

/* Définir l'image du profil comme classe 'profile-img' */
.img-rounded {
    border-radius: 50%; /* pour assurer que l'image reste ronde */
    padding: 1px; /* espacement entre la bordure et l'image */
}
.pjr{
    margin-top: 73px;
    height: 415px;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid transparent;
    border-radius: .25rem;
    margin-bottom: 1.5rem;
    box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
}
    </style>
</head>
<body>
<div class="sidebar">
        <div class="logo">
            <img src="logo3app.jpg" alt="Logo de l'application">
            <h1>Collaboration</h1>
        </div>
        <ul>
            <li class="dec"><a class="dec" href="interfacecollab.html"><i class="fas fa-home"></i> Accueil</a></li>
            <li class="dec"><a class="dec" href="#"><i class="fas fa-bullhorn"></i> Les annonces</a></li>
            <li class="dec"><a class="dec" href="#"><i class="fas fa-graduation-cap"></i> Les formations</a></li>
           
            <li class="dec" ><a class="dec" href="#"><i class="fas fa-comments"></i> Chat</a></li>
            <li class="dec"><a  class="dec"href="profil.php"><i class="fas fa-user"></i> Profil</a></li>
            <li  class="dec"><a  class="dec" href="#"><i class="fas fa-sign-out-alt"></i> Déconnexion</a></li>
        </ul>
    </div>
    <div class="content">
<div class="container">
<div class="main-body">
<div class="row">
<div class="col-lg-4">
  
<div class="card">
<div class="card-body">
<div class="d-flex flex-column align-items-center text-center">
    <img src="homme.jpg" alt="Collaborateur" class="profile-img img-rounded" width="110">

    <div class="mt-3">
        <h4><?php echo"".$collaborateur['UserName']; ?></h4>
        <p class="text-secondary mb-1"><?php echo"". $collaborateur['PosteCollaborateur']; ?></p>
       
    </div>
</div>
<hr class="my-4">
</div>
</div>
</div>
<form method="post" action="editinfoemationpersonelles.php">
<div class="col-lg-8">
<div class="card">
<div class="card-body">
<div class="row mb-3">
<div class="col-sm-3">
<h6 class="mb-0">Nom</h6>
</div>
<div class="col-sm-9 text-secondary">
<input type="text" class="form-control" name="USerNAme" value="<?php echo"". $collaborateur['UserName']; ?>">
</div>
</div>

<div class="row mb-3">
<div class="col-sm-3">
<h6 class="mb-0">Email</h6>
</div>
<div class="col-sm-9 text-secondary">
<input type="text" class="form-control" name="EmailCollaborateur" value="<?php echo $collaborateur['EmailCollaborateur']; ?>">
</div>
</div>

<div class="row mb-3">
<div class="col-sm-3">
<h6 class="mb-0">Téléphone</h6>
</div>
<div class="col-sm-9 text-secondary">
<input type="text" class="form-control" name="PhoneCollaborateur" value="<?php echo $collaborateur['PhoneCollaborateur']; ?>">
</div>
</div>

<div class="row mb-3">
<div class="col-sm-3">
<h6 class="mb-0">Adresse</h6>
</div>
<div class="col-sm-9 text-secondary">
<input type="text" class="form-control" name="AdresseCollaborateur" value="<?php echo $collaborateur['AdresseCollaborateur']; ?>">
</div>
</div>

<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-9 text-secondary">
    <input type="button" class="btn btn-primary px-4 save-changes-btn" value="Enregistrer les modifications">
</div>
</div>
</div>
</div>
</form>
</div> <!-- Fermeture du conteneur principal -->
</div> <!-- Fin du contenu -->

<div class="pjr" >
<h5 class="d-flex align-items-center mb-3">Les projets</h5>
    <ul>
    <?php foreach ($projets as $projet) : ?>
        <li><?php echo htmlspecialchars($projet['nomprojet']); ?></li>
    <?php endforeach; ?>
    </ul>
  </div>
</div>
    
<div class="row">
<div class="col-sm-12">
<div class="card">
<div class="card-body">
<h5 class="d-flex align-items-center mb-3">Competence Status</h5>

<ul>
    <?php foreach ($competences as $competence) : ?>
       
    
    <p><?php echo htmlspecialchars($competence['nomcompetence'] )?> :</p>
    <?php
    $niveau = $competence['level']; // Récupère le niveau de compétence
    $pourcentage = 0; // Valeur par défaut

    // Définir le pourcentage en fonction du niveau
    if ( $niveau === 'low') {
        $pourcentage = 25; // Si le niveau est null, 0%
    } elseif ($niveau === 'moyenne') {
        $pourcentage = 50; // Si le niveau est "moyenne", 50%
    } elseif ($niveau === 'bien') {
        $pourcentage = 100; // Si le niveau est "bien", 100%
    }

    // Définir la couleur de la barre de progression en fonction du pourcentage
    $barColor = 'bg-secondary'; // Couleur par défaut (gris)
    if ($pourcentage === 25) {
        $barColor = 'bg-danger'; // Rouge si 0%
    } elseif ($pourcentage === 50) {
        $barColor = 'bg-warning'; // Jaune pour 50%
    } elseif ($pourcentage === 100) {
        $barColor = 'bg-success'; // Vert pour 100%
    }
    ?>
    
    <div class="progress mb-3" style="height: 5px">
        <div class="progress-bar <?php echo $barColor; ?>" role="progressbar" style="width: <?php echo $pourcentage; ?>%" aria-valuenow="<?php echo $pourcentage; ?>" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
   <?php endforeach; ?>
    </ul>
    <button class="btn message-btn">EDIT competence</button>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>