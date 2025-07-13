CREATE DEFINER=`root`@`localhost` TRIGGER `zar_jobs_grades_before_update` BEFORE UPDATE ON `zar_jobs_grades` FOR EACH ROW BEGIN
	IF NEW.jobID <> OLD.jobID THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'ERROR; jobID cannot be updated after creation.';
	END IF;
END