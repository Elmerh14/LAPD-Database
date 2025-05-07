-- MO Codes Never Used in Any Incident (Set Theory) 

SELECT md.Mocodes, md.Description
FROM mocode_description md
LEFT JOIN mocode m ON md.Mocodes = u.Mocodes
WHERE u.Mocodes IS NULL;