-- Most Frequent Crimes (Join) 

SELECT COALESCE(ccd.Description, 'UNSPECIFIED') AS Description, COUNT(*) AS total_reports
FROM incident i
JOIN crime_code cc ON i.DR_NO = cc.DR_NO
JOIN crime_code_description ccd ON cc.Crm_Cd = ccd.Crm_Cd
GROUP BY Description
ORDER BY total_reports DESC
LIMIT 5;