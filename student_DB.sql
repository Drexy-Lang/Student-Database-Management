CREATE TABLE COURSES
(course_id VARCHAR2(5) PRIMARY KEY NOT NULL, 
course_Name VARCHAR2(60) NOT NULL,
course_level VARCHAR2(60) NOT NULL,
course_duration VARCHAR2(10) NOT NULL, 
modules_Offered INT NOT NULL);

CREATE TABLE MODULES(
    module_id VARCHAR2(5) PRIMARY KEY NOT NULL,
    md_name VARCHAR2(60) NOT NULL,
    credits VARCHAR2(3) NOT NULL,
    module_type VARCHAR2(30) NOT NULL
);

CREATE TABLE COURSE_MODULE(
    course_id VARCHAR2(5) NOT NULL,
    module_id VARCHAR2(5) NOT NULL
);

ALTER TABLE COURSE_MODULE
  ADD CONSTRAINT pk_course_module PRIMARY KEY (course_id, module_id);

ALTER TABLE COURSE_MODULE 
  ADD CONSTRAINT fk_cm_course FOREIGN KEY (course_id)
    REFERENCES COURSES(course_id);

ALTER TABLE COURSE_MODULE
  ADD CONSTRAINT fk_cm_module FOREIGN KEY (module_id)
  REFERENCES MODULES(module_id);

CREATE TABLE FUNDING(
    funding_id VARCHAR2(5) PRIMARY KEY NOT NULL,
    funding_name VARCHAR2(30) NOT NULL,
    fund_type VARCHAR2(60)NOT NULL,
    monthly_payout DECIMAL(7,2),
    fund_duration VARCHAR2(10)
);


CREATE TABLE STUDENTS(
    student_no VARCHAR2(5) PRIMARY KEY NOT NULL,
    email VARCHAR2(60) UNIQUE NOT NULL,
    first_name VARCHAR2(30) NOT NULL,
    last_name VARCHAR2(30) NOT NULL,
    contact VARCHAR2(12) NOT NULL,
    std_address VARCHAR2(60) NOT NULL,
    admission_year DATE NOT NULL,
    course_id VARCHAR2(5) NOT NULL,
    funding_id VARCHAR2(5) NULL,

    CONSTRAINT fk_student_course FOREIGN KEY (course_id)
    REFERENCES COURSES(course_id),
    CONSTRAINT fk_student_funding FOREIGN KEY (funding_id)
    REFERENCES funding(funding_id)
);

CREATE TABLE student_module(
      student_no VARCHAR2(5),
      module_id VARCHAR2(5)
);

ALTER TABLE student_module
ADD CONSTRAINT pk_student_module PRIMARY KEY(
        student_no,
        module_id
);

ALTER TABLE student_module
ADD CONSTRAINT fk_student_student_module FOREIGN KEY (student_no)
REFERENCES STUDENTS (student_no);

ALTER TABLE student_module
ADD CONSTRAINT fk_module_student_module FOREIGN KEY (module_id)
REFERENCES MODULES (module_id);

CREATE TABLE MARKS(
    mark_id VARCHAR2(5) PRIMARY KEY NOT NULL,
    total_mark DECIMAL(5,2) NOT NULL,
    upload_date DATE NOT NULL,
    result_Description VARCHAR2(60) NOT NULL,
    module_id VARCHAR2(5) NOT NULL,
    student_no VARCHAR2(5) NOT NULL
);

ALTER TABLE MARKS
ADD CONSTRAINT fk_mark_module FOREIGN KEY (module_id)
    REFERENCES MODULES(module_id);

ALTER TABLE MARKS 
ADD CONSTRAINT fk_mark_student FOREIGN KEY (student_no)
    REFERENCES STUDENTS(student_no);



CREATE TABLE ATTENDANCE_REGISTER(
    attendance_id VARCHAR2(5) PRIMARY KEY NOT NULL,
    attendance_no INT NOT NULL,
    attendance_date DATE,
    module_id VARCHAR2(5) NOT NULL,

    CONSTRAINT fk_attendance_module FOREIGN KEY (module_id)
    REFERENCES MODULES(module_id)
);

CREATE TABLE student_attendance (
    student_no VARCHAR2(5) NOT NULL,
    attendance_id VARCHAR2(5) NOT NULL
);

