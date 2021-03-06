<!DOCTYPE html>
<html lang="en">

<head>
    <?php include_once "./view/header.tpl" ?>
</head>

<body>
    <?php include_once "./view/navbar.tpl" ?>
    <section class="login-clean">
        <form action="index.php?controle=utilisateur&action=connexion" method="post">
            <div class="illustration"><i class="icon ion-person-stalker" style="color: #209cee;border-color: #209cee;"></i>
            </div>
            <?php
            if ($erreur !== NULL) {
                printf('<div class="mb-3">
        <div class="alert alert-danger" role="alert">%s</div>
        </div>', $erreur);
            }
            ?>
            <div class="mb-3"><input class="form-control" type="email" name="mail" placeholder="Adresse mail" required>
            </div>
            <div class="mb-3"><input class="form-control" type="password" name="motdepasse" placeholder="Mot de passe" required></div>
            <div class="mb-3">
                <button class="btn btn-primary d-block w-100" type="submit" style="background: #209cee;">Connexion</button>
            </div>
            <a class="forgot" href="index.php?controle=utilisateur&action=inscription">Pas encore de compte ?
                Inscrivez-vous</a>
        </form>
    </section>

    <?php include_once "./view/footer.tpl" ?>
</body>

</html>