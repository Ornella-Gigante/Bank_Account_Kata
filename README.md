# Banking System Management

## Description
This is a banking system management application developed in Java using the Spring Boot framework in which I worked on. It allows users to create accounts, perform deposits, transfers, withdrawals, and payments. The application also includes features for viewing transaction histories and managing bank accounts.

## Features

* Account Creation: Allows users to create new bank accounts.
* Deposits: Users can add funds to their accounts.
* Transfers: Users can transfer money between accounts.
* Withdrawals: Users can withdraw money from their accounts.
* Payments: Users can make payments from their accounts.
* Transaction History: Users can view a history of transactions.
* Filtering and Pagination: The application supports filtering and pagination of transactions.


## Technologies Used

* Spring Boot: Framework for building Java applications.
* JSP (JavaServer Pages): For dynamic web content generation.
* JPA (Java Persistence API): For data persistence management.
* Thymeleaf: Server-side template engine.
* Bootstrap: CSS framework for styling and layout.
* MySQL: Relational database for data storage.


# Requirements

* Java 17 or later
* Maven 3.6 or later
* MySQL 5.7 or later

#  Installation

1. Clone the Repository

        git clone https://github.com/your_username/repository-name.git
        cd repository-name

2. Configure the Database

   
       /**Create a MySQL database and update the application.properties file in src/main/resources with your database details:
       properties**/
       
       spring.datasource.url=jdbc:mysql://localhost:3306/your_database
       spring.datasource.username=your_username
       spring.datasource.password=your_password
       Run database migrations if applicable (e.g., using Flyway or Liquibase).


# Build and Run the Project

     mvn clean install
     mvn spring-boot:run
     //The application will run at http://localhost:8080.



# Usage

* Create an Account: Navigate to /account/create_account to create a new bank account.
* Deposit Funds: Use /transact/deposit to add funds to an account.
* Transfer Money: Access /transact/transfer to transfer money between accounts.
* Withdraw Funds: Use /transact/withdraw to withdraw money from an account.
* Make Payments: Navigate to /transact/payment to make payments from an account.
* View Transactions: Check /transact/transactions to view the transaction history.


# Project Structure

    src
    │
    ├── main
    │   ├── java
    │   │   └── com
    │   │       └── demo_bank_v1
    │   │           ├── controllers
    │   │           │   ├── AccountController.java
    │   │           │   └── TransactController.java
    │   │           ├── models
    │   │           │   ├── User.java
    │   │           │   └── Account.java
    │   │           └── repository
    │   │               ├── AccountRepository.java
    │   │               ├── PaymentRepository.java
    │   │               ├── TransactRepository.java
    │   │               └── TransactHistoryRepository.java
    │   └── resources
    │       ├── application.properties
    │       ├── templates
    │       │   ├── transactionsPage.jsp
    │       │   └── dashboard.jsp
    │       └── static
    │           ├── css
    │           ├── js
    │           └── images
    └── test
        └── java
            └── com
                └── demo_bank_v1
                    └── controllers
                        ├── AccountControllerTest.java
                        └── TransactControllerTest.java


# Contributing

Contributions are welcome! If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a branch for your feature (git checkout -b feature/new-feature).
3. Make your changes and commit (git commit -am 'Add new feature').
4. Push to your branch (git push origin feature/new-feature).
5. Open a pull request.


# License

* This project is licensed under the MIT License - see the LICENSE file for details.
* This project is also from a Tech Challengue made from Code Sherpas that I followed, visit them! --> https://www.code-sherpas.rocks/en-US


# How does it look: 

![Image_demo](https://github.com/Ornella-Gigante/Bank_Account_Kata/blob/main/demo_image.png)


## Demo video:


[Demo](https://github.com/Ornella-Gigante/Bank_Account_Kata/blob/main/demo.webm)


  
