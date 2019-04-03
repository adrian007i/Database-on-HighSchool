/*---------------------------------DDL DATA DEFINATION LANGUAGE------------------------------------- */
/*CREATING LOCATIONS TABLE*/
CREATE TABLE LOCATIONS(
	LOCATION_ID VARCHAR2(20) CONSTRAINT location_school_id_pk PRIMARY KEY,
	SCHOOL_TYPE VARCHAR2 (6) NOT NULL,
	PHONE VARCHAR2 (15)NOT NULL,
	ADDRESS VARCHAR2 (200) NOT NULL	
);



/*CREATING LOCATIONS TABLE*/
CREATE TABLE DEPARTMENTS(
	DEPARTMENT_ID VARCHAR(20) CONSTRAINT departments_department_id_pk PRIMARY KEY,
	NAME VARCHAR2 (20) NOT NULL,
	DESCRIPTION VARCHAR2 (250)NOT NULL
);


/*CREATING SUBJECT TABLE*/
CREATE TABLE SUBJECTS(
	SUBJECT_ID VARCHAR2(20) CONSTRAINT subjects_subject_id_pk PRIMARY KEY,
	TITLE VARCHAR2 (100) NOT NULL,
	DESCRIPTION VARCHAR2 (200)NOT NULL
);


/*CREATING TEACHER TABLE*/
CREATE TABLE TEACHERS(
	TEACHER_ID VARCHAR2(20) CONSTRAINT teachers_teacher_id_pk PRIMARY KEY,
	FIRST_NAME VARCHAR2 (20) NOT NULL,
	LAST_NAME VARCHAR2 (20)NOT NULL,
	DEPARTMENT_ID VARCHAR2 (20),
	CONTACT VARCHAR2 (20) NOT NULL,
	ADDRESS VARCHAR2 (70) NOT NULL,
	EMAIL VARCHAR2 (30) NOT NULL,
	SALARY DECIMAL (10,2) NOT NULL,
	location_ID VARCHAR2 (20)NOT NULL,
	SUBJECT_ID VARCHAR2 (20)NOT NULL,
	HIRE_DATE DATE NOT NULL,
	CONSTRAINT teachers_department_id_fk FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID),
	CONSTRAINT teachers_location_id_fk FOREIGN KEY (location_ID) REFERENCES LOCATIONS(location_ID),
	CONSTRAINT teachers_subject_id_fk FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECTS(SUBJECT_ID)
);

/*CREATING STUDENTS TABLE*/
CREATE TABLE STUDENTS(
	STUDENT_ID INTEGER  CONSTRAINT students_student_id_pk PRIMARY KEY,
	FIRST_NAME VARCHAR2 (20) NOT NULL,
	LAST_NAME VARCHAR2 (20)NOT NULL,
	CONTACT VARCHAR2 (20),
	ADDRESS VARCHAR2 (200),
	LOCATION_ID VARCHAR2 (20)NOT NULL,
	STU_LEVEL INTEGER,
	GPA DECIMAL(3,2),
	gender varchar2(1)
	FOREIGN KEY (LOCATION_ID) REFERENCES LOCATIONS(LOCATION_ID) 
);

/*CREATING CLASSES TABLE*/
CREATE TABLE CLASSES(
	CLASS_ID VARCHAR(20) PRIMARY KEY,
	SUBJECT_ID VARCHAR2 (20) NOT NULL,
	TEACHER_ID VARCHAR2 (20)NOT NULL,
	CLASS_TIME VARCHAR2(20) NOT NULL,
	FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECTS(SUBJECT_ID),
	FOREIGN KEY (TEACHER_ID) REFERENCES TEACHERS(TEACHER_ID)
);


/*CREATING ENROLLMENTS TABLE*/
CREATE TABLE ENROLLMENTS(
	CLASS_ID VARCHAR2(20)NOT NULL,
	STUDENT_ID NUMBER (30) NOT NULL,
	GRADE DECIMAL(4,2),
	FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
	FOREIGN KEY (CLASS_ID) REFERENCES CLASSES(CLASS_ID),
	CONSTRAINT enrollments_pk PRIMARY KEY(STUDENT_ID,CLASS_ID)
	
);

