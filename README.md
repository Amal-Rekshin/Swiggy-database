# 🍔 Swiggy Database Management System

## 📌 Project Overview

This project is a **MySQL-based database system** designed to simulate a food delivery platform similar to Swiggy.
It focuses on managing users, restaurants, and order-related data efficiently using SQL.

---

## 🛠️ Technologies Used

* MySQL
* SQL (DDL, DML)
* Database Design Concepts

---

## 🗂️ Database Structure

### 🔹 Tables Included:

* **user_table** → Stores user details
* **restaurant** → Stores restaurant information
* *(You can add more tables like orders, payments if available)*

---

## ⚙️ Features

* User registration and management
* Restaurant data handling
* Structured relational database design
* Auto-increment primary keys
* Data integrity using constraints (PRIMARY KEY, UNIQUE)

---

## 📄 Sample Table Schema

```sql
CREATE TABLE user_table (
    user_id INT AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    user_email VARCHAR(100) UNIQUE,
    user_phone_number VARCHAR(20),
    user_city VARCHAR(30),
    address VARCHAR(100),
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);
```

---

## 🚀 How to Use

1. Open MySQL Workbench or any MySQL client
2. Create a database:

   ```sql
   CREATE DATABASE swiggy;
   USE swiggy;
   ```
3. Import the SQL file:

   * Go to **Server → Data Import**
   * Select `swiggy.sql`
   * Click **Start Import**

---

## 📊 Key Concepts Applied

* Relational Database Design
* Normalization (basic level)
* SQL Commands:

  * DDL (CREATE, ALTER)
  * DML (INSERT, UPDATE)
  * DQL (SELECT)

---

## 🎯 Future Improvements

* Add Orders and Payment tables
* Implement stored procedures
* Add indexing for performance optimization
* Integrate with backend (Java / Node.js)

---

## 👨‍💻 Author

**Spark**

---

## ⭐ Contribution

Feel free to fork and improve this project!
