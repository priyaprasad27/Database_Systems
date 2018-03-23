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
  PREFERRED_SUBJECT VARCHAR(25),
  constraint TEACHER_PK primary key (TEACHER_ID)
);

create table SUBJECT (
  subject_id integer(10),
  subject_name varchar(30),
  fk_teacher_id integer(6),
  constraint SUBJECT_PK primary key (SUBJECT_ID),
  constraint TEACHER_FK foreign key (FK_TEACHER_ID) references TEACHER(TEACHER_ID)
);

CREATE TABLE HOMEROOM (
  HOMEROOM_ID integer(6),
  HOMEROOM_NAME varchar(30),
  FK_TEACHER_ID integer(6),
  constraint HOMEROOM_PK primary key (HOMEROOM_ID),
  constraint TEACHER_FK foreign key(FK_TEACHER_ID) references TEACHER(TEACHER_ID)
);

CREATE TABLE ASSIGNMENT (
  ASSIGNMENT_ID integer(6),
  ASSIGNEMENT_NAME varchar(30),
  URL varchar(30),
  FK_SUBJECT_ID integer(10),
  constraint ASSIGNMENT_PK primary key(ASSIGNMENT_ID),
  constraint SUBJECT_FK foreign key(FK_SUBJECT_ID) references SUBJECT(SUBJECT_ID)
);

CREATE TABLE STUDENT(
  STUDENT_ID integer(6),
  FNAME varchar(20),
  LNAME varchar(20),
  BIRTHDATE DATE,
  FK_HOMEROOM_ID integer(6),
  constraint STUDENT_PK primary key(STUDENT_ID),
  constraint ROOM_fk foreign key(FK_HOMEROOM_ID) references HOMEROOM(HOMEROOM_ID)
);


CREATE TABLE HOMEWORK (
  HOMEWORK_ID integer(6),
  URL varchar(30),
  FINAL_GRADE VARCHAR(2),
  FK_STUDENT_ID integer(6),
  FK_ASSIGNMENT_ID integer(6),
  constraint HOMEWORK_PK primary key(HOMEWORK_ID),
  constraint STUDENT_FK foreign key(FK_STUDENT_ID) references STUDENT(STUDENT_ID),
  constraint ASSIGNMENT_FK foreign key(FK_ASSIGNMENT_ID) references ASSIGNMENT(ASSIGNMENT_ID)
);

CREATE TABLE TAKEN_BY (
  FK_STUDENT_ID integer(6),
  FK_SUBJECT_ID integer(6),
  FINAL_GRADE VARCHAR(2),
  constraint TAKEN_PK primary key(FK_STUDENT_ID,FK_SUBJECT_ID),
  constraint STUDENT_FK foreign key(FK_STUDENT_ID) references STUDENT(student_id),
  constraint SUBJECT_FK foreign key(FK_SUBJECT_ID) references SUBJECT(SUBJECT_ID)
);




 


