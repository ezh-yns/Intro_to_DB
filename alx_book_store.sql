CREATE DATABASE IF NOT EXISTS alx_book_store ;

CREATE TABLE Authors (
    author_id INT(3) PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215)
);

CREATE TABLE Books (
    book_id INT(3) PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(215),
    author_id INT(3),
    price DOUBLE(8, 2),
    publication_date DATE
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Customers (
    customer_id INT(3) PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215),
    email VARCHAR(215) UNIQUE,
    address TEXT
);

CREATE TABLE Orders (
    order_id INT(3) PRIMARY KEY AUTO_INCREMENT,
    customer_id INT(3),
    order_date DATE DEFAULT CURRENT_DATE
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
);

CREATE TABLE Order_Details (
    orderdetail_id INT(3) AUTO_INCREMENT,
    order_id INT(3),
    book_id INT(3),
    quantity DOUBLE(8, 2)
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
)
