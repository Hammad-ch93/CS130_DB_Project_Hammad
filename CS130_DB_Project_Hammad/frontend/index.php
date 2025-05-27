<?php include 'config.php'; ?>
<title><?= APP_NAME ?></title>

<!-- In your header -->
<!--<h1><?= APP_LOGO ?> <span class="brand-name"><?= APP_NAME ?></span></h1>-->
<?php
include 'session.php';
include 'db_connect.php';

// Fetch dashboard statistics
$stats = [
    'total_customers' => $pdo->query("SELECT COUNT(*) FROM customer")->fetchColumn(),
    'total_products' => $pdo->query("SELECT COUNT(*) FROM product")->fetchColumn(),
    'total_orders' => $pdo->query("SELECT COUNT(*) FROM orders")->fetchColumn(),
    'revenue' => $pdo->query("SELECT COALESCE(SUM(total_amount), 0) FROM orders WHERE status != 'cancelled'")->fetchColumn(),
    'recent_orders' => $pdo->query("
        SELECT o.order_id, o.order_date, o.total_amount, o.status, 
               u.first_name, u.last_name 
        FROM orders o
        JOIN customer c ON o.customer_id = c.customer_id
        JOIN users u ON c.customer_id = u.user_id
        ORDER BY o.order_date DESC 
        LIMIT 5
    ")->fetchAll(PDO::FETCH_ASSOC),
    'top_products' => $pdo->query("
        SELECT p.product_name, SUM(oi.quantity) as total_sold
        FROM order_item oi
        JOIN product p ON oi.product_id = p.product_id
        GROUP BY p.product_name
        ORDER BY total_sold DESC
        LIMIT 5
    ")->fetchAll(PDO::FETCH_ASSOC)
];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enhanced Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<header>
    <div class="brand-header">
        <h1><i class="fas fa-store"></i> <span class="brand-name">ShopKaro</h1>
        <div class="header-info">
            <span><i class="fas fa-user"></i> <?= htmlspecialchars($_SESSION['first_name']) ?></span>
            <span><i class="fas fa-calendar-alt"></i> <?= date('F j, Y') ?></span>
        </div>
    </div>
</header>

<body>  
        <nav>
            <ul>
                <li><a href="index.php" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="customers.php"><i class="fas fa-users"></i> Customers</a></li>
                <li><a href="products.php"><i class="fas fa-box-open"></i> Products</a></li>
                <li><a href="orders.php"><i class="fas fa-shopping-cart"></i> Orders</a></li>
                <?php if ($_SESSION['is_admin']): ?>
                    <li><a href="admin_management.php"><i class="fas fa-user-shield"></i> Admins</a></li>
                <?php endif; ?>
                <li class="logout-link"><a href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>
        
        <main>
            <!-- Summary Cards -->
            <div class="dashboard-cards">
                <div class="card card-purple">
                    <div class="card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="card-content">
                        <h3>Total Customers</h3>
                        <p><?= $stats['total_customers'] ?></p>
                        <a href="customers.php">View All <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                
                <div class="card card-blue">
                    <div class="card-icon">
                        <i class="fas fa-box-open"></i>
                    </div>
                    <div class="card-content">
                        <h3>Total Products</h3>
                        <p><?= $stats['total_products'] ?></p>
                        <a href="products.php">View All <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                
                <div class="card card-orange">
                    <div class="card-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <div class="card-content">
                        <h3>Total Orders</h3>
                        <p><?= $stats['total_orders'] ?></p>
                        <a href="orders.php">View All <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                
                <div class="card card-green">
                    <div class="card-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="card-content">
                        <h3>Total Revenue</h3>
                        <p>$<?= number_format($stats['revenue'], 2) ?></p>
                        <a href="orders.php">View Sales <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            
            <!-- Charts Row -->
            <div class="dashboard-row">
                <div class="chart-container">
                    <h2><i class="fas fa-chart-line"></i> Sales Overview</h2>
                    <canvas id="salesChart"></canvas>
                </div>
                
                <div class="chart-container">
                    <h2><i class="fas fa-star"></i> Top Products</h2>
                    <canvas id="productsChart"></canvas>
                </div>
            </div>
            
            <!-- Recent Activity -->
            <div class="recent-activity">
                <h2><i class="fas fa-clock"></i> Recent Orders</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($stats['recent_orders'] as $order): ?>
                        <tr>
                            <td>#<?= $order['order_id'] ?></td>
                            <td><?= htmlspecialchars($order['first_name'] . ' ' . $order['last_name']) ?></td>
                            <td><?= date('M j, Y', strtotime($order['order_date'])) ?></td>
                            <td>$<?= number_format($order['total_amount'], 2) ?></td>
                            <td><span class="status-badge status-<?= $order['status'] ?>"><?= ucfirst($order['status']) ?></span></td>
                            <td><a href="order_view.php?id=<?= $order['order_id'] ?>" class="btn btn-small">View</a></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

    <script>
    // Sales Chart
    const salesCtx = document.getElementById('salesChart').getContext('2d');
    const salesChart = new Chart(salesCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Monthly Sales',
                data: [1200, 1900, 1500, 2000, 1800, 2200],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 2,
                tension: 0.4,
                fill: true
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return '$' + context.raw.toLocaleString();
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return '$' + value;
                        }
                    }
                }
            }
        }
    });

    // Products Chart
    const productsCtx = document.getElementById('productsChart').getContext('2d');
    const productsChart = new Chart(productsCtx, {
        type: 'doughnut',
        data: {
            labels: <?= json_encode(array_column($stats['top_products'], 'product_name')) ?>,
            datasets: [{
                data: <?= json_encode(array_column($stats['top_products'], 'total_sold')) ?>,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.7)',
                    'rgba(54, 162, 235, 0.7)',
                    'rgba(255, 206, 86, 0.7)',
                    'rgba(75, 192, 192, 0.7)',
                    'rgba(153, 102, 255, 0.7)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'right',
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return context.label + ': ' + context.raw + ' sold';
                        }
                    }
                }
            }
        }
    });
    </script>
</body>
</html>