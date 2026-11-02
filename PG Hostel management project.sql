SQL PG Hostel Management Project:

1. Database Creation:

CREATE DATABASE IF NOT EXISTS pg_hostel_management;
USE pg_hostel_management;

=> If exists the tables to delete then use:

DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Visitors;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Rooms;

2. Create Rooms Table
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type VARCHAR(20) NOT NULL,
    capacity INT NOT NULL,
    monthly_rent DECIMAL(10,2) NOT NULL,
    available_beds INT NOT NULL DEFAULT 0,

    CHECK (room_type IN ('Single', 'Double', 'Triple')),
    CHECK (capacity > 0),
    CHECK (monthly_rent > 0),
    CHECK (available_beds >= 0)
);

3. Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    college VARCHAR(100) NOT NULL,
    course VARCHAR(50) NOT NULL,
    room_id INT,

    CHECK (gender IN ('Male', 'Female')),

    FOREIGN KEY (room_id)
        REFERENCES Rooms(room_id)
);

4. Create Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    payment_month DATE NOT NULL,

    CHECK (amount > 0),
    CHECK (payment_status IN ('Paid', 'Pending')),

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
);

5. Create Visitors Table

CREATE TABLE Visitors (
    visitor_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    visitor_name VARCHAR(100) NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    visit_date DATE NOT NULL,

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
);


6. Insert Room Data
We use 5 rooms.

INSERT INTO Rooms
(room_number, room_type, capacity, monthly_rent, available_beds)
VALUES
('101', 'Single', 1, 6000, 0),
('102', 'Double', 2, 4500, 0),
('103', 'Double', 2, 4500, 0),
('104', 'Triple', 3, 3500, 0),
('105', 'Double', 2, 4500, 0);



7. Insert Student Data:

INSERT INTO Students
(student_name, gender, phone, college, course, room_id)
VALUES
('Ramana', 'Male', '9876500001', 'Aditya College of Engineering', 'MCA', 1),
('Mukesh', 'Male', '9876500002', 'Andhra University', 'B.Tech', 2),
('Anusha', 'Female', '9876500003', 'GITAM University', 'B.Sc', 2),
('Srinadh', 'Male', '9876500004', 'Raghu Engineering College', 'B.Tech', 3),
('Charan', 'Male', '9876500005', 'Aditya College of Engineering', 'MCA', 3),
('Priya', 'Female', '9876500006', 'Andhra University', 'MCA', 4),
('Bhanu', 'Male', '9876500007', 'GITAM University', 'BBA', 4),
('Sampath', 'Male', '9876500008', 'Raghu Engineering College', 'B.Tech', 4),
('Harsha', 'Male', '9876500009', 'Aditya College of Engineering', 'MCA', 5),
('Kiran', 'Male', '9876500010', 'Andhra University', 'B.Tech', 5);



8. Insert Payment Data:

INSERT INTO Payments
(student_id, payment_date, amount, payment_status, payment_month)
VALUES
(1, '2026-09-05', 6000, 'Paid', '2026-09-01'),
(1, '2026-10-05', 6000, 'Paid', '2026-10-01'),

(2, '2026-09-06', 4500, 'Paid', '2026-09-01'),
(2, '2026-10-06', 4500, 'Pending', '2026-10-01'),

(3, '2026-09-07', 4500, 'Paid', '2026-09-01'),

(4, '2026-10-05', 4500, 'Paid', '2026-10-01'),

(5, '2026-10-06', 4500, 'Pending', '2026-10-01'),

(6, '2026-10-04', 3500, 'Paid', '2026-10-01'),

(7, '2026-09-05', 3500, 'Paid', '2026-09-01'),

(8, '2026-10-05', 3500, 'Paid', '2026-10-01'),

(9, '2026-10-05', 4500, 'Paid', '2026-10-01');

10. Insert Visitor Data:

INSERT INTO Visitors
(student_id, visitor_name, relationship, visit_date)
VALUES
(1, 'Suresh Kumar', 'Father', '2026-10-02'),
(2, 'Ravi Kumar', 'Brother', '2026-10-03'),
(3, 'Lakshmi', 'Mother', '2026-10-04'),
(4, 'Mahesh', 'Friend', '2026-10-05'),
(6, 'Prakash', 'Father', '2026-10-06'),
(8, 'Vijay', 'Brother', '2026-10-07'),
(9, 'Ramesh', 'Father', '2026-10-08');
