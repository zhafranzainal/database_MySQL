CREATE DATABASE attendance_system;
USE attendance_system;

CREATE TABLE COURSE(
courseID VARCHAR(10) NOT NULL PRIMARY KEY,
courseCode VARCHAR(10),
courseName VARCHAR(50),
campus VARCHAR(10),
room VARCHAR(10)
);

CREATE TABLE SECTION(
classID VARCHAR(10) NOT NULL PRIMARY KEY,
section VARCHAR(10),
classMode VARCHAR(10),
classType VARCHAR(10),
courseID VARCHAR(10),
FOREIGN KEY (courseID) REFERENCES COURSE (courseID));
INSERT INTO COURSE
VALUES('CRS001','BUM1433','Mathematics','Pekan','3.1.2');
INSERT INTO COURSE
VALUES('CRS002','BCI2023','Database','Pekan','1.2.1');

INSERT INTO COURSE
VALUES('CRS003','BCI1023','Programming Techniques','Pekan','2.2.2');
INSERT INTO COURSE
VALUES('CRS004','BUM1033','Discrete Structure','Pekan','2.3.5');
INSERT INTO COURSE
VALUES('CRS005','BCN1155','Computer Architecture','Pekan','1.3.4');
INSERT INTO COURSE
VALUES('CRS006','BCN1053','Data Communication','Pekan','1.3.6');
INSERT INTO COURSE
VALUES('CRS007','UHL1112','Falsafah','Pekan','3.3.3');
INSERT INTO COURSE
VALUES('CRS008','UHL212','English','Gambang','1.2.6');
INSERT INTO COURSE
VALUES('CRS009','UHC1012','Etika','Gambang','1.2.2');
INSERT INTO COURSE
VALUES('CRS010','BCS1033','Software Engineering', 'Pekan','2.3.6');

INSERT INTO SECTION
VALUES('CLS001','02P','Online','Lab','CRS001');
INSERT INTO SECTION
VALUES('CLS002','01P','Offline','Tutorial', 'CRS002');
INSERT INTO SECTION
VALUES('CLS003','24G','Online','Lecture', 'CRS003');
INSERT INTO SECTION
VALUES('CLS004','16P','Offline','Lab','CRS004');
INSERT INTO SECTION
VALUES('CLS005','03B','Offline','Lecture','CRS005');
INSERT INTO SECTION
VALUES('CLS006','03A','Online','Tutorial','CRS006');
INSERT INTO SECTION
VALUES('CLS007','05A','Online','Lab','CRS007');
INSERT INTO SECTION
VALUES('CLS008','05B','Online','Lecture','CRS008');
INSERT INTO SECTION
VALUES('CLS009','08P','Offline','Tutorial','CRS009');
INSERT INTO SECTION
VALUES('CLS010','01G','Offline','Lab','CRS010');

CREATE TABLE STUDENT (studentID VARCHAR (10) NOT NULL PRIMARY KEY,
student_name VARCHAR (100),
student_phone VARCHAR (12),
student_email VARCHAR (100),
student_address VARCHAR (100),
student_gender VARCHAR (10),
program VARCHAR (30),
year INT (4),
sem INT (4),
classID VARCHAR(10),
FOREIGN KEY (classID) REFERENCES SECTION (classID)
);

INSERT INTO STUDENT VALUES
('CB20121','Nur Adlin', '018-3245656','lyn@gmail.com','No 666 Jln Gagak di Rimba,Perak','Female','Mathematics','1','2','CLS001'),
('CA20122','Fattah Amin','019-3456785','amin00@gmail.com','Lot 641 Jalan Kuala Kedah, Kedah','Male','Software Engineering','2','3','CLS002'),
('CD20123','Siti Saleha','011-01987271','siti12@gmail.com', 'JC 5780 Jln Sebatu , Melaka','Female','Software Engineering','1','1','CLS003'),
('FA20124','Muhd Adam ','018-2345454','AdamZz@gmail.com','P10 ,Lot 2928 Jalan Rizab,Selangor','Male','Mechanical Engineering ','1','2','CLS004'),
('CD20125','Afif Misman','019-2314536','Afifmisman@gmail.com','65 ,Jln Gombak 10, WP Kuala Lumpur','Male','Computer Science','3','5','CLS005'),
('CA20126','Sarah Aina','017-1234321','Ainaboo@gmail.com','21 Lorong Tasik ,Pulau Pinang','Female','Network Security','1','2','CLS006'),
('CB20127','Wong Mei Li','016-7657865','Wongmeili@gmail.com','5741 Jalan Rose , Negeri Sembilan','Female', 'Animation','3', '5','CLS007'),
('CB20128','Chandran','019-7345812','chandran99@gmail.com','Unit 4-4-5 , Jln Aura Tmn Permai ,Kuala Lumpur','Male','Physics','2','4','CLS008'),
('FB20129','Julia Rose','018-2315467','Juliarose@gmail.com','Lot 115 ,Jln Panjang,Perak','Female','Animation','3','5','CLS009'),
('CD20130','Wang Lei','012-0487879','wanglei@gmail.com','K02-04-05 Pangsapuri Seri U13/45B ,Selangor','Male','Software Engineering','2','4','CLS010');

