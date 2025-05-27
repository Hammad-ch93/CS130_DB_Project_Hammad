<?php
include 'session.php';?>
<?php include 'db_connect.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Product Management</h1>
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
                <a href="product_add.php" class="btn">Add New Product</a>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Category</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $stmt = $pdo->query("
                        SELECT p.product_id, p.product_name, p.description, p.base_price, p.stock_quantity, c.category_name 
                        FROM product p 
                        LEFT JOIN category c ON p.category_id = c.category_id
                        ORDER BY p.product_id
                    ");
                    
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $description = strlen($row['description']) > 50 ? substr($row['description'], 0, 50) . '...' : $row['description'];
                        echo "<tr>";
                        echo "<td>{$row['product_id']}</td>";
                        echo "<td>{$row['product_name']}</td>";
                        echo "<td>{$description}</td>";
                        echo "<td>\${$row['base_price']}</td>";
                        echo "<td>{$row['stock_quantity']}</td>";
                        echo "<td>{$row['category_name']}</td>";
                        echo "<td>
                                <a href='product_edit.php?id={$row['product_id']}' class='btn btn-small'>Edit</a>
                                <a href='product_delete.php?id={$row['product_id']}' class='btn btn-small btn-danger'>Delete</a>
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
