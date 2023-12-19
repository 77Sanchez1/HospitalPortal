Create database hospital_portal;

Use hospital_portal; 

Create table Patients (
patient_id int not null unique auto_increment primary key,
patient_name varchar(45) not null,
age int not null,
admission_date date,
discharge_date date
); 

Create table Appointments (
appointment_id int not null unique auto_increment primary key,
patient_id int not null,
doctor_id int not null,
appointment_date date not null,
appointment_time decimal not null,
Foreign key (patient_id) references Patients(patient_id)
);

INSERT INTO Patients (patient_name, age, admission_date, discharge_date) VALUES
('Elijah Martin', 10, '2023/10/12', '2023/10/20'),
('Sara Lockhart', 17, '2023/11/01', '2023/11/10'),
('Natalia Gonzalez', 45, '2023/12/07', '2023/12/12');

DELIMITER //

Create procedure ScheduleAppointment(
    IN patient_id INT,
    IN doctor_id INT,
    IN appointment_date DATE
)
BEGIN
   INSERT INTO appointments (patient_id, doctor_id, appointment_date)
   VALUES (patient_id, doctor_id, appointment_date);
END // 




CREATE PROCEDURE DischargePatient(
    IN patient_id INT
)
BEGIN

	UPDATE patients 
    SET patient_discharge_status = 'Discharged' 
    WHERE patient_id = patient_id;
    
END //

DELIMITER ;

Create table Doctors (
doctor_id int auto_increment not null primary key,
doctor_name varchar(50),
specialization varchar(45),
email varchar(80)
);

INSERT INTO Doctors (doctor_name, specialization,email) VALUES
('Joesph Johnson', 'Cardiology', 'joesph.johnson@gmail.com'),
('Charlotte Rivers', 'Anesthesiology', 'charlotte.rivers@gmail.com'),
('Mia Carbone', 'Neurology', 'mia.carbone@gmail.com');

CREATE VIEW DoctorAppointmentPatientView AS 
SELECT
    a.appointment_id,
    d.doctor_name,
    p.patient_name,
    a.appointment_date
FROM
	appointments a
JOIN
	doctors d ON a.doctor_id = d.doctor_id
JOIN
	patients p ON a.patient_id = p.patient_id;
    
SELECT * FROM DoctorAppointmentPatientView;