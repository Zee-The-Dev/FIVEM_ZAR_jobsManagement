CREATE DEFINER=`root`@`localhost` PROCEDURE `zar_insert_or_update_job_grade`(
	IN `p_jobID` INT,
	IN `p_jobGradeSort` INT,
	IN `p_jobGradeName` VARCHAR(50),
	IN `p_jobGradeIsBoss` TINYINT(1),
	IN `p_jobGradePayment` INT,
	IN `p_jobGradeID` INT
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
	IF p_jobGradeIsBoss = 1 THEN
		UPDATE zar_jobs_grades
		SET jobGradeIsBoss = 0
		WHERE jobID = p_jobID AND jobGradeisBoss = 1;
	END IF;
	
	IF p_jobGradeID IS NOT NULL THEN
		UPDATE zar_jobs_grades
		SET 
			jobID = jobID,
			jobGradeSort = p_jobGradeSort,
			jobGradeName = p_jobGradeName,
			jobGradeIsBoss = p_jobGradeIsBoss,
			jobGradePayment = p_jobGradePayment
		WHERE jobGradeID = p_jobGradeID;
	ELSE
		INSERT INTO zar_jobs_grades (jobID, jobGradeSort, jobGradeName, jobGradeIsBoss, jobGradePayment)
			VALUES (p_jobID, p_jobGradeSort, p_jobGradeName, p_jobGradeIsBoss, p_jobGradePayment);
	END IF;
END