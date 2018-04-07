/******* Operations for New school database**************
Each query has the operation commented and sample data used in the operations
A separate document with results will be attached***********************/

-- Teachers can add a grade to the Student Work. We need to add conditions for both assignment_id and student_id
UPDATE HOMEWORK
SET FINAL_GRADE = 'A-'
WHERE FK_ASSIGNMENT_ID = 1
and fk_student_id = 30;


/*Transfer a student from one homeroom to another*/
UPDATE STUDENT 
SET FK_HOMEROOM_ID = 2
where student_id = 1;

--Display a list of student assignments for a subject.Sample subject id = 1 
SELECT S.SUBJECT_NAME, g.ASSIGNMENT_ID, g.ASSIGNMENT_NAME, g.URL 
FROM ASSIGNMENT G, SUBJECT S
WHERE S.SUBJECT_ID = G.FK_SUBJECT_ID
and g.fk_subject_id=1;

-- Display a list of all students taught by a given teacher. Sample teacher - Teacher id 2, Carolyn Porco
SELECT  T.First_name||' '||t.last_Name as teacher_Name, S.FNAME||' '||s.LName as student_name
FROM STUDENT S, HOMEROOM H, teacher t
WHERE S.FK_HOMEROOM_ID = H.HOMEROOM_ID
AND H.FK_TEACHER_ID = T.TEACHER_ID
and t.teacher_id = 2;

-- DISPLAY A LIST OF ALL THE STUDENT WORK BY A STUDENT. Sample student_id = 22
SELECT  S.FNAME||' '||S.LNAME as student_Name, H.URL as homework_URL
FROM HOMEWORK H, STUDENT S
WHERE S.STUDENT_ID = H.FK_STUDENT_ID
and S.STUDENT_ID = 22;

-- Display a list of student work for a classroom. Sample homeroom_id = 2
SELECT h.FK_STUDENT_ID AS HOMEROOM_2_STUDENTS, s.fname||' '||s.lname as Student_Name, h.URL AS STUDENT_WORK
FROM HOMEWORK h, STUDENT S
WHERE FK_STUDENT_ID IN ( SELECT STUDENT_ID FROM STUDENT WHERE FK_HOMEROOM_ID = 2)
and s.student_id = h.fk_student_id;


-- INSERT A NEW STUDENT INTO THE DB. inserting 2 new students
INSERT INTO STUDENT (STUDENT_ID,  FNAME,  LNAME,  BIRTHDATE,  FK_HOMEROOM_ID) VALUES (31 ,   'Priya',        'Prasad',        '03-May-1987',  3);
INSERT INTO STUDENT (STUDENT_ID,  FNAME,  LNAME,  BIRTHDATE,  FK_HOMEROOM_ID) VALUES (32 ,   'Peter',        'Martinson',     '03-Jun-1987',  2);



