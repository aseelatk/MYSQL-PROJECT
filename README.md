# MYSQL-PROJECT
# Library Management System

## Overview
This repository contains a Library Management System (LMS) project, which is designed to keep track of all information about books in the library, their cost, status, and the total number of books available in the library. The system also manages employees, customers, issue statuses, and return statuses.

## Database Structure

The project uses a relational database with the following tables:

1. **Branch**: Stores information about the branches of the library.
   - `Branch_no` (Primary Key)
   - `Manager_Id`
   - `Branch_address`
   - `Contact_no`
   
2. **Employee**: Contains employee information working at the library branches.
   - `Emp_Id` (Primary Key)
   - `Emp_name`
   - `Position`
   - `Salary`
   - `Branch_no` (Foreign Key, references Branch)

3. **Books**: Stores details about the books available in the library.
   - `ISBN` (Primary Key)
   - `Book_title`
   - `Category`
   - `Rental_Price`
   - `Status` (Indicates availability)
   - `Author`
   - `Publisher`

4. **Customer**: Contains customer information.
   - `Customer_Id` (Primary Key)
   - `Customer_name`
   - `Customer_address`
   - `Reg_date`

5. **IssueStatus**: Records the books issued by customers.
   - `Issue_Id` (Primary Key)
   - `Issued_cust` (Foreign Key, references Customer)
   - `Issued_book_name`
   - `Issue_date`
   - `Isbn_book` (Foreign Key, references Books)

6. **ReturnStatus**: Records the return status of issued books.
   - `Return_Id` (Primary Key)
   - `Return_cust` (Foreign Key, references Customer)
   - `Return_book_name`
   - `Return_date`
   - `Isbn_book2` (Foreign Key, references Books)

## Features

- **Branch Management**: Allows managing the branches of the library, including branch address, contact number, and manager.
- **Employee Management**: Manages employee details such as position, salary, and the branch they work at.
- **Book Management**: Tracks books available in the library, including category, rental price, and availability.
- **Customer Management**: Stores customer data including their name, address, and registration date.
- **Issue and Return Tracking**: Tracks the status of books issued to customers and their return status.

## SQL Queries

This repository contains several SQL queries to manage and retrieve data from the database, such as:

1. Retrieve the book title, category, and rental price of all available books.
2. List employee names and their respective salaries.
3. Retrieve book titles and the corresponding customers who have issued those books.
4. Display the total count of books in each category.
5. Retrieve employee names and positions for employees whose salaries are above Rs. 50,000.
6. List customer names who registered before a specific date and have not issued any books.
7. Display the branch numbers and the total count of employees in each branch.
8. Display the names of customers who have issued books with a rental price higher than Rs. 25.
9. Retrieve book titles containing the word "history".
10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
11. Retrieve the names of employees who manage branches and their respective branch addresses.
12. Display the names of customers who have issued books with a rental price higher than Rs. 25.


## Setup

### Prerequisites

To set up and run the database locally, you'll need:

- A MySQL database server (or any other SQL-based database).
- A MySQL client (like MySQL Workbench or a command-line interface).
- SQL knowledge to execute queries and manage the database.



