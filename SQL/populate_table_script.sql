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


-- INSERT INTO teacher
-- VALUES (teacher_id, first_name, last_name, preferred_subject, status) ;

-- INSERT INTO subject
-- VALUES (subject_id, subject_name, fk_teacher_id) ;

-- INSERT INTO homeroom
-- VALUES (homeroom_id, homeroom_name, fk_teacher_id) ;

-- INSERT INTO assignment
-- VALUES (assignment_id, assignment_name, url, fk_subject_id) ;

-- INSERT INTO student
-- VALUES (student_id, fname, lname, birthdate, fk_homeroom_id) ;

-- INSERT INTO homework
-- VALUES (homework_id, url, final_grade, fk_student_id, fk_assignment_id) ;

-- INSERT INTO taken_by
-- VALUES (fk_student_id, fk_subject_id, final_grade) ;

 

-- Teachers:
INSERT ALL
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (1, 'Karl', 'Gauss', 'Mathematics', 'On Leave')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (2, 'Bernhard', 'Riemann', 'Mathematics', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (3, 'Annie Jump', 'Cannon', 'Astronomy', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (4, 'Cecilia', 'Payne-Gaposchkin', 'Astronomy', 'On Leave')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (5, 'Johannes', 'Kepler', 'Astronomy', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (6, 'Caroline', 'Herschel', 'Astronomy', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (7, 'Elisabeth', 'Hevelius', 'Astronomy', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (8, 'Johannes', 'Hevelius', 'Astronomy', 'On Leave')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (9, 'Carolyn', 'Porco', 'Planetary Geology', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (10, 'Vera', 'Rubin', 'Cosmology', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (11, 'Gottfried', 'Leibniz', 'Philosophy', 'On Leave')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (12, 'Leonhard', 'Euler', 'Mathematics', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (13, 'Lise', 'Meitner', 'Nuclear Physics', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (14, 'Rosalind', 'Franklin', 'Crystallography', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (15, 'Marie', 'Curie', 'Chemistry', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (16, 'Irene', 'Curie-Joliot', 'Chemistry', 'On Leave')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (17, 'Barbara', 'McClintock', 'Genetics', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (18, 'Grace', 'Hopper', 'Computer Science', 'Active')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (19, 'Henrietta Swan', 'Leavitt', 'Computer Science', 'On Leave')
  INTO teacher (teacher_id, first_name, last_name, preferred_subject, status)
  VALUES (20, 'Lynn', 'Margulis', 'Biology', 'Active')
SELECT * FROM DUAL;


-- Students:
INSERT ALL
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (1 ,   'Maryam',        'Mirzakhani',    '03-May-1977',  1)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (2 ,   'Manjul',        'Bhargava',      '08-Aug-1974',  2)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (3 ,   'Stanislav',     'Smirnov',       '03-Sep-1970',  2)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (4 ,   'Terence',       'Tao',           '17-Jul-1975',  1)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (5 ,   'Vladimir',      'Voevodsky',     '04-Jun-1966',  1)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (6 ,   'Maxim',         'Kontsevich',    '25-Aug-1964',  4)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (7 ,   'Pierre-Louis',  'Lions',         '11-Aug-1956',  4)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (8 ,   'Edward',        'Witten',        '26-Aug-1951',  1)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (9 ,   'Michael',       'Freedman',      '21-Apr-1951',  1)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (10 ,  'Shing-Tung',    'Yau',           '04-Apr-1949',  3)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (12 ,  'Enrico',        'Bombieri',      '02-Feb-1951',  2)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (13 ,  'Sergei',        'Novikov',       '16-Jan-1978',  3)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (14 ,  'Alexander',     'Grothendieck',  '24-Apr-1962',  4)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (15 ,  'Atle',          'Selberg',       '01-Jan-1961',  4)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (16 ,  'Kunihiko',      'Kodaira',       '16-Feb-1940',  2)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (17 ,  'Lars',          'Ahlfors',       '07-Mar-1922',  4)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (18 ,  'Blaise',        'Pascal',        '12-Jun-1623',  2)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (19 ,  'Ada',           'Lovelace',      '27-Nov-1852',  3)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (20 ,  'Sophie',        'Germain',       '01-Apr-1776',  3)
  INTO student (student_id, fname, lname, birthdate, fk_homeroom_id)
  VALUES (21 ,  'Srinivasa',     'Ramanujan',     '22-Dec-1887',  2)
SELECT * FROM DUAL;
