use DBLAB;

CREATE TABLE Paper_details(paper_id varchar(255),paper_title varchar(255),paper_type varchar(255),publication date );

CREATE TABLE Paper_author(paper_id varchar(255),author_id varchar(255));

CREATE TABLE Author_details(author_id varchar(255),author_type varchar(255));

CREATE TABLE Student_details(student_id varchar(255),student_name varchar(255),student_institute varchar(255),department varchar(255),DOB date,research_area varchar(255));

CREATE TABLE Faculty_details(faculty_id varchar(255),faculty_name varchar(255),faculty_institute varchar(255),department varchar(255),DOB date,research_area varchar(255));

CREATE TABLE Supervisor(faculty_id varchar(255),student_id varchar(255));
		
INSERT INTO Paper_details VALUES('P1','Thesis1','conference', '2010-10-21');
INSERT INTO Paper_details VALUES('P2','Thesis2','conference', '2010-10-22');
INSERT INTO Paper_details VALUES('P3','Thesis3','journal', '2010-10-21');
INSERT INTO Paper_details VALUES('P4','Thesis4','conference', '2010-10-23');
INSERT INTO Paper_details VALUES('P5','Thesis5','conference', '2010-10-24');
INSERT INTO Paper_details VALUES('P6','Thesis6','journal', '2010-10-21');
INSERT INTO Paper_details VALUES('P7','Thesis7','conference', '2010-10-01');
INSERT INTO Paper_details VALUES('P8','Thesis8','journal', '2010-10-15');
INSERT INTO Paper_details VALUES('P9','Thesis9','journal', '2010-10-17');
INSERT INTO Paper_details VALUES('P0','Thesis10','conference', '2010-10-18');

INSERT INTO Paper_author VALUES ('P1','A1234');
INSERT INTO Paper_author VALUES ('P2','102');
INSERT INTO Paper_author VALUES ('P3','C1234');
INSERT INTO Paper_author VALUES ('P4','D1234');
INSERT INTO Paper_author VALUES ('P5','E1234');
INSERT INTO Paper_author VALUES ('P6','F1234');
INSERT INTO Paper_author VALUES ('P7','G1234');
INSERT INTO Paper_author VALUES ('P8','H1234');
INSERT INTO Paper_author VALUES ('P9','1501CS60');
INSERT INTO Paper_author VALUES ('P0','J1234');

INSERT INTO Author_details VALUES ('A1234','Student');
INSERT INTO Author_details VALUES ('102','Faculty');
INSERT INTO Author_details VALUES ('C1234','Student');
INSERT INTO Author_details VALUES ('D1234','Faculty');
INSERT INTO Author_details VALUES ('E1234','Faculty');
INSERT INTO Author_details VALUES ('F1234','Student');
INSERT INTO Author_details VALUES ('G1234','Faculty');
INSERT INTO Author_details VALUES ('H1234','Faculty');
INSERT INTO Author_details VALUES ('1501CS60','Student');
INSERT INTO Author_details VALUES ('J1234','Faculty');

INSERT INTO Student_details VALUES('A1234', 'R. Kumar', 'IITP' ,'CSE','1998-09-02', 'Big Data' );
INSERT INTO Student_details VALUES('C1234', 'R. Gupta', 'IITP' ,'CSE','1997-08-02', 'ML' );
INSERT INTO Student_details VALUES('F1234', 'P. Kumar', 'IITP' ,'CSE','1989-09-01', 'AI' );
INSERT INTO Student_details VALUES('1501CS60', 'P. Gupta', 'IITP' ,'CSE','2008-09-02', 'Big Data' );
INSERT INTO Student_details VALUES('P1234', 'R. Das', 'IITP' ,'CSE','1982-07-02', 'Algorithms' );
INSERT INTO Student_details VALUES('Q1234', 'P. Das', 'IITP' ,'CSE','1998-06-02', 'Vision' );
INSERT INTO Student_details VALUES('R1234', 'W. Khan', 'IITP' ,'CSE','1998-11-02', 'Big Data' );
INSERT INTO Student_details VALUES('S1234', 'R. Jain', 'IITP' ,'CSE','2000-12-02', 'AI' );
INSERT INTO Student_details VALUES('T1234', 'A. Jha', 'IITP' ,'CSE','1972-01-11', 'Automation' );
INSERT INTO Student_details VALUES('U1234', 'S. Gupta', 'IITP' ,'CSE','1987-05-03', 'Electronics' );

