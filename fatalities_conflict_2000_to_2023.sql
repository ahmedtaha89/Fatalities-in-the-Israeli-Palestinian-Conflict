-- 1. Select All Rows
USE fatalities_isr_pse_conflict_2000_to_2023;

SELECT *
FROM fatalities_conflict_2000_to_2023;

-- 2. Count of People
SELECT COUNT(name) as 'Num Of Deaths'
FROM fatalities_conflict_2000_to_2023;

-- 3. Total recorded casualties by year
SELECT COUNT(name) AS name_count
	,YEAR(date_of_event) AS event_year
FROM fatalities_conflict_2000_to_2023
GROUP BY YEAR(date_of_event)
HAVING COUNT(name) != 0
ORDER BY event_year DESC;

-- 4. Count of Names by Age
SELECT age
	,COUNT(name) AS name_count
FROM fatalities_conflict_2000_to_2023
GROUP BY age
ORDER BY COUNT(name) DESC;

-- 5. Top 5 Counts of Names by Age
SELECT TOP 5 age
	,COUNT(name) AS name_count
FROM fatalities_conflict_2000_to_2023
GROUP BY age
ORDER BY COUNT(name) DESC;

-- 6. # of people killed by Citizenship
SELECT citizenship
	,COUNT(citizenship)
FROM fatalities_conflict_2000_to_2023
GROUP BY citizenship
HAVING citizenship IS NOT NULL
ORDER BY COUNT(citizenship) DESC;

-- 7. # People killed in Event Location Region
SELECT event_location_region
	,count(name)
FROM fatalities_conflict_2000_to_2023
GROUP BY event_location_region
HAVING event_location_region IS NOT NULL
ORDER BY COUNT(event_location_region) DESC;

-- 8. # People killed in District Location
SELECT event_location_district
	,count(name)
FROM fatalities_conflict_2000_to_2023
GROUP BY event_location_district
HAVING event_location_district IS NOT NULL
ORDER BY COUNT(event_location_district) DESC;

-- 9. Distribtuion Of Gender
SELECT gender
	,COUNT(gender)
FROM fatalities_conflict_2000_to_2023
GROUP BY gender
HAVING gender IS NOT NULL;

-- 10. Distribtuion of injuries
SELECT type_of_injury
	,COUNT(type_of_injury) AS injuries
FROM fatalities_conflict_2000_to_2023
GROUP BY type_of_injury
HAVING type_of_injury IS NOT NULL
ORDER BY injuries DESC;

SELECT killed_by , COUNT(killed_by) 
FROM fatalities_conflict_2000_to_2023
GROUP BY killed_by
HAVING killed_by IS NOT NULL
ORDER BY COUNT(killed_by)  DESC;