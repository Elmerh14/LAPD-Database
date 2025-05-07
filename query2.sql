-- All LAPD Areas reporting Incidents (Outer Join)

SELECT a.Area, a.Area_Name, COUNT(i.DR_NO) AS Total_Incidents
FROM area a
LEFT JOIN rpt_no r ON a.Area = r.Area
LEFT JOIN incident i ON r.Rpt_Dist_No = i.Rpt_Dist_No
GROUP BY a.Area, a.Area_Name
ORDER BY Total_Incidents DESC;