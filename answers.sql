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



/*****************************************************************************/

-- SUM and COUNT Tutorial (https://sqlzoo.net/wiki/SUM_and_COUNT)


-- 1 Total world population
SELECT SUM(population)
FROM world

-- 2 List of continents
SELECT DISTINCT continent FROM world

-- 3 GDP of Africa
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

-- 4 Count the big countries
SELECT COUNT(name) FROM world WHERE area >= 1000000

-- 5 Baltic states population
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- 6 Counting the countries of each continent
SELECT continent, COUNT(name) AS number_of_countries FROM world GROUP BY continent

-- 7 Counting big countries in each continent
SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent

-- 8 Counting big continents
SELECT continent FROM world GROUP BY continent HAVING SUM(population) > 100000000


-- SUM and COUNT Quiz (https://sqlzoo.net/wiki/SUM_and_COUNT_Quiz)

-- 1. Select the statement that shows the sum of population of all countries in 'Europe'
SELECT SUM(population) FROM bbc WHERE region = 'Europe'

-- 2. Select the statement that shows the number of countries with population smaller than 150000
SELECT COUNT(name) FROM bbc WHERE population < 150000

-- 3. Select the list of core SQL aggregate functions
AVG(), COUNT(), MAX(), MIN(), SUM()

-- 4. Select the result that would be obtained from the following code:
--  SELECT region, SUM(area)
--    FROM bbc 
--   WHERE SUM(area) > 15000000 
--   GROUP BY region
No result due to invalid use of the WHERE function

-- 5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

-- 6. Select the statement that shows the medium population density of each region
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- 7. Select the statement that shows the name and population density of the country with the largest population
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

-- 8. Pick the result that would be obtained from the following code:
--  SELECT region, SUM(area) 
--    FROM bbc 
--   GROUP BY region 
--   HAVING SUM(area)<= 20000000
Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710




/*****************************************************************************/
-- The JOIN operation Tutorial (https://sqlzoo.net/wiki/The_JOIN_operation)

-- 1. Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'


-- 2. Show id, stadium, team1, team2 for just game 1012
SELECT id, stadium, team1, team2 FROM game
  WHERE id = 1012

-- 3. Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT goal.player, goal.teamid, game.stadium, game.mdate FROM game JOIN goal ON goal.teamid = 'GER' AND goal.matchid = game.id

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT game.team1, game.team2, goal.player FROM game JOIN goal WHERE goal.matchid = game.id AND player LIKE 'Mario%'

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id AND gtime <= 10

-- 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname FROM game JOIN eteam ON team1 = eteam.id AND coach = 'Fernando Santos'

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player FROM goal JOIN game ON matchid = id AND stadium = 'National Stadium, Warsaw'


-- 8. Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (teamid <> 'GER' AND (team1 = 'GER' OR team2 = 'GER'))


-- 9. Show teamname and the total number of goals scored.
SELECT teamname, COUNT(player) AS goals
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname

-- 10. Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(player) AS goals_scored FROM game JOIN goal ON id = matchid GROUP BY stadium

-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate AS date, COUNT(teamid) AS goals
  FROM game JOIN goal ON matchid = id WHERE team1 = 'POL' OR team2 = 'POL' GROUP BY matchid, date

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(teamid) AS goals
  FROM game JOIN goal ON matchid = id WHERE teamid = 'GER' GROUP BY matchid, mdate

-- 13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
-- mdate	team1	score1	team2	score2
-- 1 July 2012	ESP	4	ITA 	0
-- 10 June 2012	ESP	1	ITA	1
-- 10 June 2012	IRL	1	CRO	3
-- ...
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, matchid, team1, team2;


-- JOIN Quiz (https://sqlzoo.net/wiki/JOIN_Quiz)

-- 1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:
game  JOIN goal ON (id=matchid)

-- 2. You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:
matchid, teamid, player, gtime, id, teamname, coach

-- 3. Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

-- 4. Select the result that would be obtained from this code:
-- SELECT DISTINCT teamid, mdate
--   FROM goal JOIN game on (matchid=id)
--  WHERE mdate = '9 June 2012'
DEN	9 June 2012
GER	9 June 2012

-- 5. Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
  SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'

-- 6. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

-- 7. Select the result that would be obtained from this code:
-- SELECT teamname, COUNT(*)
--   FROM eteam JOIN goal ON teamid = id
--  GROUP BY teamname
-- HAVING COUNT(*) < 3
Netherlands	2
Poland	2
Republic of Ireland	1
Ukraine	2


/*****************************************************************************/

-- More JOIN operations (https://sqlzoo.net/wiki/More_JOIN_operations)


-- 1 1962 movies
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2 When was Citizen Kane released?
SELECT yr FROM movie WHERE title = 'Citizen Kane'

-- 3 Star Trek movies
SELECT id, title, yr FROM movie WHERE title LIKE '%Star Trek%' ORDER BY yr

-- 4 id for actor Glenn Close
SELECT id FROM actor WHERE name = 'Glenn Close'

-- 5 id for Casablanca
SELECT id FROM movie WHERE title = 'Casablanca'

-- 6 Cast list for Casablanca
SELECT name FROM actor JOIN casting ON id=actorid WHERE movieid=11768

-- 7 Alien cast list
SELECT name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE title = 'Alien'

-- 8 Harrison Ford movies
SELECT title FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE name = 'Harrison Ford'

-- 9 Harrison Ford as a supporting actor
SELECT title FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE name = 'Harrison Ford' AND ord > 1

-- 10 Lead actors in 1962 movies
SELECT title, name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE yr = 1962 AND ord = 1

-- 11 Busy years for Rock Hudson
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12 Lead actor in Julie Andrews movies
SELECT title, name FROM
  movie JOIN casting ON movie.id = movieid
        JOIN actor   ON actorid=actor.id
          WHERE movie.id IN (SELECT movieid FROM casting
                              WHERE actorid IN (
                                SELECT id FROM actor
                                WHERE name='Julie Andrews')) 
                AND ord = 1

-- 13 Actors with 15 leading roles
SELECT name FROM casting JOIN actor ON (actorid = actor.id AND ord = 1) GROUP BY name HAVING COUNT(*) >= 15


-- 14 List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actorid) FROM movie JOIN casting ON movieid = movie.id WHERE yr = 1978 GROUP BY title ORDER BY COUNT(actorid) DESC, title

-- 15 List all the people who have worked with 'Art Garfunkel'.
SELECT name FROM casting JOIN actor ON actorid = actor.id WHERE name != 'Art Garfunkel' AND movieid IN (SELECT movieid FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE name = 'Art Garfunkel')


-- JOIN Quiz 2 (https://sqlzoo.net/wiki/JOIN_Quiz_2)

-- 1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

-- 2. Select the correct example of JOINing three tables
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

-- 3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

-- 4. Select the result that would be obtained from the following code:

--  SELECT title 
--    FROM movie JOIN casting ON (movieid=movie.id)
--               JOIN actor   ON (actorid=actor.id)
--   WHERE name='Paul Hogan' AND ord = 1
Table-B
"Crocodile" Dundee
Crocodile Dundee in Los Angeles
Flipper
Lightning Jack

-- 5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351


-- 6. There are two sensible ways to connect movie and actor. They are:
- link the director column in movies with the primary key in actor
- connect the primary keys of movie and actor via the casting table

-- 7. Select the result that would be obtained from the following code:
--  SELECT title, yr 
--    FROM movie, casting, actor 
--   WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3
Table-B
A Bronx Tale	1993
Bang the Drum Slowly	1973
Limitless	2011


/*****************************************************************************/

-- Using Null (https://sqlzoo.net/wiki/Using_Null)

-- 1. List the teachers who have NULL for their department.
SELECT name FROM teacher WHERE dept IS NULL

-- 2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3. Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- 4. Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

-- 5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

-- 6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON teacher.dept = dept.id

-- 7. Use COUNT to show the number of teachers and the number of mobile phones.
SELECT COUNT(name), COUNT(mobile) FROM teacher

-- 8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id GROUP BY dept.name

-- 9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT name, CASE WHEN dept IN (1, 2) THEN 'Sci' ELSE 'Art' END AS name FROM teacher

-- 10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT name, 
        CASE 
          WHEN dept IN (1, 2) THEN 'Sci'
          WHEN dept = 3 THEN 'Art'
        ELSE 'None'
        END AS name 
          FROM teacher



-- Using Null Quiz (https://sqlzoo.net/wiki/Using_Null_Quiz)


-- 1. Select the code which uses an outer join correctly.
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

-- 2. Select the correct statement that shows the name of department which employs Cutflower
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

-- 3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

-- 4. Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:
display 0 in result column for all teachers without department


-- 5. Query:
-- SELECT name,
--        CASE WHEN phone = 2752 THEN 'two'
--             WHEN phone = 2753 THEN 'three'
--             WHEN phone = 2754 THEN 'four'
--             END AS digit
--   FROM teacher
'four' for Throd

-- 6. Select the result that would be obtained from the following code:
--  SELECT name, 
--       CASE 
--        WHEN dept 
--         IN (1) 
--         THEN 'Computing' 
--        ELSE 'Other' 
--       END 
--   FROM teacher
Table-A
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	Other
Cutflower	Other
Deadyawn	Other


/*****************************************************************************/

-- Self join Tutorial (https://sqlzoo.net/wiki/Self_join)

-- 1. How many stops are in the database.
SELECT COUNT(*) FROM stops;

-- 2. Find the id value for the stop 'Craiglockhart'
SELECT id FROM stops WHERE name = 'Craiglockhart'

-- 3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name FROM stops JOIN route ON stop = id WHERE company = 'LRT' and num = '4'

-- 4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

-- 5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

-- 6. The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

-- 7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) WHERE a.stop=115 AND b.stop=137

-- 8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON a.stop=stopa.id JOIN stops stopb ON b.stop=stopb.id WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'

-- 9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT stopb.name, a.company, a.num FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON stopa.id=a.stop JOIN stops stopb ON b.stop=stopb.id WHERE stopa.name='Craiglockhart'

-- 10. Find the routes involving two buses that can go from Craiglockhart to Lochend.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus.
SELECT first.num, first.company, name, second.num, second.company FROM
(SELECT DISTINCT a.company, a.num, b.stop FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops ON a.stop=id WHERE name='Craiglockhart') AS first
JOIN
(SELECT DISTINCT a.company, a.num, b.stop FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops ON a.stop=id WHERE name='Lochend') AS second
ON first.stop=second.stop JOIN stops ON id=first.stop
ORDER BY first.num, first.company, name, second.num, second.company




-- Self join Quiz (https://sqlzoo.net/wiki/Self_join_Quiz)

-- 1. Select the code that would show it is possible to get from Craiglockhart to Haymarket
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

-- 2. Select the code that shows the stops that are on route.num '2A' which can be reached with one bus from Haymarket?
SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A'

-- 3. Select the code that shows the services available from Tollcross?
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross'





/*****************************************************************************/