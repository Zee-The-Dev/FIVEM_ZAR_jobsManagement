CREATE TABLE `zar_jobs` (
	`jobID` INT(11) NOT NULL AUTO_INCREMENT,
	`jobKey` VARCHAR(50) NOT NULL DEFAULT 'No Job Key' COLLATE 'utf8mb4_general_ci',
	`jobRemovable` TINYINT(1) NOT NULL DEFAULT '1',
	`jobLabel` VARCHAR(50) NOT NULL DEFAULT 'No Label' COLLATE 'utf8mb4_general_ci',
	`jobDefaultDuty` TINYINT(1) NOT NULL DEFAULT '1',
	`jobOffDutyPay` TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`jobID`) USING BTREE,
	UNIQUE INDEX `jobName` (`jobKey`) USING BTREE,
	INDEX `jobID` (`jobID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;
