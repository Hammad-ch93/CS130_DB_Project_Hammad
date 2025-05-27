<?php
include 'session.php';?>
<?php include 'db_connect.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Order Management</h1>
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
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Order Date</th>
                        <th>Status</th>
                        <th>Total Amount</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $stmt = $pdo->query("
                        SELECT o.order_id, u.first_name, u.last_name, o.order_date, o.status, o.total_amount 
                        FROM orders o 
                        JOIN customer c ON o.customer_id = c.customer_id
                        JOIN users u ON c.customer_id = u.user_id
                        ORDER BY o.order_date DESC
                        LIMIT 50
                    ");
                    
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        echo "<tr>";
                        echo "<td>{$row['order_id']}</td>";
                        echo "<td>{$row['first_name']} {$row['last_name']}</td>";
                        echo "<td>" . date('M j, Y', strtotime($row['order_date'])) . "</td>";
                        echo "<td>{$row['status']}</td>";
                        echo "<td>\${$row['total_amount']}</td>";
                        echo "<td>
                                <a href='order_view.php?id={$row['order_id']}' class='btn btn-small'>View</a>
                                <a href='order_edit.php?id={$row['order_id']}' class='btn btn-small'>Edit</a>
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
