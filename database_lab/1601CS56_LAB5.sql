create database SP;
use SP;
create table supplier(
sno varchar(255) NOT NULL PRIMARY KEY,
sname varchar(255),
city varchar(255),
phone bigint ,
email varchar(255));

create table parts(
pno varchar(255) NOT NULL PRIMARY KEY,
pname varchar(255),
weight int,
color varchar(255));

create table sp(
sno varchar(255) NOT NULL ,
pno varchar(255) NOT NULL,
qty int,
PRIMARY KEY(sno,pno),
FOREIGN KEY (sno) REFERENCES supplier(sno),
FOREIGN KEY (pno) REFERENCES parts(pno));

INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s1', 'AMIT', 'KANPUR', '9876543201', 'AMIT@gmail.com');
INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s212', 'RAHUL', 'PATNA', '9878943421', 'RAHUL@duck.com');
INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s3', 'SHIKHA', 'BIHTA', '8976545321', 'SHIKHA@gmail.com');
INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s4', 'MAYA', 'LUCKNOW', '9876544300', 'MAYA@bing.com');
INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s5', 'ARUN', 'BIHTA', '7896574123', 'ARUN@bing.com');
INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s6', 'TANYA', 'KANPUR', '6123085462', 'TANYA@gmail.com');
INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s7', 'ARUNIKA', 'KANPUR', '3258075934', 'arunika@gmail.com';
INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s8', 'PARTH', 'PATNA', '7746985234', 'PARTH@gmail.com');
INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s9', 'DHANUSH', 'BIHTA', '9638527410', 'DHANUSH@yahoo.com');
INSERT INTO supplier(sno, sname, city, phone, email)
VALUES ('s123', 'AMAN', 'KANPUR', '9517538524', 'AMAN@gmail.com');

INSERT INTO parts(pno, pname, weight, color)
VALUES('p1', 'A', '123', 'A');
INSERT INTO parts(pno, pname, weight, color)
VALUES('p2', 'B', '121', 'B');
INSERT INTO parts(pno, pname, weight, color)
VALUES('p3', 'C', '223', 'C');
INSERT INTO parts(pno, pname, weight, color)
VALUES('p4', 'D', '100', 'D');
INSERT INTO parts(pno, pname, weight, color)
VALUES('p5', 'E', '120', 'E');
INSERT INTO parts(pno, pname, weight, color)
VALUES('p6', 'F', '110', 'F');
INSERT INTO parts(pno, pname, weight, color)
VALUES('p7', 'G', '140', 'G');
INSERT INTO parts(pno, pname, weight, color)
VALUES('p8', 'H', '230', 'H');
INSERT INTO parts(pno, pname, weight, color)
VALUES('p9', 'I', '89', 'I');
INSERT INTO parts(pno, pname, weight, color)
VALUES('p10', 'J', '190', 'J');

INSERT INTO sp(sno, pno, qty)
VALUES('s123', 'p10', '23');
INSERT INTO sp(sno, pno, qty)
VALUES('s123', 'p7', '23');
INSERT INTO sp(sno, pno, qty)
VALUES('s1', 'p1', '22');
INSERT INTO sp(sno, pno, qty)
VALUES('s212', 'p8', '21');
INSERT INTO sp(sno, pno, qty)
VALUES('s1', 'p9', '20');
INSERT INTO sp(sno, pno, qty)
VALUES('s3', 'p3', '9');
INSERT INTO sp(sno, pno, qty)
VALUES('s1', 'p4', '2');
INSERT INTO sp(sno, pno, qty)
VALUES('s5', 'p5', '3');
INSERT INTO sp(sno, pno, qty)
VALUES('s5', 'p6', '29');
INSERT INTO sp(sno, pno, qty)
VALUES('s7', 'p2', '53');

select * from supplier;
/*1*/
Select substring(sno, 2) as sno from supplier;
/*2*/
select sname from supplier where (length(sname)-length(replace(sname, 'A','')))=2;
/*3*/
SELECT Concat(substr(sp.sno, 1, 1), substr(sp.pno, 1, 1), substr(sp.sno, 2), substr(sp.pno, 2)) as spno, sp.qty from sp;
/*4*/
Select top.num from (Select substring(sno, 2) num from supplier) top where top.num = reverse(top.num);
/*5*/
select replace(sno, 's', 'suppl') as rep from supplier;
/*6*/
select concat(substr(supplier.phone, 1, 5), '-', substr(supplier.phone, 5, 5)) as phone from supplier;
/*7*/
select concat(substr(sno, length(sno)), substr(phone, 5, 1), substr(phone, 8, 1),(FLOOR(RAND()*(99-0)+0))) from supplier;
/*8*/
SELECT format(((parts.weight)/1000),2) as weightinkg from parts;
/*9*/
select  substring(substring(email, locate('@', email)+1), 1, locate('.',substring(email, locate('@', email)+1))-1)   from supplier;

/*10*/
select pno, repeat('*', floor((weight)/10)+1) as weight from parts;

