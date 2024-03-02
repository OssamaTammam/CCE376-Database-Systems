-- Question 1: Find the names of students with level “SR” who are enrolled in a class taught by professor whose id=“1”.
SELECT DISTINCT s.student_name
FROM student as s
    JOIN enrolled as e ON s.student_id = e.student_id
    JOIN semester_course as sc ON e.course_code = sc.course_code
WHERE s.level = "SR"
    AND sc.prof_id = 1;
-- Question 2: Find the names of all students and their courses' name even if they weren’t enrolled in any course.
SELECT s.student_name,
    c.name AS course_name
FROM student AS s
    LEFT JOIN enrolled as e ON s.student_id = e.student_id
    LEFT JOIN course as c ON e.course_code = c.course_code
GROUP BY s.student_id,
    s.student_name,
    c.name;
-- Question 3: Find the names of professors whose combined enrollment of all courses that they taught is less than five.
SELECT p.prof_name
FROM professor as p
    JOIN semester_course as sc ON p.prof_id = sc.prof_id
GROUP BY p.prof_id,
    p.prof_name
HAVING COUNT(*) < 5;
-- Question 4: Find students' names enrolled in all courses that professor with id="2" has taught.
SELECT s.student_name
FROM student AS s
    JOIN enrolled AS e ON s.student_id = e.student_id
    JOIN semester_course AS sc ON e.course_code = sc.course_code
WHERE sc.prof_id = 2
GROUP BY s.student_id,
    s.student_name
HAVING COUNT(DISTINCT sc.course_code) = (
        SELECT COUNT(*)
        FROM semester_course
        WHERE prof_id = 2
    );
-- Question 5: Find the names and ids of the professors that have enrolled in less than 2 courses and whose department is either 1,2,3,4
SELECT p.prof_name,
    p.prof_id
FROM professor as p
    JOIN semester_course AS sc ON p.prof_id = sc.prof_id
WHERE p.dept_id IN (1, 2, 3, 4)
GROUP BY p.prof_id,
    p.prof_name
HAVING COUNT(*) < 2;
-- Question 6: Find course name, course code and professor name and id for courses that the same professor taught twice or more.
SELECT c.name AS course_name,
    c.course_code,
    p.prof_name,
    p.prof_id
FROM course AS c
    JOIN semester_course AS sc ON c.course_code = sc.course_code
    JOIN professor AS p ON p.prof_id = sc.prof_id
GROUP BY c.course_code,
    c.name,
    p.prof_name,
    p.prof_id
HAVING count(*) >= 2;