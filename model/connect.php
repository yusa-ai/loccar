<?php

function PDO()
{
    $hostname = "localhost";
    $dbname = "location_voitures";
    $user = "root";
    $pass = "";

    try {
        return new PDO("mysql:server=$hostname; dbname=$dbname", $user, $pass);
    } catch (PDOException $e) {
        die("Echec de connexion : " . utf8_encode($e->getMessage()) . "\n");
    }
}
