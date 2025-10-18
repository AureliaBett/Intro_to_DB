USE `alx_book_store`;



CREATE TABLE IF NOT EXISTS Authors (
  author_id INT NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL,
  PRIMARY KEY (author_id)
) 

CREATE TABLE IF NOT EXISTS Books (
  book_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NOT NULL DEFAULT 0.00,
  publication_date DATE DEFAULT NULL,
  PRIMARY KEY (book_id),
  INDEX idx_books_author_id (author_id),
  CONSTRAINT `fk_books_author`
    FOREIGN KEY (author_id) REFERENCES Authors (author_id)

) 


CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) DEFAULT NULL UNIQUE,
  address TEXT,
) 


CREATE TABLE IF NOT EXISTS Orders (
  order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
   
  INDEX idx_orders_customer_id (customer_id),
  CONSTRAINT `fk_orders_customer`
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)

) 

CREATE TABLE IF NOT EXISTS Order_Details (
  orderdetailid INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE NOT NULL DEFAULT 1,
  PRIMARY KEY (orderdetailid),
  INDEX idx_orderdetails_order_id (order_id),
  INDEX idx_orderdetails_book_id (book_id),
  CONSTRAINT `fk_orderdetails_order`
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT `fk_orderdetails_book`
    FOREIGN KEY (book_id) REFERENCES Books(book_id)

) 