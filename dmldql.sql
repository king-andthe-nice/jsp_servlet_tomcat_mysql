-- User Operations
-- Check if user exists
SELECT * FROM user WHERE username = ?;

-- User login
SELECT * FROM user WHERE username = ? AND password = ?;

-- Get user level
SELECT level FROM user WHERE username = ?;

-- Query all users
SELECT * FROM user ORDER BY username;

-- Insert new user
INSERT INTO user VALUES(?,?,?);

-- Delete user by username
DELETE FROM user WHERE username = ?;

-- Update user information
UPDATE user SET username = ?, password = ?, level = ? WHERE username = ?;

-- Department Operations
-- Query all departments
SELECT * FROM department ORDER BY dno;

-- Insert new department
INSERT INTO department VALUES(?,?);

-- Delete department by dno
DELETE FROM department WHERE dno = ?;

-- Update department information
UPDATE department SET dno = ?, dname = ? WHERE dno = ?;

-- Class Operations
-- Query all classes
SELECT * FROM class ORDER BY clno;

-- Insert new class
INSERT INTO class VALUES(?,?,?);

-- Delete class by clno
DELETE FROM class WHERE clno = ?;

-- Update class information
UPDATE class SET clno = ?, clname = ?, dno = ? WHERE clno = ?;

-- Student Operations
-- Query all students
SELECT * FROM student ORDER BY sno;

-- Insert new student
INSERT INTO student VALUES(?,?,?,?,?);

-- Delete student by sno
DELETE FROM student WHERE sno = ?;

-- Update student information
UPDATE student SET sno = ?, sname = ?, ssex = ?, sage = ?, clno = ? WHERE sno = ?;

-- Course Operations
-- Query all courses
SELECT * FROM course ORDER BY cno;

-- Insert new course
INSERT INTO course VALUES(?,?,?,?);

-- Delete course by cno
DELETE FROM course WHERE cno = ?;

-- Update course information
UPDATE course SET cno = ?, cname = ?, cteacher = ?, ccredit = ? WHERE cno = ?;

-- SC (Student-Course) Operations
-- Query all SC records
SELECT student.sno sno, sname, ssex, sage, course.cno, cname, grade 
FROM sc, student, course 
WHERE sc.sno = student.sno AND course.cno = sc.cno 
ORDER BY sno;

-- Insert new score record
INSERT INTO sc VALUES(?,?,?);

-- Delete score record by sno and cno
DELETE FROM sc WHERE sno = ? AND cno = ?;

-- Update score record
UPDATE sc SET grade = ? WHERE sno = ? AND cno = ?;

-- Query course average grades
SELECT sc.cno cno, cname, avg(grade) avg 
FROM course, sc 
WHERE course.cno = sc.cno 
GROUP BY cno 
ORDER BY cno;

-- Query course fail rates
SELECT cno, (SELECT cname FROM course WHERE cno = x.cno) cname, 
cast(100.0*(SELECT count(sno) FROM sc WHERE grade < 60 AND cno = x.cno)/
(SELECT count(sno) FROM sc WHERE cno = x.cno) AS decimal(18,2)) rate 
FROM sc x 
GROUP BY cno 
ORDER BY cno;

-- Query course ranking
SELECT student.Sno Sno, Dname, Clname, Sname, Ssex, Sage, Grade 
FROM department, class, student, sc 
WHERE student.sno = sc.sno AND class.Clno = student.Clno 
AND department.Dno = class.Dno AND cno = ? 
ORDER BY grade DESC;