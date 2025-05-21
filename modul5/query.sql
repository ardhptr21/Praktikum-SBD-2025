-- 1
SELECT member_name, member_type, joining_date FROM member ORDER BY joining_date DESC;

-- 2
SELECT class_name, class_date FROM class ORDER BY class_name ASC;

-- 3
SELECT member_id, COUNT(*) AS total_class FROM participant GROUP BY member_id ORDER BY total_class DESC;

-- 4
SELECT MIN(joining_date) AS earliest, MAX(joining_date) AS latest FROM member;

-- 5
SELECT member_name, joining_date FROM member WHERE joining_date BETWEEN '2022-01-01' AND '2022-12-31';

-- 6
SELECT member_name, member_type FROM member WHERE member_type='Silver';

-- 7
SELECT * FROM class WHERE class_name LIKE '%yoga%';

-- 8
SELECT
	member_name,
	CASE member_type
		WHEN 'Gold' THEN 'Member Prioritas'
		WHEN 'Silver' THEN 'Member Menengah'
		WHEN 'Bronze' THEN 'Member Dasar'
	END AS member_type
FROM member;

-- 9
SELECT member_name AS Nama, member_type AS Membership FROM member;

-- 10
SELECT member_name, member_phone, joining_date FROM member WHERE YEAR(joining_date)=2022;

-- 11
SELECT member_name, TIMESTAMPDIFF(YEAR, Member_DOB, CURDATE()) AS age FROM member;

-- 12

-- alt 1
SELECT 
    c.class_name,
    c.class_time,
    TIMEDIFF(c.class_time, mc.class_time) AS diff
FROM 
    class c
JOIN 
    class mc ON mc.class_name = 'Morning Cardio'
WHERE 
    c.class_date = mc.class_date
    AND c.class_id != mc.class_id;

-- alt 2
SELECT
	class_name,
	class_time,
	TIMEDIFF(class_time, '07:00:00') AS diff
FROM class
WHERE class_date = '2025-04-20' AND class_name != 'Morning Cardio';
