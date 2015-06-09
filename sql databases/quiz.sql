DROP DATABASE IF EXISTS quiz;
CREATE DATABASE quiz
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;
USE quiz;


DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
	`user_id` INT(5) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL,
    `first_name` VARCHAR (35) NOT NULL,
    `last_name` VARCHAR (35) NOT NULL,
    PRIMARY KEY (`user_id`)
);
INSERT INTO `users` VALUES 
	(1,'egw','egw','eimai'),
	(2,'mpampis','ff','gg'),
	(3,'mpampis','ff','gg'),
	(4,'mpampis','ff','gg'),
	(5,'mpampis','ff','gg'),
	(6,'mpampis','ff','gg'),
	(7,'mpampis','ff','gg');

	
DROP TABLE IF EXISTS `difficulties`;
CREATE TABLE IF NOT EXISTS `difficulties` (
	`difficulty_id` INT(1) NOT NULL AUTO_INCREMENT,
    `difficulty` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`difficulty_id`)
);

INSERT INTO `difficulties` VALUES 
	(1,'easy'),
	(2,'medium'),
	(3,'hard');


DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
	`subject_id` int(3) NOT NULL AUTO_INCREMENT,
	`subject` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`subject_id`)
);
INSERT INTO `subjects` VALUES 
	(1,'cs'),
	(2,'football'),
	(3,'cinema'),
	(4,'basketball'),
	(5,'history');


DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
	`question_id` INT(5) NOT NULL AUTO_INCREMENT,
    `question` TEXT CHARACTER SET utf8 NOT NULL,
	`subject_id` int(3) NOT NULL,
    `difficulty_id` INT(1) NOT NULL,
	FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`subject_id`),
	FOREIGN KEY (`difficulty_id`) REFERENCES `difficulties`(`difficulty_id`),
    PRIMARY KEY (`question_id`)
);
-- Greek
INSERT INTO `questions` VALUES 
	(1, 'Πως είσαι;', 1, 2),
	(2, 'Τι είναι το web service;', 1, 2),
	(3, '\"Τριπλή χειραψία\", πρωτόκολλο;', 1, 2),
	(4, 'Ποια δεν είναι μάρκα επεηεργαστή;', 1, 2),
	(5, 'Ποια είναι αντικειμενοστραφή γλώσσα προγραμματισμού;', 1, 2),
	(6, 'Ποιο από τα παρακάτω δεν είναι ανοιχτό λειτουργικό σύστημα;', 1, 2),
	(7, 'Ποιο από τα παρακάτω software υποστηρίζει αναπαράσταση και εξομοίωση διαδικασιών', 1, 2),
	(8, 'Ποια είναι η πιο επιτυχημένη μάρκα περιφεριακών για gaming;', 1, 2),
	(9, 'Ποιο από τα παρκάτω δεν είναι λογισμικό antivirus;', 1, 2),
	(10,'Ποιος από τους παρακάτων δεν είναι κρυπτογραφικός αλγόριθμος;', 1, 2),
	(11,'Στη γλώσσα C, ποια συνάρτηση χρησιμοποιούμε για να εμφανίσουμε στην οθόνη;', 1, 3),
	(12,'Ποιο από τα παρκάτων δεν είναι φυλλομετρητής;', 1, 2);

/*-- Greeklish
INSERT INTO `questions` VALUES 
	(1,'how are u?',1,2),
	(2,'ti einai to webservice?',1,2),
	(3,'\"triplh xeirapsia\", protokolo',1,2),
	(4,'poia den einai marka epeksergasth?',1,2),
	(5,'poia einai antikeimenostrafh glwssa programmatismou?',1,2),
	(6,'poio apo ta parakatw den einai anoixto leitourgiko systhma?',1,2),
	(7,'poio apo ta parakatw software uposthrizei anaparastash kai eksomoiwsh diadikasiwn?',1,2),
	(8,'poia einai h pio epituhmenh marka periferiakwn gia gaming?',1,2),
	(9,'poio apo ta parakatw den einai antivirus?',1,2),
	(10,'poios apo tous parakatw den einai kryptografikos algorithmos?',1,2),
	(11,'me poia synarthsh emfanizoyme sthn othonh me thn glwssa C?',1,3),
	(12,'poio apo ta parakatw den einai fylometrhths?',1,2);
*/


