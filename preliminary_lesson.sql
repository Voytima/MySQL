USE gb;

CREATE TABLE courses (
	id INT,
	name VARCHAR(100)
); 

CREATE TABLE students (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	firstname VARCHAR(100) NOT NULL,
	lastname VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	course_id INT
);

ALTER TABLE students 
ADD COLUMN birthday DATE;

ALTER TABLE students 
RENAME COLUMN birthday TO date_of_birth;

ALTER TABLE students 
DROP COLUMN date_of_birth;


INSERT INTO courses (name)
VALUES 
('Databases') ,
('Linux'), 
('BigDATA');


INSERT INTO students (firstname, lastname, email, course_id)
VALUES 
('Pavel', 'Ivanov', 'gb_ivanov@mail.ru', 1) , 
('Sveta', 'Petrova', 'gb_petrova@mail.ru', 2) , 
('Ivan', 'Svetlov', 'gb_svetlov@mail.ru', 3) ;

SELECT * FROM courses;
SELECT  id, firstname, lastname, email, course_id FROM students;

UPDATE students 
SET email='gb_svetlov@yandex.ru'
WHERE lastname = 'Svetlov';

DELETE FROM students 
WHERE id = 3;





