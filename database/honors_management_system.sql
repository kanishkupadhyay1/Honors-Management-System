CREATE DATABASE IF NOT EXISTS HONORS;
USE HONORS;

-- =========================
-- TABLE: DEPARTMENT
-- =========================
CREATE TABLE Department(
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL,
    HOD_Name VARCHAR(100),
    Faculty_Incharge VARCHAR(100)
);

INSERT INTO Department VALUES
(1, 'Computer Science', 'Dr. Sharma', 'Prof. Mehta'),
(2, 'Information Technology', 'Dr. Kumar', 'Prof. Rao'),
(3, 'Electronics', 'Dr. Singh', 'Prof. Verma'),
(4, 'Mechanical', 'Dr. Reddy', 'Prof. Naidu'),
(5, 'Civil', 'Dr. Iyer', 'Prof. Pillai'),
(6, 'Electrical', 'Dr. Das', 'Prof. Bose'),
(7, 'AI & Data Science', 'Dr. Nair', 'Prof. Menon'),
(8, 'Cyber Security', 'Dr. Gupta', 'Prof. Jain'),
(9, 'Biotechnology', 'Dr. Khan', 'Prof. Ali'),
(10, 'Chemical Engineering', 'Dr. Roy', 'Prof. Sen');

-- =========================
-- TABLE: STUDENT
-- =========================
CREATE TABLE Student(
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone_Number VARCHAR(15),
    Email_ID VARCHAR(100) UNIQUE,
    Year INT,
    Department_ID INT,
    Status VARCHAR(20),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
    CHECK (Year BETWEEN 1 AND 4)
);

INSERT INTO Student VALUES
(101,'Arjun','9876543210','arjun@gmail.com',2,1,'Active'),
(102,'Priya','9876501234','priya@gmail.com',3,1,'Active'),
(103,'Karthik','9123456780','karthik@gmail.com',2,2,'Active'),
(104,'Sneha','9988776655','sneha@gmail.com',4,3,'Inactive'),
(105,'Rahul','9871234567','rahul@gmail.com',1,4,'Active'),
(106,'Divya','9123409876','divya@gmail.com',3,5,'Active'),
(107,'Vikram','9012345678','vikram@gmail.com',2,6,'Active'),
(108,'Ananya','9988123456','ananya@gmail.com',4,7,'Active'),
(109,'Rohit','9877001122','rohit@gmail.com',3,8,'Inactive'),
(110,'Meena','9090909090','meena@gmail.com',2,9,'Active');

-- =========================
-- TABLE: HONORS PROGRAM
-- =========================
CREATE TABLE Honors_Program(
    Program_ID INT PRIMARY KEY,
    Program_Name VARCHAR(100),
    Department_ID INT,
    Max_Seats INT,
    Start_yr INT,
    Status VARCHAR(20),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

INSERT INTO Honors_Program VALUES
(201,'AI Honors',1,30,2024,'Active'),
(202,'Data Science Honors',1,25,2024,'Active'),
(203,'Cyber Security Honors',8,20,2024,'Active'),
(204,'Robotics Program',3,15,2024,'Active'),
(205,'Cloud Computing',2,20,2024,'Active'),
(206,'Blockchain Program',7,10,2024,'Active'),
(207,'IoT Program',3,18,2024,'Active'),
(208,'Machine Learning',7,22,2024,'Active'),
(209,'Big Data Analytics',2,25,2024,'Active'),
(210,'Software Engineering Honors',1,30,2024,'Active');

-- =========================
-- TABLE: SEMESTER
-- =========================
CREATE TABLE Semester(
    Semester_ID INT PRIMARY KEY,
    Semester_No INT,
    Academic_Year VARCHAR(20)
);

INSERT INTO Semester VALUES
(1,1,'2023-24'),
(2,2,'2023-24'),
(3,3,'2024-25'),
(4,4,'2024-25'),
(5,5,'2025-26'),
(6,6,'2025-26'),
(7,7,'2026-27'),
(8,8,'2026-27');

-- =========================
-- TABLE: ACADEMIC PERFORMANCE
-- =========================
CREATE TABLE Academic_Performance(
    Performance_ID INT PRIMARY KEY,
    Student_ID INT,
    Semester_ID INT,
    CGPA DECIMAL(3,2),
    Credits_Earned INT,
    Backlogs INT,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Semester_ID) REFERENCES Semester(Semester_ID)
);

INSERT INTO Academic_Performance VALUES
(301,101,1,8.50,20,0),
(302,102,1,9.00,22,0),
(303,103,2,7.80,18,1),
(304,104,2,6.90,16,2),
(305,105,3,8.20,21,0),
(306,106,3,9.10,23,0),
(307,107,4,7.50,19,1),
(308,108,4,8.90,22,0),
(309,109,5,6.80,17,2),
(310,110,5,8.30,20,0);

-- =========================
-- TABLE: APPLICATION
-- =========================
CREATE TABLE Application(
    Application_ID INT PRIMARY KEY,
    Student_ID INT,
    Program_ID INT,
    Application_Date DATE,
    Status VARCHAR(20),
    UNIQUE(Student_ID, Program_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Program_ID) REFERENCES Honors_Program(Program_ID)
);

INSERT INTO Application VALUES
(401,101,201,'2024-06-01','Submitted'),
(402,102,202,'2024-06-02','Approved'),
(403,103,203,'2024-06-03','Submitted');

-- =========================
-- TABLE: ELIGIBILITY
-- =========================
CREATE TABLE Eligibility_Criteria(
    Criteria_ID INT PRIMARY KEY,
    Program_ID INT,
    Min_CGPA DECIMAL(3,2),
    Min_Credits INT,
    Max_Backlogs INT,
    FOREIGN KEY (Program_ID) REFERENCES Honors_Program(Program_ID)
);

INSERT INTO Eligibility_Criteria VALUES
(501,201,8.00,20,0),
(502,202,7.50,18,1);

-- =========================
-- TABLE: SELECTION
-- =========================
CREATE TABLE Selection(
    Selection_ID INT PRIMARY KEY,
    Application_ID INT,
    Student_Rank INT,
    Final_Score DECIMAL(5,2),
    Selection_Date DATE,
    FOREIGN KEY (Application_ID) REFERENCES Application(Application_ID)
);

INSERT INTO Selection VALUES
(601,401,2,85.50,'2024-06-15'),
(602,402,1,91.20,'2024-06-15');

-- =========================
-- TRIGGER
-- =========================
DELIMITER //
CREATE TRIGGER check_cgpa
BEFORE INSERT ON Academic_Performance
FOR EACH ROW
BEGIN
    IF NEW.CGPA < 0 OR NEW.CGPA > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid CGPA value';
    END IF;
END;
//
DELIMITER ;

-- =========================
-- PROCEDURE
-- =========================
DELIMITER //
CREATE PROCEDURE get_students()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE s_name VARCHAR(100);

    DECLARE cur CURSOR FOR SELECT Name FROM Student;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO s_name;
        IF done THEN LEAVE read_loop;
        END IF;
        SELECT s_name;
    END LOOP;

    CLOSE cur;
END;
//
DELIMITER ;