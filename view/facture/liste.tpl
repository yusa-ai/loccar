<!doctype html>
<html lang="fr">

<head>
    <?php include_once "./view/header.tpl" ?>
</head>

<body>
    <?php include_once "./view/navbar.tpl" ?>

    <div class="container">
        <h1>Mes factures</h1>

        <?php echo $message ?>

        <div class="table-responsive border rounded" style="margin-top: 16px;">
            <table class="table table-striped" style="margin: 0">
                <thead>
                    <tr>
                        <th class="text-center">Photo</th>
                        <th class="text-center">Modèle</th>
                        <th class="text-center">Date de début</th>
                        <th class="text-center">Date de fin</th>
                        <th class="text-center">Montant</th>
                        <th class="text-center">Paiement</th>
                    </tr>
                </thead>

                <tbody>
                    <?php
                    foreach ($factures as $facture) {
                        echo '<tr>';
                        printf('
            <td class="d-xl-flex justify-content-xl-center"><img class="img-fluid" src="./assets/vehicule/img/%s"
                                                                 alt="%s" width="200px" height="100px"></td>
            ', $facture["photo"], $facture["photo"]);
                        printf('
            <td class="text-center align-middle"><p style="margin: 0;">%s</p></td>
            ', htmlspecialchars($facture["nomModele"]));
                        printf('
            <td class="text-center align-middle"><p style="margin: 0;">%s</p></td>
            ', $facture["dateDebut"]);
                        printf('
            <td class="text-center align-middle"><p style="margin: 0;">%s</p></td>
            ', $facture["dateFin"]);
                        printf('
            <td class="text-center align-middle"><p style="margin: 0;">%s €</p></td>
            ', number_format($facture["montant"], 0, ',', ' '));
                        printf('
            <td class="text-center align-middle"><a class="btn btn-dark" type="button"
                                                    href="index.php?controle=facture&action=payer&id=%s">PAYER</a></td>
            ', $facture["idVehicule"]);
                        echo '</tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <?php include_once "./view/footer.tpl" ?>

</body>

</html>