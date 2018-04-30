/* Oracle Database Express Edition 11g Release 2

This and all associated scripts were tested and ran successfully using the
docker image available at the following URL:

https://hub.docker.com/r/wnameless/oracle-xe-11g/
$ docker pull wnameless/oracle-xe-11g

Created by:
Priya Prasad
Peter Martinson
*/

/******* Operations for New school database**************
Each query has the operation commented and sample data used in the operations
A separate document with results will be attached***********************/

-- Teachers can add a grade to the Student Work. We need to add conditions for both assignment_id and student_id
UPDATE homework
SET final_grade = 'A-'
WHERE fk_assignment_id = 1
and fk_student_id = 30;

-- Transfer a student from one homeroom to another
UPDATE student 
SET fk_homeroom_id = 2
where student_id = 1;

--Display a list of student assignments for a subject.Sample subject id = 1 
SELECT s.subject_name, g.assignment_id, g.assignment_name, g.url 
FROM assignment g, subject s
WHERE s.subject_id = g.fk_subject_id
AND s.subject_name = 'Astronomy';

-- Display a list of all students taught by a given teacher. Sample teacher - Teacher id 2, Carolyn Porco
SELECT  t.first_name||' '||t.last_Name as teacher_Name, s.fname||' '||s.lname as student_name
FROM student s, homeroom h, teacher t
WHERE s.fk_homeroom_id = h.homeroom_id
AND h.fk_teacher_id = t.teacher_id
AND t.first_name = 'Carolyn'
AND t.last_name = 'Porco';

-- DISPLAY A LIST OF ALL THE STUDENT WORK BY A STUDENT. Sample student_id = 22
SELECT  s.fname||' '||s.lname as student_Name, h.url as homework_url
FROM homework h, student s
WHERE s.student_id = h.fk_student_id
AND s.fname = 'Johannes'
AND s.lname = 'Hevelius';

-- Display a list of student work for a classroom. Sample homeroom_id = 2
SELECT h.fk_student_id AS homeroom_2_students, s.fname||' '||s.lname as student_name, h.url AS student_work
FROM homework h, student s
WHERE fk_student_id IN ( SELECT student_id FROM student WHERE fk_homeroom_id = 2)
AND s.student_id = h.fk_student_id;


-- INSERT A NEW STUDENT INTO THE DB. inserting 2 new students
INSERT INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (31 ,   'Priya',        'Prasad',        '03-May-1987',  3);
INSERT INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (32 ,   'Peter',        'Martinson',     '03-Jun-1987',  2);

-- Replace a subject's teacher with a substitute.  Sample subject_id = 3
-- First, find a possible substitute:
SELECT DISTINCT
  subject.subject_name
, teacher.first_name || ' ' || teacher.last_name AS current_teacher
, teacher.preferred_subject
, possible_sub.first_name || ' ' || possible_sub.last_name AS possible_sub
, possible_sub.teacher_id
FROM
  subject
  INNER JOIN teacher
    ON teacher.teacher_id = subject.fk_teacher_id
  LEFT OUTER JOIN teacher possible_sub
    ON possible_sub.preferred_subject = teacher.preferred_subject
    AND possible_sub.teacher_id <> teacher.teacher_id
    AND possible_sub.teacher_id NOT IN ( SELECT fk_teacher_id FROM subject)
WHERE subject.subject_id = 3;

-- Second, update the subject table
UPDATE subject
SET fk_teacher_id = 9
WHERE subject_id = 3;

-- Display a list of all teachers not teaching a subject
-- ** This is to show a useful application of LEFT OUTER JOINs **
SELECT DISTINCT
  teacher.first_name || ' ' || teacher.last_name AS teacher_name
, teacher.teacher_id
FROM
  teacher
  LEFT OUTER JOIN subject
    ON subject.fk_teacher_id = teacher.teacher_id
WHERE subject.subject_id IS NULL;
