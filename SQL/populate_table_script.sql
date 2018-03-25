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

-- Teachers:
INSERT ALL
  INTO teacher (teacher_id,  first_name,  last_name,  preferred_subject,  status) VALUES (1,  'Johannes',        'Kepler',    'Astronomy',          'Active')
  INTO teacher (teacher_id,  first_name,  last_name,  preferred_subject,  status) VALUES (2,  'Carolyn',         'Porco',     'Planetary Geology',  'Active')
  INTO teacher (teacher_id,  first_name,  last_name,  preferred_subject,  status) VALUES (3,  'Vera',            'Rubin',     'Cosmology',          'Active')
  INTO teacher (teacher_id,  first_name,  last_name,  preferred_subject,  status) VALUES (4,  'Leonhard',        'Euler',     'Mathematics',        'Active')
  INTO teacher (teacher_id,  first_name,  last_name,  preferred_subject,  status) VALUES (5,  'Lise',            'Meitner',   'Nuclear Physics',    'Active')
  INTO teacher (teacher_id,  first_name,  last_name,  preferred_subject,  status) VALUES (6,  'Rosalind',        'Franklin',  'Crystallography',    'Active')
  INTO teacher (teacher_id,  first_name,  last_name,  preferred_subject,  status) VALUES (7,  'Marie',           'Curie',     'Chemistry',          'Active')
  INTO teacher (teacher_id,  first_name,  last_name,  preferred_subject,  status) VALUES (8,  'Grace',           'Hopper',    'Computer Science',   'Active')
  INTO teacher (teacher_id,  first_name,  last_name,  preferred_subject,  status) VALUES (9,  'Henrietta Swan',  'Leavitt',   'Computer Science',   'On Leave')
SELECT * FROM DUAL;

-- subject
INSERT ALL
  INTO subject (subject_id, subject_name, fk_teacher_id) VALUES (1, 'Astronomy',         1)
  INTO subject (subject_id, subject_name, fk_teacher_id) VALUES (2, 'Chemistry',         7)
  INTO subject (subject_id, subject_name, fk_teacher_id) VALUES (3, 'Computer Science',  8)
  INTO subject (subject_id, subject_name, fk_teacher_id) VALUES (4, 'Cosmology',         3)
  INTO subject (subject_id, subject_name, fk_teacher_id) VALUES (5, 'Crystallography',   6)
  INTO subject (subject_id, subject_name, fk_teacher_id) VALUES (6, 'Mathematics',       4)
  INTO subject (subject_id, subject_name, fk_teacher_id) VALUES (7, 'Nuclear Physics',   5)
  INTO subject (subject_id, subject_name, fk_teacher_id) VALUES (8, 'Planetary Geology', 2)
SELECT * FROM DUAL;

-- INSERT INTO homeroom
-- VALUES (homeroom_id, homeroom_name, fk_teacher_id) ;

-- INSERT INTO assignment
-- VALUES (assignment_id, assignment_name, url, fk_subject_id) ;

-- Students:
INSERT ALL
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (1 ,   'Maryam',        'Mirzakhani',        '03-May-1977',  1)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (2,    'Karl',          'Gauss',             '31-Apr-1777',  3)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (3 ,   'Manjul',        'Bhargava',          '08-Aug-1974',  2)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (4,    'Bernhard',      'Riemann',           '17-Sep-1826',  4)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (5 ,   'Stanislav',     'Smirnov',           '03-Sep-1970',  2)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (6,    'Annie Jump',    'Cannon',            '11-Dec-1863',  1)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (7 ,   'Terence',       'Tao',               '17-Jul-1975',  1)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (8,    'Cecilia',       'Payne-Gaposchkin',  '10-May-1900',  3)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (9 ,   'Vladimir',      'Voevodsky',         '04-Jun-1966',  1)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (10 ,  'Maxim',         'Kontsevich',        '25-Aug-1964',  4)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (11 ,  'Shing-Tung',    'Yau',               '04-Apr-1949',  3)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (12,   'Caroline',      'Herschel',          '16-Mar-1750',  4)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (13 ,  'Pierre-Louis',  'Lions',             '11-Aug-1956',  4)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (14 ,  'Enrico',        'Bombieri',          '02-Feb-1951',  2)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (15,   'Elisabeth',     'Hevelius',          '17-Jan-1647',  2)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (16 ,  'Sergei',        'Novikov',           '16-Jan-1978',  3)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (17 ,  'Michael',       'Freedman',          '21-Apr-1951',  1)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (18 ,  'Kunihiko',      'Kodaira',           '16-Feb-1940',  2)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (19 ,  'Alexander',     'Grothendieck',      '24-Apr-1962',  4)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (20 ,  'Blaise',        'Pascal',            '12-Jun-1623',  2)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (21,   'Irene',         'Curie-Joliot',      '12-Sep-1897',  1)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (22,   'Johannes',      'Hevelius',          '28-Jan-1611',  1)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (23 ,  'Ada',           'Lovelace',          '27-Nov-1852',  3)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (24 ,  'Edward',        'Witten',            '26-Aug-1951',  1)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (25 ,  'Atle',          'Selberg',           '01-Jan-1961',  4)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (26 ,  'Sophie',        'Germain',           '01-Apr-1776',  3)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (27,   'Lynn',          'Margulis',          '05-Mar-1938',  2)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (28 ,  'Lars',          'Ahlfors',           '07-Mar-1922',  4)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (29 ,  'Srinivasa',     'Ramanujan',         '22-Dec-1887',  2)
  INTO student (student_id,  fname,  lname,  birthdate,  fk_homeroom_id) VALUES (30,   'Barbara',       'McClintock',        '16-Jun-1906',  2)
SELECT * FROM DUAL;

-- INSERT INTO homework
-- VALUES (homework_id, url, final_grade, fk_student_id, fk_assignment_id) ;

-- INSERT INTO taken_by
-- VALUES (fk_student_id, fk_subject_id, final_grade) ;
