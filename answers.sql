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

/*****************************************************************************/

-- SELECT from Nobel Tutorial (https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial)

-- 1 Winners from 1950
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950;

-- 2 1962 Literature
SELECT winner
  FROM nobel
  WHERE yr = 1962 AND subject = 'Literature'

-- 3 Albert Einstein
SELECT yr, subject FROM nobel
  WHERE winner = 'Albert Einstein';

-- 4 Recent Peace Prizes
SELECT winner FROM nobel
  WHERE yr > 1999 AND subject = 'Peace';

-- 5 Literature in the 1980's
SELECT yr, subject, winner FROM nobel
  WHERE yr BETWEEN 1980 AND 1989
    AND subject = 'Literature';

-- 6 Only Presidents
SELECT * FROM nobel
 WHERE winner in ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

-- 7 John
SELECT winner FROM nobel WHERE winner LIKE 'John%';

-- 8 Chemistry and Physics from different years
SELECT * FROM nobel
  WHERE (yr = 1980 AND subject = 'Physics')
    OR (yr = 1984 AND subject = 'Chemistry');

-- 9 Exclude Chemists and Medics
SELECT * FROM nobel
  WHERE yr = 1980
    AND subject NOT IN ('Chemistry', 'Medicine');

-- 10 Early Medicine, Late Literature
SELECT * FROM nobel
  WHERE (yr < 1910 AND subject = 'Medicine')
    OR (yr >= 2004 AND subject = 'Literature');

-- Harder Questions
-- 11 Umlaut
SELECT * FROM nobel
  WHERE winner = 'Peter Grünberg';

-- 12 Apostrophe
SELECT * FROM nobel
  WHERE winner = 'Eugene O\'Neill';

'

-- 13 Knights of the realm
SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir%'
    ORDER BY yr DESC, winner;

-- 14 Chemistry and Physics last
SELECT winner, subject FROM nobel
  WHERE yr = 1984
    ORDER BY subject IN ('Chemistry', 'Physics'), subject, winner;



-- Nobel Quiz (https://sqlzoo.net/wiki/Nobel_Quiz)

-- 1. Pick the code which shows the name of winner's names beginning with C and ending in n
SELECT winner FROM nobel
  WHERE winner LIKE 'C%' AND winner LIKE '%n'

-- 2. Select the code that shows how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) FROM nobel
  WHERE subject = 'Chemistry'
    AND yr BETWEEN 1950 and 1960

-- 3. Pick the code that shows the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

-- 4. Select the result that would be obtained from the following code:
-- SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet

-- 5. Select the code which would show the year when neither a Physics or Chemistry award was given
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

-- 6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

-- 7. Pick the result that would be obtained from the following code:
--  SELECT subject, COUNT(subject) 
--    FROM nobel 
--   WHERE yr ='1960' 
--   GROUP BY subject
Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1


/*****************************************************************************/

-- SELECT within SELECT Tutorial


-- 1 Bigger than Russia
SELECT name FROM world
  WHERE population >
      (SELECT population FROM world
        WHERE name='Russia');

-- 2 Richer than UK
SELECT name FROM world
  WHERE continent = 'Europe' 
    AND gdp/population > 
      (SELECT gdp/population FROM world
        WHERE name = 'United Kingdom')

-- 3 Neighbours of Argentina and Australia
SELECT name, continent FROM world
  WHERE continent IN
    (SELECT DISTINCT continent FROM world
      WHERE name IN ('Argentina', 'Australia'))
        ORDER BY name;

-- 4 Between Canada and Poland
SELECT name, population FROM world
  WHERE population > (SELECT population FROM world WHERE name = 'Canada')
    AND population < (SELECT population FROM world WHERE name = 'Poland');

-- 5 Percentages of Germany
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany'), 0), '%') AS percentage FROM world WHERE continent = 'Europe';

-- 6 Bigger than every country in Europe
SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp IS NOT NULL)

-- 7 Largest in each continent
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent = x.continent
          AND area IS NOT NULL);

-- 8 First country of each continent (alphabetically)
SELECT DISTINCT continent, name FROM world x
  WHERE name <= ALL (SELECT name FROM world y
                      WHERE x.continent = y.continent);

-- Difficult Questions That Utilize Techniques Not Covered In Prior Sections
-- 9 Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population FROM world
  WHERE continent IN
    (SELECT DISTINCT continent FROM world x
      WHERE 25000000 >=
        ALL(SELECT population FROM world y
          WHERE x.continent = y.continent))

-- 10 Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent FROM world x 
  WHERE x.population/3 >=
    ALL(SELECT population FROM world y
      WHERE y.continent = x.continent
        AND x.name != y.name)




-- Nested SELECT Quiz (https://sqlzoo.net/wiki/Nested_SELECT_Quiz)

-- 1. Select the code that shows the name, region and population of the smallest country in each region
SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

-- 2. Select the code that shows the countries belonging to regions with all populations over 50000
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

-- 3. Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

-- 4. Select the result that would be obtained from the following code:
-- SELECT name FROM bbc
--  WHERE population >
--        (SELECT population
--           FROM bbc
--          WHERE name='United Kingdom')
--    AND region IN
--        (SELECT region
--           FROM bbc
--          WHERE name = 'United Kingdom')
Table-D
France
Germany
Russia
Turkey


-- 5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')


-- 6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')

-- 7. Select the result that would be obtained from the following code:
-- SELECT name FROM bbc
--  WHERE population > ALL
--        (SELECT MAX(population)
--           FROM bbc
--          WHERE region = 'Europe')
--    AND region = 'South Asia'
Table-B
Bangladesh
India
Pakistan
