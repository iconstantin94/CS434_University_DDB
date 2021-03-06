USE UNIVERSITY;

CREATE TABLE DEPARTMENTS(
	DeptId INT NOT NULL AUTO_INCREMENT,
	DeptName VARCHAR(40),
	College VARCHAR(40),
	PRIMARY KEY (DeptId)
);

CREATE TABLE INSTRUCTORS(
	LastName VARCHAR(40) NOT NULL,
	FirstName VARCHAR(40) NOT NULL,
	DeptId INT,
	Office VARCHAR(40),
	Phone VARCHAR(9),
	Email VARCHAR(255),
	PRIMARY KEY (LastName, FirstName),
	FOREIGN KEY (DeptId)
		REFERENCES DEPARTMENTS(DeptId)
		ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE COURSES(
	Cno INT NOT NULL AUTO_INCREMENT,
	Ctitle VARCHAR(40),
	Hours INT,
	DeptId INT NOT NULL,
	PRIMARY KEY (Cno),
	FOREIGN KEY (DeptId)
		REFERENCES DEPARTMENTS(DeptId)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE STUDENTS(
	Sid INT NOT NULL AUTO_INCREMENT,
	LastName VARCHAR(40),
	FirstName VARCHAR(40),
	Class VARCHAR(40),
	Phone VARCHAR(9),
	Street VARCHAR(15),
	City VARCHAR(20),
	State VARCHAR(15),
	Zip INT,
	Degree VARCHAR(20),
	DeptId INT,
	Hours INT,
	GPA DECIMAL,
	PRIMARY KEY (Sid),
	FOREIGN KEY (DeptId)
		REFERENCES DEPARTMENTS(DeptId)
		ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE SECTIONS(
	Term VARCHAR(10) NOT NULL,
	LineNo INT NOT NULL,
	Cno INT NOT NULL,
	InstrLname VARCHAR(40),
	InstrFname VARCHAR(40),
	Room VARCHAR(10),
	Days VARCHAR(10),
	StartTime TIME,
	EndTime TIME,
	Capacity INT,
	PRIMARY KEY (Term, LineNo),
	FOREIGN KEY (Cno)
		REFERENCES COURSES(Cno)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE ENROLLMENTS(
	Sid INT NOT NULL,
	Term VARCHAR(10) NOT NULL,
	LineNo INT NOT NULL,
	Grade DECIMAL,
	PRIMARY KEY (Sid, Term, LineNo),
	FOREIGN KEY (Sid)
		REFERENCES STUDENTS(Sid)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Term, LineNo)
		REFERENCES SECTIONS(Term, LineNo)
		ON UPDATE CASCADE ON DELETE CASCADE
);