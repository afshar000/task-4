select * from uniqlo_tshirts;
SHOW COLUMNS FROM uniqlo_tshirts;
UPDATE uniqlo_tshirts
SET `Rating Count` = ABS(CAST(REGEXP_REPLACE(`Rating Count`, '[^0-9.-]', '') AS DOUBLE));
ALTER TABLE uniqlo_tshirts
MODIFY COLUMN `Rating Count` DOUBLE;
 
 