ALTER TABLE student_attendance
ADD CONSTRAINT pk_student_attendance PRIMARY KEY (
    student_no, 
    attendance_id
);

ALTER TABLE student_attendance
ADD CONSTRAINT fk_st_attendance FOREIGN KEY (attendance_id)
REFERENCES ATTENDANCE_REGISTER(attendance_id);

ALTER TABLE student_attendance
ADD CONSTRAINT fk_st_student FOREIGN KEY (student_no)
REFERENCES STUDENTS (student_no);

CREATE TABLE FEE_ACCOUNT(
    account_no VARCHAR2(5) PRIMARY KEY NOT NULL,
   outstanding_amount DECIMAL(7,2) NOT NULL,
    last_update DATE NOT NULL,
    student_no VARCHAR2(5) NOT NULL,

    CONSTRAINT fk_faccount_student FOREIGN KEY (student_no)
    REFERENCES STUDENTS (student_no)
);

INSERT INTO COURSES
VALUES ( 
    'C0HS1', 
'Hospitality',
'Diploma', 
'3 Years', 
40);

INSERT INTO COURSES
VALUES ('C0IT2', 
'Imformation Technology',
'Diploma',
'3 Years', 
29);

INSERT INTO COURSES
VALUES (
    'C0CE3',
    'Computer Engineering',
    'Bachelors Degree',
    '3 Years',
    36
);

INSERT INTO COURSES
VALUES (
    'C0FS4',
    'Financial Information Systems',
    'Diploma',
    '3 Years',
    37
);

INSERT INTO COURSES
VALUES (
    'C0HR5',
    'Human Resource Management',
    'Certificate',
    '4 Years',
    40
);

INSERT INTO COURSES
VALUES (
    'C0MK6',
    'Marketing',
    'Certificate',
    '4 Years',
    35
);

INSERT INTO COURSES
VALUES (
    'C0IA7',
    'Internal Auditing',
    'Honours Degree',
    '3 Years',
    28
);

INSERT INTO COURSES
VALUES (
    'C0LS8',
    'Logistics and Supply Chain Management',
    'Advanced Dimploma',
    '3 Years',
    38
);

INSERT INTO COURSES
VALUES (
    'C0MA9',
    'Cost And Management Account',
    'Advanced Diploma',
    '3 Years',
    27
);

INSERT INTO COURSES
VALUES (
    'CBT10',
    'BioTechnology',
    'Diploma',
    '3 Years',
    38
);

INSERT INTO COURSES
VALUES (
    'CPE11',
    'Power Engineering',
    'Masters Degree',
    '3 Years',
    35
);

INSERT INTO FUNDING
VALUES (
    'F0SC1',
    'Goverment Bursary',
    'NSFAS',
    1716.00,
    '3 Years'
);

INSERT INTO FUNDING
VALUES (
    'F0SC2',
    'Government Bursary',
    'Department of Military Veterans Bursary',
    2050.00,
    '3 Years'
);

INSERT INTO FUNDING
VALUES (
    'F0SC3',
    'Government Bursary',
    'National Skills Fund',
    2150.00,
    '3 Years'
);

INSERT INTO FUNDING
VALUES (
    'F0SC4',
    'Scholarship',
    'Moshal Scholarship Program',
    2100.00,
    '4 Years'
);

INSERT INTO FUNDING
VALUES (
    'F0SC5',
    'Scholarship',
    'Mastercard Foundation Scholars Program',
    2570.00,
    '4 Years'
);

INSERT INTO FUNDING
VALUES (
    'F0SC6',
    'Bursary',
    'Cyril Ramaphose Foundarion Bursary',
    1890.00,
    '3 Years'
);

INSERT INTO FUNDING
VALUES (
    'F0SC7',
    'Scholarship',
    'Cisco Global Impact Cash Grant and Scholarship Programmes',
    2100.00,
    '4 Years'
);

INSERT INTO FUNDING
VALUES (
    'F0SC8',
    'Bursary',
    'Sasol Bursary',
    1725.00,
    '4 Years'
);

INSERT INTO FUNDING
VALUES (
    'F0SC9',
    'Government Bursary',
    'Gaunteng City Region(GCRA) Bursary',
    2100.00,
    '4 Years'
);

