create database lab2_5673;
use lab2_5673;
 
/*Q1*/
/*
create table Book(
  BookID int not null,
  Title nvarchar(50) not null,
  Author nvarchar(50) not null,
  Pub_year int not null, 
  ISBN nvarchar(50) not null,
  )
  
 Insert into Book(BookID,Title,Author,Pub_year,ISBN)
 Values (1,'To kill a Mockingbird','Harper Lee',1960,'9780061120084'),
 (2,'1984','George Orwell',1949,'9780451524935'),
 (3,'The great gatsby','F. Scott Fitzgerald',1925,'9780743273565'),
 (4,'Pride and  Prejudice','Jane Austen',1813,'9780141439518');

 Alter table Book add constraint ins_bk primary key(BookID)

 Insert into Book(BookID,Title,Author,Pub_year,ISBN)
 Values (5,'The catcher in the rye','J.D Salinger',1951,'9780316769174');

 Select BookID,Title,Author,Pub_year,ISBN
 From Book;

 Update Book
 Set Title='Catcher in the rye'
 Where ISBN='9780316769174';

 Delete from Book
 Where ISBN='9780316769174';


*/








 /*Q2*/
 /*
 create table product(

 ProductID int not null,
 Productname nvarchar(50) not null,
 category nvarchar(50) not null,
 Price float not null
 );

 Insert into product(ProductID,Productname,category,Price)
 Values (1, 'Laptop', 'Electronics' ,800.00),
 (2, 'Desk Chair', 'Furniture', 120.00),
 (3, 'Smartphone' ,'Electronics',500.00),
 (4, 'Office Desk', 'Furniture' ,250.00),
 (5, 'Wireless Mouse', 'Electronics' ,20.00),
 (6, 'Bookshelf', 'Furniture' ,150.00),
 (7, 'Headphones', 'Electronics' ,100.00);
  Alter table Book add constraint pd_bk primary key(ProductID)

 Select ProductID,Productname,category,Price
 From Product
 Select *
 From Product
 Where Productname LIKE '%Chair%';

 Select Productname,Price
 From Product
 Where category='Electronics';

 Select Productname,Price
 From Product
 Where Price < 200.00;

 Select Productname,category
 From Product
 Where Productname LIKE '%Desk%';
 */








 /*Q3*/
 /*
 create table orderss(

 order_id INT not null,
 customer_id INT not null,
 order_date DATE not null,
 total_amount DECIMAL not null
 );

create table employee(

 employee_id INT not null,
 first_name VARCHAR(100) not null,
 last_name VARCHAR(100) not null,
 department_id INT not null
 );
create table department(

 department_id INT not null,
 department_name VARCHAR (100) not null,
 );

Insert into orderss(order_id,customer_id,order_date,total_amount)
 Values (1, 101, '2023-09-01' ,150.50),
 (2 ,102 ,'2022-09-02 ',750.20),
 (3 ,103 ,'2023-09-03' ,200.00),
 (4 ,104 ,'2023-09-04 ',800.75),
 (5 ,105, '2021-09-05' ,300.30);

 Insert into employee(employee_id, first_name, last_name,department_id)
 Values (1 ,'John' ,'Smith' ,101),
 (2 ,'Sarah' ,'Johnson' ,102),
 (3 ,'Michael' ,'Williams', 103),
 (4 ,'Emily', 'Davis', 104),
 (5 ,'David' ,'Lee' ,105);

 Insert into department(department_id, department_name)
 Values (101 ,'Sales'),
 (102 ,'Marketing'),
 (103 ,'Finance'),
 (104 ,'Human Resources'),
 (105 ,'Research and Development');

 SELECT SUM(total_amount) AS TotalRev
 FROM orderss;

 SELECT AVG(total_amount) AS AvgOrderAmt
 FROM orderss;

 UPDATE orderss 
 SET total_amount = total_amount * 1.10;

 SELECT * FROM orderss 
 WHERE total_amount > 500.00;

 SELECT SUM(total_amount) AS TotalAmt2023
 FROM orderss
 WHERE YEAR(order_date) = 2023;

 /*.......................................................................*/

SELECT concat (first_name,' ', last_name)
FROM employee
UNION
SELECT department_name 
FROM department;


SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM department d
LEFT JOIN employee e ON d.department_id = e.department_id
GROUP BY d.department_name;


SELECT d.department_name
FROM department d
LEFT JOIN employee e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
*/









/*Q4*/
/*
create table pproducts(

 productID int not null,
 productname varchar(50) not null,
 descriptions TEXT not null,
 price DECIMAL not null,
 manufacture_date DATE not null
 );
 
insert into pproducts(productID, productname, descriptions , price, manufacture_date)
Values (1, 'Laptop', 'High Performance laptop' ,900,'2023-05-15'),
 (2, 'Smartphone', 'Latest smartphone model', 699, '2023-06-20'),
 (3, 'Headphone' ,'Noise-canceling headphones',949,'2023-07-10'),
 (4, 'Tablet', '10-inch touchscreen tablet' ,299,'2023-06-05'),
 (5, 'Camera', 'DSLR camera with zoom lens' ,799,'2023-08-12');

 select*
 From pproducts;

SELECT SUBSTRING(productname, 1, 3) AS shortn
FROM pproducts;

SELECT productname, DATEDIFF(DAY, manufacture_date, GETDATE()) AS ageindays
FROM pproducts;

SELECT productname, descriptions
FROM pproducts
WHERE descriptions LIKE '%premium%';

ALTER TABLE pproducts ADD discount_price DECIMAL(10, 2);

UPDATE pproducts
SET discount_price = price * 0.90;

SELECT *
FROM pproducts
WHERE manufacture_date = (SELECT MIN(manufacture_date) FROM pproducts);

SELECT SUM(price) AS total_price
FROM pproducts;

SELECT *
FROM pproducts
ORDER BY price DESC;

SELECT COUNT(*)
FROM pproducts
WHERE price > 900;

SELECT TOP 1 productname, descriptions
FROM pproducts
ORDER BY LEN(descriptions) DESC;


UPDATE pproducts
SET descriptions = 'Budget Product'
WHERE price < 799;
*/