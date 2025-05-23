-- Monthly Crime Counts per Reporting District (Aggregation)

SELECT r.Rpt_Dist_No AS District, a.Area_Name AS Area, MONTHNAME(i.DATE_OCC) AS Month, COUNT(*) AS Total_Incidents
FROM incident i
JOIN rpt_no r ON i.Rpt_Dist_No = r.Rpt_Dist_No
JOIN area a ON r.Area = a.Area
WHERE YEAR(i.DATE_OCC) = 2020
GROUP BY r.Rpt_Dist_No, a.Area_Name, MONTH(i.DATE_OCC), MONTHNAME(i.DATE_OCC)
ORDER BY r.Rpt_Dist_No, MONTH(i.DATE_OCC);
