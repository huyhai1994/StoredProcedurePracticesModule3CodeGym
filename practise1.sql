CREATE DATABASE teststoredprocedure;
use  teststoredprocedure;
CREATE TABLE SumOfAll( 
	AMOUNT INT
);
INSERT INTO SumOfAll VALUES(100);
INSERT INTO SumOfAll VALUES (330),(450),(400);

SELECT * FROM SumOfAll;
DELIMITER //
CREATE PROCEDURE StoredProcedureCheckValue (IN value1 int , OUT value2 INT)
	BEGIN 
		SET value2 = (SELECT Amount from SumOfAll WHERE Amount = value1);
	END;
DELIMITER;

CALL StoredProcedureCheckValue (300, @isPresent);

SELECT @isPresent;

INSERT INTO SumOfAll VALUES (300);