/*---------------------------------DML DATA MANIPULATION LANGUAGE------------------------------------- */

/*INSERTING DATA INTO LOCATIONS TABLE (4 LOCATIONS)*/
INSERT INTO LOCATIONS VALUES ('l1','male','1-868-324-2342','#121 Charles Street San Fernando Trinidad');
INSERT INTO LOCATIONS VALUES ('l2','female','1-868-724-1142','#41 David Street Couva Trinidad');
INSERT INTO LOCATIONS VALUES ('l3','mixed','1-868-624-9942','#45 Sutton Street Gasparillo Trinidad');
INSERT INTO LOCATIONS VALUES ('l4','mixed','1-868-224-2645','#166 Ping Street Debe Trinidad');


/*INSERTING DATA INTO DEPARTMENTS TABLE (3 DEPARTMENTS)*/
INSERT INTO DEPARTMENTS VALUES('d1','Mathematics','The study of topics such as quantity (numbers), structure, space, and change.');
INSERT INTO DEPARTMENTS VALUES('d2','Science','A branch of knowledge or study dealing with a body of facts or truths systematically arranged and showing the operation of general laws.');
INSERT INTO DEPARTMENTS VALUES('d3','Information Technology','Computers to store, study, retrieve, transmit and manipulate data');


/*INSERTING DATA INTO SUBJECTS TABLE (9 SUBJECTS)*/
/*Mathematics department subjects*/
INSERT INTO SUBJECTS VALUES ('s1','Intro to Algebra','Basics of Algebra for lower level students.');
INSERT INTO SUBJECTS VALUES ('s2','Calculas','The study of differentials and integrals will be based');
INSERT INTO SUBJECTS VALUES ('s3','Geometry','Calculation of areas and perimenters');

/*Science department subjects*/
INSERT INTO SUBJECTS VALUES ('s4','Physics','Understanding why things do what they do.');
INSERT INTO SUBJECTS VALUES ('s5','Chemistry','The study of all chemicals');
INSERT INTO SUBJECTS VALUES ('s6','Agriculture','The study of plants.');

/*IT department Subjects*/
INSERT INTO SUBJECTS VALUES ('s7','Introduction to Programming','Fundamentals of using the Java programming language.');
INSERT INTO SUBJECTS VALUES ('s8','Introduction to Computer Hardware','Fundamentals hardware devices');
INSERT INTO SUBJECTS VALUES ('s9','Introduction to Web Design','Building static webpages');

/*INSERTING DATA INTO TEACHERS TABLE*/
/*SCHOOL 1*/
/*Maths Department 1, School 1*/
INSERT INTO TEACHERS VALUES ('t1','Sona','James','d1','1 868 324-2132','#1 Tom drive San Fernando','teach1@gmail.com',10000.00,'l1','s1','12-Nov-1997');
INSERT INTO TEACHERS VALUES ('t2','Bob','Pane','d1','1 868 687-7789','#12 Charles Street Couva','teach2@gmail.com',3000.00,'l1','s3','02-Jan-1998');
INSERT INTO TEACHERS VALUES ('t3','Peter','Doi','d1','1 868 667-1332','#109 Southern Main Road Debe','teach3@gmail.com',5000.00,'l1','s2','19-Sep-1998');
INSERT INTO TEACHERS VALUES ('t4','Tom','NewMan','d1','1 868 324-2132','#101 NewTown drive Arima','teach4@gmail.com',11000.00,'l1','s3','21-Sep-2002');
INSERT INTO TEACHERS VALUES ('t5','Sam','Bob','d1','1 868 324-2132','#122 Johnson Street POS','teach5@gmail.com',9000.00,'l1','s2','12-Dec-2001');

/*Science Department 2 School 1*/
INSERT INTO TEACHERS VALUES ('t6','Marva','James','d2','1 868 432-2132','#98 Benjamin Drive Penal','teach6@gmail.com',9500.00,'l1','s4','01-Nov-1998');
INSERT INTO TEACHERS VALUES ('t7','Javis','Rammus','d2','1 868 755-7789','#7 Duke Street Mayaro','teach7@gmail.com',10000.00,'l1','s5','02-Dec-1997');
INSERT INTO TEACHERS VALUES ('t8','Polly','Ahri','d2','1 868 787-1332','#54 Kim Road Siparia','teach8@gmail.com',15000.00,'l1','s6','15-Apr-1997');

