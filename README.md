# E-commerce Database Project

## Project Description

This project is a comprehensive e-commerce database system built with PostgreSQL. The database is designed to handle core e-commerce operations including product management, customer information, order processing, inventory tracking, and payment processing.

### Key Features
- Customer management and authentication
- Product catalog with categories and inventory
- Shopping cart functionality
- Order management system
- Payment processing records
- Admin panel for database management
- Full-featured frontend interface

### Database Schema
The database includes the following main entities:
- **Customers** - User accounts and profiles
- **Products** - Product catalog with descriptions, pricing, and categories
- **Categories** - Product categorization system
- **Orders** - Order tracking and management
- **Order Items** - Individual items within orders
- **Cart** - Shopping cart functionality
- **Payments** - Payment transaction records
- **Inventory** - Stock management

## Prerequisites

Before setting up this project, ensure you have:
- PostgreSQL installed (version 12 or higher)
- MAMP installed (for frontend)
- Basic knowledge of SQL and database management
- Web browser for accessing the frontend

## Setup Instructions

### 1. Database Restoration

#### Option A: Using Command Line
```bash
# Create a new database
createdb -U postgres ecommerce_db

# Restore from backup file
psql -U postgres -d ecommerce_db < ecommerce_backup.sql
```

#### Option B: Using TablePlus or pgAdmin
1. Create a new database named `ecommerce_db`
2. Right-click on the database
3. Select "Restore" or "Import"
4. Choose your backup file
5. Execute the restoration

### 2. Database Connection Configuration

Update your connection settings:
- **Host:** localhost
- **Port:** 5432 (default PostgreSQL port)
- **Database:** ecommerce_db
- **Username:** postgres (or your PostgreSQL username)
- **Password:** [your PostgreSQL password]

### 3. Verify Installation

Run this query to verify the database is properly set up:
```sql
-- Check if all tables exist
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
ORDER BY table_name;
```

## Frontend Implementation (MAMP)

### Setup Instructions

1. **Install MAMP**
   - Download and install MAMP from [mamp.info](https://www.mamp.info/)
   - Start Apache and MySQL/PostgreSQL services

2. **Frontend Files Location**
   - Place your frontend files in: `/Applications/MAMP/htdocs/ecommerce/` (Mac)
   - Or `C:\MAMP\htdocs\ecommerce\` (Windows)

3. **Database Connection Configuration**
   Update your PHP connection file with:
   ```php
   <?php
   $host = 'localhost';
   $dbname = 'ecommerce_db';
   $username = 'postgres';
   $password = 'your_password';
   $port = '5432';
   
   try {
       $pdo = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $username, $password);
       $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   } catch(PDOException $e) {
       echo "Connection failed: " . $e->getMessage();
   }
   ?>
   ```

4. **Access the Frontend**
   - Start MAMP services
   - Open browser and navigate to: `http://localhost:8888/ecommerce/`
   - Default MAMP port is 8888 (check your MAMP settings)

### Frontend Features

- **Customer Portal**
  - User registration and login
  - Product browsing and search
  - Shopping cart management
  - Order placement and tracking
  - User profile management

- **Admin Dashboard**
  - Product management (CRUD operations)
  - Order management and processing
  - Customer management
  - Inventory tracking
  - Sales analytics and reports

- **Key Pages**
  - `index.php` - Homepage with featured products
  - `products.php` - Product catalog
  - `cart.php` - Shopping cart
  - `checkout.php` - Order placement
  - `admin/` - Admin panel directory
  - `login.php` - User authentication

### Troubleshooting Frontend

**Common Issues:**
- **Database connection errors:** Check PostgreSQL service is running and connection credentials
- **Page not loading:** Verify MAMP Apache service is running
- **Permission errors:** Check file permissions in htdocs directory
- **PHP errors:** Enable error reporting in php.ini for debugging

**Testing the Frontend:**
1. Create a test customer account
2. Browse products and add items to cart
3. Complete a test order
4. Check admin panel for order management
5. Verify data appears correctly in database

## Contributing

To contribute to this project:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions or issues:
- Check the troubleshooting section above
- Review the sample queries for database operations
- Ensure MAMP and PostgreSQL services are running
- Verify database connection credentials
