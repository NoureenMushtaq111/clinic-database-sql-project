CREATE DATABASE IF NOT EXISTS ClinicDB;
USE ClinicDB;

CREATE TABLE Physicians (
    physician_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(50),
    years_experience INT
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE,
    city VARCHAR(50)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    physician_id INT,
    appointment_date DATE,
    consultation_fee DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (physician_id) REFERENCES Physicians(physician_id)
);


INSERT INTO Physicians (first_name, last_name, specialty, years_experience) VALUES
('Alice', 'Smith', 'Cardiology', 12),
('Bob', 'Johnson', 'Pediatrics', 8),
('Charlie', 'Williams', 'Dermatology', 15),
('Diana', 'Brown', 'Cardiology', 5);

INSERT INTO Patients (first_name, last_name, dob, city) VALUES
('John', 'Doe', '1985-05-12', 'New York'),
('Jane', 'Miller', '1992-07-20', 'Chicago'),
('Sam', 'Wilson', '2010-01-15', 'New York'),
('Emily', 'Davis', '1978-11-03', 'Boston');

INSERT INTO Appointments (patient_id, physician_id, appointment_date, consultation_fee) VALUES
(1, 1, '2026-03-01', 150.00),
(2, 3, '2026-03-02', 200.00),
(3, 2, '2026-03-05', 100.00),
(1, 4, '2026-03-10', 120.00),
(4, 1, '2026-03-12', 150.00);

select * from appointments;

CREATE TABLE Clinics (
    clinic_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

INSERT INTO Physicians (first_name, last_name, specialty, years_experience)
VALUES ('Gregory', 'House', 'Diagnostics', 20);

UPDATE Patients
SET city = 'Evanston'
WHERE city = 'Chicago';

DELETE FROM Appointments
WHERE consultation_fee = 0;

SELECT * 
FROM Patients
WHERE last_name LIKE 'W%';

SELECT first_name, last_name
FROM Physicians
WHERE years_experience BETWEEN 5 AND 10;

SELECT *
FROM Appointments
WHERE appointment_date > '2026-03-05'
AND consultation_fee > 120;

SELECT MAX(consultation_fee) AS highest_fee
FROM Appointments;

SELECT city, COUNT(*) AS total_patients
FROM Patients
GROUP BY city;

SELECT last_name,
       (years_experience * 0.10) AS Bonus
FROM Physicians;