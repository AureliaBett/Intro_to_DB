DROP DATABASE IF EXISTS `alx_book_store`;
CREATE DATABASE `alx_book_store` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE `alx_book_store`;

CREATE TABLE `Books` (
  book_id INT NOT NULL PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NOT NULL,
  publication_date DATE  NULL,

  INDEX `idx_books_author_id` (`author_id`),
  CONSTRAINT `fk_books_author`
    FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE `Authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(215) NOT NULL,
  PRIMARY KEY (`author_id`)
) 

CREATE TABLE `Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(215) NOT NULL,
  `email` VARCHAR(215) DEFAULT NULL,
  `address` TEXT,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `uq_customers_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `idx_orders_customer_id` (`customer_id`),
  CONSTRAINT `fk_orders_customer`
    FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Order_Details` (
  `orderdetailid` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL DEFAULT 1,
  PRIMARY KEY (`orderdetailid`),
  INDEX `idx_orderdetails_order_id` (`order_id`),
  INDEX `idx_orderdetails_book_id` (`book_id`),
  CONSTRAINT `fk_orderdetails_order`
    FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT `fk_orderdetails_book`
    FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
