
# 📚 Library Management System

## 📌 Project Overview
The **Library Management System** is designed to efficiently manage book rentals, customers, and branch operations. This system ensures smooth transactions, book availability tracking, and customer management using **MySQL**.

## 📂 Features
- **Branch Management**: Stores branch details including address and contact information.
- **Books Catalog**: Maintains a list of books with categories, rental price, and availability status.
- **Customer Management**: Keeps track of customer information and registration dates.
- **Book Issuance System**: Manages book loans with foreign key relationships.
- **Database Integrity**: Implements primary and foreign keys to maintain data consistency.

## 🏗️ Database Schema
### 1️⃣ **Branch Table**
```sql
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
```
### 2️⃣ **Books Table**
```sql
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status ENUM('Yes', 'No'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);
```
### 3️⃣ **Customer Table**
```sql
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
```
### 4️⃣ **IssueStatus Table**
```sql
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
```

## 🛠️ Installation & Usage
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/Library-Management-System.git
   ```
2. Open MySQL Workbench or any SQL environment.
3. Import `Library Management System.sql` and execute the script.

## 📊 Future Enhancements
- Implement a **fine tracking system** for overdue books.
- Create a **reservation system** for unavailable books.
- Develop a **user-friendly UI** for librarians and customers.

## 🤝 Contributing
Feel free to contribute to this project by submitting pull requests or reporting issues.

