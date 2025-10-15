CREATE TABLE Books(
    book_id INT PRIMARY KEY, 
    title VARCHAR(130),
    author_id ,
    price DOUBLE,
    publication_date DATE

);

CREATE TABLE Authors(
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215),
);

CREATE TABLE Customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    adress TEXT,
);
CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id ,
    order_date DATE,

);

CREATE TABLE Order_Details(
    orderdetailid INT PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCES Orders(order_id),
    book_id INT FOREIGN KEY REFERENCES Books(bbasook_id),
    quantity DOUBLE,

)
