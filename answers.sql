-- SELECT basics Tutorial (https://sqlzoo.net/wiki/SELECT_basics)
SELECT population FROM world WHERE name = 'Germany';
SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;


-- SELECT Quiz (https://sqlzoo.net/wiki/SELECT_Quiz)
-- 1. Select the code which produces this table
-- name	population
-- Bahrain	1234571
-- Swaziland	1220000
-- Timor-Leste	1066409
SELECT name, population FROM world
  WHERE population BETWEEN 1000000 AND 1250000

-- 2. Pick the result you would obtain from this code:
--       SELECT name, population
--       FROM world
--       WHERE name LIKE 'Al%'
Table-E 
Albania 	3200000
Algeria 	32900000

-- 3. Select the code which shows the countries that end in A or L 
SELECT name FROM world
  WHERE name LIKE '%a' OR name LIKE '%l'

-- 4. Pick the result from the query
-- SELECT name,length(name)
-- FROM world
-- WHERE length(name)=5 and continent='Europe'
name	length(name)
Italy	5
Malta	5
Spain	5

-- 5. Here are the first few rows of the world table:
-- name 	region 	area 	population 	gdp
-- Afghanistan 	South Asia 	652225 	26000000 	
-- Albania 	Europe 	28728 	3200000 	6656000000
-- Algeria 	Middle East 	2400000 	32900000 	75012000000
-- Andorra 	Europe 	468 	64000 	
-- ...
-- Pick the result you would obtain from this code:
-- `SELECT name, area*2 FROM world WHERE population = 64000`
Andorra	936

-- 6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000
SELECT name, area, population
  FROM world
  WHERE area > 50000 AND population < 10000000

-- 7. Select the code that shows the population density of China, Australia, Nigeria and France
SELECT name, population/area
  FROM world
  WHERE name IN ('China', 'Nigeria', 'France', 'Australia')


/*****************************************************************************/

-- SELECT from WORLD Tutorial (https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial)


-- 1 Introduction
SELECT name, continent, population FROM world;

-- 2 Large Countries
SELECT name
  FROM world
  WHERE population > 200000000;

-- 3 Per capita GDP
SELECT name, gdp/population AS per_capita_GDP FROM world
  WHERE population >= 200000000 ORDER BY per_capita_GDP DESC;

-- 4 South America In millions
SELECT name, population/1000000 AS pop_in_millions FROM world
  WHERE continent = 'South America';

-- 5 France, Germany, Italy
SELECT name, population FROM world
  WHERE name IN ('France', 'Germany', 'Italy');

-- 6 United
SELECT name FROM world WHERE name LIKE '%United%';

-- 7 Two ways to be big
SELECT name, population, area FROM world
  WHERE area > 3000000 OR population > 250000000;

-- 8 One or the other (but not both)
SELECT name, population, area FROM world
  WHERE (area > 3000000 AND population < 250000000)
    OR (area < 3000000 AND population > 250000000);

-- 9 Rounding
SELECT
    name,
    ROUND(population/1000000, 2) AS pop_in_millions,
    ROUND(GDP/1000000000, 2) GDP_in_billions
  FROM world
  WHERE continent = 'South America';

-- 10 Trillion dollar economies
SELECT name, ROUND((GDP/population)/1000,0)*1000 AS GPD_per_capita FROM world
  WHERE GDP > 1000000000000;

-- 11 Name and capital have the same length
SELECT name, capital FROM world
  WHERE LENGTH(name) = LENGTH(capital)

-- 12 Matching name and capital
SELECT name, capital FROM world
  WHERE LEFT(name, 1) = LEFT(capital, 1)
    AND name <> capital;

-- 13 All the vowels
SELECT name FROM world
  WHERE (name LIKE 'A%' OR name LIKE '%a%') AND
        (name LIKE 'E%' OR name LIKE '%e%') AND
        (name LIKE 'I%' OR name LIKE '%i%') AND
        (name LIKE 'O%' OR name LIKE '%o%') AND
        (name LIKE 'U%' OR name LIKE '%u%') AND
        (name NOT LIKE '% %');



-- BBC QUIZ (https://sqlzoo.net/wiki/BBC_QUIZ)
-- 1. Select the code which gives the name of countries beginning with U
SELECT name
  FROM world
  WHERE name LIKE 'U%'

-- 2. Select the code which shows just the population of United Kingdom?
SELECT population
  FROM world
  WHERE name = 'United Kingdom'

-- 3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
-- SELECT continent 
--   FROM world 
--   WHERE 'name' = 'France'
'name' should be name

-- 4. Select the result that would be obtained from the following code:
--  SELECT name, population / 10 
--   FROM world 
--  WHERE population < 10000
Nauru	990

-- 5. Select the code which would reveal the name and population of countries in Europe and Asia
SELECT name, population
  FROM world
  WHERE continent IN ('Europe', 'Asia')

-- 6. Select the code which would give two rows
SELECT name FROM world
  WHERE name IN ('Cuba', 'Togo')

-- 7. Select the result that would be obtained from this code:

-- SELECT name FROM world
--  WHERE continent = 'South America'
--    AND population > 40000000
Brazil
Colombia
