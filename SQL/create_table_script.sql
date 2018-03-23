use school;

set foreign_key_checks = 0;
drop table if exists TEACHER;
drop table if exists SUBJECT;
drop table if exists HOMEROOM;
drop table if exists ASSIGNMENT;
drop table if exists STUDENT;
drop table if exists HOMEWORK;
drop table if exists TAKEN_BY;
set foreign_key_checks = 1;

CREATE TABLE TEACHER (
  TEACHER_ID integer(6),
  FIRST_NAME VARCHAR(25),
  LAST_NAME VARCHAR(25),
  PREFFERED_SUBJECT VARCHAR(25)
);

create table SUBJECT (
  subject_id integer(10),
  subject_name varchar(30),
  teacher_id integer(6)
);

CREATE TABLE HOMEROOM (
  HOMEROOM_ID integer(6),
  HOMEROOM_NAME varchar(30),
  TEACHER_ID integer(6),
  constraint teacherID_fk foreign key(teacher_id) references teacher(teacher_id)
);

CREATE TABLE ASSIGNMENT (
  ASSIGNMENT_ID integer(6),
  ASSIGNEMENT_NAME varchar(30),
  URL varchar(30),
  SUBJECT_ID integer(10),
  CONSTRAINT ASSIGNMENT_PK PRIMARY KEY(ASSIGNMENT_ID), CONSTRAINT SUBJECT_FK FOREIGN KEY(SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID)
);

CREATE TABLE STUDENT(
  STUDENT_ID integer(6),
  FNAME varchar(20),
  LNAME varchar(20),
  BIRTHDATE DATE,
  HOMEROOM_ID integer(6),
  CONSTRAINT STUDENT_PK PRIMARY KEY(STUDENT_ID), CONSTRAINT ROOM_fk foreign key(homeroom_id) REFERENCES homeroom(homeroom_id)
);


CREATE TABLE HOMEWORK (
  HOMEWORK_ID integer(6),
  URL varchar(30),
  FINAL_GRADE VARCHAR(2),
  STUDENT_ID integer(6),
  ASSIGNMENT_ID integer(6),
  constraint homework_pk primary key(homework_id), constraint student_fk foreign key(student_id) references student(student_id)
);

CREATE TABLE TAKEN_BY (
  STUDENT_ID integer(6),
  SUBJECT_ID integer(6),
  FINAL_GRADE VARCHAR(2),
  constraint taken_pk primary key(student_id,subject_id)
);




 


