-- Create the database
CREATE DATABASE LIBRARY;
USE LIBRARY;

-- 1. Create Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- 2. Create Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- 3. Create Books Table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(150),
    Category VARCHAR(50),
    Rental_Price DECIMAL(8, 2),
    Status VARCHAR(3) CHECK (Status IN ('Yes', 'No')), -- Status should be 'Yes' or 'No'
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- 4. Create Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- 5. Create IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 6. Create ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


SHOW TABLES;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
    (1, 101, '123 Main St, Downtown', '123-456-7890'),
    (2, 102, '456 Elm St, Uptown', '987-654-3210'),
    (3, 103, '789 Oak St, Suburbia', '555-123-4567'),
    (4, 104, '101 Maple Ave, Midtown', '444-555-6666'),
    (5, 105, '202 Birch Rd, City Center', '999-888-7777'),
    (6, 106, '303 Cedar St, Old Town', '222-333-4444'),
    (7, 107, '404 Pine Dr, East Side', '111-222-3333'),
    (8, 108, '505 Birch St, West Side', '888-999-0000'),
    (9, 109, '606 Elmwood Ln, Heights', '777-666-5555'),
    (10, 110, '707 Oakwood Dr, Valley', '333-444-5555');


SELECT * FROM Branch;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
    (1, 'Alice Johnson', 'Librarian', 50000.00, 1),
    (2, 'Bob Smith', 'Assistant Librarian', 40000.00, 1),
    (3, 'Charlie Brown', 'Librarian', 52000.00, 2),
    (4, 'Diana Green', 'Assistant Librarian', 42000.00, 2),
    (5, 'Eve White', 'Librarian', 51000.00, 3),
    (6, 'Frank Black', 'Assistant Librarian', 43000.00, 3),
    (7, 'Grace Adams', 'Librarian', 54000.00, 4),
    (8, 'Hank Gray', 'Assistant Librarian', 45000.00, 4),
    (9, 'Ivy Wilson', 'Librarian', 56000.00, 5),
    (10, 'Jack Blue', 'Assistant Librarian', 47000.00, 5);