/*IT Department 3 School 1*/
INSERT INTO TEACHERS VALUES ('t9','Sally','Jeff','d3','1 868 124-7892','#18 Boys Street Chagunas','teach9@gmail.com',11500.00,'l1','s7','14-Feb-2004');
INSERT INTO TEACHERS VALUES ('t10','Sonny','Eve','d3','1 868 474-2342','#67 John Drive Chagunas','teach10@gmail.com',4100.00,'l1','s7','30-Jan-2005');
INSERT INTO TEACHERS VALUES ('t11','Bruce','Wayne','d3','1 868 334-9782','#41 Michael Street Toco','teach11@gmail.com',11500.00,'l1','s8','14-Dec-2004');
INSERT INTO TEACHERS VALUES ('t12','Bert','Kevin','d3','1 868 674-8942','#84 Bane Road Matlot','teach12@gmail.com',4100.00,'l1','s9','12-May-2001');


/*SCHOOL 2*/
/*Maths Department 1 School 2*/
INSERT INTO TEACHERS VALUES ('t13','Paul','Jackson','d1','1 868 755-2345','#5 Paul Road La Romaine','teach13@gmail.com',15000.00,'l2','s1','12-Jul-1999');
INSERT INTO TEACHERS VALUES ('t14','Davis','Clarke','d1','1 868 456-5469','#34 Gate Street Penal','teach14@gmail.com',4600.00,'l2','s2','22-Nov-1996');
INSERT INTO TEACHERS VALUES ('t15','Judy','Stark','d1','1 868 765-2344','#123 Velmont POS','teach15@gmail.com',2000.00,'l2','s3','09-Sep-1997');

/*science department 2 school 2*/
INSERT INTO TEACHERS VALUES ('t16','Ariana','Strongman','d2','1 868 656-3456','#11 Telley Road Mc Bean','teach16@gmail.com',1900.00,'l2','s4','09-Oct-2001');
INSERT INTO TEACHERS VALUES ('t17','Marline','John','d2','1 868 567-8977','#34 Hilltop Street Piarco','teach17@gmail.com',1100.00,'l2','s5','14-Aug-2002');
INSERT INTO TEACHERS VALUES ('t18','Keith','James','d2','1 868 567-2345','#67 John Drive Chagunas','teach18@gmail.com',4300.00,'l2','s6','30-Jan-1999');

/*IT Department 3 School 2*/
INSERT INTO TEACHERS VALUES ('t19','Johana','John','d3','1 868 124-7892','#12 Boys Parklane Chagunas','teach19@gmail.com',5800.00,'l2','s7','19-Feb-2004');
INSERT INTO TEACHERS VALUES ('t20','Sandra','Stark','d3','1 868 324-4321','#234 Merryville Debe','teach20@gmail.com',9000.00,'l2','s7','17-Jan-2005');
INSERT INTO TEACHERS VALUES ('t21','Akali','Riven','d3','1 868 765-7654','#101 Townville Arima','teach21@gmail.com',3600.00,'l2','s8','27-Dec-2004');
INSERT INTO TEACHERS VALUES ('t22','Bert','Davis','d3','1 868 346-6435','#96 Lowlance St Cruz','teach22@gmail.com',1100.00,'l2','s9','15-Jun-2001');


/*SCHOOL 3*/
/*Maths Department 1 School 3*/
INSERT INTO TEACHERS VALUES ('t23','Marvin','Jackson','d1','1 868 857-2345','#82 Villa Road POS','teach23@gmail.com',2500.00,'l3','s1','01-Jul-2006');
INSERT INTO TEACHERS VALUES ('t24','Irella','Clarke','d1','1 868 273-3254','#234 Mike Street San Fernando','teach24@gmail.com',10000.00,'l3','s2','05-Nov-2012');
INSERT INTO TEACHERS VALUES ('t25','Karma','Stark','d1','1 868 273-7555','#101 Velmont POS','teach25@gmail.com',12000.00,'l3','s3','02-Sep-2011');

