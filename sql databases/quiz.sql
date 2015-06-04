DROP DATABASE IF EXISTS quiz;
CREATE DATABASE quiz
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;
USE quiz;

CREATE TABLE IF NOT EXISTS `users` (
	`user_id` INT(5) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL,
    `first_name` VARCHAR (35) NOT NULL,
    `last_name` VARCHAR (35) NOT NULL,
    PRIMARY KEY (`user_id`)
);

CREATE TABLE IF NOT EXISTS `difficulties` (
	`difficulty_id` INT(1) NOT NULL AUTO_INCREMENT,
    `difficulty` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`difficulty_id`)
);

CREATE TABLE IF NOT EXISTS `subjects` (
	`subject_id` int(3) NOT NULL AUTO_INCREMENT,
	`subject` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`subject_id`)
);

CREATE TABLE IF NOT EXISTS `questions` (
	`question_id` INT(5) NOT NULL AUTO_INCREMENT,
    `question` TEXT CHARACTER SET utf8 NOT NULL,
	`subject_id` int(3) NOT NULL,
    `difficulty_id` INT(1) NOT NULL,
	FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`subject_id`),
	FOREIGN KEY (`difficulty_id`) REFERENCES `difficulties`(`difficulty_id`),
    PRIMARY KEY (`question_id`)
);

CREATE TABLE IF NOT EXISTS `question_choices` (
	`choice_id` INT(6) NOT NULL AUTO_INCREMENT,
    `choice` TEXT CHARACTER SET utf8 NOT NULL,
    `correct` TINYINT(1) DEFAULT 0,
    `question_id` INT(5) NOT NULL,
    FOREIGN KEY (`question_id`) REFERENCES `questions`(`question_id`),
    PRIMARY KEY (`choice_id`)
);

CREATE TABLE IF NOT EXISTS `stats` (
	`stats_id` INT(5) NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(20) NOT NULL,
    `score` INT(2) NOT NULL,
	`subject_id` int(3) NOT NULL,
    `difficulty_id` INT(1) NOT NULL,
	PRIMARY KEY (`stats_id`),
	FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`subject_id`),
	FOREIGN KEY (`difficulty_id`) REFERENCES `difficulties`(`difficulty_id`)

);

insert into subjects (subject) values ('CS');
insert into subjects (subject) values ('FOOTBALL');

insert into difficulties (difficulty) values ('NOOB');
insert into difficulties (difficulty) values ('KOURKOS');

insert into users (username,first_name,last_name) values ('egw','egw','eimai');

insert into questions (question,subject_id,difficulty_id) values ('how are u?',1,1);

insert into question_choices (choice,correct,question_id) values ('fine',1,1);
insert into question_choices (choice,correct,question_id) values ('leave me alone',0,1);
insert into question_choices (choice,correct,question_id) values ('what?',0,1);
insert into question_choices (choice,correct,question_id) values ('....',0,1);

insert into stats (user_id,score,subject_id,difficulty_id) values (1,9,1,1);