CREATE TABLE LECTURER(
L_StaffID varchar(20) not null primary key,
L_Ranks varchar(30),L_Name varchar(100),
L_Faculty varchar(15)
);

INSERT INTO LECTURER VALUES
('AA101','Prof','Ali bin Bakar','ftkee'),
('AA321','Assoc Prof','Siti Hawa binti Karim','ftkma'),
('AA124','Lect','Anis Ilya binti Muhd Sharif','fkp'),
('AA331','Lect','Adam bin Ismail','fkasa'),
('AA442','Assoc Prof', 'Diana binti Amir','fkom'),
('AA912','Lect','Diana Syafiqah binti Amirul','fim'),
('AA710','Lect','Nur Aina binti Zahid','fkom'),
('AA632','Assoc Prof','Muthu A/L Siva','fkasa'),
('AA774','Lect', 'Syed Aiman bin Syed Ali','fkom'),
('AA952','Prof','Chan Lee Meng','fim'),
('AA664','Assoc Prof', 'Hakim bin Mat Din','ftkee'),
('AA006','Lect','Simon Grey','fkp');

CREATE TABLE ADMIN(
adminID VARCHAR(10) not null primary key,
admin_name VARCHAR(100),
admin_phone VARCHAR(12),
admin_email VARCHAR(50),
username VARCHAR(20),
password VARCHAR(30),
studentID VARCHAR(10),
staffID VARCHAR(20),
courseID VARCHAR(10),
FOREIGN KEY (studentID) REFERENCES STUDENT (studentID),
FOREIGN KEY (staffID) REFERENCES LECTURER (L_StaffID),
FOREIGN KEY (courseID) REFERENCES COURSE (courseID)
);

INSERT INTO ADMIN VALUES
('AB410', 'Rahmad Adha bin Samad', '017-3324965', 'rahmad65@gmail.com', 'RahmadAdha', 'Samadha1990', 'CB20121', 'AA101', 'CRS001'),('AB411', 'Chou Sow Chun Siang', '011-9044872', 'chunsiangcw@gmail.com', 'Chun_Siang', 'Chousow1991', 'CA20122', 'AA321', 'CRS002'),
('AB412', 'Hui Qian', '011-3786434', 'huiqian89@gmail.com', 'Huiqian89', 'Qianhui1987', 'CD20123', 'AA124', 'CRS003'),
('AB413', 'Qamarina binti M. Zainal', '019-1132197', 'qamarinamz@gmail.com', 'QamaZainal', 'Zainalqa1992', 'FA20124', 'AA331', 'CRS004'),
('AB414', 'Shatya Kumar', '012-5430702', 'kshatya@gmail.com', 'ShatyaKumar_', 'Kumarsha1983', 'CD20125', 'AA442', 'CRS005'),
('AB415', 'Nur Umairah binti Ahmad Din', '018-6422208', 'umairahdin@gmail.com', 'Umairah_Ahmad', 'Dinnur199', 'CA20126', 'AA912', 'CRS006'),
('AB416', 'Tharvin Swamy', '013-4709376', 'tharvin12@gmail.com', 'TharvinS12', 'Swamytha1990', 'CB20127', 'AA710', 'CRS007'),
('AB417', 'Hazman bin Haris', '017-5652755', 'manris2@gmail.com', 'Hazman_Haris', 'Harishaz1997', 'CB20128', 'AA632', 'CRS008'),
('AB418', 'Andayani binti Ansari', '019-2149361', 'andayaniaa@gmail.com', 'Andayani__', 'Ansarian1992', 'FB20129', 'AA774', 'CRS009'),
('AB419', 'Justin Low', '011-5640983', 'justinlow83@gmail.com', 'JustinLow_83', 'Lowjustin1990', 'CD20130', 'AA952', 'CRS010');

CREATE TABLE attendance(
attendanceID VARCHAR(10) NOT NULL PRIMARY KEY,
studentID VARCHAR(10),
staffID VARCHAR(20),
sessionDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
attendanceStatus VARCHAR(20),
sessionAvailable INT,
sessionTaken INT,
attendancePercent DECIMAL(5,2),
examEligibility VARCHAR(10),
FOREIGN KEY (studentID) REFERENCES student (studentID),
FOREIGN KEY (staffID) REFERENCES lecturer (L_StaffID)
);

INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00001”, “CB20121”, “AA101”, “Attend (Early)”, “40”, “35”);
INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00002”, “CA20122”, “AA006”, “Attend (Late)”, “40”, “40”);
INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00003”, “CA20126”, “AA124”, “Absent”, “40”, “37”);
INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00004”, “CB20127”, “AA321”, “MC”, “40”, “38”);
INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00005”, “CB20128”, “AA331”, “On Leave”, “40”, “39”);
INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00006”, “CD20123”, “AA442”, “Attend (Late)”, “40”, “12”);
INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00007”, “CD20125”, “AA632”, “Attend (Late)”, “40”, “20”);
INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00008”, “CD20130”, “AA664”, “Attend (Early)”, “40”, “30”);
INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00009”, “FB20129”, “AA710”, “MC”, “40”, “28”);
INSERT INTO attendance (attendanceID, studentID, staffID, attendanceStatus, sessionAvailable, sessionTaken)
VALUES (“ATT00010”, “FA20124”, “AA952”, “Attend (Early)”, “40”, “33”);
