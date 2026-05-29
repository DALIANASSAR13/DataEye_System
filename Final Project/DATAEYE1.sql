INSERT INTO Hospital 
(HospitalID, Name, Phone, Email, latitude, longitude) 
VALUES 
(1, 'Nile Eye Hospital', '0222345678', 'info@nileeye.eg', 30.058874, 31.229441);


INSERT INTO Department 
(Departmentcode, Name, startdate, HospitalID) 
VALUES
(1, 'Retina & Vitreous', '2010-03-01', 1),
(2, 'Cornea & External Eye', '2010-03-01', 1),
(3, 'Glaucoma', '2011-06-15', 1),
(4, 'Pediatric Ophthalmology', '2012-01-10', 1),
(5, 'Refractive Surgery', '2013-09-05', 1),
(6, 'Cataract Surgery', '2010-03-01', 1),
(7, 'Neuro-Ophthalmology', '2015-04-20', 1),
(8, 'Oculoplastics', '2016-07-01', 1);


INSERT INTO DepartmentLocation 
(location, Departmentcode) 
VALUES
('Building A, Floor 2', 1),
('Building A, Floor 1', 2),
('Building B, Floor 1', 3),
('Building C, Floor 1', 4),
('Building B, Floor 2', 5),
('Building A, Floor 3', 6),
('Building C, Floor 2', 7),
('Building D, Floor 1', 8);


INSERT INTO Doctor 
(DSSN, name, sex, birthdate, scientificarea, degree) 
VALUES
(17426841, 'Dr. Ahmed Fawzy', 'M', '1975-09-23', 'Retina & Vitreous', 'MD, PhD'),
(17956878, 'Dr. Mohamed Shawky', 'M', '1976-11-05', 'Cornea & External Eye', 'DO, FAAO'),
(15191088, 'Dr. Tarek Naguib', 'M', '1984-03-01', 'Glaucoma', 'MD, FEBO'),
(17139718, 'Dr. Khaled Mansour', 'M', '1975-04-01', 'Pediatric Ophthalmology', 'MD, FEBO'),
(10874064, 'Dr. Omar Zaki', 'M', '1972-09-23', 'Oculoplastics', 'DO, FAAO'),
(11801704, 'Dr. Hassan El-Badry', 'M', '1975-01-23', 'Refractive Surgery', 'MBBS, MS'),
(16182512, 'Dr. Youssef Kamel', 'M', '1981-12-17', 'Neuro-Ophthalmology', 'MD'),
(14786863, 'Dr. Sherif El-Naggar', 'M', '1984-08-18', 'Cataract Surgery', 'DO, FAAO');


INSERT INTO Appointment 
(AppointmentID, Appointment_time, Appointment_date, status) 
VALUES
(1, '11:30:00', '2023-05-09', 'Cancelled'),
(2, '14:00:00', '2023-07-02', 'Completed'),
(3, '15:15:00', '2024-04-11', 'No-Show'),
(4, '12:00:00', '2023-04-08', 'Completed'),
(5, '09:45:00', '2022-03-06', 'Completed');


INSERT INTO Diagnosis 
(diagnosisID, notes, diagnosisDate, conditionname, severity, DSSN) 
VALUES
(1, 'Confirmed by imaging', '2024-10-15', 'Diabetic Retinopathy', 'Severe', 17426841),
(2, 'Biopsy confirmed', '2022-07-30', 'Age-Related Macular Degeneration', 'Mild', 17426841),
(3, 'Confirmed by imaging', '2024-04-24', 'Cataract', 'Moderate', 14786863),
(4, 'Confirmed by imaging', '2022-01-01', 'Retinal Detachment', 'Severe', 17426841),
(5, 'IOP-based diagnosis', '2023-09-16', 'Keratoconus', 'Moderate', 17956878),
(6, 'Biopsy confirmed', '2023-02-28', 'Dry Eye Syndrome', 'Mild', 17956878),
(7, 'Awaiting further tests', '2023-11-30', 'Uveitis', 'Moderate', 15191088),
(8, 'Clinical diagnosis', '2022-04-22', 'Corneal Ulcer', 'Severe', 17956878),
(9, 'Awaiting further tests', '2024-07-19', 'Amblyopia', 'Mild', 17139718),
(10, 'Awaiting further tests', '2024-08-26', 'Strabismus', 'Mild', 17139718);


INSERT INTO Patient 
(PSSN, PNUM, name, phone, sex, birthdate, temperature, bloodpressure, heartrate, medicalhistory, admitteddate, address, diagnosisID, AppointmentID) 
VALUES
(2018242, 2535841, 'Sandra Mina', '01384249818', 'F', '1972-06-25', 37.3, '120/88', 69, 'No significant past medical history.', '2022-01-15', '62 Suez Road, Cairo', 6, 1),

(2024994, 7174648, 'Khaled Hassan', '01771906594', 'M', '1998-06-12', 36.5, '111/72', 96, 'Diabetic retinopathy, early stage.', '2024-10-10', '12 Tahrir Square, Cairo', 1, 2),

(2026064, 7468723, 'Mina George', '01309805009', 'M', '1976-08-14', 37.3, '140/86', 93, 'No significant past medical history.', '2023-05-12', '45 Salah Salem, Cairo', 2, 3),

