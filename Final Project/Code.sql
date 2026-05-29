DROP DATABASE IF EXISTS DATAEYE1;
CREATE DATABASE IF NOT EXISTS DATAEYE1;
USE DATAEYE1;

CREATE TABLE IF NOT EXISTS Hospital (
    HospitalID INT,
    Name VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    PRIMARY KEY (HospitalID)
);

CREATE TABLE IF NOT EXISTS Room (
    RoomID INT,
    status VARCHAR(50),
    capacity SMALLINT,
    RoomNum VARCHAR(10),
    PRIMARY KEY (RoomID)
);

CREATE TABLE IF NOT EXISTS Medication (
    medicineID INT,
    PRIMARY KEY (medicineID)
);

CREATE TABLE IF NOT EXISTS Appointment (
    AppointmentID INT,
    Appointment_time TIME,
    Appointment_date DATE,
    status VARCHAR(50),
    PRIMARY KEY (AppointmentID)
);

CREATE TABLE IF NOT EXISTS Doctor (
    DSSN INT,
    name VARCHAR(100),
    sex CHAR(1),
    birthdate DATE,
    scientificarea VARCHAR(100),
    degree VARCHAR(50),
    PRIMARY KEY (DSSN)
);

CREATE TABLE IF NOT EXISTS Diagnosis (
    diagnosisID INT,
    notes TEXT,
    diagnosisDate DATE,
    conditionname VARCHAR(100),
    severity VARCHAR(100),
    DSSN INT,
    PRIMARY KEY (diagnosisID),
    FOREIGN KEY (DSSN) REFERENCES Doctor(DSSN)
);

CREATE TABLE IF NOT EXISTS Department (
    Departmentcode INT,
    Name VARCHAR(100),
    startdate DATE,
    HospitalID INT,
    PRIMARY KEY (Departmentcode),
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID)
);