/*science department 2 school 3*/
INSERT INTO TEACHERS VALUES ('t26','Lissandra','Icelady','d2','1 868 234-7654','#76 Old Road Penal','teach26@gmail.com',9100.00,'l3','s4','09-May-2005');
INSERT INTO TEACHERS VALUES ('t27','Zoe','John','d2','1 868 554-2634','#9 New Street Couva','teach27@gmail.com',6100.00,'l3','s5','14-Nov-2010');
INSERT INTO TEACHERS VALUES ('t28','Victoria','turner','d2','1 868 236-6444','#7 Rosie Hill Toco','teach28@gmail.com',6700.00,'l3','s6','30-Oct-1998');

/*IT Department 3 School 3*/
INSERT INTO TEACHERS VALUES ('t29','Leblanc','Devy','d3','1 868 124-2357','#98 Leblanc Drive Chagunas','teach29@gmail.com',8800.00,'l3','s7','12-Mar-2002');
INSERT INTO TEACHERS VALUES ('t30','Matt','Hollow','d3','1 868 324-5896','#112 Melville Debe','teach30@gmail.com',8600.00,'l3','s8','17-Jul-2001');


/*SCHOOL 4*/
/*Maths Department 1 School 4*/
INSERT INTO TEACHERS VALUES ('t31','Kindrid','Pamer','d1','1 868 947-8632','#101 Villa Road Edward Street Balmain','teach31@gmail.com',5000.00,'l4','s1','14-Mar-2010');
INSERT INTO TEACHERS VALUES ('t32','Baron','Nas','d1','1 868 746-3573','#23 Juke Street POS','teach31@gmail.com',11000.00,'l4','s2','05-Sep-2011');
INSERT INTO TEACHERS VALUES ('t33','Drogon','Snow','d1','1 868 844-9273','#83 Johnson RD San Fernando','teach33@gmail.com',8200.00,'l4','s3','12-Mar-2009');

/*science department 2 school 4*/
INSERT INTO TEACHERS VALUES ('t34','Matt','Anston','d2','1 868 474-9373','#12 Jackson Valley Forest Park','teach34@gmail.com',6900.00,'l4','s5','19-May-2015');

/*IT Department 3 School 4*/
INSERT INTO TEACHERS VALUES ('t35','Velkoz','Spacelike','d3','1 868 786-2237','#34 Sookoo Trace Claxton Bay','teach35@gmail.com',9000.00,'l4','s8','02-Mar-2005');
INSERT INTO TEACHERS VALUES ('t36','John','Cena','d3','1 868 927-5234','#98 Coders Village Chagunas','teach36@gmail.com',9000.00,'l4','s9','27-Jul-2009');

/*INSERTING DATA INTO STUDENTS TABLE*/
/*students in school 1*/
INSERT INTO STUDENTS VALUES(id_count.nextval,'Adrian','John','1-868-924-2342','#121 Charles Street San Fernando Trinidad','l1',1,3.2,'M');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Matt','Project','1-868-234-6232','#3 Juke Street POS','l1',2,5.2,'M');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Tob','Waldon','1-868-134-3244','#23 Juke Street POS','l1',3,1.2,'M');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Samuel','Damion','1-868-544-9782','#1 Tom drive San Fernando','l1',4,4.0,'M');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Kindrid','Howl','1-868-654-5645','#121 Charles Street San Fernando Trinidad','l1',5,1.4,'M');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Dudea','Valan','1-868-345-9778','#13 Melville Debe','l1',1,2.3,'M');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Drew','Chin','1-868-865-3457','#1 Tom drive San Fernando','l1',2,3.1,'M');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Samuel','Persad','1-865-924-8786','#98 Leblanc Drive Chagunas','l1',3,2.9,'M');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Peter','James','1-868-234-3457','#12 Charles Street Couva','l1',4,1.7,'M');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Davis','Mark','1-868-345-6784','#98 Benjamin Drive Penal','l1',5,2.4,'M');