(2031051, 8347382, 'Khaled Hassan', '01973763116', 'M', '2001-03-25', 36.7, '132/83', 63, 'Keratoconus bilateral, under monitoring.', '2023-09-10', '23 Corniche El Nil, Giza', 5, 4),

(2054156, 6765277, 'Mariam Hossam', '01841616928', 'F', '1982-12-16', 37.1, '118/76', 70, 'Astigmatism corrected with glasses.', '2022-08-20', '5 El Geish Road, Alexandria', 3, 5);


INSERT INTO Book 
(AppointmentID, PSSN, PNUM) 
VALUES
(1, 2018242, 2535841),
(2, 2024994, 7174648),
(3, 2026064, 7468723),
(4, 2031051, 8347382),
(5, 2054156, 6765277);


INSERT INTO Room 
(RoomID, status, capacity, RoomNum) 
VALUES
(1, 'Reserved', 1, '101'),
(2, 'Maintenance', 3, '102'),
(3, 'Reserved', 1, '103'),
(4, 'Reserved', 2, '104'),
(5, 'Maintenance', 1, '105');


INSERT INTO WorksOn 
(DSSN, Departmentcode, JoinDate) 
VALUES
(17426841, 4, '2021-09-22'),
(16182512, 7, '2013-05-10'),
(17139718, 3, '2020-09-03'),
(17956878, 2, '2012-02-03'),
(15191088, 3, '2022-02-04'),
(17426841, 7, '2021-09-16'),
(14786863, 6, '2010-12-22'),
(10874064, 8, '2018-07-21'),
(17956878, 2, '2019-07-18'),
(11801704, 5, '2020-09-13');


INSERT INTO Medication 
(medicineID) 
VALUES 
(1), (2), (3), (4), (5), (22), (24), (27), (30);


INSERT INTO Prescription 
(pID, prescription_date, PSSN, PNUM, DSSN) 
VALUES
(1, '2022-10-01', 2018242, 2535841, 17426841),
(4, '2024-11-15', 2024994, 7174648, 17426841),
(12, '2022-09-29', 2026064, 7468723, 14786863),
(15, '2023-10-23', 2031051, 8347382, 17956878),
(23, '2022-01-27', 2054156, 6765277, 17426841);


INSERT INTO Contain 
(pID, medicineID, dose, starttime, endtime, timesperday) 
VALUES
(23, 27, '2 capsules', '00:00:00', '00:00:00', 1),
(15, 24, '1 capsule', '00:00:00', '00:00:00', 2),
(4, 30, '1 capsule', '00:00:00', '00:00:00', 4),
(12, 22, '2 drops', '00:00:00', '00:00:00', 2);


INSERT INTO EyeSurgery 
(SurgeryID, durationminutes, surgerydate, surgerytype, outcome, notes, PSSN, PNUM) 
VALUES
(1, 177, '2023-11-04', 'LASIK Refractive Surgery', 'Good', 'Standard anesthesia risks', 2018242, 2535841),

(2, 164, '2022-11-09', 'Vitrectomy for Retinal Detachment', 'Good', 'Suture complications', 2024994, 7174648);


INSERT INTO Performs 
(DSSN, SurgeryID) 
VALUES
(11801704, 1),
(17426841, 2);


INSERT INTO Treatment 
(startdate, hourperweek, DSSN, PSSN, PNUM, AppointmentID) 
VALUES
('2023-06-14', 2.9, 17426841, 2018242, 2535841, 1),
('2022-08-17', 5.4, 17426841, 2024994, 7174648, 2);


INSERT INTO Payment 
(PaymentID, status, method, date, amount, DSSN, PSSN, PNUM) 
VALUES
(1, 'Paid', 'Cash', '2023-04-23 00:00:00', 13999.48, 17426841, 2018242, 2535841),

(2, 'Paid', 'Cash', '2023-11-18 00:00:00', 9611.94, 17426841, 2024994, 7174648);


INSERT INTO Refund 
(RefundID, status, amount, PaymentID, DSSN, PSSN, PNUM) 
VALUES
(1, 'Pending', 651.34, 1, 17426841, 2018242, 2535841),
(2, 'Approved', 826.18, 2, 17426841, 2024994, 7174648);


INSERT INTO EyeExamination 
(eyeexamID, VisualacuityLeft, visualacuityright, colorvision, examdate, field_of_vision, notes, IOPleft, IOPright, PSSN, PNUM, DSSN) 
VALUES
(1, 0.586, 1.105, 'Mild deficiency', '2022-07-02', 'Peripheral deficit', 'Mild deterioration', 17.3, 18.7, 2018242, 2535841, 17426841),

(2, 0.971, 0.172, 'Mild deficiency', '2022-04-26', 'Enlarged blind spot', 'Monitoring advised', 22.8, 17.3, 2024994, 7174648, 17426841);


INSERT INTO Reserve 
(RE_ID, SSN, RoomID, eyeexamID, AppointmentID, SurgeryID, StartTime, EndTime, purpose) 
VALUES
(1, 2018242, 1, 1, 1, 1, '09:00:00', '10:00:00', 'Overnight observation'),

(2, 2024994, 2, 2, 2, 2, '07:00:00', '11:00:00', 'Photodynamic therapy');