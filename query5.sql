-- Firearm related incidents

SELECT i.DR_NO, i.DATE_OCC, w.Weapon_Desc
FROM incident i
JOIN weapon w ON i.Weapon_Used_Cd = w.Weapon_Used_Cd
WHERE w.Weapon_Desc LIKE '%SEMI-AUTOMATIC PISTOL%'
   OR w.Weapon_Desc LIKE '%SIMULATED GUN%'
   OR w.Weapon_Desc LIKE '%OTHER FIREARM%'
   OR w.Weapon_Desc LIKE '%UNKNOWN FIREARM%'
   OR w.Weapon_Desc LIKE '%AIR PISTOL/REVOLVER/RIFLE/BB GUN%'
   OR w.Weapon_Desc LIKE '%RIFLE%'
   OR w.Weapon_Desc LIKE '%REVOLVER%';
