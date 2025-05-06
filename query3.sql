SELECT i.DR_NO, i.`Date Rptd`, i.`DATE OCC`, i.`Vict Sex`, i.`Vict Descent`
FROM incident i
WHERE i.`Weapon Used Cd` NOT IN (
    SELECT DISTINCT `Weapon Used Cd`
    FROM weapon
    WHERE `Weapon Used Cd` IS NOT NULL
);