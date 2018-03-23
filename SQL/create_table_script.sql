/* MySQL */

USE school;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS teacher;
DROP TABLE IF EXISTS subject;
DROP TABLE IF EXISTS homeroom;
DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS homework;
DROP TABLE IF EXISTS taken_by;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE teacher (
  teacher_id        INTEGER(6) NOT NULL,
  first_name        VARCHAR(25) NOT NULL,
  last_name         VARCHAR(25) NOT NULL,
  preferred_subject VARCHAR(25),
  status            VARCHAR(16) NOT NULL DEFAULT 'UNASSIGNED',
  CONSTRAINT teacher_pk
    PRIMARY KEY (teacher_id)
);

CREATE TABLE subject (
  subject_id    INTEGER(10) NOT NULL,
  subject_name  VARCHAR(30) NOT NULL,
  fk_teacher_id INTEGER(6),
  CONSTRAINT subject_pk
    PRIMARY KEY (subject_id),
  CONSTRAINT subject_sk
    UNIQUE (subject_name),
  CONSTRAINT subject_teacher_fk
    FOREIGN KEY (fk_teacher_id)
    REFERENCES teacher(teacher_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE homeroom (
  homeroom_id   INTEGER(6) NOT NULL,
  homeroom_name VARCHAR(30) NOT NULL,
  fk_teacher_id INTEGER(6),
  CONSTRAINT homeroom_pk
    PRIMARY KEY (homeroom_id),
  CONSTRAINT homeroom_teacher_fk
    FOREIGN KEY(fk_teacher_id)
    REFERENCES teacher(teacher_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE assignment (
  assignment_id    INTEGER(6) NOT NULL,
  assignement_name VARCHAR(30) NOT NULL,
  url              VARCHAR(30) NOT NULL,
  fk_subject_id    INTEGER(10) NOT NULL,
  CONSTRAINT assignment_pk
    PRIMARY KEY(assignment_id),
  CONSTRAINT assignment_subject_fk
    FOREIGN KEY(fk_subject_id)
    REFERENCES subject(subject_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE student(
  student_id     INTEGER(6) NOT NULL,
  fname          VARCHAR(20) NOT NULL,
  lname          VARCHAR(20) NOT NULL,
  birthdate      DATE,
  fk_homeroom_id INTEGER(6),
  CONSTRAINT student_pk
    PRIMARY KEY(student_id),
  CONSTRAINT student_room_fk
    FOREIGN KEY(fk_homeroom_id)
    REFERENCES homeroom(homeroom_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE homework (
  homework_id      INTEGER(6) NOT NULL,
  url              VARCHAR(30) NOT NULL,
  final_grade      VARCHAR(2),
  fk_student_id    INTEGER(6) NOT NULL,
  fk_assignment_id INTEGER(6),
  CONSTRAINT homework_pk
    PRIMARY KEY(homework_id),
  CONSTRAINT homework_student_fk
    FOREIGN KEY(fk_student_id)
    REFERENCES student(student_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT homework_assignment_fk
    FOREIGN KEY(fk_assignment_id)
    REFERENCES assignment(assignment_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE taken_by (
  fk_student_id INTEGER(6) NOT NULL,
  fk_subject_id INTEGER(6) NOT NULL,
  final_grade VARCHAR(2),
  CONSTRAINT taken_pk
    PRIMARY KEY(fk_student_id,fk_subject_id),
  CONSTRAINT taken_by_student_fk
    FOREIGN KEY(fk_student_id)
    REFERENCES student(STUDENT_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT taken_by_subject_fk
    FOREIGN KEY(fk_subject_id)
    REFERENCES subject(subject_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);




 