/*values into school 2*/
INSERT INTO STUDENTS VALUES(id_count.nextval,'Mally','Best','1-868-736-2332','#24, Alice Drive, Couva','l2',1,1.6,'F');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Sally','Keet','1-868-964-9472','#12, Highland Drive, San Fernando','l2',1,2.8,'F');
INSERT INTO STUDENTS VALUES(id_count.nextval,'kim','Salman','1-868-392-9362','#2, Highland Trace, Duncan Village','l2',1,3.1,'F');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Sam','Spears','1-868-394-1722','#101, Green Lane, Debe','l2',1,4.0,'F');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Brit','Mally','1-868-978-7382','#11 Charles Street San Fernando Trinidad','l2',1,3.1,'F');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Jamie','Jackson','1-868-702-8372','#34, Green Lane, Debe','l2',1,3.8,'F');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Syndra','Johnson','1-868-625-1982','#4, Alice Drive, Couva','l2',1,2.5,'F');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Kalista','Legends','1-868-747-2222','#1, Highland Drive, San Fernando','l2',1,1.9,'F');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Alicia','Denis-Nagee','1-868-736-7943','#12, Highland Trace, Duncan Village','l2',1,2.9,'F');
INSERT INTO STUDENTS VALUES(id_count.nextval,'Judy','Bower','1-868-392-2748','#45, Ingot Street, Arima','l2',1,2.3,'F');

/*students school 3*/
INSERT INTO students VALUES (id_count.NEXTVAL, 'Aaron','Singh', '657-9822', '#32, Mango Trace, Toruba', 'l3', 1, 2.0, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Jack','Daniel', '647-1622', '#24, Alice Drive, Couva', 'l3', 2, 2.4, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Daveed','Ali', '623-4972', '#12, Highland Drive, San Fernando', 'l3', 3, 2.2, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Brandon','John', '654-1662', '#2, Ingot Street, Arima', 'l3', 4, 2.7, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Steve','Carl', '665-1548', '#4, Alfred Road, Marabella', 'l3', 5, 3.0, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Jenny','Alves', '643-4722', '#12, Denial Lane, Couva', 'l3', 2, 2.1, 'F' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Saphana','Ali', '624-3658', '#12, Highland Trace, Duncan Village', 'l3', 3, 2.23, 'F' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Bella','Deane', '625-8862', '#22, Apple Street, Prince Town', 'l3', 4, 2.9, 'F' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Sally','Lorenzo', '669-5874', '#44, Green Lane, Debe', 'l3', 5, 3.1, 'F' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Tiana','Forte', '677-6674', '#7, River Road, San Fernando', 'l3', 5, 3.1, 'F' );


/*students in school 4*/
INSERT INTO students VALUES (id_count.NEXTVAL, 'Kevin','Scott', '657-2525', '#241, Alvion Alley, POS', 'l4', 2, 1.9, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Daniel','Narine', '644-3651', '#71, Lowland Drive, San Fernando', 'l4', 3, 2.1, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Steven','Harris', '628-4875', '#29, Steel Street, Gasparillo', 'l4', 4, 3.2, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Garen','Bush', '632-5474', '#11, Diamond Road, Marabella', 'l4', 5, 2.0, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Levi','Crawford', '644-6958', '#41, Toad Village, Arima', 'l4', 1, 2.5, 'M' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Jennifer','Carlton', '647-4362', '#13, Happy Lane, Princes Town', 'l4', 2, 2.4, 'F' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Penny','Walcott', '658-7858', '#12, Highland Trace, Point Fortin', 'l4', 3, 2.21, 'F' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Katarina','Dianne', '6278-1562', '#22, Singh Street, La Brea', 'l4', 4, 2.91, 'F' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Diana','Larry', '669-4774', '#44, Plaza Lane, Moruga', 'l4', 5, 3.08, 'F' );
INSERT INTO students VALUES (id_count.NEXTVAL, 'Sona','Farali', '678-4174', '#7, Water Road, Marabella', 'l4', 1, 2.48, 'F' );

/*INSERTING DATA INTO CLASSES TABLE */
/*list of CLASSES in school 1*/
INSERT INTO CLASSES VALUES ('LOC1_CLA1','s2','t3','Saturday 10:00 ');
INSERT INTO CLASSES VALUES ('LOC1_CLA2','s6','t8','Thursday 11:00 ');
INSERT INTO CLASSES VALUES ('LOC1_CLA3','s1','t1','Friday 2:00 ');
/*list of CLASSES in school 2*/
INSERT INTO CLASSES VALUES ('LOC2_CLA1','s4','t16','Wednesday 8:00 ');
INSERT INTO CLASSES VALUES ('LOC2_CLA2','s9','t22','Friday 4:00 ');
INSERT INTO CLASSES VALUES ('LOC2_CLA3','s5','t17','Saturday 12:00 ');
/*list of CLASSES in school 3*/
INSERT INTO CLASSES VALUES('LOC3_CLA1','s8','t30','Tuesday 9:00');
INSERT INTO CLASSES VALUES('LOC3_CLA2','s4','t26','Wednesday 9:00' );
INSERT INTO CLASSES VALUES ('LOC3_CLA3','s7','t10','Sunday 12:00');

/*list of CLASSES in school 4*/
INSERT INTO CLASSES VALUES('LOC4_CLA1','s2','t32','Monday 9:00' );
INSERT INTO CLASSES VALUES('LOC4_CLA2','s3','t33','Tuesday 9:00' );
INSERT INTO CLASSES VALUES('LOC4_CLA3','s9','t36','Wednesday 9:00' );

--------------------------------------------------------------------------------


/*INSERTING DATA INTO ENROLLMENTS TABLE*/
/*Enrollment of CLASSES from school 1*/
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA1',1030,92.5);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA1',1080,70.9);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA1',1100,85.2);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA1',1120,50.0);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA1',1160,77.8);

