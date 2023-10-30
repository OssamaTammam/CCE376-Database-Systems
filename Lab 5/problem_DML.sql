USE library;
-- question 1
SELECT *
FROM member
where join_date > '2000-09-01';
-- question 2
SELECT *
FROM member
where join_date BETWEEN '1995-10-01' AND '2019-10-01';
-- question 3
SELECT *
FROM book b
    JOIN publisher p ON b.pub_id = p.pub_id
WHERE b.price BETWEEN 15 AND 20
    OR p.name = 'Oxford';