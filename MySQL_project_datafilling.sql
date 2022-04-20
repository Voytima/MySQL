USE jobtoday;

INSERT INTO countries 
VALUES 
(NULL, 'Russia'),
(NULL, 'Belarus'),
(NULL, 'Poland'),
(NULL, 'Ukraine'),
(NULL, 'Khazahstan'),
(NULL, 'Uzbekistan'),
(NULL, 'Latvia'),
(NULL, 'Lithuania'),
(NULL, 'Austia'),
(NULL, 'France');
-- SELECT * FROM countries ORDER BY id;

INSERT INTO companies 
VALUES 
(NULL, 'OZ.by', '1999-04-25', 2, 'Minsk', 'oz@oz.by', 80292579634, 
'OZ.by — это гипермаркет с ассортиментом более 190 тыс. наименований. 
Основные категории: книги, канцтовары, настольные игры, сувенирная продукция, принадлежности для творчества,
косметика, товары для детей, для дома, спорта и туризма'),
(NULL, 'COFFIX club', '2017-01-03', 1, 'Moscow', 'coffix@cmail.ru', 74232497773, 
'В Cofix москвичи и гости столицы могут купить горячие и холодные напитки, завтраки, ланчи, выпечку и десерты'),
(NULL, 'EasySoup', '2021-05-16', 3, 'Warsaw', 'easysoup@mail.pl', 48224298571, 
'Мы готовим сложные супы из 20 и более компонентов, чтобы  переход на сбалансированное питание был легким'),
(NULL, 'GEELY', '1986-06-22', 8, 'Kaunas', 'geely@litcar.lt', 81037053336523, 
'Динамично развивающийся автомобильный бренд компании Geely Auto'),
(NULL, 'Evroopt', '1993-11-26', 2, 'Brest', 'vac@eurotorg.by', 80175652955, 
'Помогаем улучшить качество жизни жителей Беларуси, предлагая наилучшие цены и тщательно продуманный ассортимент товаров'),
(NULL, 'Anti-Doping Center', '1999-03-07', 5, 'Nur_Sultan', 'nada@mail.kz', 771721102250, 
'Миссия Всемирного антидопингового агентства - возглавлять совместное мировое движение за спорт, свободный от допинга'),
(NULL, '7745.fr', '2015-12-25', 10, 'Marseille', '7745@goods.fr', 8103316553979, 
'Any goods and any stuff for your home from France with love!'),
(NULL, 'Electrosila', '1994-03-04', 9, 'Innsbruck', 'electrosila@mail.au', 4617852345601, 
'The main field of activity is wholesale and retail trade in household appliances and electronics'),
(NULL, 'MinskTrans', '2003-11-26', 2, 'Minsk', 'info@minsktrans.by', 80172198601, 
'«Минсктранс» — предприятие, выполняющее городские и пригородные перевозки автобусами, троллейбусами, трамваями'),
(NULL, 'TruckRoad', '2010-06-30', 6, 'Bukhara', 'truck@truckroad.uz', 810998655556636, 
'We are pleased to provide the TruckRoad transportation service for different companies in many countries'),
(NULL, 'Agrokombinat "Ghdanovichi"', '1998-02-19', 7, 'Jūrmala', 'ok@akz.lv', 371276562043, 
'Fresh harvest from home fields');
-- SELECT * FROM companies;

INSERT INTO speciality
VALUES 
(NULL, 'Driver A-F'),
(NULL, 'Barista'),
(NULL, 'Biology'),
(NULL, 'Teacher of chemistry/biology'),
(NULL, 'Seller'),
(NULL, 'Electrician'),
(NULL, 'Vulkanologist'),
(NULL, 'Agronomist'),
(NULL, 'Designer'),
(NULL, 'Singer'),
(NULL, 'Surgeon'),
(NULL, 'Logistics'),
(NULL, 'Babysitter'),
(NULL, 'Student');
-- SELECT * FROM speciality;

INSERT INTO photos 
VALUES 
('1', 'eveniet', 'http://lorempixel.com/640/480/abstract/'),
('2', 'iure', 'http://lorempixel.com/640/480/abstract/'),
('3', 'quaerat', 'http://lorempixel.com/640/480/abstract/'),
('4', 'velit', 'http://lorempixel.com/640/480/abstract/'),
('5', 'similique', 'http://lorempixel.com/640/480/abstract/'),
('6', 'itaque', 'http://lorempixel.com/640/480/abstract/'),
('7', 'soluta', 'http://lorempixel.com/640/480/abstract/'),
('8', 'nihil', 'http://lorempixel.com/640/480/abstract/'),
('9', 'quae', 'http://lorempixel.com/640/480/abstract/'),
('10', 'dolore', 'http://lorempixel.com/640/480/abstract/'),
('11', 'quos', 'http://lorempixel.com/640/480/abstract/'),
('12', 'quaerat', 'http://lorempixel.com/640/480/abstract/'),
('13', 'corporis', 'http://lorempixel.com/640/480/abstract/'),
('14', 'odit', 'http://lorempixel.com/640/480/abstract/'),
('15', 'debitis', 'http://lorempixel.com/640/480/abstract/'),
('16', 'vel', 'http://lorempixel.com/640/480/abstract/'),
('17', 'iusto', 'http://lorempixel.com/640/480/abstract/'),
('18', 'est', 'http://lorempixel.com/640/480/abstract/'),
('19', 'vel', 'http://lorempixel.com/640/480/abstract/'),
('20', 'quia', 'http://lorempixel.com/640/480/abstract/');
-- SELECT * FROM photos;

INSERT INTO users
VALUES 
('1', '2022-04-04 01:28:12', 'Harrison', 'Cremin', 'leuschke.jedediah@example.org', '46e79e66e57b8728310702da8b309515bde1c1ae', 
'9320104846', 0),
('2', '2022-04-09 21:54:37', 'Verdie', 'Bernier', 'goyette.abraham@example.org', '5a8df268d3ac6b10a37d141a9fb754066ecfe127', 
'9649970331', 0),
('3', '2022-04-08 10:39:23', 'Leila', 'Maggio', 'blaise.gulgowski@example.net', '07840d51d7ce262b9ee2f3296de2b6e5cda4f86d', 
'9787200310', 0),
('4', '2022-03-30 11:11:44', 'Cyril', 'Rippin', 'rosinski@example.com', '16160444b73e9cffd97ed303b3466d6ae5cabaead', 
'9761341657', 0),
('5', '2022-03-26 17:32:52', 'Amaya', 'Smith', 'antonio07@example.org', 'e74226927e8189ca0f9a2efae8c2a2b883b0f9a4', 
'9450151242', 1),
('6', '2022-04-04 15:31:32', 'Mckenna', 'Russel', 'skylar.cormier@example.com', '74706025b464476a322f1534a72e6ecfe5de6183', 
'9495430830', 0),
('7', '2022-03-18 18:39:48', 'Jayda', 'Mann', 'winifred.becker@example.org', '7706a3aad0f5ed870220bb017c8c5412c2008fb2', 
'9223380993', 0),
('8', '2022-03-27 20:01:18', 'Elnora', 'Sauer', 'vlynch@example.org', '9b7a8f5b79e43682c92e062bac0c8ded331b7b27', 
'9753146595', 0),
('9', '2022-04-14 19:11:37', 'Arlie', 'Rippin', 'mariam.barton@example.com', '62645bab3e1479ba610b26a4cb6172320a324b12', 
'9525259601', 0),
('10', '2022-04-10 07:12:34', 'Deon', 'Gleichner', 'swaniawski.noel@example.com', '61f6670fcf80196e71c84d18ab5b516c9b7b156b', 
'9887578797', 0),
('11', '2022-03-21 11:35:14', 'Viola', 'Heller', 'grady.clyde@example.com', '4ef4f7ec283a055ab693ec69f613bad86c8db94b', 
'9464010377', 0),
('12', '2022-03-29 01:44:46', 'Rollin', 'Flatley', 'dayton.kerluke@example.com', 'b7909272bfa07bc8f3773dfe40061054b852f3fa', 
'9948521079', 1),
('13', '2022-04-13 04:46:06', 'Chelsey', 'Larkin', 'justen77@example.net', '655d615f2e11d169c588cb3c2e181e42e11af73a', 
'9036035340', 0),
('14', '2022-03-20 21:55:27', 'Erna', 'Runte', 'owilkinson@example.net', 'a4ac90b3a340f4f1f9ebc573e04e8c8677cb93f1', 
'9562781705', 0),
('15', '2022-04-06 04:56:27', 'Bertram', 'Kuvalis', 'tyrique.moore@example.net', '94a95537206604e149ddfb0ca0ebf30b6e20297d', 
'9336907911', 0),
('16', '2022-03-29 02:39:56', 'Nelda', 'Thompson', 'macejkovic.arlene@example.org', '374e82cbcd04aafb0fe5c8e9a4cfdcc93a13918e', 
'9566024657', 0),
('17', '2022-03-27 17:29:13', 'Robin', 'Donnelly', 'clementina.kohler@example.net', 'f2ae1f6d3306dedbca50fa82fc2f1b74338f1b16', 
'9655316245', 0),
('18', '2022-03-19 17:01:19', 'Terence', 'Sauer', 'lehner.giovanni@example.net', '2de5a8866c98e342a8633ce279ba9b27e3b6e68c', 
'9286469015', 0),
('19', '2022-04-12 23:47:55', 'Eden', 'Douglas', 'alexandro78@example.org', 'a2efb32345496d706f047d2d77620c5355bb1d7f', 
'9542905032', 0),
('20', '2022-03-23 12:29:06', 'Loraine', 'Volkman', 'coy50@example.org', '3c07081a4180bda17ef686877dd2f76ee597b095', 
'9897714709', 0);
-- SELECT * FROM users;

INSERT INTO resume 
VALUES 
('1', 'ud', '1983-08-16', '1', '1', 'Moscow', 'Russian', 'married', 'no', 'yes', 'Gymnasium №34', NULL, 'Moscow State Regional University', 
'university', '4', 'self-employed', 'Zulauf-Effertz', 'CEO', 
'Responsible and discipline person', 'ud', 'full-time', 'flexible', '2022-04-04 06:45:24', '2022-04-05 07:03:08'),
('2', 'f', '1980-10-13', '2', '2', 'Minsk', 'Belarus', 'divorced', 'no', 'yes', 'Gymnasium №50', NULL, 'BSU', 
'university', '3', 'self-employed', 'Ratke Group', 'worker', 
'Motivated and energy worker', 'Looking for a job', 'contract', 'flexible', '2022-04-09 19:21:32', '2022-04-10 08:05:23'),
('3', 'ud', '2000-12-31', '3', '3', 'Warsaw', 'Polish', 'not_married', 'yes', 'yes', 'Middle school №11', NULL, NULL, 
'school', '1', 'full-time position', 'Schiller PLC', 'driver', 
'Have a driver license A-F + EU permission', 'Looking for a job', 'full-time', 'shifts', '2022-04-09 11:20:20', '2022-04-22 16:43:16'),
('4', 'f', '1975-01-09', '4', '4', 'Dnepr', 'Ukrainian', 'not_married', 'no', 'no', 'Middle school №2', 'KIBiT', NULL, 
'college', '14', 'unemployed', NULL, NULL, 
'Last course student is looking for any job', 'Looking for a job', 'part-time', 'shifts', '2022-04-07 07:27:26', '2022-04-21 20:17:43'),
('5', 'ud', '2001-05-14', '5', '5', 'Nur_Sultan', 'Khazahstanian', 'not_married', 'no', 'yes', 'Base school №38', NULL, NULL, 
'school', '5', 'unemployed', 'Sanford, Stracke and Wisoky', 'seller', 
'Have some experience in trade', 'ud', 'traineeship', 'flexible', '2022-03-26 14:29:40', '2022-03-27 20:40:22'), 
('6', 'm', '1990-10-21', '6', '6', 'Bukhara', 'Uzbekistanian', 'not_married', 'yes', 'yes', 'Middle school №11', 'Trading college', NULL, 
'college', '13', 'unemployed', 'Hudson-Witting', 'Odd hand', 
'No experience, just physical power', 'Looking for a job', 'probation', '9-to-5', '2022-04-04 19:16:27', '2022-04-05 05:40:55'),
('7', 'm', '2000-02-06', '7', '7', 'Jūrmala', 'Latvian', 'divorced', 'yes', 'yes', NULL, NULL, NULL, 
'empty', NULL, 'unemployed', 'Strosin-Keeling', 'Odd hand', 
'No experience, but full of motivation', 'Looking for a job', 'probation', 'shifts', '2022-04-30 00:31:54', '2022-04-30 05:39:15'),
('8', 'f', '1999-01-20', '8', '8', 'Kaunas', 'Lithuanian', 'divorced', 'yes', 'yes', 'Middle school №155', 'Auto-prod college', NULL, 
'college', '12', 'full-time position', 'Hammes, Raynor and Gusikowski', 'Logist', 
'Some logistics, some driver, some sales', 'Looking for a job', 'full-time', '9-to-5', '2022-02-01 02:52:56', '2022-02-23 12:18:57'),
('9', 'm', '1990-03-08', '9', '9', 'Moscow', 'Austrian', 'not_married', 'yes', 'no', 'Middle school №15', NULL, NULL, 
'school', '14', 'unemployed', 'Wyman-Haley', 'Odd hand', 
'Need some money for further education', 'ud', 'traineeship', 'flexible', '2022-04-015 18:40:17', '2022-04-15 20:35:51'),
('10', 'm', '1993-11-03', '10', '10', 'Moscow', 'Russian', 'divorced', 'no', 'no', 'Middle school №15', 'Agronomic college', NULL, 
'college', '8', 'self-employed', 'Spencer-Schumm', 'Online shop', 
'I would be pretty usefull to an agronomic sector. Probably...', 'ud', 'probation', '9-to-5', '2022-04-11 04:22:42', '2022-04-12 10:40:41'),
('11', 'f', '1999-04-28', '11', '1', 'St.Peterburg', 'Russian', 'divorced', 'yes', 'yes', NULL, NULL, NULL, 
'empty', NULL, 'full-time position', 'Mills-Morissette', 'Manager', 
'All the info in privat talks', 'Looking for a job', 'full-time', 'flexible', '2022-04-15 12:03:44', '2022-04-16 11:17:17'),
('12', 'm', '1995-09-04', '12', '2', 'Brest', 'Belarus', 'not_married', 'no', 'no', 'Middle school №35', NULL, 'BSTU', 
'university', '5', 'self-employed', 'Spencer-Ledner', 'microdirector', 
'Microdirector of microcompany is motivated for development', 'ud', 'traineeship', 'flexible', '2022-03-30 18:17:24', '2022-04-01 17:16:26'),
('13', 'f', '1982-01-09', '13', '3', 'Krakov', 'Polish', 'married', 'yes', 'yes', NULL, NULL, NULL, 
'empty', '13', 'self-employed', NULL, 'babysitter', 
'Huge experience in working with people and children', 'Looking for a job', 'contract', 'shifts', '2022-04-14 08:24:37', '2022-04-14 15:30:16'),
('14', 'f', '1997-01-18', '14', '4', 'Kharkov', 'Ukrainian', 'divorced', 'no', 'no', NULL, NULL, NULL, 
'empty', '2', 'self-employed', 'Cole Ltd', 'barista', 
'Motivated, young and full of energy person', 'Looking for a job', 'probation', '9-to-5', '2022-04-10 14:18:20', '2022-04-14 04:40:46'),
('15', 'f', '1990-06-23', '15', '1', 'Novgorod', 'Russian', 'divorced', 'no', 'no', 'Middle school №1', NULL, NULL, 
'school', NULL, 'full-time position', 'Russel, Koepp and Hauck', 'Dog trainee', 
'Love animals much more than people. Just fun here', 'Not looking for a job', 'full-time', 'flexible', '2022-04-11 11:36:20', '2022-04-11 06:51:36'),
('16', 'f', '2000-07-19', '16', '2', 'Minsk', 'Belarus', 'divorced', 'yes', 'no', NULL, NULL, NULL, 
'empty', NULL, 'full-time position', 'Wisoky and Sons', 'driver', 
'Have some driver experience. Open to any positions', 'Looking for a job', 'part-time', '9-to-5', '2022-03-30 23:53:37', '2022-04-06 21:28:53'),
('17', 'f', '1995-01-05', '17', '1', 'Norilsk', 'Russian', 'married', 'yes', 'yes', 'Middle school №192', 'Art college', NULL, 
'college', '10', 'self-employed', 'Fisher, Kassulke and Bogisich', 'singer', 
'Corporates, weddings, celebrates', 'Looking for a job', 'contract', 'flexible', '2022-03-28 09:31:32', '2022-03-30 11:10:10'),
('18', 'f', '1997-12-04', '18', '2', 'Minsk', 'Belarus', 'not_married', 'yes', 'yes', 'Middle school №192', 'High school of design', NULL, 
'college', '9', 'full-time position', 'Leannon and Sons', 'designer', 
'Excellent sense of taste in fashion!', 'Looking for a job', 'probation', 'flexible', '2022-04-04 13:48:38', '2022-04-15 10:05:42'),
('19', 'm', '1970-03-08', '19', '2', 'Minsk', 'Belarus', 'not_married', 'no', 'no', 'Middle school №192', 'College of electricity', NULL, 
'college', '6', 'self-employed', 'Mayer, Lindgren and Hoeger', 'electrician', 
'My startup is dead. Looking for a job for a talented electrician', 'Looking for a job', 'contract', 'flexible', '2022-04-15 11:59:25', '2022-04-15 20:04:14'),
('20', 'f', '1990-07-07', '20', '4', 'Dmitrovka', 'Ukrainian', 'divorced', 'yes', 'yes', 'Middle school №11', NULL, 'Geology Institute', 
'university', '7', 'unemployed', 'Hane, Lang and McDermott', 'Vulkanologist', 
'My love is vulkans, not only dirt. Ready to move', 'Looking for a job', 'part-time', 'flexible', '2022-04-14 07:08:53', '2022-04-16 19:00:24');
-- SELECT speciality_id  FROM resume;

INSERT INTO vacancies 
VALUES 
(NULL, '2021-09-21 03:05:18', '1', 'book seller', 'Need a seller in our book store', 'school', '5', '18', 'full-time', 'flexible', '576'),
(NULL, '2022-04-13 21:25:43', '2', 'barista', 'Cool barista is welcome', 'empty', '2', '18', 'probation', '9-to-5', '728'),
(NULL, '2022-01-17 13:44:48', '3', 'Delivery service', 'Looking for a driver, private auto', 'college', '1', '20', 'part-time', '9-to-5', '2052'),
(NULL, '2022-04-02 23:02:31', '4', 'Autodesigner', 'Looking for a creative person', 'college', '9', '22', 'probation', 'flexible', '2622'),
(NULL, '2022-04-05 13:45:04', '5', 'Job for students', 'Looking for a person for an Odd hand job', 'school', '14', '18', 'part-time', 'flexible', '1858'),
(NULL, '2021-11-30 17:04:27', '6', 'Lab person', 'Looking for a scientist in lab', 'university', '4', '23', 'contract', '9-to-5', '807'),
(NULL, '2022-02-16 03:38:05', '7', 'Goods seller', 'Seller for an online shop', 'college', '5', '21', 'probation', '9-to-5', '429'),
(NULL, '2022-03-23 11:50:33', '8', 'Tech master', 'An electrician in our team', 'college', '6', '23', 'contract', 'flexible', '2096'),
(NULL, '2022-04-02 01:46:23', '9', 'Bus driver', 'Citybus driver is required', 'school', '1', '18', 'full-time', 'shifts', '2600'),
(NULL, '2021-12-09 04:02:42', '10', 'Truck driver', 'Truck EU driver is required', 'empty', '1', '18', 'part-time', '9-to-5', '586'),
(NULL, '2022-02-16 14:07:27', '11', 'Agronomist', 'Biologist/agronomist is required', 'university', '8', '25', 'full-time', '9-to-5', '2863'),
(NULL, '2022-04-17 02:12:01', '6', 'Biologist', 'Biologist in a lab! Quickly!', 'university', '4', '22', 'probation', '9-to-5', '1804'),
(NULL, '2022-02-02 07:52:06', '11', 'Mouse surgeon', 'Mouse surgeon in our lab', 'university', '14', '19', 'part-time', '9-to-5', '953'),
(NULL, '2021-09-21 15:09:22', '7', 'Courier', 'Courier for sales delivery', 'college', '1', '20', 'full-time', 'shifts', '1766'),
(NULL, '2022-01-14 09:58:07', '9', 'Electrician', 'Repairing trolleybuses', 'college', '6', '22', 'contract', 'flexible', '2125'),
(NULL, '2021-12-24 23:04:55', '6', 'Customer service', 'Mostly doing with children in our "little angel" department', 'empty', '13', '18', 'contract', 'shifts', '1080'),
(NULL, '2022-02-09 00:02:21', '10', 'Geologist/vulkanologist', 'Vulkanologist is needed for our new route', 'university', '7', '18', 'part-time', 'flexible', '4580');
-- SELECT * FROM vacancies;

INSERT INTO headhunter 
VALUES 
('1', '6', 'Julius', 'Hayes', 'henderson77@example.org', '774d3955b1cac85977aaac070157572abcb06440', '9686402452'),
('2', '5', 'Lyric', 'Ruecker', 'lockman.randy@example.net', '68385eb0c9049f89f71cbb40f7f5099d9dfff0a3', '9413187703'),
('3', '11', 'Donald', 'Mayert', 'dkuhn@example.com', '9351746a76b546a0ac46615916c81885d08450e8', '9207116600'),
('4', '8', 'Jamil', 'Kassulke', 'elwin.bailey@example.org', '0df0199d4c5f5aab0efa59ef9c521f5398a2d629', '9321387335'),
('6', '17', 'Evan', 'Kling', 'hilbert28@example.org', '9dbc21262e2525496c34df96f3372b657a362ca6', '9710257734'),
('7', '9', 'Einar', 'Olson', 'ansel61@example.com', 'f1e2da38a5ef695435144d077fbc0f1ca07d925f', '9499622863'),
('8', '14', 'Bertram', 'Bruen', 'hipolito87@example.org', '741915488e962d9328dd8e79bc6a30170a588b43', '9313240296'),
('9', '3', 'Zackery', 'Bins', 'stehr.alanna@example.com', '882f17ef0b6bd65d42ff42c9c949fea3c11e5e56', '9830494282'),
('10', '15', 'William', 'Beier', 'block.eliza@example.com', '118a061290ebc8e11e7e0838c2ea22b4d246817d', '9456227260'),
('11', '20', 'Mohammed', 'Kunde', 'daniella.mclaughlin@example.net', '77fecffa437d62c775a7da5bc2c1de3230d453de', '9437608517');
-- SELECT * FROM headhunter ORDER BY hh_id;

INSERT INTO messages 
VALUES
('1', '2', '1', NULL, NULL, 'Eaque dolor et voluptates consequatur. Debitis a error culpa iusto eveniet voluptates. 
Dolorum fugiat quis modi voluptate et quos. Officiis ea et recusandae fugiat.', '2022-04-13 09:48:59'),
('2', NULL, NULL, '11', '1', 'Qui id quia in rerum quas dolor. Dolor quos aut est vero adipisci doloremque. 
Occaecati eum culpa similique at praesentium molestias et dolorum. Facilis eveniet nam mollitia.', '2022-04-14 09:24:08'),
('3', NULL, NULL, '6', '17', 'Voluptas et neque voluptatem at labore dolor. Et neque porro id perspiciatis dolorem. 
In temporibus sapiente sit sint soluta enim. Earum blanditiis vel suscipit officiis tenetur sit quas. 
Tempore iure veniam quo exercitationem sit qui provident.', '2022-04-14 06:28:22'),
('4', NULL, NULL, '6', '8', 'Dolores itaque voluptas ut saepe distinctio et. 
Nobis asperiores dolorem culpa reprehenderit. Nisi nobis beatae corporis.', '2022-04-18 14:31:07'),
('5', '6', '11', NULL, NULL, 'Quos veritatis voluptas fugit et qui dolorem aut enim. Ullam et aperiam nesciunt tenetur. 
Aut velit at delectus delectus facere qui suscipit recusandae. Sapiente porro sit deserunt maxime tempora.', '2022-04-17 20:59:14'),
('6', '13', '2', NULL, NULL, 'Necessitatibus voluptas nulla animi. Molestiae omnis eos sint impedit laboriosam laudantium. Voluptas alias qui qui libero omnis. 
Facere voluptatum quo incidunt nisi quos cumque enim necessitatibus.', '2022-04-10 10:49:41'),
('7', NULL, NULL, '10', '14', 'Nobis quia velit eligendi ducimus ipsum atque. Qui tenetur perspiciatis voluptatem ullam illo velit qui. 
Architecto molestiae molestias quia et eligendi accusamus.', '2022-04-13 11:14:37'),
('8', NULL, NULL, '7', '17', 'Quidem aut necessitatibus tempore totam sapiente maiores ipsam. 
Dolorum asperiores recusandae voluptatem quos. Sunt quia aperiam quae totam.', '2022-04-17 22:51:41'),
('9', NULL, NULL, '7', '2', 'Accusamus magnam facere magni ab repellat modi corporis ad. Est voluptatum inventore accusantium voluptate dignissimos ea aliquid. 
A sed libero vel ducimus sapiente corporis in inventore. Dolorem deleniti voluptatum soluta.', '2022-04-18 12:17:52'),
('10', '16', '7', NULL, NULL, 'Iste vel sit temporibus pariatur. 
Repellat consequatur maxime quo aut ducimus.', '2022-04-13 12:28:46'),
('11', '12', '6', NULL, NULL, 'Qui beatae ut id qui nostrum unde. 
Odit in est amet id rerum tempore eos. Distinctio et in esse consequuntur atque ipsum.', '2022-04-16 00:26:01'),
('12', '11', '1', NULL, NULL, 'Fugiat assumenda voluptatem ut odio. Esse natus sit magnam molestias suscipit quia voluptatibus. 
Porro reprehenderit sint qui ipsa et dolor. Maxime doloribus earum iusto sapiente eos fugiat.', '2022-04-15 12:46:43'),
('13', NULL, NULL, '8', '1', 'Sit ut sequi et blanditiis. Dolore voluptates ut magni dolores. 
Ut vitae molestias eius ea.', '2022-04-17 19:50:06'),
('14', NULL, NULL, '9', '17', 'Eveniet modi aut consequatur adipisci facere quia. Sint eum voluptatem perferendis ut molestiae. 
Aut commodi ut minus occaecati porro deleniti repellat. Excepturi qui laboriosam est rerum maxime quisquam.', '2022-04-18 08:48:12'),
('15', NULL, NULL, '11', '7', 'Ducimus cupiditate aspernatur voluptatibus autem fugit qui magnam. Laborum qui ut consequuntur. 
Vel possimus dolores et nisi suscipit eligendi. Accusantium dicta atque qui qui ad voluptatem.', '2022-04-18 11:52:53'),
('16', NULL, NULL, '6', '7', 'Consequatur eos est maxime quis excepturi id. Dolor impedit repudiandae est mollitia reiciendis. 
Consequatur excepturi debitis dignissimos neque veniam. Sapiente molestiae et provident blanditiis vel voluptates consectetur. 
Fuga architecto reprehenderit maxime sint..', '2022-04-12 08:16:05'),
('17', NULL, NULL, '10', '18', 'Sit eligendi architecto maiores similique. Nihil autem ratione impedit quam expedita similique pariatur iste. 
Et dignissimos eos tenetur incidunt odio sit error. Quae expedita qui doloremque quas numquam quibusdam voluptate. 
Repudiandae iste atque in quibusdam ab.', '2022-04-16 01:08:49'),
('18', '7', '11', NULL, NULL, 'Sapiente ut ut ut neque facilis repudiandae qui nobis. Et odio provident similique qui incidunt.', '2022-04-11 14:27:17'),
('19', '18', '9', NULL, NULL, 'Adipisci voluptas repellat eligendi optio itaque placeat. Officia labore blanditiis ea voluptatem nisi.', '2022-04-16 12:39:55'),
('20', NULL, NULL, '4', '19', 'Quia quisquam dolore vitae placeat. 
Dolores earum quas dolores vel doloribus quo earum. Veritatis voluptatum quo similique perferendis eum deserunt placeat.', '2022-04-18 09:57:27'),
('21', NULL, NULL, '2', '10', 'Illo delectus ut odio velit non. Alias quia rerum laborum. 
Omnis ut nisi eos dolores veniam sed. Unde quis velit architecto qui eum facere id. Sunt commodi vel rerum dolores tenetur numquam necessitatibus.', '2022-04-12 16:41:06'),
('22', NULL, NULL, '6', '11', 'Exercitationem omnis cum dolor enim deleniti. Deleniti sunt et itaque qui consequatur blanditiis. 
Ipsum qui fuga voluptatem aut. Deserunt blanditiis sequi deserunt soluta fugit possimus. Doloribus consequuntur ducimus quo rerum aut nemo.', '2022-04-09 18:49:52'),
('23', NULL, NULL, '10', '7', 'Ullam ratione laborum est ipsum. Eligendi a occaecati voluptate. Nulla ut repellendus cupiditate numquam sit quia. 
Laborum est voluptatibus voluptate dicta dolor hic qui.', '2022-04-11 15:51:34'),
('24', NULL, NULL, '7', '16', 'Architecto molestiae amet eligendi error tempora. Provident nemo velit earum beatae laboriosam ipsa vel. 
Aut et et occaecati et sunt. Itaque molestiae sit ut recusandae. Aperiam enim temporibus labore ea.', '2022-04-14 07:11:33'),
('25', '2', '9', NULL, NULL, 'Eligendi et autem eligendi hic neque mollitia. At quia id qui non vero. Sit enim minus similique assumenda. 
Voluptas sint esse labore.', '2022-04-12 15:58:15'),
('26', '9', '6', NULL, NULL, 'Tenetur omnis et magni dolores. Debitis nostrum sint error itaque ea. Facilis quae aperiam voluptate cupiditate.', '2022-04-14 12:18:25'),
('27', '20', '3', NULL, NULL, 'Fuga eos modi eius accusamus distinctio. Illo dolorum voluptatem voluptates veniam suscipit reprehenderit.', '2022-04-15 23:04:59'),
('28', NULL, NULL, '3', '13', 'Velit nihil ipsam veritatis. Autem ut neque et laudantium quas. Ipsum asperiores nisi autem earum inventore at et. 
Veritatis sed qui praesentium eveniet quia et. Cum sunt saepe cupiditate et aliquid perferendis.', '2022-04-15 12:40:19'),
('29', NULL, NULL, '3', '14', 'Est reiciendis ducimus sed dolore. Temporibus sit quod et quo nihil officia. Assumenda nostrum dolor maxime magni.', '2022-04-17 04:18:32'),
('30', NULL, NULL, '6', '10', 'Eius corporis rerum ullam numquam. Sint ea voluptas eius fuga qui hic. Praesentium ut praesentium odio explicabo inventore eaque. 
Et asperiores dolor corrupti cumque voluptatem aut.', '2022-04-16 19:44:09');
-- SELECT * FROM messages;

INSERT INTO best_vac_week (
id, created_at, vacancies_id, vacancy_name, vacancy_description, education, req_speciality_id,
employee_min_age, type_of_employment, working_hours, salary)
SELECT 
id, created_at, vacancies.id, vacancy_name, vacancy_description, education, req_speciality_id, employee_min_age,
type_of_employment, working_hours, salary 
FROM vacancies
GROUP BY id
ORDER BY salary DESC
LIMIT 5;
-- SELECT * FROM best_vac_week


INSERT INTO admins 
VALUES 
('1', '17', 'Chesley', 'Stehr', '9105275201', 'clara.bayer@example.org', '3f72feb58e0c083a193813df7458fcea73fd9e85'),
('2', '14', 'Lyda', 'Lind', '9551066077', 'zoe97@example.org', '0f2c8280782c449c761c1e12dad578b9510916c0'),
('3', '15', 'Natalia', 'Weissnat', '9821856990', 'vance.beatty@example.net', 'daf00294335ce3971546c699287288173fe7e8d0'),
('4', '7', 'Gerda', 'Bogan', '9951373566', 'luigi.johnston@example.org', '63c3005ebd8bcbdf297fe06acadf4efeb3e716a2'),
('5', '3', 'Marlee', 'Luettgen', '9763575277', 'ebogisich@example.com', '76cf3612518b8e03321fd8ed75eefb5bf0c4194b');
-- SELECT * FROM admins;

INSERT INTO favorites (user_id, vacancies_id, company_id, speciality_id, salary, created_at)
SELECT users.id, vacancies.id, vacancies.company_id, vacancies.req_speciality_id, vacancies.salary, vacancies.created_at 
FROM users, vacancies 
WHERE users.id=3 AND vacancies.id>8 AND vacancies.id<11;
-- SELECT * FROM favorites; 

