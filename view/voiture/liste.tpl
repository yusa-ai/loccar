<!DOCTYPE html>
<html lang="fr">

<head>
    <?php include_once "./view/header.tpl" ?>
</head>

<body>

<?php include_once "./view/navbar.tpl" ?>

<div class="container">
    <h1>Nos véhicules</h1>
    <section class="article-list">
        <div class="container">
            <?php
            require_once "./model/vehicule_bd.php";

            $nb = 1;
            echo '<div class="row row-cols-3 justify-content-center articles">';
            foreach ($modeles as $modele) {
                echo '<div class="col-sm-6 col-md-4 item" style="width: 325px">';
                echo '<div class="pb-3" style="background-color: #fffafa">';

                $photo = $modele["photo"];
                printf('<img class="img-fluid" style="height: 200px; width: 300px;" src="./assets/vehicule/img/%s" alt="%s">', $photo, $photo);

                $nom = $modele["nomModele"];
                printf('<h3 class="name">%s</h3>', htmlspecialchars($nom));

                $cars = $modele["caracteristiques"];
                echo '<ul class="list-unstyled text-start description">';

                printf('<li>Moteur : %s</li>', htmlspecialchars($cars["moteur"]));
                printf('<li>Boîte de vitesse : %s</li>', htmlspecialchars($cars["boiteVitesse"]));
                printf('<li>Carburant : %s</li>', htmlspecialchars($cars["carburant"]));
                printf('<li>Nombre de places : %s</li>', htmlspecialchars($cars["nbPlaces"]));

                echo '</ul>';

                printf('<p class="text-dark fw-bolder text-center description">Tarif journalier : %s €</p>',
                    number_format($modele["tarifJournalier"], 0, ',', ' '));

                $max = maxDisponibles($modele["idModele"]);

                if ($max > 0) {
                    printf('<a class="btn btn-primary btn-sm mt-3 fw-bold" type="button" role="button"
                           href="index.php?controle=voiture&action=louer&id=%s" style="width: 200px;">LOUER</a>',
                        $modele["idModele"]);
                } else {
                    printf('
                    <button class="btn btn-secondary btn-sm mt-3 fw-bold" type="button" role="button"
                            style="width: 200px;" disabled>RUPTURE
                    </button>
                    ');
                }
                echo '</div></div>';

                if ($nb === 3) {
                    $nb = 0;
                    echo '</div><div class="row row-cols-3 justify-content-center articles">';
                }
                ++$nb;
            }
            echo '</div>';
            ?>
        </div>
    </section>
</div>

<?php include_once "./view/footer.tpl" ?>

</body>

</html>