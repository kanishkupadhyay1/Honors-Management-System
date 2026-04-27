CREATE DATABASE IF NOT EXISTS university_honors;
USE university_honors;

CREATE TABLE IF NOT EXISTS department (
    Department_ID INT AUTO_INCREMENT PRIMARY KEY,
    Department_name VARCHAR(100) NOT NULL,
    HOD_Name VARCHAR(100),
    Faculty_Incharge VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS student (
    Student_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone_Number VARCHAR(20),
    Email_ID VARCHAR(100),
    Year INT,
    Dept_ID INT,
    Status VARCHAR(30),
    CONSTRAINT fk_student_department
        FOREIGN KEY (Dept_ID) REFERENCES department(Department_ID)
);

CREATE TABLE IF NOT EXISTS honors_program (
    Program_ID INT AUTO_INCREMENT PRIMARY KEY,
    Program_Name VARCHAR(120) NOT NULL,
    Department_ID INT,
    Max_Seats INT,
    Start_year INT,
    Status VARCHAR(30),
    CONSTRAINT fk_program_department
        FOREIGN KEY (Department_ID) REFERENCES department(Department_ID)
);

CREATE TABLE IF NOT EXISTS semester (
    Semester_ID INT AUTO_INCREMENT PRIMARY KEY,
    Semester_No INT NOT NULL,
    Academic_year VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS eligibility_criteria (
    Criteria_ID INT AUTO_INCREMENT PRIMARY KEY,
    Program_ID INT NOT NULL,
    Min_CGPA DECIMAL(4,2),
    Min_Credits INT,
    Max_Backlogs INT,
    CONSTRAINT fk_criteria_program
        FOREIGN KEY (Program_ID) REFERENCES honors_program(Program_ID)
);

CREATE TABLE IF NOT EXISTS application (
    Application_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Program_ID INT NOT NULL,
    Application_Date DATE,
    Status VARCHAR(30),
    CONSTRAINT fk_application_student
        FOREIGN KEY (Student_ID) REFERENCES student(Student_ID),
    CONSTRAINT fk_application_program
        FOREIGN KEY (Program_ID) REFERENCES honors_program(Program_ID)
);

CREATE TABLE IF NOT EXISTS academic_performance (
    Performance_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Semester_ID INT NOT NULL,
    Semester_GPA DECIMAL(4,2),
    Credits_earned INT,
    Backlogs INT,
    CONSTRAINT fk_performance_student
        FOREIGN KEY (Student_ID) REFERENCES student(Student_ID),
    CONSTRAINT fk_performance_semester
        FOREIGN KEY (Semester_ID) REFERENCES semester(Semester_ID)
);

CREATE TABLE IF NOT EXISTS selection (
    Selection_ID INT AUTO_INCREMENT PRIMARY KEY,
    Application_ID INT NOT NULL,
    Rank_No INT,
    Final_Score DECIMAL(5,2),
    Selection_Date DATE,
    CONSTRAINT fk_selection_application
        FOREIGN KEY (Application_ID) REFERENCES application(Application_ID)
);

INSERT INTO department (Department_ID, Department_name, HOD_Name, Faculty_Incharge) VALUES
    (1, 'Computer Science', 'Dr. Meera Nair', 'Prof. Arjun Rao'),
    (2, 'Electronics', 'Dr. Vikram Singh', 'Prof. Kavya Iyer')
ON DUPLICATE KEY UPDATE
    Department_name = VALUES(Department_name),
    HOD_Name = VALUES(HOD_Name),
    Faculty_Incharge = VALUES(Faculty_Incharge);

INSERT INTO student (Student_ID, Name, Phone_Number, Email_ID, Year, Dept_ID, Status) VALUES
    (1, 'Ananya Sharma', '9876543210', 'ananya.sharma@university.edu', 2, 1, 'Active'),
    (2, 'Rahul Verma', '9876543211', 'rahul.verma@university.edu', 3, 1, 'Active'),
    (3, 'Nisha Patel', '9876543212', 'nisha.patel@university.edu', 2, 2, 'Active')
ON DUPLICATE KEY UPDATE
    Name = VALUES(Name),
    Phone_Number = VALUES(Phone_Number),
    Email_ID = VALUES(Email_ID),
    Year = VALUES(Year),
    Dept_ID = VALUES(Dept_ID),
    Status = VALUES(Status);

INSERT INTO honors_program (Program_ID, Program_Name, Department_ID, Max_Seats, Start_year, Status) VALUES
    (1, 'AI and Data Science Honors', 1, 30, 2024, 'Active'),
    (2, 'Embedded Systems Honors', 2, 25, 2024, 'Active')
ON DUPLICATE KEY UPDATE
    Program_Name = VALUES(Program_Name),
    Department_ID = VALUES(Department_ID),
    Max_Seats = VALUES(Max_Seats),
    Start_year = VALUES(Start_year),
    Status = VALUES(Status);

INSERT INTO semester (Semester_ID, Semester_No, Academic_year) VALUES
    (1, 1, '2024-25'),
    (2, 2, '2024-25'),
    (3, 3, '2025-26')
ON DUPLICATE KEY UPDATE
    Semester_No = VALUES(Semester_No),
    Academic_year = VALUES(Academic_year);

INSERT INTO eligibility_criteria (Criteria_ID, Program_ID, Min_CGPA, Min_Credits, Max_Backlogs) VALUES
    (1, 1, 8.00, 40, 0),
    (2, 2, 7.50, 38, 1)
ON DUPLICATE KEY UPDATE
    Program_ID = VALUES(Program_ID),
    Min_CGPA = VALUES(Min_CGPA),
    Min_Credits = VALUES(Min_Credits),
    Max_Backlogs = VALUES(Max_Backlogs);

INSERT INTO application (Application_ID, Student_ID, Program_ID, Application_Date, Status) VALUES
    (1, 1, 1, '2026-04-01', 'Approved'),
    (2, 2, 1, '2026-04-03', 'Pending'),
    (3, 3, 2, '2026-04-04', 'Approved')
ON DUPLICATE KEY UPDATE
    Student_ID = VALUES(Student_ID),
    Program_ID = VALUES(Program_ID),
    Application_Date = VALUES(Application_Date),
    Status = VALUES(Status);

INSERT INTO academic_performance (Performance_ID, Student_ID, Semester_ID, Semester_GPA, Credits_earned, Backlogs) VALUES
    (1, 1, 1, 8.70, 22, 0),
    (2, 1, 2, 8.90, 22, 0),
    (3, 2, 1, 7.80, 20, 1),
    (4, 2, 2, 8.10, 20, 0),
    (5, 3, 1, 8.20, 21, 0),
    (6, 3, 2, 7.90, 20, 1)
ON DUPLICATE KEY UPDATE
    Student_ID = VALUES(Student_ID),
    Semester_ID = VALUES(Semester_ID),
    Semester_GPA = VALUES(Semester_GPA),
    Credits_earned = VALUES(Credits_earned),
    Backlogs = VALUES(Backlogs);

INSERT INTO selection (Selection_ID, Application_ID, Rank_No, Final_Score, Selection_Date) VALUES
    (1, 1, 1, 92.50, '2026-04-10'),
    (2, 3, 2, 86.25, '2026-04-10')
ON DUPLICATE KEY UPDATE
    Application_ID = VALUES(Application_ID),
    Rank_No = VALUES(Rank_No),
    Final_Score = VALUES(Final_Score),
    Selection_Date = VALUES(Selection_Date);
