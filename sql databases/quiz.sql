DROP DATABASE IF EXISTS quiz;
CREATE DATABASE quiz
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;
USE quiz;

CREATE TABLE IF NOT EXISTS `users` (
	`user_id` INT(5) NOT NULL,
    `username` VARCHAR(20) NOT NULL,
    `first_name` VARCHAR (35) NOT NULL,
    `last_name` VARCHAR (35) NOT NULL,
    PRIMARY KEY (`user_id`)
);

CREATE TABLE IF NOT EXISTS `difficulties` (
	`difficulty_id` INT(1) NOT NULL,
    `difficulty` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`difficulty_id`)
);

CREATE TABLE IF NOT EXISTS `questions` (
	`question_id` INT(5) NOT NULL AUTO_INCREMENT,
    `question` TEXT CHARACTER SET utf8 NOT NULL,
    `answer` VARCHAR(255) NOT NULL,
    `difficulty_id` INT(1) NOT NULL,
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