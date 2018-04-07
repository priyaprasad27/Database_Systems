/* Oracle 11.2 */

/**************************************************************************
Assumptions
 
1. Neither Subject nor Homeroom disappears if a Teacher gets deleted
2. If a Subject gets deleted, delete all associated Assignments
3. A Student does not need to be assigned to a Homeroom
4. A student's Homework exists as long as there is an associated Student,
   but gets deleted along with the Student
**************************************************************************/


--SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE teacher CASCADE CONSTRAINTS;
DROP TABLE subject CASCADE CONSTRAINTS;
DROP TABLE homeroom CASCADE CONSTRAINTS;
DROP TABLE assignment CASCADE CONSTRAINTS;
DROP TABLE student CASCADE CONSTRAINTS;
DROP TABLE homework CASCADE CONSTRAINTS;
DROP TABLE taken_by CASCADE CONSTRAINTS;
-- SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE teacher (
  teacher_id        NUMBER(6) NOT NULL,
  first_name        VARCHAR2(25) NOT NULL,
  last_name         VARCHAR2(25) NOT NULL,
  preferred_subject VARCHAR2(25),
  status            VARCHAR2(16) DEFAULT 'UNASSIGNED' NOT NULL,
  CONSTRAINT teacher_pk
    PRIMARY KEY (teacher_id)
);

CREATE TABLE subject (
  subject_id    NUMBER(10) NOT NULL,
  subject_name  VARCHAR2(30) NOT NULL,
  fk_teacher_id NUMBER(6),
  CONSTRAINT subject_pk
    PRIMARY KEY (subject_id),
  CONSTRAINT subject_sk
    UNIQUE (subject_name),
  CONSTRAINT subject_teacher_fk
    FOREIGN KEY (fk_teacher_id)
    REFERENCES teacher(teacher_id)
    ON DELETE SET NULL
);

CREATE TABLE homeroom (
  homeroom_id   NUMBER(6) NOT NULL,
  homeroom_name VARCHAR2(30) NOT NULL,
  fk_teacher_id NUMBER(6),
  CONSTRAINT homeroom_pk
    PRIMARY KEY (homeroom_id),
  CONSTRAINT homeroom_teacher_fk
    FOREIGN KEY(fk_teacher_id)
    REFERENCES teacher(teacher_id)
    ON DELETE SET NULL
);

CREATE TABLE assignment (
  assignment_id    NUMBER(6) NOT NULL,
  assignment_name VARCHAR2(30) NOT NULL,
  url              VARCHAR2(60) NOT NULL,
  fk_subject_id    NUMBER(10) NOT NULL,
  CONSTRAINT assignment_pk
    PRIMARY KEY(assignment_id),
  CONSTRAINT assignment_subject_fk
    FOREIGN KEY(fk_subject_id)
    REFERENCES subject(subject_id)
    ON DELETE CASCADE
);

CREATE TABLE student(
  student_id     NUMBER(6) NOT NULL,
  fname          VARCHAR2(20) NOT NULL,
  lname          VARCHAR2(20) NOT NULL,
  birthdate      DATE,
  fk_homeroom_id NUMBER(6),
  CONSTRAINT student_pk
    PRIMARY KEY(student_id),
  CONSTRAINT student_room_fk
    FOREIGN KEY(fk_homeroom_id)
    REFERENCES homeroom(homeroom_id)
    ON DELETE SET NULL
);

CREATE TABLE homework (
  homework_id      NUMBER(6) NOT NULL,
  url              VARCHAR2(60) NOT NULL,
  final_grade      VARCHAR2(2),
  fk_student_id    NUMBER(6) NOT NULL,
  fk_assignment_id NUMBER(6),
  CONSTRAINT homework_pk
    PRIMARY KEY(homework_id),
  CONSTRAINT homework_student_fk
    FOREIGN KEY(fk_student_id)
    REFERENCES student(student_id)
    ON DELETE CASCADE,
  CONSTRAINT homework_assignment_fk
    FOREIGN KEY(fk_assignment_id)
    REFERENCES assignment(assignment_id)
    ON DELETE SET NULL
);

CREATE TABLE taken_by (
  fk_student_id NUMBER(6) NOT NULL,
  fk_subject_id NUMBER(6) NOT NULL,
  final_grade VARCHAR2(2),
  CONSTRAINT taken_pk
    PRIMARY KEY(fk_student_id,fk_subject_id),
  CONSTRAINT taken_by_student_fk
    FOREIGN KEY(fk_student_id)
    REFERENCES student(STUDENT_ID)
    ON DELETE CASCADE,
  CONSTRAINT taken_by_subject_fk
    FOREIGN KEY(fk_subject_id)
    REFERENCES subject(subject_id)
    ON DELETE CASCADE
);




 