DROP TABLE IF EXISTS `question_choices`;
CREATE TABLE IF NOT EXISTS `question_choices` (
	`choice_id` INT(6) NOT NULL AUTO_INCREMENT,
    `choice` TEXT CHARACTER SET utf8 NOT NULL,
    `correct` TINYINT(1) DEFAULT 0,
    `question_id` INT(5) NOT NULL,
    FOREIGN KEY (`question_id`) REFERENCES `questions`(`question_id`),
    PRIMARY KEY (`choice_id`)
);
INSERT INTO `question_choices` VALUES 
	(5, 'Δεν ξέρω',0,1), (6, 'Άσε με', 0, 1), (7, 'Μεταφορά δεδομένων μέσω web', 1, 1), (8, 'Αλγόριθμος ταξινόμησης', 0, 1),
	(1, 'Lenovo', 0, 2), (2, 'Fujitsu', 0, 2), (3, 'Πλαίσιο', 0, 2), (4, 'HTC', 1, 2),
	(9, 'HTTP', 0, 3), (10, 'FTP', 0, 3), (11,'UDP', 0, 3), (12, 'TCP', 1, 3),
	(13, 'Intel', 0, 4), (14,'8051', 0, 4), (15,'Nvidia',1,4), (16,'MiniMIPS',0,4), 
	(17, 'C++', 1, 5), (18, 'C',0,5),(19,'Pascal',0,5),(20,'Assembly',0,5),
	(21, 'Linux',0,6),(22,'Windows',0,6),(23,'VMWare',1,6),(24,'Macintosh',0,6),
	(25, 'ADONIS',1,7),(26,'Notepad',0,7),(27,'Notepad++',0,7),(28,'Atom',0,7),
	(29, 'Razer',1,8),(30,'Microsoft',0,8),(31,'Cooler Master',0,8),(32,'Natec',0,8),
	(33, 'Nessus',1,9),(34,'Avira',0,9),(35,'Norton',0,9),(36,'Avast',0,9),
	(37, 'Buble Sort',1,10),(38,'Caesar',0,10),(39,'Substitution',0,10),(40,'Vigenere',0,10),
	(41, 'cout',0,11),(42,'emfanise',0,11),(43,'printf',1,11),(44,'li $v0,11',0,11),
	(45, 'Iceweasel',0,12),(46,'Chrome',0,12),(47,'Opera',0,12),(48,'AVG',1,12);
/* -- Greeklish
INSERT INTO `question_choices` VALUES 
	(1,'lenovo',0,1),(2,'fujitsu',0,1),(3,'plaisio',0,1),(4,'HTC',1,1),
	(5,'den kserw',0,2),(6,'ase me',0,2),(7,'metafora dedomenwn mesw tou web',1,2),(8,'algorithmos taksinomishs',0,2),
	(9,'HTTP',0,3),(10,'FTP',0,3),(11,'UDP',0,3),(12,'TCP',1,3),
	(13,'Intel',0,4),(14,'8051',0,4),(15,'Nvidia',1,4),(16,'MiniMIPS',0,4),
	(17,'C++',1,5),(18,'C',0,5),(19,'Pascal',0,5),(20,'Assembly',0,5),
	(21,'Linux',0,6),(22,'Windows',0,6),(23,'VMWare',1,6),(24,'Macintosh',0,6),
	(25,'ADONIS',1,7),(26,'Notepad',0,7),(27,'Notepad++',0,7),(28,'Atom',0,7),
	(29,'Razer',1,8),(30,'Microsoft',0,8),(31,'Cooler Master',0,8),(32,'Natec',0,8),
	(33,'Nessus',1,9),(34,'Avira',0,9),(35,'Norton',0,9),(36,'Avast',0,9),
	(37,'Buble Sort',1,10),(38,'Caesar',0,10),(39,'Substitution',0,10),(40,'Vigenere',0,10),
	(41,'cout',0,11),(42,'emfanise',0,11),(43,'printf',1,11),(44,'li $v0,11',0,11),
	(45,'Iceweasel',0,12),(46,'Chrome',0,12),(47,'Opera',0,12),(48,'AVG',1,12);
*/	


DROP TABLE IF EXISTS `stats`;
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
INSERT INTO `stats` VALUES 
	(1,'1',9,1,1),
	(2,'2',-1,2,1),
	(3,'3',-1,2,1),
	(4,'4',-1,1,1),
	(5,'5',-1,1,1),
	(6,'6',-1,2,1),
	(7,'7',-1,1,1);
