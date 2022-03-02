DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,-- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	firstname VARCHAR(100) COMMENT 'Имя',
	lastname VARCHAR(100) COMMENT 'Фамилия',
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(100),
	phone BIGINT,
	is_deleted bit default 0,
	INDEX users_lastname_firstname_idx(lastname, firstname)
);

-- 1-1
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
	gender CHAR(1),
	birthday DATE,
	photo_id BIGINT UNSIGNED, 
	created_at DATETIME DEFAULT NOW(),
	hometown VARCHAR(100)
);

ALTER TABLE `profiles` ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;

-- 1-M
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL, -- отправитель
	to_user_id BIGINT UNSIGNED NOT NULL, -- получатель
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (from_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);


DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	-- id SERIAL,
	initiator_user_id BIGINT UNSIGNED NOT NULL, -- отправитель
	target_user_id BIGINT UNSIGNED NOT NULL, -- получатель
	`status` ENUM('requested', 'approved', 'declined', 'unfriended'),
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE NOW(), -- CURRENT_TIMESTAMP
	PRIMARY KEY (initiator_user_id, target_user_id),
	FOREIGN KEY (initiator_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (target_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
); 

DROP TABLE IF EXISTS communities;
CREATE TABLE communities (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	admin_user_id BIGINT UNSIGNED,
	INDEX communities_name_idx(name),
	FOREIGN KEY (admin_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- M-M
DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities (
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id, community_id), -- защита от дубликатов
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (community_id) REFERENCES communities(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS media;
CREATE TABLE media (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	media_type_id BIGINT UNSIGNED,
	body TEXT,
	-- filename BLOB,
	filename VARCHAR(255), -- хранение ссылок на файлы
	`size` INT,
	metadata JSON,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (media_type_id) REFERENCES media_types(id) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_id) REFERENCES media(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL,
  	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id SERIAL PRIMARY KEY,
	`album_id` BIGINT unsigned NOT NULL,
	`media_id` BIGINT unsigned NOT NULL,

	FOREIGN KEY (album_id) REFERENCES photo_albums(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_id) REFERENCES media(id) ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE `profiles` ADD CONSTRAINT fk_photo_id
    FOREIGN KEY (photo_id) REFERENCES photos(id)
    ON UPDATE CASCADE ON DELETE set NULL;
   
 -- Домашняя работа

DROP TABLE IF EXISTS game_types; 
CREATE TABLE game_types (			-- создаем таблицу с типами игр на выбор
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	
	started_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS games;		-- Тут уже создаем таблицу с играми, в которую играют пользователи
CREATE TABLE games (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	game_type_id BIGINT UNSIGNED NOT NULL,
	game_name VARCHAR(150),				-- имя игры
	game_admin_user_id BIGINT UNSIGNED,	-- админ игры
	body TEXT,							-- пока что допустим, что игра простенькая, текстовый квест, например
	filename VARCHAR(255),
	`size` BIGINT,
	INDEX game_name_idx(game_name),
	started_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY (game_admin_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (game_type_id) REFERENCES game_types(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS game_communities;
CREATE TABLE game_communities (
	admin_user_id BIGINT UNSIGNED,
	game_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	game_type_id BIGINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (user_id, game_id),
	FOREIGN KEY (admin_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (game_type_id) REFERENCES game_types (id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS education_career;	-- Создаем таблицу образование/карьера
CREATE TABLE education_career (
	user_id SERIAL PRIMARY KEY,
	latest_education ENUM('empty', 'school', 'college', 'university'),	-- последнее учебное заведение
	school TEXT,
	college TEXT,
	university TEXT,
	current_work_status ENUM('unemployed', 'self-employed', 'full-time position'),	-- текущий рабочий статус
	company TEXT,
	current_position TEXT,
	previous_work_position TEXT,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS blacklist;		-- Создаем таблицу с заблокированными пользователями
CREATE TABLE blacklist (
	id SERIAL PRIMARY KEY,
	blocked_user_id BIGINT UNSIGNED NOT NULL, -- заблокированный пользователь
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (blocked_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