INSERT INTO FUNDING
VALUES (
    'FSC10',
    'Bursary',
    'Department of Science, Technology Innovation Bursary',
    2100.00,
    '4 Years'
);

INSERT INTO STUDENTS
VALUES ('ST001',
'226032359@edu.vut.ac.za', 
'Christopher',
'Muleya', 
'+27724641088', 
'Amberfield Village', 
'20-Jan-2026',
'C0IT2',
'F0SC1'
);

INSERT INTO STUDENTS
VALUES (
    'ST002',
    '226037766@edu.vut.ac.za',
    'Shela',
    'Matlala',
    '+27658591234',
    'Academia Student Village',
    '20-Jan-2026',
    'C0IT2',
    'F0SC5'
);

INSERT INTO STUDENTS
VALUES(
    'ST003',
    '222035757@edu.vut.ac.za',
    'Evelyne',
    'Muleya',
    '+27663176812',
    'Laureen Guest House',
    '17-Jan-2022',
    'CPE11',
    'F0SC4'
);

INSERT INTO STUDENTS
VALUES (
    'ST004',
    '225095327@edu.vut.ac.za',
    'Jan',
    'Sasebula',
    '+27793293239',
    'Vaal Student Housing',
    '23-Jan-2025',
    'C0HS1',
    'F0SC2'
);

INSERT INTO STUDENTS 
VALUES (
    'ST005',
    '223044257@edu.vut.ac.za',
    'Tebogo',
    'Tlou',
    '+27832261276',
    'Paragon Student Housing',
    '18-Jan-2023',
    'C0HS1',
    'F0SC2'
);

INSERT INTO STUDENTS 
VALUES (
    'ST006',
    '223074327@edu.vut.ac.za',
    'Gomolemo',
    'Tlou',
    '+27832362246',
    'Academia Student Village',
    '18-Jan-2023',
    'C0MK6',
    'F0SC3'
);

INSERT INTO STUDENTS 
VALUES (
    'ST007',
    '223033257@edu.vut.ac.za',
    'Elphus',
    'Mulondo',
    '+27553247538',
    'Amberfield Village',
    '18-Jan-2023',
    'C0LS8',
    'F0SC3'
);

INSERT INTO STUDENTS 
VALUES (
    'ST008',
    '225033257@edu.vut.ac.za',
    'Vincent',
    'Mulondo',
    '+27553244538',
    'Cassandra 17',
    '18-Jan-2025',
    'C0LS8',
    'F0SC5'
);


INSERT INTO STUDENTS 
VALUES (
    'ST009',
    '226033257@edu.vut.ac.za',
    'Coddy',
    'Woods',
    '+27578324753',
    'Cassandra 24',
    '18-Jan-2026',
    'C0CE3',
    'F0SC4'
);

INSERT INTO STUDENTS 
VALUES (
    'ST010',
    '226034237@edu.vut.ac.za',
    'Ronewa',
    'Mamphogoro',
    '+27578324753',
    'Cassandra 24',
    '19-Jan-2026',
    'CPE11',
    'F0SC7'
);

INSERT INTO STUDENTS 
VALUES (
    'ST011',
    '226033295@edu.vut.ac.za',
    'Leavict',
    'Ngwenya',
    '+27778324539',
    'Academia Student Village',
    '20-Jan-2026',
    'C0CE3',
    'F0SC6'
);

INSERT INTO STUDENTS 
VALUES (
    'ST012',
    '224033293@edu.vut.ac.za',
    'Siyamkelo',
    'Mapheto',
    '+27783237539',
    'Amberfield Village',
    '20-Jan-2025',
    'C0MK6',
    'F0SC6'
);

INSERT INTO STUDENTS (STUDENT_NO, EMAIL, FIRST_NAME, LAST_NAME, CONTACT,STD_ADDRESS, ADMISSION_YEAR,COURSE_ID)
VALUES (
    'ST013',
    '224033295@edu.vut.ac.za',
    'Alicia',
    'Msindo',
    '+27778347579',
    'Park Village',
    '20-Jan-2024',
    'CBT10'
);

INSERT INTO STUDENTS 
VALUES (
    'ST014',
    '224033245@edu.vut.ac.za',
    'Nathaniel',
    'Mahachi',
    '+27768324756',
    'Park Village',
    '20-Jan-2024',
    'CBT10',
    'F0SC8'
);

