CREATE TABLE TEACHER(TEACHER_ID NUMBER(6), FIRST_NAME VARCHAR(25), LAST_NAME VARCHAR(25), PREFFERED_SUBJECT VARCHAR(25));

create table subject ( subject_id number(10), subject_name varchar2(30), teacher_id number(6));

CREATE TABLE HOMEROOM ( HOMEROOM_ID NUMBER(6), HOMEROOM_NAME VARCHAR2(30), TEACHER_ID NUMBER(6),
constraint tacherID_fk foreign key(teacher_id) references teacher(teacher_id));

CREATE TABLE ASSIGNMENT (ASSIGNMENT_ID NUMBER(6), ASSIGNEMENT_NAME VARCHAR2(30), URL VARCHAR2(30), SUBJECT_ID NUMBER(10),
CONSTRAINT ASSIGNMENT_PK PRIMARY KEY(ASSIGNMENT_ID), CONSTRAINT SUBJECT_FK FOREIGN KEY(SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID));

CREATE TABLE STUDENT(STUDENT_ID NUMBER(6), FNAME VARCHAR2(20), LNAME VARCHAR2(20), BIRTHDATE DATE, HOMEROOM_ID number(6),
CONSTRAINT STUDENT_PK PRIMARY KEY(STUDENT_ID), CONSTRAINT ROOM_fk foreign key(homeroom_id) REFERENCES homeroom(homeroom_id));


CREATE TABLE HOMEWORK (HOMEWORK_ID NUMBER(6), URL VARCHAR2(30), FINAL_GRADE VARCHAR(2), STUDENT_ID NUMBER(6), ASSIGNMENT_ID NUMBER(6),
constraint homework_pk primary key(homework_id), constraint student_fk foreign key(student_id) references student(student_id));

CREATE TABLE TAKEN_BY (STUDENT_ID NUMBER(6), SUBJECT_ID NUMBER(6), FINAL_GRADE VARCHAR(2),
constraint taken_pk primary key(student_id,subject_id));




 


create table subject(class_id number(6), class_name varchar2(25));