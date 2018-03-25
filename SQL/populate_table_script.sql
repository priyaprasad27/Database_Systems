ALTER TABLE subject DISABLE CONSTRAINT subject_teacher_fk;
ALTER TABLE homeroom DISABLE CONSTRAINT homeroom_teacher_fk;
ALTER TABLE assignment DISABLE CONSTRAINT assignment_subject_fk;
ALTER TABLE student DISABLE CONSTRAINT student_room_fk;
ALTER TABLE homework DISABLE CONSTRAINT homework_student_fk;
ALTER TABLE homework DISABLE CONSTRAINT homework_assignment_fk;
ALTER TABLE taken_by DISABLE CONSTRAINT taken_by_student_fk;
ALTER TABLE taken_by DISABLE CONSTRAINT taken_by_subject_fk;

TRUNCATE TABLE teacher;
TRUNCATE TABLE subject;
TRUNCATE TABLE homeroom;
TRUNCATE TABLE assignment;
TRUNCATE TABLE student;
TRUNCATE TABLE homework;
TRUNCATE TABLE taken_by;

ALTER TABLE subject DISABLE CONSTRAINT subject_teacher_fk;
ALTER TABLE homeroom DISABLE CONSTRAINT homeroom_teacher_fk;
ALTER TABLE assignment DISABLE CONSTRAINT assignment_subject_fk;
ALTER TABLE student DISABLE CONSTRAINT student_room_fk;
ALTER TABLE homework DISABLE CONSTRAINT homework_student_fk;
ALTER TABLE homework DISABLE CONSTRAINT homework_assignment_fk;
ALTER TABLE taken_by DISABLE CONSTRAINT taken_by_student_fk;
ALTER TABLE taken_by DISABLE CONSTRAINT taken_by_subject_fk;


INSERT INTO
  teacher
VALUES
  (teacher_id, first_name, last_name, preferred_subject, status)
;

INSERT INTO
  subject
VALUES
  (subject_id, subject_name, fk_teacher_id)
;

INSERT INTO
  homeroom
VALUES
  (homeroom_id, homeroom_name, fk_teacher_id)
;

INSERT INTO
  assignment
VALUES
  (assignment_id, assignment_name, url, fk_subject_id)
;

INSERT INTO
  student
VALUES
  (student_id, fname, lname, birthdate, fk_homeroom_id)
;

INSERT INTO
  homework
VALUES
  (homework_id, url, final_grade, fk_student_id, fk_assignment_id)
;

INSERT INTO
  taken_by
VALUES
  (fk_student_id, fk_subject_id, final_grade)
;

 