INSERT INTO Faculty_details VALUES('102', 'R. Kumar', 'IIT Patna' ,'CSE','1987-09-02', 'Big Data' );
INSERT INTO Faculty_details VALUES('102', 'R. Kumar', 'IIT Patna' ,'CSE','1987-09-02', 'AI' );
INSERT INTO Faculty_details VALUES('D1234', 'R. Gupta', 'IIT Hyderabad' ,'CSE','1997-08-02', 'ML' );
INSERT INTO Faculty_details VALUES('E1234', 'P. Kumar', 'IIT Mumbai' ,'CSE','1966-09-01', 'AI' );
INSERT INTO Faculty_details VALUES('E1234', 'P. Kumar', 'IIT Mumbai' ,'CSE','1966-09-01', 'Big Data' );
INSERT INTO Faculty_details VALUES('G1234', 'P. Gupta', 'IIT Patna' ,'CSE','1977-09-02', 'Big Data' );
INSERT INTO Faculty_details VALUES('H1234', 'R. Das', 'IIT Jodhpur' ,'CSE','1982-07-02', 'Algorithms' );
INSERT INTO Faculty_details VALUES('J1234', 'P. Das', 'IIT Patna' ,'CSE','1973-06-02', 'Vision' );

INSERT INTO Supervisor VALUES('102' ,'A1234');
INSERT INTO Supervisor VALUES('102' ,'P1234');
INSERT INTO Supervisor VALUES('J1234' ,'Q1234');
INSERT INTO Supervisor VALUES('D1234' ,'C1234');
INSERT INTO Supervisor VALUES('D1234' ,'S1234');
INSERT INTO Supervisor VALUES('E1234' ,'T1234');
INSERT INTO Supervisor VALUES('E1234' ,'U1234');
INSERT INTO Supervisor VALUES('H1234' ,'1501CS60');
INSERT INTO Supervisor VALUES('G1234' ,'F1234');

ALTER TABLE Paper_details ADD PRIMARY KEY(paper_id);
ALTER TABLE Author_details ADD PRIMARY KEY(author_id);
ALTER TABLE Student_details ADD PRIMARY KEY(student_id);
ALTER TABLE Faculty_details ADD PRIMARY KEY(faculty_id,research_area);
ALTER TABLE Paper_author ADD PRIMARY KEY(paper_id,author_id);
ALTER TABLE Supervisor ADD PRIMARY KEY(faculty_id,student_id);

ALTER TABLE Paper_author ADD FOREIGN KEY (paper_id) REFERENCES Paper_details(paper_id);
ALTER TABLE Paper_author ADD FOREIGN KEY (author_id) REFERENCES Author_details(author_id);
ALTER TABLE Supervisor ADD FOREIGN KEY (faculty_id) REFERENCES Faculty_details(faculty_id); 
ALTER TABLE Supervisor ADD FOREIGN KEY (student_id) REFERENCES Student_details(student_id);


SELECT paper_title FROM Paper_details ;
SELECT student_id, student_name, student_institute, department, DOB, research_area FROM Student_details WHERE research_area like '%Big Data' ;
SELECT COUNT(paper_type) FROM Paper_details WHERE paper_type like '%Journal' ;
SELECT student_id, student_name, student_institute, department, DOB, research_area FROM Student_details WHERE DOB between '1990-04-01' AND '2000-03-31' ;
SELECT faculty_id, faculty_name, faculty_institute, department, DOB, research_area FROM Faculty_details WHERE research_area='AI' ;
SELECT faculty_id, faculty_name, faculty_institute, department, DOB, research_area FROM Faculty_details WHERE research_area= '%AI' OR research_area ='%Big Data' ;
SELECT student_id, student_name, student_institute, department, DOB, research_area FROM Student_details WHERE student_name like '%Kumar' ;
SELECT faculty_id, count(student_id) FROM Supervisor GROUP BY faculty_id;
SELECT paper_id, count(author_id) FROM Paper_author GROUP BY paper_id HAVING (count(author_id) > 1);

DELETE FROM Supervisor WHERE faculty_id='J1234';
1
SELECT * FROM Faculty_details LEFT JOIN Supervisor ON Faculty_details.faculty_id = Supervisor.faculty_id WHERE Supervisor.faculty_id IS NULL;
2
SELECT * FROM Student_details INNER JOIN Paper_author ON Student_details.student_id = Paper_author.author_id WHERE Student_details.student_institute='IITP';
3
SELECT paper_id FROM Paper_author INNER JOIN Author_details ON Paper_author.author_id=Author_details.author_id  WHERE Author_details.author_id='1501CS60' AND Author_details.author_type='Student';
4
SELECT * FROM Student_details INNER JOIN Supervisor ON Supervisor.student_id=Student_details.student_id INNER JOIN Paper_author ON Student_details.student_id=Paper_author.author_id INNER JOIN Paper_details ON Paper_details.paper_id=Paper_author.paper_id WHERE Supervisor.faculty_id='102' AND Paper_details.paper_type='conference'
5
SELECT Paper_details.Paper_author.paper_id,COUNT(Paper_author.paper_id) as cn,Paper_author.author_id FROM Paper_author INNER JOIN Paper_details ON Paper_author.paper_id = Paper_details.paper_id GROUP BY author_id having cn=1;
6
SELECT faculty_id,count(paper_id) FROM Faculty_details LEFT JOIN Paper_author ON Faculty_details.faculty_id=Paper_author.author_id GROUP BY Paper_author.paper_id
8
SELECT * FROM Student_details LEFT JOIN Author_details ON Student_details.student_id=Author_details.author_id WHERE Author_details.author_id IS NULL
10









