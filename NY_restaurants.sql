-- #1 nomnom table
select *
from nomnom;

-- #2 What are the distinct neighborhoods?
select distinct neighborhood
from nomnom;

-- #3 What are the distinct cuisine types?
select distinct cuisine 
from nomnom;

-- #4 Suppose we would like some Chinese takeout. What are our options?
select *
from nomnom
where cuisine = 'Chinese';

-- #5 Return all the restaurants with reviews of 4 and above.
select *
from nomnom
where review >= 4;

-- #6 Return all the restaurants that are Italian and $$$.
select *
from nomnom
where cuisine = 'Italian' and
 price = '$$$';

 -- #7 Find the restaurant with the word 'meat ball' in the name.
 select *
 from nomnom
 where name like '%meatball%';

 -- #8 Find all the close by spots in Midtown, Downtown or Chinatown.
select *
from nomnom
where neighborhood = 'Midtown' or 
      neighborhood = 'Downtown' or
      neighborhood = 'Chinatown';

-- #9 Find all the health grade pending restaurants (empty values).
select *
from nomnom
where health is null;

-- #10 Create a Top 10 Restaurants Ranking based on review.
select *
from nomnom
order by review desc
limit 10;

-- #11 Use a CASE statement to change the rating system to..
select name,
case
 when review > 4.5 then 'Extraordinary'
 when review > 4 then 'Excellent'
 when review > 3 then 'Good'
 when review > 2 then 'Fair'
 else 'Poor'
end as 'Review'
from nomnom;