SELECT * FROM employee;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    ('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 5.00, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
    ('978-1-86197-876-9', '1984', 'Dystopian', 6.00, 'Yes', 'George Orwell', 'Secker & Warburg'),
    ('978-0-7432-7356-5', 'To Kill a Mockingbird', 'Fiction', 5.50, 'No', 'Harper Lee', 'J.B. Lippincott & Co.'),
    ('978-0-452-28423-4', 'Pride and Prejudice', 'Romance', 4.50, 'Yes', 'Jane Austen', 'T. Egerton'),
    ('978-0-14-243724-7', 'The Catcher in the Rye', 'Fiction', 5.00, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
    ('978-0-7434-7772-3', 'The Hobbit', 'Fantasy', 6.50, 'No', 'J.R.R. Tolkien', 'Allen & Unwin'),
    ('978-0-394-82375-3', 'Moby Dick', 'Adventure', 7.00, 'Yes', 'Herman Melville', 'Harper & Brothers'),
    ('978-0-7432-7357-2', 'War and Peace', 'Historical Fiction', 8.00, 'No', 'Leo Tolstoy', 'The Russian Messenger'),
    ('978-1-5011-8179-2', 'The Silent Patient', 'Thriller', 6.00, 'Yes', 'Alex Michaelides', 'Celadon Books'),
    ('978-0-14-044926-6', 'Crime and Punishment', 'Classic', 6.50, 'Yes', 'Fyodor Dostoevsky', 'The Russian Messenger');
    
    SELECT * FROM Books;
    
    INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
    (1, 'John Doe', '123 Maple St, Downtown', '2024-01-15'),
    (2, 'Jane Smith', '456 Pine St, Uptown', '2024-02-20'),
    (3, 'Michael Johnson', '789 Birch St, Suburbia', '2024-03-10'),
    (4, 'Emily Davis', '101 Cedar St, Downtown', '2024-04-05'),
    (5, 'David Wilson', '202 Redwood St, Uptown', '2024-05-25'),
    (6, 'Sarah Miller', '303 Cedar St, Old Town', '2024-06-10'),
    (7, 'Daniel Taylor', '404 Pine Dr, East Side', '2024-07-15'),
    (8, 'Jessica White', '505 Birch St, West Side', '2024-08-20'),
    (9, 'William Brown', '606 Elmwood Ln, Heights', '2024-09-25'),
    (10, 'Sophia Green', '707 Oakwood Dr, Valley', '2024-10-30');
    
    SELECT * FROM Customer;
    INSERT INTO issueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (1, 1, 'The Great Gatsby', '2024-06-01', '978-3-16-148410-0'),
    (2, 2, '1984', '2024-06-05', '978-1-86197-876-9'),
    (3, 3, 'To Kill a Mockingbird', '2024-06-10', '978-0-7432-7356-5'),
    (4, 4, 'Pride and Prejudice', '2024-06-15', '978-0-452-28423-4'),
    (5, 5, 'The Catcher in the Rye', '2024-06-20', '978-0-14-243724-7'),
    (6, 6, 'The Hobbit', '2024-06-25', '978-0-7434-7772-3'),
    (7, 7, 'Moby Dick', '2024-06-30', '978-0-394-82375-3'),
    (8, 8, 'War and Peace', '2024-07-05', '978-0-7432-7357-2'),
    (9, 9, 'The Silent Patient', '2024-07-10', '978-1-5011-8179-2'),
    (10, 10, 'Crime and Punishment', '2024-07-15', '978-0-14-044926-6');
    
    SELECT * FROM issuestatus;
    
    INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (1, 1, 'The Great Gatsby', '2024-07-01', '978-3-16-148410-0'),
    (2, 2, '1984', '2024-07-05', '978-1-86197-876-9'),
    (3, 3, 'To Kill a Mockingbird', '2024-07-10', '978-0-7432-7356-5'),
    (4, 4, 'Pride and Prejudice', '2024-07-15', '978-0-452-28423-4'),
    (5, 5, 'The Catcher in the Rye', '2024-07-20', '978-0-14-243724-7'),
    (6, 6, 'The Hobbit', '2024-07-25', '978-0-7434-7772-3'),
    (7, 7, 'Moby Dick', '2024-07-30', '978-0-394-82375-3'),
    (8, 8, 'War and Peace', '2024-08-05', '978-0-7432-7357-2'),
    (9, 9, 'The Silent Patient', '2024-08-10', '978-1-5011-8179-2'),
    (10, 10, 'Crime and Punishment', '2024-08-15', '978-0-14-044926-6');
    SELECT * FROM returnstatus;
    
    /*
    Write the queries for the following : 
    1. Retrieve the book title, category, and rental price of all available books. 
    2. List the employee names and their respective salaries in descending order of salary. 
    3. Retrieve the book titles and the corresponding customers who have issued those books. 
    4. Display the total count of books in each category. 
    5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
    6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
    7. Display the branch numbers and the total count of employees in each branch. 
    8. Display the names of customers who have issued books in the month of June 2023. 
    9. Retrieve book_title from book table containing history. 
    10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
    11. Retrieve the names of employees who manage branches and their respective branch addresses. 
    12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
    Score Distribution: 1 point for correctly formulating the query of each question (12 x 1 = 12). 1 point for providing 
    screenshots of the output for each question (12 x 1 = 12). 1 point for timely submission. Total = 25. PS : After completing the project 
    upload your project with screenshots in the github and share the link.
    */
    
--     1. Retrieve the book title, category, and rental price of all available books. 
    SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'Yes';
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM employee ORDER BY Salary DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT 
    B.Book_title, 
    C.Customer_name
FROM 
    IssueStatus I 
JOIN 
    Books B ON I.Isbn_book = B.ISBN
JOIN 
    Customer C ON I.Issued_cust = C.Customer_Id;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  4. Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position,Salary FROM Employee WHERE Salary > 50000;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

-- TABLE UPDATION FOR THIS QUERY
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
    (11, 'Alice Walker', '123 Green St', '2021-11-15'),
    (12, 'John Smith', '456 Blue Rd', '2020-06-10'),
    (13, 'Diana Prince', '789 Red Ave', '2021-09-05');
SELECT * FROM customer;    
SELECT * FROM issuestatus;    

SELECT 
    C.Customer_name, C.Reg_date
FROM 
    Customer C
LEFT JOIN 
    IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE 
    C.Reg_date < '2022-01-01'
    AND I.Issue_Id IS NULL;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;
-- --------------------------------------------------------------------------------------------------------------------------------------------------------

--  8. Display the names of customers who have issued books in the month of June 2023. 

-- updation of table Cutomer,Books,issuestatus accordingly for the query

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
    (14, 'Sophia Johnson', '101 Oak St', '2021-11-15'),
    (15, 'Michael Clark', '2022 Maple Rd', '2020-06-10'),
    (16, 'Emma Davis', '303 Pine Ave', '2021-09-05');
SELECT * FROM Customer;
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
    (11, 14, 'The Great Gatsby', '2023-06-05', '978-12-3456789-0'),
    (12, 15, 'Moby Dick', '2023-06-15', '978-9-8765432-10'),
    (13, 16, 'To Kill a Mockingbird', '2023-06-20', '978-1-1122233-33');
select * from issuestatus;   
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
    ('978-12-3456789-0', 'The Great Gatsby', 'Fiction', 150, 'yes', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons'),
    ('978-9-8765432-10', 'Moby Dick', 'Adventure', 200, 'yes', 'Herman Melville', 'Harper & Brothers'),
    ('978-1-1122233-33', 'To Kill a Mockingbird', 'Fiction', 180, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
select * from books; 
-- query for the question
SELECT 
    C.Customer_name,I.Issue_date
FROM 
    Customer C
JOIN 
    IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE 
    I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
 -- -------------------------------------------------------------------------------------------------------------------------------------------
 -- 9. Retrieve book_title from book table containing history. 
 
 -- updating table books for this query
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
    ('978-12-3456789-1', 'A Brief History of Time', 'Science', 250, 'yes', 'Stephen Hawking', 'Bantam Books'),
    ('978-9-8765432-12', 'The History of Modern Europe', 'History', 300, 'yes', 'John Merriman', 'W.W. Norton & Company');

SELECT 
    Book_title
FROM 
    Books
WHERE 
    Book_title LIKE '%history%';
-- -------------------------------------------------------------------------------------------------------------------------------------------------------
-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
-- updation of table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 

    -- Branch 2
    (22, 'George Harris', 'Manager', 62000, 2),
    (21, 'Hannah Wilson', 'Assistant', 45000, 2),
    (20, 'Isaac Lee', 'Clerk', 37000, 2),
    (19, 'Jack Taylor', 'Clerk', 35000, 2),
    (11, 'Karen Moore', 'Assistant', 43000, 2),
    (12, 'Liam Clark', 'Security', 26000, 2),

    -- Branch 3
    (13, 'Monica Lewis', 'Manager', 64000, 3),
    (14, 'Nathan Walker', 'Assistant', 47000, 3),
    (15, 'Olivia Hall', 'Clerk', 36000, 3),
    (16, 'Paul Young', 'Clerk', 34000, 3),
    (17, 'Quincy Adams', 'Assistant', 44000, 3),
    (18, 'Rachel Scott', 'Security', 27000, 3);

select * from employee;

SELECT 
    Branch_no, 
    COUNT(Emp_Id) AS Employee_Count
FROM 
    Employee
GROUP BY 
    Branch_no
HAVING 
    COUNT(Emp_Id) > 5;
-- ------------------------------------------------------------------------------------------------------------------------------------------------    
-- 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
SELECT 
    E.Emp_name AS Employee_Name, 
    E.Position AS Employee_Position,
    B.Branch_address AS Branch_Address
FROM 
    Employee E
JOIN 
    Branch B ON E.Branch_no = B.Branch_no
WHERE 
    E.Position = 'Manager';
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
SELECT 
    C.Customer_name, B.Rental_Price AS Rental_Price
FROM 
    IssueStatus I
JOIN 
    Books  B ON I.Isbn_book = B.ISBN
JOIN 
    Customer C ON I.Issued_cust = C.Customer_Id
WHERE 
    B.Rental_Price > 25;
