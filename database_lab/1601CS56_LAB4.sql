create database SP;
use SP;

create table supplier(
sno varchar(10) NOT NULL PRIMARY KEY,
sname varchar(10),
city varchar(10),
phone bigint,
email varchar(10));

create table parts(
pno varchar(10) NOT NULL PRIMARY KEY,
pname varchar(10),
weight integer,
color varchar(10));

create table sp(
sno varchar(10) NOT NULL,
pno varchar(10) NOT NULL,
PRIMARY KEY(sno, pno),
CONSTRAINT FK_sno FOREIGN KEY (sno) REFERENCES
supplier(sno),
CONSTRAINT FK_pno FOREIGN KEY (pno) REFERENCES
parts(pno));

ALTER TABLE sp ADD COLUMN qty integer AFTER pno; 
ALTER TABLE sp ADD COLUMN dos DATE AFTER qty; 
ALTER TABLE parts ADD COLUMN dom DATE AFTER color; 
ALTER TABLE supplier ADD COLUMN dob DATE AFTER email;


INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s1', 'AMIT', 'KANPUR', '9876543201', 'AMIT@', '2000-2-13');
INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s2', 'RAHUL', 'PATNA', '9878943421', 'RAHUL@', '1997-1-14');
INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s3', 'SHIKHA', 'BIHTA', '8976545321', 'SHIKHA@', '1976-2-1');
INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s4', 'MAYA', 'LUCKNOW', '9876544300', 'MAYA@', '2002-2-11');
INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s5', 'ARUN', 'BIHTA', '7896574123', 'ARUN@', '1977-8-14');
INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s6', 'TANYA', 'KANPUR', '6123085462', 'TANYA@', '1975-7-13');
INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s7', 'ARUNIKA', 'KANPUR', '3258075934', 'arunika@', '1997-2-4');
INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s8', 'PARTH', 'PATNA', '7746985234', 'PARTH@', '1982-6-25');
INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s9', 'DHANUSH', 'BIHTA', '9638527410', 'DHANUSH@', '2011-5-26');
INSERT INTO supplier(sno, sname, city, phone, email, dob)
VALUES ('s123', 'AMAN', 'KANPUR', '9517538524', 'AMAN@', '1998-4-30');

select * from supplier;

INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p1', 'A', '123', 'A', '2012-2-13');
INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p2', 'B', '121', 'B', '2011-2-13');
INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p3', 'C', '223', 'C', '2018-2-13');
INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p4', 'D', '100', 'D', '2012-2-13');
INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p5', 'E', '120', 'E', '2010-7-13');
INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p6', 'F', '110', 'F', '2001-2-13');
INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p7', 'G', '140', 'G', '1912-3-18');
INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p8', 'H', '230', 'H', '1996-6-13');
INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p9', 'I', '89', 'I', '1999-2-13');
INSERT INTO parts(pno, pname, weight, color, dom)
VALUES('p10', 'J', '190', 'J', '2018-1-29');

select * from parts;

INSERT INTO sp(sno, pno, qty, dos)
VALUES('s123', 'p10', '23', '2018-6-12');
INSERT INTO sp(sno, pno, qty, dos)
VALUES('s123', 'p7', '23', '2018-3-12');
INSERT INTO sp(sno, pno, qty, dos)
VALUES('s1', 'p1', '22', '2018-6-16');
INSERT INTO sp(sno, pno, qty, dos)
VALUES('s2', 'p8', '21', '2017-6-11');
INSERT INTO sp(sno, pno, qty, dos)
VALUES('s1', 'p9', '20', '2017-5-23');
INSERT INTO sp(sno, pno, qty, dos)
VALUES('s3', 'p3', '9', '2006-6-11');
INSERT INTO sp(sno, pno, qty, dos)
VALUES('s1', 'p4', '2', '2017-6-05');
INSERT INTO sp(sno, pno, qty, dos)
VALUES('s5', 'p5', '3', '2012-6-11');
INSERT INTO sp(sno, pno, qty, dos)
VALUES('s5', 'p6', '29', '2017-8-11');
INSERT INTO sp(sno, pno, qty, dos)
VALUES('s7', 'p2', '53', '2013-6-11');


select * from sp;
/*1*/
select sname from supplier where dob = (select max(dob) from supplier);
/*2*/
select * from supplier where datediff(curdate(),dob)>30*365;

/*3*/
select avg(floor((datediff(curdate(),dob))/365.2425)) as average_age, city from supplier group by city;

/*4*/
select sname from supplier join sp on sp.sno=supplier.sno where (SELECT YEAR(sp.dos)) = '2012';

/*5*/
select sp.dos, sname from supplier join sp on sp.sno=supplier.sno where sp.dos > '2015-02-1';

/*6*/
select parts.pname,sp.dos from parts join sp on parts.pno=sp.pno where sp.dos= (select max(sp.dos) from sp);

/*7*/
select supplier.sname,x.sno, x.pno, y.pno from sp as x join (sp as y, supplier) on (x.sno = y.sno and x.pno<y.pno and supplier.sno=x.sno) where abs(datediff(x.dos, y.dos)) <= 30 group by supplier.sname;

/*8*/
select dos, DATE_ADD(dos, INTERVAL 30*3 DAY) as warranty_date from sp; 

/*9*/
select sp.sno, sp.pno, sp.dos, curdate(), datediff(curdate(), sp.dos) as diff from sp where sp.sno='s123' and datediff(curdate(), sp.dos) < datediff(DATE_ADD(dos, INTERVAL 30*3 DAY), sp.dos);

/*10*/
select supplier.sname, sp.pno, parts.dom, curdate() from sp join (supplier,parts) on sp.sno=supplier.sno and sp.pno=parts.pno and parts.dom < DATE_SUB(curdate(), INTERVAL 6 MONTH);