INSERT INTO STUDENTS 
VALUES (
    'ST015',
    '222033234@edu.vut.ac.za',
    'Sfiso',
    'Giliante',
    '+27763247579',
    'Laureen Guest House',
    '20-Jan-2023',
    'C0IA7',
    'F0SC9'
);

INSERT INTO STUDENTS 
VALUES (
    'ST016',
    '223033234@edu.vut.ac.za',
    'Junior',
    'Nkopane',
    '+27734327579',
    'Park Village',
    '20-Jan-2023',
    'C0IA7',
    'F0SC8'
);

INSERT INTO STUDENTS 
VALUES (
    'ST017',
    '224323234@edu.vut.ac.za',
    'Koketso',
    'Maroatona',
    '+27648780709',
    'Vaal Student Hive',
    '20-Jan-2024',
    'C0MA9',
    'F0SC9'
);

INSERT INTO STUDENTS 
VALUES (
    'ST018',
    '224336834@edu.vut.ac.za',
    'Tumelo',
    'Lebepe',
    '+27713687360',
    'Vaal Student Hive',
    '22-Jan-2024',
    'C0FS4',
    'FSC10'
);

INSERT INTO STUDENTS (STUDENT_NO, EMAIL, FIRST_NAME, LAST_NAME, CONTACT,STD_ADDRESS, ADMISSION_YEAR,COURSE_ID)
VALUES (
    'ST019',
    '223336834@edu.vut.ac.za',
    'Aluwani',
    'Nemangayi',
    '+27793816067',
    'Amberfield Village',
    '22-Jan-2023',
    'C0FS4'
);

INSERT INTO STUDENTS 
VALUES (
    'ST020',
    '224036834@edu.vut.ac.za',
    'Tshepo',
    'Mashaba',
    '+27793742834',
    'Luisevill',
    '25-Jan-2024',
    'C0HR5',
    'F0SC4'
);

INSERT INTO STUDENTS (STUDENT_NO, EMAIL, FIRST_NAME, LAST_NAME, CONTACT,STD_ADDRESS, ADMISSION_YEAR,COURSE_ID)
VALUES (
    'ST021',
    '225026834@edu.vut.ac.za',
    'Michael',
    'Netshifhefhe',
    '+27729578493',
    'Luisevill',
    '25-Jan-2025',
    'C0HR5'
);


INSERT INTO STUDENTS 
VALUES (
    'ST022',
    '224323274@edu.vut.ac.za',
    'Domingos',
    'Maja',
    '+27699985947',
    'Vaal Student Hive',
    '20-Jan-2024',
    'C0MA9',
    'FSC10'
);

INSERT INTO MODULES
VALUES (
    'M001',
    'Programming Fundamentals',
    15,
    'Semester'
);

INSERT INTO MODULES
VALUES (
    'M002',
    'Information Systems',
    15,
    'Semester'
);

INSERT INTO MODULES
VALUES (
    'M003',
    'Computer Networks',
    15,
    'Semester'
);

INSERT INTO MODULES
VALUES (
    'M004',
    'Database Fundamentals',
    15,
    'Semester'
);

INSERT INTO MODULES 
VALUES (
    'M005',
    'Web Development',
    15,
    'Semester'
);

INSERT INTO MODULES 
VALUES (
    'M006',
    'Operating Systems',
    15,
    'Semester'
);

INSERT INTO MODULES 
VALUES (
    'M007',
    'Systems Analysis',
    20,
    'Year'
);

INSERT INTO MODULES
VALUES (
    'M008',
    'Network Administration',
    20,
    'Year'
);

INSERT INTO MODULES
VALUES (
    'M009',
    'Software Engineering',
    15,
    'Semester'
);

INSERT INTO MODULES 
VALUES (
    'M010',
    'Cybersecurity Fundamentals',
    15,
    'Semester'
);

INSERT INTO MARKS
VALUES (
    'MK001',
    78.50,
    DATE '2026-06-10',
    'Pass',
    'M001',
    'ST001'
);

INSERT INTO MARKS
VALUES (
    'MK002',
    65.00,
    DATE '2026-06-10',
    'Pass',
    'M002',
    'ST001'
);

