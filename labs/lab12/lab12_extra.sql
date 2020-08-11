.read lab12.sql

CREATE TABLE sp19favpets AS
  SELECT pet, count(*) as c from students group by pet order by c desc limit 10;


CREATE TABLE sp19dog AS
  SELECT pet, count(*) as c from students group by pet where pet = "dog";


CREATE TABLE sp19alldogs AS
  SELECT pet, count(*) as c from students group by pet where pet like '%dog%';


CREATE TABLE obedienceimages AS
  SELECT seven, animal, count(*) from students group by animal where seven = '7';

CREATE TABLE smallest_int_count AS
  SELECT smallest, count(*) from students group by smallest order by smallest;

CREATE TABLE sals AS
  SELECT supervisor, sum(salary) from records group by supervisor;

CREATE TABLE meets AS
  SELECT days, count(*) from records group by days where count < 6;