INSERT INTO ENROLLMENTS VALUES('LOC1_CLA2',1080,92.9);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA2',1050,90.9);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA2',1030,100.6);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA2',1100,89.1);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA2',1120,98.2);

INSERT INTO ENROLLMENTS VALUES('LOC1_CLA3',1050,62.3);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA3',1110,49.9);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA3',1160,78.0);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA3',1090,66.1);
INSERT INTO ENROLLMENTS VALUES('LOC1_CLA3',1030,59.5);

/*enrollments of classes in school 2*/
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA1',1220,42.5);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA1',1230,72.2);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA1',1240,82.1);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA1',1250,100.0);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA1',1260,93.1);

INSERT INTO ENROLLMENTS VALUES('LOC2_CLA2',1260,69.5);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA2',1250,76.0);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA2',1290,82.1);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA2',1220,56.2);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA2',1300,90.3);

INSERT INTO ENROLLMENTS VALUES('LOC2_CLA3',1330,89.5);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA3',1320,70.9);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA3',1260,88.8);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA3',1300,98.1);
INSERT INTO ENROLLMENTS VALUES('LOC2_CLA3',1230,78.2);

/*enrollments for location 3*/
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA1',1050,82.5);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA1',1040,70.9);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA1',1060,70.2);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA1',1180,60.0);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA1',1170,72.8);

INSERT INTO ENROLLMENTS VALUES('LOC3_CLA2',1360,92.4);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA2',1390,88.3);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA2',1340,75.5);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA2',1410,90.0);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA2',1420,82.5);

INSERT INTO ENROLLMENTS VALUES('LOC3_CLA3',1360,62.4);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA3',1390,78.2);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA3',1340,95.3);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA3',1410,98.4);
INSERT INTO ENROLLMENTS VALUES('LOC3_CLA3',1420,98.1);

/*enrollments for location 4*/
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA1',1400,75.1);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA1',1430,85.0);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA1',1420,62.3);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA1',1350,50.5);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA1',1370,73.7);

INSERT INTO ENROLLMENTS VALUES('LOC4_CLA2',1430,84.6);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA2',1410,89.4);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA2',1360,94.2);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA2',1390,90.1);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA2',1370,71.4);

