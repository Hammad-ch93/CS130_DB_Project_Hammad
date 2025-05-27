<?php
session_start();
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    try {
        // Check if user exists
        $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            // Check if user is admin
            $stmt = $pdo->prepare("SELECT * FROM admin WHERE admin_id = ?");
            $stmt->execute([$user['user_id']]);
            $admin = $stmt->fetch(PDO::FETCH_ASSOC);

            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['email'] = $user['email'];
            $_SESSION['first_name'] = $user['first_name'];
            $_SESSION['last_name'] = $user['last_name'];
            $_SESSION['user_type'] = $user['user_type'];
            
            if ($admin) {
                $_SESSION['is_admin'] = true;
                $_SESSION['admin_role'] = $admin['role'];
                $_SESSION['permissions'] = $admin['permissions'];
            }

            // Update last login
            $pdo->prepare("UPDATE users SET last_login = CURRENT_TIMESTAMP WHERE user_id = ?")
                ->execute([$user['user_id']]);

            header("Location: index.php");
            exit();
        } else {
            header("Location: login.php?error=Invalid credentials");
            exit();
        }
    } catch (PDOException $e) {
        header("Location: login.php?error=Database error");
        exit();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h1>Admin Login</h1>
            
            <?php if (isset($_GET['error'])): ?>
                <div class="message error"><?= htmlspecialchars($_GET['error']) ?></div>
            <?php endif; ?>
            
            <form action="login.php" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn">Login</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
