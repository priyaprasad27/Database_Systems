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
  TEACHER_ID integer(6) not null,
  FIRST_NAME varchar(25) not null,
  LAST_NAME varchar(25) not null,
  PREFERRED_SUBJECT varchar(25),
  constraint TEACHER_PK primary key (TEACHER_ID)
);

create table SUBJECT (
  SUBJECT_ID integer(10) not null,
  SUBJECT_NAME varchar(30) not null,
  FK_TEACHER_ID integer(6) not null,
  constraint SUBJECT_PK primary key (SUBJECT_ID),
  constraint SUBJECT_TEACHER_FK foreign key (FK_TEACHER_ID) references TEACHER(TEACHER_ID)
);

CREATE TABLE HOMEROOM (
  HOMEROOM_ID integer(6) not null,
  HOMEROOM_NAME varchar(30) not null,
  FK_TEACHER_ID integer(6) not null,
  constraint HOMEROOM_PK primary key (HOMEROOM_ID),
  constraint HOMEROOM_TEACHER_FK foreign key(FK_TEACHER_ID) references TEACHER(TEACHER_ID)
);

CREATE TABLE ASSIGNMENT (
  ASSIGNMENT_ID integer(6) not null,
  ASSIGNEMENT_NAME varchar(30) not null,
  URL varchar(30) not null,
  FK_SUBJECT_ID integer(10) not null,
  constraint ASSIGNMENT_PK primary key(ASSIGNMENT_ID),
  constraint ASSIGNMENT_SUBJECT_FK foreign key(FK_SUBJECT_ID) references SUBJECT(SUBJECT_ID)
);

CREATE TABLE STUDENT(
  STUDENT_ID integer(6) not null,
  FNAME varchar(20) not null,
  LNAME varchar(20) not null,
  BIRTHDATE date,
  FK_HOMEROOM_ID integer(6) not null,
  constraint STUDENT_PK primary key(STUDENT_ID),
  constraint STUDENT_ROOM_FK foreign key(FK_HOMEROOM_ID) references HOMEROOM(HOMEROOM_ID)
);


CREATE TABLE HOMEWORK (
  HOMEWORK_ID integer(6) not null,
  URL varchar(30) not null,
  FINAL_GRADE varchar(2),
  FK_STUDENT_ID integer(6) not null,
  FK_ASSIGNMENT_ID integer(6) not null,
  constraint HOMEWORK_PK primary key(HOMEWORK_ID),
  constraint HOMEWORK_STUDENT_FK foreign key(FK_STUDENT_ID) references STUDENT(STUDENT_ID),
  constraint HOMEWORK_ASSIGNMENT_FK foreign key(FK_ASSIGNMENT_ID) references ASSIGNMENT(ASSIGNMENT_ID)
);

CREATE TABLE TAKEN_BY (
  FK_STUDENT_ID integer(6) not null,
  FK_SUBJECT_ID integer(6) not null,
  FINAL_GRADE varchar(2),
  constraint TAKEN_PK primary key(FK_STUDENT_ID,FK_SUBJECT_ID),
  constraint TAKEN_BY_STUDENT_FK foreign key(FK_STUDENT_ID) references STUDENT(student_id),
  constraint TAKEN_BY_SUBJECT_FK foreign key(FK_SUBJECT_ID) references SUBJECT(SUBJECT_ID)
);




 


