CREATE TABLE `zar_jobs_grades` (
	`jobGradeID` INT(11) NOT NULL AUTO_INCREMENT,
	`jobID` INT(11) NOT NULL,
	`jobGradeSort` INT(11) NULL DEFAULT NULL,
	`jobGradeName` VARCHAR(50) NOT NULL DEFAULT 'No Job Grade Name' COLLATE 'utf8mb4_general_ci',
	`jobGradeIsBoss` TINYINT(1) NOT NULL DEFAULT '0',
	`jobGradePayment` INT(11) NOT NULL DEFAULT '50',
	PRIMARY KEY (`jobGradeID`) USING BTREE,
	INDEX `job_to_grade` (`jobID`) USING BTREE,
	CONSTRAINT `job_to_grade` FOREIGN KEY (`jobID`) REFERENCES `zar_jobs` (`jobID`) ON UPDATE CASCADE ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;