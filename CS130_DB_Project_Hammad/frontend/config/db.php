<?php
$host = "localhost";
$port = "5432";
$dbname = "e-commerce";
$user = "postgres";
$password = "postgresql_db";

try {
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;";
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
} catch (PDOException $e) {
    die("DB connection failed: " . $e->getMessage());
}
?>

