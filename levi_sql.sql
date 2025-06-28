SELECT * FROM levi_products_clean;
ALTER TABLE levi_products_clean ADD COLUMN Average_price DECIMAL(10,2);
UPDATE levi_products_clean
SET Average_price = (
	CASE
		WHEN REGEXP_SUBSTR(Price, '\\$[0-9]+\\.[0-9]+', 1, 2) IS NOT NULL THEN
			(
				(CAST(REPLACE(REGEXP_SUBSTR(Price, '\\$[0-9]+\\.[0-9]+', 1, 1), '$', '') AS DECIMAL(10,2))
                +
                CAST(REPLACE(REGEXP_SUBSTR(Price, '\\$[0-9]+\\.[0-9]+', 1, 2), '$', '') AS DECIMAL(10,2))
                )/2
			)
		WHEN REGEXP_SUBSTR(Price, '\\$[0-9]+\\.[0-9]+', 1, 1) IS NOT NULL THEN
			CAST(REPLACE(REGEXP_SUBSTR(Price, '\\$[0-9]+\\.[0-9]+', 1, 1), '$', '') AS DECIMAL(10,2))
            
		ELSE NULL
	END
);
select * from levi_products_clean; 