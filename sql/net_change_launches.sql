-- Problem: Net Change in Product Launches (StrataScratch)
-- Goal: Find net difference in product launches between 2020 and 2019 for each company

SELECT 
   COALESCE(pl_2020.company_name, pl_2019.company_name) AS company_name,
   COALESCE(pl_2020.total_launch2020, 0) - COALESCE(pl_2019.total_launch2019, 0) AS net_difference
FROM 
(
    SELECT 
        company_name,
        COUNT(*) AS total_launch2020
    FROM car_launches 
    WHERE year = 2020
    GROUP BY company_name
) AS pl_2020
FULL OUTER JOIN 
(
    SELECT 
        company_name,
        COUNT(*) AS total_launch2019
    FROM car_launches 
    WHERE year = 2019
    GROUP BY company_name
) AS pl_2019
ON pl_2020.company_name = pl_2019.company_name;
