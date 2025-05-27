<?php
include 'session.php';?>
<?php include 'db_connect.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Customer Management</h1>
        </header>
        
        <nav>
    <ul>
        <li><a href="index.php">Dashboard</a></li>
        <li><a href="customers.php">Customers</a></li>
        <li><a href="products.php">Products</a></li>
        <li><a href="orders.php">Orders</a></li>
        <?php if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']): ?>
            <li><a href="admin_management.php">Admin Management</a></li>
        <?php endif; ?>
        <li class="logout-link"><a href="logout.php">Logout (<?= htmlspecialchars($_SESSION['first_name']) ?>)</a></li>
    </ul>
</nav>
        
        <main>
            <div class="action-bar">
                <a href="customer_add.php" class="btn">Add New Customer</a>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Loyalty Points</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $stmt = $pdo->query("
                        SELECT u.user_id, u.first_name, u.last_name, u.email, u.phone, c.loyalty_points 
                        FROM users u 
                        JOIN customer c ON u.user_id = c.customer_id
                        ORDER BY u.user_id
                    ");
                    
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        echo "<tr>";
                        echo "<td>{$row['user_id']}</td>";
                        echo "<td>{$row['first_name']} {$row['last_name']}</td>";
                        echo "<td>{$row['email']}</td>";
                        echo "<td>{$row['phone']}</td>";
                        echo "<td>{$row['loyalty_points']}</td>";
                        echo "<td>
                                <a href='customer_edit.php?id={$row['user_id']}' class='btn btn-small'>Edit</a>
                                <a href='customer_delete.php?id={$row['user_id']}' class='btn btn-small btn-danger'>Delete</a>
                              </td>";
                        echo "</tr>";
                    }
                    ?>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>