INSERT INTO ENROLLMENTS VALUES('LOC4_CLA3',1070,65.7);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA3',1170,69.4);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA3',1200,78.4);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA3',1190,70.5);
INSERT INTO ENROLLMENTS VALUES('LOC4_CLA3',1400,88.4);

/*list of queries*/
1)
SELECT STUDENT_ID,FIRST_NAME,LAST_NAME,GPA
FROM STUDENTS
WHERE GPA = (SELECT MAX(GPA) 
	         FROM STUDENTS);
			 
2)
SELECT LOCATION_ID, MAX(GPA)"HIGHEST GPA IN LOCATION"
FROM STUDENTS
WHERE GPA != 0.0
GROUP BY LOCATION_ID;
			 
3)
SELECT STUDENT_ID,FIRST_NAME,LAST_NAME,GPA,LOCATION_ID,GENDER
FROM STUDENTS
WHERE GPA IN (SELECT MAX(GPA) 
	          FROM STUDENTS
              GROUP BY GENDER);

4)
SELECT c.SUBJECT_ID, s.TITLE, ROUND (AVG(e.GRADE),2)"AVERAGE GRADE OF SUBJECT"
FROM CLASSES c JOIN ENROLLMENTS e ON(e.CLASS_ID=c.CLASS_ID) JOIN SUBJECTS s ON(s.SUBJECT_ID=c.SUBJECT_ID)
GROUP BY c.SUBJECT_ID,s.TITLE
ORDER BY c.SUBJECT_ID;

5)
SELECT c.SUBJECT_ID, s.TITLE, ROUND (MAX(e.GRADE),2)"MAX GRADE OF SUBJECT"
FROM CLASSES c JOIN ENROLLMENTS e ON(e.CLASS_ID=c.CLASS_ID) JOIN SUBJECTS s ON(s.SUBJECT_ID=c.SUBJECT_ID)
GROUP BY c.SUBJECT_ID,s.TITLE
ORDER BY c.SUBJECT_ID;


6)	
SELECT CLASS_ID,STUDENT_ID,FIRST_NAME,LAST_NAME,GRADE
FROM STUDENTS NATURAL JOIN ENROLLMENTS
WHERE GRADE IN(SELECT MAX(GRADE)
               FROM ENROLLMENTS
               GROUP BY CLASS_ID)
ORDER BY CLASS_ID;
      			 
7) 
SELECT STU_LEVEL "STUDENT LEVEL", ROUND(AVG(GPA),2)"GRADE POINT AVERAGE"
FROM STUDENTS
GROUP BY STU_LEVEL
ORDER BY STU_LEVEL;

8)
SELECT STU_LEVEL"STUDENT LEVEL", MAX(GPA)"HIGHEST GPA OF THAT LEVEL"
FROM STUDENTS
GROUP BY STU_LEVEL
ORDER BY STU_LEVEL;

9)
SELECT CASE GENDER
                  WHEN 'M' THEN 'MALES HAS A HIGHER AVERAGE GPA OF '|| ROUND(AVG(GPA),3)
                  ELSE 'FEMALES HAS A HIGHER AVERAGE GPA OF '|| ROUND(AVG(GPA),3)
                  END "HIGHEST AVERAGE GPA"
FROM STUDENTS
HAVING  AVG(GPA)= (SELECT MAX(AVG(GPA))
                   FROM STUDENTS 
                   GROUP BY GENDER)
GROUP BY GENDER;
		
10)
SELECT STUDENT_ID,FIRST_NAME,LAST_NAME,GPA,LOCATION_ID,GENDER,GRADE "FAILING GRADES"
FROM STUDENTS NATURAL JOIN ENROLLMENTS 
WHERE GPA<2 AND GRADE<70;	

11)
SELECT TEACHER_ID,FIRST_NAME,LAST_NAME,LOCATION_ID
FROM TEACHERS 
WHERE TEACHER_ID IN
                  (SELECT  c.TEACHER_ID
                   FROM ENROLLMENTS e JOIN CLASSES c ON (e.CLASS_ID=c.CLASS_ID) 
                   HAVING AVG(GRADE)<70
                   GROUP BY c.TEACHER_ID);

