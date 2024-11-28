-- 1
SELECT DISTINCT rs.first_name, rs.surname
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
WHERE rb.cust_name = 'Tanya Singh';

-- 2
SELECT rr.room_date
FROM restRoom_management rr
JOIN restStaff rs ON rr.headwaiter = rs.staff_no
WHERE rs.first_name = 'Charles' AND rr.room_name = 'Green' AND rr.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');

-- 4
SELECT rb.cust_name, rb.bill_total, rs.first_name, rs.surname
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
ORDER BY rb.bill_total DESC;

-- 5
SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.headwaiter IN (
    SELECT DISTINCT headwaiter
    FROM restStaff
    WHERE staff_no IN (
        SELECT waiter_no
        FROM restBill
        WHERE bill_no IN (00014, 00017)
    )
);

-- 6
SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.staff_no IN (
    SELECT DISTINCT waiter_no
    FROM restBill
    WHERE table_no IN (
        SELECT table_no
        FROM restRest_table
        WHERE room_name = 'Blue'
    ) 
    AND bill_date = 160312
)
OR rs.staff_no = (
	SELECT headwaiter 
	FROM restRoom_management 
	WHERE room_name = 'Blue' AND room_date = 160312
);

