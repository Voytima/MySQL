DROP DATABASE IF EXISTS jobtoday;
CREATE DATABASE jobtoday;
USE jobtoday;


DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
	id SERIAL PRIMARY KEY,
	country VARCHAR(200) UNIQUE NOT NULL
) COMMENT 'Таблица для хранения стран, использующихся в данном проекте';

DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
	filename VARCHAR(200) NOT NULL,
	path VARCHAR(200) NOT NULL
) COMMENT 'Таблица хранения фото'; 

DROP TABLE IF EXISTS speciality;
CREATE TABLE speciality (
	id SERIAL PRIMARY KEY,
	specialization VARCHAR(200) NOT NULL
) COMMENT 'Таблица хранения специальностей юзеров и для вакансий';

DROP TABLE IF EXISTS companies;
CREATE TABLE companies (
	id SERIAL PRIMARY KEY,
	company_name VARCHAR(200) UNIQUE NOT NULL,
	founded_at DATE NOT NULL,
	country_id BIGINT UNSIGNED,
	city VARCHAR(100),
	email VARCHAR(100) UNIQUE NOT NULL,
	phone BIGINT UNSIGNED UNIQUE,
	description VARCHAR(550) NOT NULL,
	INDEX companies_name_idx(company_name),
	
	FOREIGN KEY (country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Таблица для хранения данных о компаниях-работодателях';


DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	signed_up_at TIMESTAMP DEFAULT NOW(),
	firstname VARCHAR(100) NOT NULL,
	lastname VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(100),
	mobile_phone BIGINT UNSIGNED UNIQUE,
	is_deleted BIT DEFAULT 0,
	INDEX user_name_idx (firstname, lastname)
) COMMENT 'Список юзеров, ищущих/нашедших работу';
-- Тут еще будет триггер на проверку возраста (18+)

DROP TABLE IF EXISTS resume;
CREATE TABLE resume (
	user_id SERIAL PRIMARY KEY,
	gender ENUM ('m', 'f', 'ud') DEFAULT 'ud',
	date_of_birth DATE,
	photo_id BIGINT UNSIGNED,
	country_id BIGINT UNSIGNED,
	hometown VARCHAR(100),
	citizenship VARCHAR(100),
	marital_status ENUM ('married', 'not_married', 'divorced'),
	childrens_before_12 ENUM ('yes', 'no'),
	working_exp ENUM ('yes', 'no'),
	school TEXT,
	college TEXT,
	university TEXT,
	latest_education ENUM('empty', 'school', 'college', 'university'),
	speciality_id BIGINT UNSIGNED,
	current_work_status ENUM('unemployed', 'self-employed', 'full-time position'),
	last_company TEXT,
	previous_or_current_position TEXT,
	personal_info VARCHAR(350) DEFAULT ' ',
	job_status ENUM ('Looking for a job', 'Not looking for a job', 'ud') DEFAULT 'ud',
	type_of_employment ENUM('full-time', 'part-time', 'contract', 'traineeship', 'probation'),
	working_hours ENUM('shifts', 'flexible', '9-to-5'),
	
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (photo_id) REFERENCES photos(id) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (speciality_id) REFERENCES speciality(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Тут хранятся резюме наших соискателей';


DROP TABLE IF EXISTS vacancies;
CREATE TABLE vacancies (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP DEFAULT NOW(),
	company_id BIGINT UNSIGNED,
	vacancy_name VARCHAR(255),
	vacancy_description VARCHAR(255),
	education ENUM('empty', 'school', 'college', 'university'),
	req_speciality_id BIGINT UNSIGNED,
	employee_min_age TINYINT UNSIGNED,
	type_of_employment ENUM('full-time', 'part-time', 'contract', 'traineeship', 'probation'),
	working_hours ENUM('shifts', 'flexible', '9-to-5'),
	salary INT UNSIGNED,
	
	INDEX vacancies_name_idx(vacancy_name),
	
	FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (req_speciality_id) REFERENCES speciality(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Здесь список вакансий на текущий момент';

DROP TABLE IF EXISTS headhunter;
CREATE TABLE  headhunter (
	hh_id BIGINT UNSIGNED,
	user_id BIGINT UNSIGNED,
	hh_firstname VARCHAR(100) NOT NULL,
	hh_lastname VARCHAR(100) NOT NULL,
	hh_email VARCHAR(100) UNIQUE,
	hh_password_hash VARCHAR(100),
	hh_mobile_phone BIGINT UNSIGNED UNIQUE,
	PRIMARY KEY (user_id, hh_id),
	
	FOREIGN KEY (hh_id) REFERENCES vacancies (id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (user_id) REFERENCES resume (user_id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Это и рекрутеры и одновременно представители компаний, которые отслеживают интересные для них резюме';

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED,
	to_hh_id BIGINT UNSIGNED,
	from_hh_id BIGINT UNSIGNED,
	to_user_id BIGINT UNSIGNED,
	body_text TEXT NOT NULL,
	created_at TIMESTAMP DEFAULT now(),

	FOREIGN KEY (from_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (from_hh_id) REFERENCES headhunter(hh_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (to_hh_id) REFERENCES headhunter(hh_id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'А здесь общаются хх с соискателями, равно как и соискатели могут задать вопрос представителю компании';

DROP TABLE IF EXISTS best_vac_week;
CREATE TABLE best_vac_week (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP DEFAULT NOW(),
	vacancies_id BIGINT UNSIGNED,
	vacancy_name VARCHAR(255),
	vacancy_description VARCHAR(255),
	education ENUM('empty', 'school', 'college', 'university'),
	req_speciality_id BIGINT UNSIGNED,
	employee_min_age TINYINT UNSIGNED,
	type_of_employment ENUM('full-time', 'part-time', 'contract', 'traineeship', 'probation'),
	working_hours ENUM('shifts', 'flexible', '9-to-5'),
	salary INT UNSIGNED,
	
	FOREIGN KEY (vacancies_id) REFERENCES vacancies(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (req_speciality_id) REFERENCES speciality(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Тут ТОП 5 вакансий недели (по уровню зароботной платы)';

DROP TABLE IF EXISTS admins;
CREATE TABLE admins (
  id SERIAL PRIMARY KEY,
  vacancies_id BIGINT UNSIGNED DEFAULT NULL,
  firstname VARCHAR(100) NOT NULL,
  lastname VARCHAR(100) NOT NULL,
  phone BIGINT UNSIGNED UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(100) NOT NULL,
  
  FOREIGN KEY (vacancies_id) REFERENCES vacancies(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Админы( они же модераторы), которые проверяют вакансии перед тем, как их опубликуют';

DROP TABLE IF EXISTS favorites;
CREATE TABLE favorites (
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    company_id BIGINT UNSIGNED,
    vacancies_id BIGINT UNSIGNED NOT NULL,
    speciality_id BIGINT UNSIGNED,
    salary INT UNSIGNED,
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (vacancies_id) REFERENCES vacancies (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (speciality_id) REFERENCES speciality(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Это вакансии, которые соискатель (теоритически) может пометить как интересные для него';


DROP TABLE IF EXISTS saved_jobs;
CREATE TABLE saved_jobs(
	added_at DATETIME NOT NULL,
	company_id BIGINT UNSIGNED,
	vacancy_id INT UNSIGNED NOT NULL,
	speciality_id BIGINT UNSIGNED,
	salary INT UNSIGNED
) 	ENGINE = ARCHIVE
COMMENT 'А это сохраненные понравившиеся вакансии с компаниями (чтобы не потерялись)';

-- Триггер на автодобавление вакансий в сохраненные после пометки как "интересная вакансия"
DROP TRIGGER IF EXISTS log_vac;
delimiter //

CREATE TRIGGER log_vac AFTER INSERT ON favorites 
FOR EACH ROW 
BEGIN 
	INSERT INTO saved_jobs (added_at, company_id, vacancy_id, speciality_id, salary)
		VALUES (NOW(), NEW.company_id, NEW.vacancies_id, NEW.speciality_id, NEW.salary);
END//
delimiter ;

-- SELECT * FROM saved_jobs;


-- Триггер на проверку корректного ввода даты рождения и возраста (18+)
DROP TRIGGER IF EXISTS age_checker;
delimiter //

CREATE TRIGGER age_checker
BEFORE INSERT 
ON resume FOR EACH ROW 
BEGIN 
	IF NEW.date_of_birth > current_date() THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong date of birth (check your data)';
	ELSEIF (YEAR(CURRENT_DATE) - YEAR(NEW.date_of_birth)) < 18 THEN 
		SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Your age cannot be below 18.';
	END IF;
END//
delimiter ;

/* -- Проверка триггера:
INSERT INTO resume (user_id, gender, date_of_birth)
			VALUES ('21', 'ud', '2020.01.01');
INSERT INTO resume (user_id, gender, date_of_birth)
			VALUES ('21', 'ud', '2030.01.01');
SELECT * FROM resume
*/
