USE jobtoday;

-- Выведем данные о соискателях:
SELECT
	id,
	firstname,
	lastname,
	(SELECT hometown FROM resume WHERE user_id = users.id) AS 'city',
	(SELECT filename FROM photos WHERE id=(
		SELECT photo_id FROM resume WHERE user_id = users.id)) AS 'photo'
FROM users
ORDER BY id;

-- Посмотрим кто больше всего получил сообщений и кто больше всего отправил:
SELECT
  id,
  (SELECT count(*) FROM messages
    WHERE messages.to_user_id = users.id
  ) as messages_to,
  (SELECT count(*) FROM messages
    WHERE messages.from_user_id = users.id
  ) as messages_from
FROM users
GROUP BY id;

-- Как видно, пользователи с id = 7 и 17 получили больше всего сообщений. Проверим:
SELECT *
FROM messages
WHERE from_user_id  = 7 OR to_user_id  = 7
ORDER BY created_at DESC;
-- Да, действительно, пользователю с id = 7 и правда поступило 3 сообщения от хх.
-- А ответил он только хх с id = 11. Видимо, заинтересовался предложением.
-- Для пользователя с id = 17 проверять не будем


-- Просмотр кто добавил каки-либо вакансии в понравившиеся
SELECT 
	user_id,
	(SELECT email FROM users WHERE id=favorites.user_id) AS user,
	count(id)
FROM favorites
GROUP BY user_id;
-- Пользователю с id = 3 понравилось 2 вакансии и он добавил их в понравившиеся


-- Можно посмотреть компанию и вакансию с наибольшей зарплатой:
SELECT id, company_id, vacancy_name, salary
FROM vacancies
WHERE salary = (SELECT max(salary) FROM vacancies);

-- Посмотрим сколько соискателей имеет схожие или совсем неподходящие для поиска специальности на данный момент:
SELECT users.id, users.firstname, users.lastname, speciality.id AS 'speciality', speciality.specialization AS 'specialization' 
FROM users
JOIN 
resume ON (resume.user_id = users.id)
LEFT JOIN 
speciality ON (resume.speciality_id = speciality.id)
GROUP BY users.id 
ORDER BY speciality.id;

-- Просмотрим список компаний, список вакансий и предлагаемые зарплаты:
SELECT c.company_name AS company, v.salary AS $$$, v.vacancy_name AS vacancy 
FROM vacancies AS v							  
LEFT JOIN 
companies AS c
ON 
c.id = v.company_id
GROUP BY vacancy
ORDER BY salary DESC, company;

-- Так можно посмотреть какие вакансии прошли модерацию, а какие все еще модерируются специалистами:
SELECT a.firstname AS 'firstname', a.lastname AS 'lastname', v.vacancy_name AS vacancy
FROM vacancies v 
LEFT JOIN 
admins a 
ON 
v.id = a.vacancies_id 
ORDER BY firstname DESC;

-- View's

-- Можно создать вьюшку с компаниями и вакансиями, которая, кстати, покажет, что нету ни одной компании и вакасии из Украины:
DROP VIEW IF EXISTS v_companies;
CREATE VIEW v_companies
AS
SELECT c.id, c.company_name, c.founded_at, c2.country AS 'country', c.city, c.email, c.phone, c.description, 
v.vacancy_name AS vacancy, v.vacancy_description AS responsibilities, v.salary AS $$$
FROM companies c 
RIGHT JOIN 
countries c2 ON c2.id = c.country_id
LEFT JOIN  
vacancies v ON v.company_id = c.id
ORDER BY $$$ DESC;

SELECT * from v_companies;

-- Эта вьюшка на совпадение требований и ожиданий кандидатов и лучших вакансий недели:
DROP VIEW IF EXISTS v_specs;
CREATE VIEW v_specs 
AS 
SELECT r.*, s.specialization, bvw.id, bvw.created_at AS 'posted_at', bvw.vacancies_id, bvw.vacancy_name, bvw.vacancy_description,
bvw.education, bvw.req_speciality_id, bvw.employee_min_age, bvw.type_of_employment AS 't_o_e', bvw.working_hours AS 'w_o', bvw.salary 
FROM resume r
JOIN speciality s ON s.id = r.speciality_id 
JOIN best_vac_week bvw ON s.id=bvw.req_speciality_id;

SELECT * FROM v_specs;

