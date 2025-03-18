#1. Create the library database:
CREATE DATABASE library;
USE library;

#2.Create the Tables:
#Branch Table
CREATE TABLE Branch (Branch_no INT PRIMARY KEY,Manager_Id INT,Branch_address VARCHAR(255),Contact_no VARCHAR(15));

#Employee Table
CREATE TABLE Employee (Emp_Id INT PRIMARY KEY,Emp_name VARCHAR(100),Position VARCHAR(50),Salary DECIMAL(10, 2),Branch_no INT,FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));

#Books Table
CREATE TABLE Books (ISBN INT PRIMARY KEY,Book_title VARCHAR(255),Category VARCHAR(100),Rental_Price DECIMAL(10, 2),Status VARCHAR(3),Author VARCHAR(100),Publisher VARCHAR(100));

#Customer Table
CREATE TABLE Customer (Customer_Id INT PRIMARY KEY,Customer_name VARCHAR(100),Customer_address VARCHAR(255),Reg_date DATE);

#IssueStatus Table
CREATE TABLE IssueStatus (Issue_Id INT PRIMARY KEY,Issued_cust INT,Issued_book_name VARCHAR(255),Issue_date DATE,Isbn_book INT,FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

#ReturnStatus Table
CREATE TABLE ReturnStatus (Return_Id INT PRIMARY KEY,Return_cust INT,Return_book_name VARCHAR(255),Return_date DATE,Isbn_book2 INT,FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES (1, 101, '123 Main St, City', '1234567890');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (1, 'John Doe', 'Manager', 60000, 1),(2, 'Jane Smith', 'Assistant', 45000, 1);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES(1001, 'History of Ancient Civilizations', 'History', 50.00, 'Yes', 'John Doe', 'Historical Press'),
(1002, 'Modern AI Techniques', 'Technology', 70.00, 'No', 'Jane Smith', 'TechWorld Publishing');


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES(201, 'Charlie Brown', '789 Academic Ave, Suburbia', '2021-12-15'),
(202, 'Daisy Green', '321 Scholar St, Uptown', '2022-05-10');


INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES(301, 201, 'History of Ancient Civilizations', '2023-06-10', 1001),
(302, 202, 'Modern AI Techniques', '2023-06-15', 1002);


INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES(401, 201, 'History of Ancient Civilizations', '2023-06-20', 1001),
(402, 202, 'Modern AI Techniques', '2023-06-25', 1002);
   
    
#1
select book_title,category,rental_price from books where status="yes";

#2
SELECT Emp_name, Salary FROM EMPLOYEE ORDER BY Salary DESC;

#3
SELECT I.Issued_book_name, C.Customer_name FROM IssueStatus I JOIN CUSTOMER C ON I.Issued_cust = C.Customer_Id;

#4
SELECT Category, COUNT(*) AS Total_Books FROM BOOKS GROUP BY Category;

#5
select emp_name,position,salary from employee where salary >50000;

#6
SELECT Customer_name FROM CUSTOMER C
LEFT JOIN IssueStatus  ON Customer_Id = Issued_cust
WHERE Reg_date < '2022-01-01' 
AND Issue_Id IS NULL;

#7
SELECT Branch_no, COUNT(*) AS Total_Employees FROM EMPLOYEE GROUP BY Branch_no;

#8
SELECT DISTINCT Customer_name FROM CUSTOMER  JOIN IssueStatus  ON Customer_Id = Issued_cust
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#9
SELECT Book_title FROM BOOKS 
WHERE LOWER(Category) LIKE '%history%' OR LOWER(Book_title) LIKE '%history%';

#10
SELECT Branch_no, COUNT(*) AS Employee_Count FROM EMPLOYEE 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

#11
SELECT Emp_name, Branch_address FROM EMPLOYEE 
JOIN BRANCH  ON Emp_Id = Manager_Id;

#12
SELECT DISTINCT C.Customer_name 
FROM CUSTOMER C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN BOOKS B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;