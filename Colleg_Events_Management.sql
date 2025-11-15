CREATE DATABASE CollegeEvent;
USE CollegeEvent;

CREATE Table Categories (
	Category_id Int primary key Auto_Increment,
    Category_name VARCHAR (100) NOT NULL UNIQUE,
    Description Text
);
SELECT * FROM Event;

CREATE Table Venue (
	Venue_id INT Primary Key Auto_Increment,
    Venue_Name VARCHAR (150) NOT NULL,
    Venue_location VARCHAR (200) NOT NULL,
    Capacity INT NOT NULL
);

SELECT * FROM Student;

CREATE TABLE Student (
	Student_id INT Primary key,
	Student_name VARCHAR (50),
    roll_no VARCHAR (20) NOT NULL UNIQUE,
    email VARCHAR (80) NOT NULL UNIQUE,
    phone_number VARCHAR (10),
    Year_Of_Student INT,
    Department VARCHAR (100)
);


ALTER TABLE Student
MODIFY roll_no INT;

CREATE Table Event (
	Event_id INT Primary Key Auto_Increment,
    Event_name VARCHAR (150) NOT NULL,
    Description Text,
    Category_id INT, 
    Venue_id INT,
    Event_date DATE NOT NULL,
    Start_time TIME NOT NULL,
	End_time TIME NOT NULL,
    Organizer_name VARCHAR (100),
    Status ENUM ("Planned", "Active", "Completed", "cancelled") Default 'Planned',
    FOREIGN KEY (Category_id) REFERENCES Categories (Category_id),
    FOREIGN KEY (Venue_id) REFERENCES Venue (Venue_id)
)
SELECT * FROM Event;

CREATE Table Registration (
	registration_id int primary key AUTO_INCREMENT,
    event_id INT,
	student_id INT,
	Registration_date DATE DEFAULT (CURDATE()),
	attendance ENUM ("Registered" , "Present" , "Absent") DEFAULT "Registered",
	FOREIGN KEY (event_id) REFERENCES EVENT (Event_id),
	FOREIGN KEY (student_id) REFERENCES Student (Student_id),
	UNIQUE KEY unique_registration (event_id,student_id)
);

SELECT * FROM Registration;

Use CollegeEvent;
Show tables;

/*Insertion of data*/

INSERT INTO Categories (Category_name , Description)
VALUES
("Technichal", "Programming session, tech talks, coding, programming session"),
("Cultural", "Dance, Drama, Art, Music, Drama, Exhibition"),
("Sports", "Atheletic events, Tournaments, Fitness activity"),
("Acaddemic","Seminar, Guest Lecture, Educational workshop"),
("Social","Student meetup, social gathering, club activities");

SELECT * FROM Categories;

INSERT INTO Venue (Venue_Name, Venue_Location) 
VALUES 
("Main Auditorium","Academic Block A"),
("Computer Lab","Tech building"),
("Sports Ground","Atheletic Complex"),
("Open Area","Central Campus");

INSERT INTO Student (Student_id, Student_name, roll_no, email, Year_Of_Student, Department )
VALUES
(01,"Amit Kumar", 01 , "amitkumar01@gmail.com", 3, "Computer Science"),
(02,"Dev Sharma", 22, "devsharma22@gmail.com", 4, "E&TC"),
(03,"Rudra Kapoor", 13, "rudrakapoor13@gmail.com", 1, "Computer Science"),
(04,"Priya Sharma", 04,"priyasharma04@gmail.com" , 1 , "Electronics"),
(05,"Ritika Patil", 05, "ritikapatil2@gmail.com",2, "Ai & Data Science"),
(06,"Parth Shrivasthava", 10,"partha10@gmail.com",4 , "Ai & Data Science"),
(07,"Kunal Kapoor", 21,"kunalkapoor21@gmail.com",1 , "Electronics"),
(08,"Rahul Verma", 45,"rahulverma45@gmail.com",2 , "IT"),
(09,"Sneha Patel", 23,"snehapatel23@gmail.com",4 ,"Ai & Data Science"),
(10,"Vedahi Verma", 47,"vverma11@gmail.com",3 , "IT"),
(11,"Sakshi Jain", 50, "sakshijain@07gmail.com" ,3 ,"Computer Science"); 

SELECT * FROM Student;

INSERT INTO Event(event_name, description, category_id, venue_id, event_date, start_time, 
end_time, max_participants, organizer_name, status) VALUES
('Python Workshop', 'Learn python programming basics', 1, 2, '2025-08-15', '10:00:00', '16:00:00',45, 'CS Club', 'Planned'),
('Annual Day Celebration', 'college annual culture program', 2, 1, '2025-09-20', '18:00:00', '21:00:00', 250, 'Cultural Committee', 'Planned'),
('Cricket Tournament', 'Inter-department cricket competition', 3, 3, '2025-08-10', '09:00:00', '17:00:00', 100, 'sport Committee', 'Active'),
('AI Seminar','Introduction... to Artificial Intelligence', 4, 4, '2025-07-25','14:00:00', '16:00:00', 80, 'Prof. Sharma', 'Completed'),
('Freshers Welcome', 'Welcome party for Freshers', 5, 5, '2025-07-15', '17:00:00', '20:00:00', 150, 'Student Council', 'Completed' );

SELECT * FROM Event;
DESCRIBE EVENT;

ALTER TABLE EVENT 
ADD COLUMN max_participants INT; 

INSERT INTO Registration (event_id, student_id, Registration_date, attendance)
VALUES
(1, 1, "2025-07-20", "Registered"),
(1, 4, "2025-07-21", "Registered"),
(1, 7, "2025-07-22", "Registered"),
(2, 2, "2025-08-01", "Registered"),
(2, 6, "2025-08-02", "Registered"),
(3, 3, "2025-07-28", "Present"),
(3, 5, "2025-07-29", "Present"),
(4, 1, "2025-07-20", "Present"),
(4, 4, "2025-07-21", "Present"),
(4, 7, "2025-07-22", "Absent"),
(5, 5, "2025-07-10", "Present"),
(5, 8, "2025-07-11", "Present");

SELECT * FROM Registration;

/*END OF PROJECT*/

/*SELECTING ALL EVENTS AND ITS DETAILS AT ONCE.*/
SELECT
    e.event_name,
    c.category_name,
    e.event_date,
    e.start_time,
    e.organizer_name,
    e.status
FROM Event e
JOIN Categories c ON e.category_id = c.category_id
ORDER BY e.event_date;



















