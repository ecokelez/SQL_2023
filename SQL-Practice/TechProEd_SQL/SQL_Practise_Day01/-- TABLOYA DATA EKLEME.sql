-- TABLOYA DATA EKLEME
CREATE TABLE students
(
    student_id CHAR(3) PRIMARY KEY,
    student_name VARCHAR(50) UNIQUE,
    student_age int NOT NULL,
    student_dob DATE,
    CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20)
    
);
-- Tam veri girişi
INSERT INTO students VALUES(101, 'ALI CAN', 13, '021-08-11');
INSERT INTO students VALUES(102, 'VELI HAN', 14, '2007-08-10');
INSERT INTO students VALUES(103, 'AYSE TAN', 14, '2007-08-08');
INSERT INTO students VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO students VALUES(105, 'TOM HANKS', 20, '2005-10-12');
INSERT INTO students VALUES(106, 'ANGELINA JULIE', 18, '1986-10-12');
INSERT INTO students VALUES(107, 'BRAD PITT', 0, '2021-08-10');
-- Parçalı veri girişi
INSERT INTO students(student_id, student_age) VALUES('108', 17);
INSERT INTO students(student_name, student_id, student_age) VALUES('JOHN DAVID', '109', 20);

select * from students;

-- id=101 olan öğrencinin ismini 'LEO OCEAN' olarak güncelleyinin
UPDATE students
SET student_name='LEO OCEAN'
WHERE student_id ='101';

-- 101 id öğrencinin yasini 22 olarak güncelleyinin
UPDATE students
SET student_age='22'
WHERE student_id='101'


-- 101 id öğrencinin ismini 'ALI CAN' olarak güncelleyinin
UPDATE students
SET student_name='ALI CAN'
WHERE student_id ='101';

-- 109 id li öğrencinin doğum tarihini 2010-12-11 olarak update yapın.
UPDATE students
SET  student_dob='2010-12-11'
WHERE student_id ='109';

--ilk iki veriden sonra 5 veriyi listeleyiniz
select * from students limit 5 OFFSET 2;

-- yasi en buyyuk 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from students ORDER BY student_age desc limit 3 OFFSET 3 ;

