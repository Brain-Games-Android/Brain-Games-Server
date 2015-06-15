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
INSERT INTO `questions` (question, subject_id, difficulty_id) VALUES 
	-- Medium
	/*1*/('Τι είναι το web service;', 1, 2),
	/*2*/('Ποια εταιρεία δεν κατασκευάζει laptops;', 1, 2),
	/*3*/('\"Τριπλή χειραψία\", πρωτόκολλο;', 1, 2),
	/*4*/('Ποια δεν είναι μάρκα επεξεργαστή;', 1, 2),
	/*5*/('Ποια είναι αντικειμενοστραφή γλώσσα προγραμματισμού;', 1, 2),
	/*6*/('Ποιο από τα παρακάτω δεν είναι ανοιχτό λειτουργικό σύστημα;', 1, 2),
	/*7*/('Ποιο από τα παρακάτω software υποστηρίζει αναπαράσταση και εξομοίωση διαδικασιών', 1, 2),
	/*8*/('Το CD-ROM είναι ένα είδος:', 1, 2),
	/*9*/('Ποιο από τα παρκάτω δεν είναι λογισμικό antivirus;', 1, 2),
	/*10*/('Ποιος από τους παρακάτω δεν είναι κρυπτογραφικός αλγόριθμος;', 1, 2),
	/*11*/('Στη γλώσσα C, ποια συνάρτηση χρησιμοποιούμε για να εμφανίσουμε δεδομένα στην οθόνη;', 1, 2),
	/*12*/('Ποιο από τα παρκάτω δεν είναι φυλλομετρητής;', 1, 2),
	
	-- Hard
	/*13*/('Από ποια τοποθεσία είναι οι πρώτες εντολές του υπολογιστή διαθέσιμες στο ξεκίνημα του;', 1, 3),
	/*14*/('Ένας σκληρός δίσκος είναι διαιρεμένο σε tracks που είναι είναι περαιτέρω υποδιαιρεμένο σε:', 1, 3),
	/*15*/('Ποια αρχιτεκτονική υλικού δεν υποστηρίζεται από την Red Hat?', 1, 3),
	/*16*/('Το πρώτο βήμα στα συστήματα Κύκλος Ζωής Ανάπτυξης είναι:', 1, 3),
	/*17*/('The speed at which the monitor accepts data is called:', 1, 3),
	/*18*/('Of the following, which best characterizes computers that use memory-mapped I/O?', 1, 3),
	/*19*/('In an array of 2N elements that is both 2- and 3-ordered, what is the maximum number of positions that an element can be from its position if the array were 1- ordered.', 1, 3),
	/*20*/('Let G be connected undirected graph of 100 vertices and 300 edges. The weight of a minimum spanning tree of G is 500. When the weight of each edge of G is increased by five, the weight of a minimum spanning tree becomes?.', 1, 3),
	/*21*/('Assume that a mergesort algorithm in the worst case takes 30 seconds for an input of size 64. Which of the following most closely approximates the maximum input size of a problem that can be solved in 6 minutes?', 1, 3),
	/*22*/('In C++, const qualifier can be applied to 1) Member functions of a class 2) Function arguments 3) To a class data member which is declared as static 4) Reference variables', 1, 3),
	/*23*/('The most efficient algorithm for finding the number of connected components in an undirected graph on n vertices and m edges has time complexity.', 1, 3),
	/*24*/('Which of the following is FALSE about abstract classes in Java', 1, 3),
	
	-- Easy
	/*25*/('In Linux, what command is used to remove files?', 1, 1),
	/*26*/('Ο εγκέφαλος ενός υπολογιστικού συστήματος είναι', 1, 1),
	/*27*/('Το RS-232 είναι πρότυπο που εφαρμόζεται σε:', 1, 1),
	/*28*/('Διεργασία είναι:', 1, 1),
	/*29*/('Τι λεγότανε αρχικά \'παιχνίδι απομίμησης\' από τον δημιουργό του;', 1, 1),
	/*30*/('Η λογική δομή δεδομένων με συσχέτιση ένα-προς-πολλά είναι:', 1, 1),
	/*31*/('Ποιο πρόγραμμα του υπολογιστή μετατρέπει γλώσσα assembly σε γλώσσα μηχανής;', 1, 1),
	/*32*/('Ένα byte αντιστοιχεί σε:', 1, 1),
	/*33*/('Το λειτουργικό σύστημα διαχειρίζει:', 1, 1),
	/*34*/('Το άτομο που χρησιμοποιεί την ειδικότητα του για να αποκτήσει πρόσβαση σε υπολογιστές άλλων ανθρώπων για να πάρει πληροφορίες παράνομα ή να προκαλέσει ζημιά είναι ένας:', 1, 1),
	/*35*/('Το pdf είναι ακρώνυμο του:', 1, 1),
	/*36*/('Στη γλώσσα C, ποια θα είναι η τελική τιμή της x όταν τρέξουμε το τμήμα κώδικα ... int x; for(x = 0; x<10; x++) {} ... ;', 1, 1)
	;

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
INSERT INTO `question_choices` (choice, correct, question_id) VALUES 
	-- Medium
	('Τίποτα από τα προτεινόμενα',0,1), ('Πρόγραμμα που κάνει την εγκατάσταση web προγραμμάτων', 0, 1), ('Τεχνολογία που επιτρέπει στις εφαρμογές να επικοινωνούν μεταξύ τους.', 1, 1), ('Αλγόριθμος ταξινόμησης.', 0, 1),
	('Lenovo', 0, 2), ('Fujitsu', 0, 2), ('Πλαίσιο', 0, 2), ('Intel', 1, 2),
	('HTTP', 0, 3), ('FTP', 0, 3), ('UDP', 0, 3), ('TCP', 1, 3),
	('Intel', 0, 4), ('8051', 0, 4), ('Nvidia', 1, 4), ('MiniMIPS', 0, 4), 
	('C++', 1, 5), ('C', 0, 5), ('Pascal', 0, 5), ('Assembly', 0, 5),
	('Linux', 0, 6), ('Windows',0,6), ('VMWare', 1, 6), ('Macintosh', 0, 6),
	('ADONIS', 1, 7),('Notepad', 0, 7), ('Notepad++', 0, 7), ('Atom', 0, 7),
	('Οπτικού δίσκου', 0, 8), ('Μαγνητο-ομπτικού δίσκου', 0, 8), ('Μαγνητικού δίσκου', 1, 8), ('Τίποτα από τα προτεινόμενα', 0, 8),
	('Nessus', 1, 9), ('Avira', 0, 9), ('Norton', 0, 9), ('Avast', 0, 9),
	('Buble Sort', 1, 10), ('Caesar',0,10), ('Substitution', 0, 10), ('Vigenere', 0, 10),
	('cout', 0, 11), ('emfanise', 0, 11), ('printf', 1, 11), ('li $v0,11', 0, 11),
	('Iceweasel', 0, 12), ('Chrome', 0, 12), ('Opera', 0, 12), ('AVG', 1, 12),
	
	-- Hard
	('ROM BIOS', 1, 13), ('CPU', 0, 13), ('boot.ini', 0, 13), ('CONFIG.SYS', 0, 13),
	('clusters', 0, 14), ('sectors', 1, 14), ('vectors', 0, 14), ('heads', 0, 14),
	('SPARC', 0, 15), ('IBM-compatible', 0, 15), ('Alpha', 0, 15), ('Macintosh', 1, 15),
	('Σχεδίαση βάσης δεδομένων', 0, 16), ('Σχεδίαση συστήματος', 0, 16), ('Προκαταρκτική έρευνα και ανάλυση', 1, 16), ('Γραφική διεπαφή χρήσης', 0, 16),
	('bandwidth', 1, 17), ('response time', 0, 17), ('interlacing', 0, 17), ('scanning', 0, 17), 
	('. I/O ports are placed at addresses on the bus and are accessed just like other memory locations.', 1, 18), ('To perform an I/O operation, it is sufficient to place the data in an address register and call the channel to perform the operation.', 0, 18), ('Ports are referenced only by memory-mapped instructions of the computer and are located athardwired memory locations.', 0, 18), ('I/O can be performed only when memory management hardware is turned on.', 0, 18),
	('2*N - 1', 0, 19), ('2', 0, 19), ('N/2', 0, 19), ('N', 1, 19),
	('1000', 0, 20), ('995', 1, 20), ('2000', 0, 20), ('1995', 0, 20),
	('256', 0, 21), ('512', 1, 21), ('1024', 0, 21), ('2048', 0, 21),
	('Only 1, 2 and 3', 0, 22), ('Only 1, 2 and 4', 0, 22), ('All', 1, 22), ('Only 1, 3 and 4', 0, 22),
	('θ(n)', 0, 23), ('θ(m)', 0, 23), ('θ(m + n)', 1, 23), ('θ(m * n)', 0, 23),
	('If we derive an abstract class and do not implement all the abstract methods, then the derived class should also be marked as abstract using \'abstract\' keyword', 0, 24), ('Abstract classes can have constructors', 0, 24), ('A class can be made abstract without any abstract method', 0, 24), ('A class can inherit from multiple abstract classes.', 1, 24),
	
	-- Easy
	('rm', 1, 25), ('dm', 0, 25), ('delete', 0, 25), ('erase', 0, 25),
	('ALU', 0, 26), ('Μνήμη', 0, 26), ('CPU', 1, 26), ('Μονάδα ελέγχου', 0, 26),
	('Σειριακές πόρτες', 1, 27), ('Παράλληλες πόρτες', 0, 27), ('Δίκτυα', 0, 27), ('Ψηφιακές συχνότητες', 0, 27),
	('πρόγραμμα σε υψηλό επίπεδο γλώσσα που φυλάσσεται στο δίσκο', 0, 28), ('περιεχόμενα της κύριας μνήμης', 0, 28), ('ένα πρόγραμμα σε εκτέλεση', 1, 28), ('μια εργασία σε δευτερεύων μνήμη', 0, 28),
	('Το τεστ του Turing', 1, 29), ('LISP', 0, 29), ('The Logic Theorist', 0, 29), ('Cybernetics', 0, 29),
	('Δίκτυο', 0, 30), ('Αλυσίδα', 0, 30), ('Σχεσιακή', 0, 30), ('Δέντρο', 1, 30),
	('Διερμηνευτής', 0, 31), ('Μεταγλωττιστής', 0, 31), ('Συμβολομεταφραστής', 1, 31), ('Συγκριτής', 0, 31),
	('4 bits', 0, 32), ('8 bits', 1, 32), ('12 bits', 0, 32), ('32 bits', 0, 32),
	('Διεργασίες', 0, 33), ('Μνήμη', 0, 33), ('Δίσκους και συσκευές Ι/Ο', 0, 33), ('Όλα από τα προτεινόμενα', 1, 33),
	('Programmer', 0, 34), ('Analyst', 0, 34), ('Spammer', 0, 34), ('Hacker', 1, 34),
	('portable data file', 0, 35), ('portable document file', 0, 35), ('portable document format', 1, 35), ('portable data format', 0, 35),
	('10', 1, 36), ('9', 0, 36), ('Σκουπίδια', 0, 36), ('1', 0, 36)
	;
	-- ('', , ), ('', , ), ('', , ), ('', , ),

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
