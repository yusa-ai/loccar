<?php

function accueil()
{
    require_once "./view/utilisateur/accueil.tpl";
}

function connexion()
{
    $mail = isset($_POST["mail"]) ? $_POST["mail"] : NULL;
    $motdepasse = isset($_POST["motdepasse"]) ? $_POST["motdepasse"] : NULL;

    if (isset($mail, $motdepasse)) {
        require_once "./model/utilisateur_bd.php";

        if (getUtilisateur($mail, $motdepasse, $attributs)) {
            $_SESSION["utilisateur"] = $attributs[0];
            header("Location: index.php");
        } else {
            $erreur = "Identifiants invalides";
            require "./view/utilisateur/connexion.tpl";
        }
    } else {
        $erreur = NULL;
        require "./view/utilisateur/connexion.tpl";
    }
}

function inscription()
{
    $nom = isset($_POST["nom"]) ? $_POST["nom"] : NULL;
    $mail = isset($_POST["mail"]) ? $_POST["mail"] : NULL;
    $motdepasse = isset($_POST["motdepasse"]) ? $_POST["motdepasse"] : NULL;
    $societe = isset($_POST["societe"]) ? $_POST["societe"] : NULL;

    require_once "./model/entreprise_bd.php";
    getEntreprises($entreprises);

    if (isset($nom, $mail, $motdepasse, $societe)) {
        if (champsValides($nom, $mail, $motdepasse, $societe)) {

            // Insérer nouveau client dans BDD
            require_once "./model/utilisateur_bd.php";
            if (ajouterUtilisateur($nom, $mail, $motdepasse, $societe)) {

                // Créer la session PHP
                $_SESSION["utilisateur"] = array();

                // Récupérer l'utilisateur en BDD
                getUtilisateur($mail, $motdepasse, $attributs);
                $_SESSION["utilisateur"] = $attributs[0];

                header("Location: index.php");
            } else {
                $erreur = "Échec de l'inscription, veuillez recommencer";
                require "./view/utilisateur/inscription.tpl";
            }
        } else {
            $erreur = "Saisie invalide, veuillez recommencer";
            require "./view/utilisateur/inscription.tpl";
        }
    } else {
        $erreur = NULL;
        require "./view/utilisateur/inscription.tpl";
    }
}

function deconnexion()
{
    session_unset();
    require_once "./view/utilisateur/deconnexion.tpl";
    header("refresh:3, url=index.php");
}


// Vérification des formats des champs

function champsValides($nom, $mail, $motdepasse, $societe)
{
    return nomValide($nom) && mailValide($mail) && motDePasseValide($motdepasse) && societeValide($societe);
}

function nomValide($nom)
{
    return preg_match("`^[A-Z][a-zA-Z]{1,50}$`", $nom);
}

function mailValide($mail)
{
    return filter_var($mail, FILTER_VALIDATE_EMAIL);
}

function motDePasseValide($motdepasse)
{
    return preg_match("`(?=.*[0-9])(?=.*[A-Z])([a-zA-Z0-9]){8,16}`", $motdepasse);
}

function societeValide($societe)
{
    return $societe !== 0; // 0 <=> "Société"
}
