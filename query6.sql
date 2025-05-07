-- Firearm incidents involving female victims 

SELECT MONTHNAME(i.DATE_OCC) AS Month, COUNT(*) AS Total_Incidents
FROM incident i
JOIN weapon w ON i.Weapon_Used_Cd = w.Weapon_Used_Cd
WHERE i.Vict_Sex = 'F'
  AND (
       w.Weapon_Desc LIKE '%SEMI-AUTOMATIC PISTOL%' OR
       w.Weapon_Desc LIKE '%SIMULATED GUN%' OR
       w.Weapon_Desc LIKE '%OTHER FIREARM%' OR
       w.Weapon_Desc LIKE '%UNKNOWN FIREARM%' OR
       w.Weapon_Desc LIKE '%AIR PISTOL/REVOLVER/RIFLE/BB GUN%' OR
       w.Weapon_Desc LIKE '%RIFLE%' OR
       w.Weapon_Desc LIKE '%REVOLVER%'
  )
  AND YEAR(i.DATE_OCC) = 2020
GROUP BY MONTH(i.DATE_OCC), MONTHNAME(i.DATE_OCC)
ORDER BY MONTH(i.DATE_OCC);