CREATE TABLE IF NOT EXISTS Patient (
    PSSN INT,
    PNUM INT,
    name VARCHAR(100),
    phone VARCHAR(20),
    sex CHAR(1),
    birthdate DATE,
    temperature DECIMAL(3,1),
    bloodpressure VARCHAR(10),
    heartrate SMALLINT,
    medicalhistory TEXT,
    admitteddate DATE,
    address VARCHAR(300),
    diagnosisID INT,
    AppointmentID INT,
    PRIMARY KEY (PSSN, PNUM),
    FOREIGN KEY (diagnosisID) REFERENCES Diagnosis(diagnosisID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

CREATE TABLE IF NOT EXISTS UserAccount (
    UserID INT,
    Username VARCHAR(50),
    Email VARCHAR(100),
    HashedPassword VARCHAR(300),
    phone VARCHAR(20),
    createdAT DATETIME,
    LastLogin DATETIME,
    status VARCHAR(20),
    role VARCHAR(30),
    PSSN INT,
    PNUM INT,
    DSSN INT,
    PRIMARY KEY (UserID),
    FOREIGN KEY (PSSN, PNUM) REFERENCES Patient(PSSN, PNUM),
    FOREIGN KEY (DSSN) REFERENCES Doctor(DSSN)
);

CREATE TABLE IF NOT EXISTS Prescription (
    pID INT,
    prescription_date DATE,
    PSSN INT,
    PNUM INT,
    DSSN INT,
    PRIMARY KEY (pID),
    FOREIGN KEY (PSSN, PNUM) REFERENCES Patient(PSSN, PNUM),
    FOREIGN KEY (DSSN) REFERENCES Doctor(DSSN)
);

CREATE TABLE IF NOT EXISTS EyeSurgery (
    SurgeryID INT,
    durationminutes INT,
    surgerydate DATE,
    surgerytype VARCHAR(100),
    outcome VARCHAR(100),
    notes VARCHAR(300),
    PSSN INT,
    PNUM INT,
    PRIMARY KEY (SurgeryID),
    FOREIGN KEY (PSSN, PNUM) REFERENCES Patient(PSSN, PNUM)
);

CREATE TABLE IF NOT EXISTS EyeExamination (
    eyeexamID INT,
    VisualacuityLeft DECIMAL(5,3),
    visualacuityright DECIMAL(5,3),
    colorvision VARCHAR(30),
    examdate DATE,
    field_of_vision VARCHAR(50),
    notes TEXT,
    IOPleft DECIMAL(4,1),
    IOPright DECIMAL(4,1),
    PSSN INT,
    PNUM INT,
    DSSN INT,
    PRIMARY KEY (eyeexamID),
    FOREIGN KEY (PSSN, PNUM) REFERENCES Patient(PSSN, PNUM),
    FOREIGN KEY (DSSN) REFERENCES Doctor(DSSN)
);

CREATE TABLE IF NOT EXISTS Treatment (
    startdate DATE,
    hourperweek DECIMAL(4,1),
    DSSN INT,
    PSSN INT,
    PNUM INT,
    AppointmentID INT,
    PRIMARY KEY (DSSN, PSSN, PNUM),
    FOREIGN KEY (DSSN) REFERENCES Doctor(DSSN),
    FOREIGN KEY (PSSN, PNUM) REFERENCES Patient(PSSN, PNUM),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

CREATE TABLE IF NOT EXISTS Performs (
    DSSN INT,
    SurgeryID INT,
    PRIMARY KEY (DSSN, SurgeryID),
    FOREIGN KEY (DSSN) REFERENCES Doctor(DSSN),
    FOREIGN KEY (SurgeryID) REFERENCES EyeSurgery(SurgeryID)
);

CREATE TABLE IF NOT EXISTS Contain (
    pID INT,
    medicineID INT,
    dose VARCHAR(50),
    starttime TIME,
    endtime TIME,
    timesperday SMALLINT,
    PRIMARY KEY (pID, medicineID),
    FOREIGN KEY (pID) REFERENCES Prescription(pID),
    FOREIGN KEY (medicineID) REFERENCES Medication(medicineID)
);

CREATE TABLE IF NOT EXISTS Payment (
    PaymentID INT,
    status VARCHAR(50),
    method VARCHAR(50),
    date DATETIME,
    amount DECIMAL(10,2),
    DSSN INT,
    PSSN INT,
    PNUM INT,
    PRIMARY KEY (PaymentID, DSSN, PSSN, PNUM),
    FOREIGN KEY (DSSN, PSSN, PNUM)
        REFERENCES Treatment(DSSN, PSSN, PNUM)
);

CREATE TABLE IF NOT EXISTS Refund (
    RefundID INT,
    status VARCHAR(50),
    amount DECIMAL(10,2),
    PaymentID INT,
    DSSN INT,
    PSSN INT,
    PNUM INT,
    PRIMARY KEY (RefundID, PaymentID, DSSN, PSSN, PNUM),
    FOREIGN KEY (PaymentID, DSSN, PSSN, PNUM)
        REFERENCES Payment(PaymentID, DSSN, PSSN, PNUM)
);

CREATE TABLE IF NOT EXISTS WorksOn (
    DSSN INT,
    Departmentcode INT,
    JoinDate DATE,
    PRIMARY KEY (DSSN, Departmentcode),
    FOREIGN KEY (DSSN) REFERENCES Doctor(DSSN),
    FOREIGN KEY (Departmentcode) REFERENCES Department(Departmentcode)
);

CREATE TABLE IF NOT EXISTS Reserve (
    RE_ID INT,
    SSN INT,
    RoomID INT,
    eyeexamID INT,
    AppointmentID INT,
    SurgeryID INT,
    StartTime TIME,
    EndTime TIME,
    purpose VARCHAR(100),
    PRIMARY KEY (RE_ID, RoomID, eyeexamID, AppointmentID, SurgeryID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
    FOREIGN KEY (eyeexamID) REFERENCES EyeExamination(eyeexamID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    FOREIGN KEY (SurgeryID) REFERENCES EyeSurgery(SurgeryID)
);

CREATE TABLE IF NOT EXISTS Book (
    AppointmentID INT,
    PSSN INT,
    PNUM INT,
    PRIMARY KEY (AppointmentID, PSSN, PNUM),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    FOREIGN KEY (PSSN, PNUM) REFERENCES Patient(PSSN, PNUM)
);

CREATE TABLE IF NOT EXISTS DepartmentLocation (
    location VARCHAR(100),
    Departmentcode INT,
    PRIMARY KEY (location, Departmentcode),
    FOREIGN KEY (Departmentcode)
        REFERENCES Department(Departmentcode)
);