INSERT INTO MARKS
VALUES (
    'MK003',
    42.50,
    DATE '2026-06-10',
    'Fail',
    'M003',
    'ST002'
);

INSERT INTO MARKS
VALUES (
    'MK004',
    81.00,
    DATE '2026-06-10',
    'Pass',
    'M004',
    'ST002'
);

INSERT INTO MARKS
VALUES (
    'MK005',
    55.50,
    DATE '2026-06-11',
    'Pass',
    'M005',
    'ST003'
);

INSERT INTO MARKS
VALUES (
    'MK006',
    33.00,
    DATE '2026-06-11',
    'Fail',
    'M006',
    'ST003'
);

INSERT INTO MARKS
VALUES (
    'MK007',
    90.00,
    DATE '2026-06-11',
    'Pass',
    'M007',
    'ST004'
);

INSERT INTO MARKS
VALUES (
    'MK008',
    48.00,
    DATE '2026-06-11',
    'Fail',
    'M008',
    'ST004'
);

INSERT INTO MARKS
VALUES (
    'MK009',
    72.50,
    DATE '2026-06-12',
    'Pass',
    'M009',
    'ST005'
);

INSERT INTO MARKS
VALUES (
    'MK010',
    61.00,
    DATE '2026-06-12',
    'Pass',
    'M010',
    'ST005'
);

INSERT INTO MARKS
VALUES (
    'MK011',
    39.50,
    DATE '2026-06-12',
    'Fail',
    'M001',
    'ST006'
);

INSERT INTO MARKS
VALUES (
    'MK012',
    84.00,
    DATE '2026-06-12',
    'Pass',
    'M002',
    'ST006'
);

INSERT INTO MARKS
VALUES (
    'MK013',
    57.00,
    DATE '2026-06-13',
    'Pass',
    'M003',
    'ST007'
);

INSERT INTO MARKS
VALUES (
    'MK014',
    29.50,
    DATE '2026-06-13',
    'Fail',
    'M004',
    'ST007'
);

INSERT INTO MARKS
VALUES (
    'MK015',
    76.00,
    DATE '2026-06-13',
    'Pass',
    'M005',
    'ST008'
);

INSERT INTO MARKS
VALUES (
    'MK016',
    68.50,
    DATE '2026-06-13',
    'Pass',
    'M006',
    'ST008'
);

INSERT INTO MARKS
VALUES (
    'MK017',
    44.00,
    DATE '2026-06-14',
    'Fail',
    'M007',
    'ST009'
);

INSERT INTO MARKS
VALUES (
    'MK018',
    93.50,
    DATE '2026-06-14',
    'Pass',
    'M008',
    'ST009'
);

INSERT INTO MARKS
VALUES (
    'MK019',
    51.00,
    DATE '2026-06-14',
    'Pass',
    'M009',
    'ST010'
);

INSERT INTO MARKS
VALUES (
    'MK020',
    37.50,
    DATE '2026-06-14',
    'Fail',
    'M010',
    'ST010'
);

INSERT INTO MARKS
VALUES (
    'MK021',
    79.00,
    DATE '2026-06-15',
    'Pass',
    'M001',
    'ST011'
);

INSERT INTO MARKS
VALUES (
    'MK022',
    88.00,
    DATE '2026-06-15',
    'Pass',
    'M002',
    'ST011'
);

INSERT INTO MARKS
VALUES (
    'MK023',
    46.50,
    DATE '2026-06-15',
    'Fail',
    'M003',
    'ST012'
);

INSERT INTO MARKS
VALUES (
    'MK024',
    63.00,
    DATE '2026-06-15',
    'Pass',
    'M004',
    'ST012'
);

INSERT INTO MARKS
VALUES (
    'MK025',
    74.50,
    DATE '2026-06-16',
    'Pass',
    'M005',
    'ST013'
);

INSERT INTO MARKS
VALUES (
    'MK026',
    31.00,
    DATE '2026-06-16',
    'Fail',
    'M006',
    'ST013'
);

INSERT INTO MARKS
VALUES (
    'MK027',
    82.00,
    DATE '2026-06-16',
    'Pass',
    'M007',
    'ST014'
);

INSERT INTO MARKS
VALUES (
    'MK028',
    59.50,
    DATE '2026-06-16',
    'Pass',
    'M008',
    'ST014'
);

INSERT INTO MARKS
VALUES (
    'MK029',
    41.00,
    DATE '2026-06-17',
    'Fail',
    'M009',
    'ST015'
);

INSERT INTO MARKS
VALUES (
    'MK030',
    95.00,
    DATE '2026-06-17',
    'Pass',
    'M010',
    'ST015'
);

INSERT INTO MARKS
VALUES (
    'MK031',
    67.00,
    DATE '2026-06-17',
    'Pass',
    'M001',
    'ST016'
);

INSERT INTO MARKS
VALUES (
    'MK032',
    28.00,
    DATE '2026-06-17',
    'Fail',
    'M002',
    'ST016'
);

INSERT INTO MARKS
VALUES (
    'MK033',
    86.50,
    DATE '2026-06-18',
    'Pass',
    'M003',
    'ST017'
);

INSERT INTO MARKS
VALUES (
    'MK034',
    59.00,
    DATE '2026-06-18',
    'Pass',
    'M004',
    'ST017'
);

INSERT INTO MARKS
VALUES (
    'MK035',
    46.00,
    DATE '2026-06-18',
    'Fail',
    'M005',
    'ST018'
);

INSERT INTO MARKS
VALUES (
    'MK036',
    74.00,
    DATE '2026-06-18',
    'Pass',
    'M006',
    'ST018'
);

INSERT INTO MARKS
VALUES (
    'MK037',
    87.00,
    DATE '2026-06-19',
    'Pass',
    'M007',
    'ST019'
);

INSERT INTO MARKS
VALUES (
    'MK038',
    62.50,
    DATE '2026-06-19',
    'Pass',
    'M008',
    'ST019'
);

INSERT INTO MARKS
VALUES (
    'MK039',
    94.00,
    DATE '2026-06-19',
    'Pass',
    'M009',
    'ST020'
);

INSERT INTO MARKS
VALUES (
    'MK040',
    52.50,
    DATE '2026-06-19',
    'Pass',
    'M010',
    'ST020'
);

INSERT INTO MARKS
VALUES (
    'MK041',
    68.50,
    DATE '2026-06-20',
    'Pass',
    'M001',
    'ST021'
);

INSERT INTO MARKS
VALUES (
    'MK042',
    45.50,
    DATE '2026-06-20',
    'Fail',
    'M002',
    'ST021'
);

INSERT INTO MARKS
VALUES (
    'MK043',
    83.50,
    DATE '2026-06-20',
    'Pass',
    'M003',
    'ST022'
);

INSERT INTO MARKS
VALUES (
    'MK044',
    71.00,
    DATE '2026-06-20',
    'Pass',
    'M004',
    'ST022'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0HS1',
    'M002'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0HS1',
    'M007'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M001'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M002'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M003'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M004'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M005'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M006'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M007'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M008'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M009'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IT2',
    'M010'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0CE3',
    'M001'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0CE3',
    'M003'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0CE3',
    'M006'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0CE3',
    'M008'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0FS4',
    'M001'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0FS4',
    'M002'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0FS4',
    'M004'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0FS4',
    'M009'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0HR5',
    'M002'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0HR5',
    'M007'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0MK6',
    'M002'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0MK6',
    'M005'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0MK6',
    'M009'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IA7',
    'M002'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IA7',
    'M004'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0IA7',
    'M009'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0LS8',
    'M002'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0LS8',
    'M004'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0LS8',
    'M007'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0MA9',
    'M002'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0MA9',
    'M004'
);

INSERT INTO COURSE_MODULE
VALUES (
    'C0MA9',
    'M009'
);

INSERT INTO COURSE_MODULE
VALUES (
    'CBT10',
    'M001'
);

INSERT INTO COURSE_MODULE
VALUES (
    'CBT10',
    'M004'
);

INSERT INTO COURSE_MODULE
VALUES (
    'CBT10',
    'M006'
);

INSERT INTO COURSE_MODULE
VALUES (
    'CPE11',
    'M001'
);

INSERT INTO COURSE_MODULE
VALUES (
    'CPE11',
    'M003'
);

INSERT INTO COURSE_MODULE
VALUES (
    'CPE11',
    'M006'
);

INSERT INTO COURSE_MODULE
VALUES (
    'CPE11',
    'M008'
);

COMMIT;


SELECT * FROM MARKS;

