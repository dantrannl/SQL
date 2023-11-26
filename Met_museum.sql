-- #1 met table
select *
from met
limit 10;

-- #2 How many pieces are in the American Decorative Art collection?
select count(*)
from met;

--#3 Celery was considered a luxurious snack in the Victorian era (around the 1800s). Wealthy families served stalks of it in intricate glass vases.
-- Count the number of pieces where the category includes ‘celery’.
select count(*)
from met
where category like '%celery%';

-- #4 Find the title and medium of the oldest piece(s) in the collection.
select min(date)
from met; -- result is 1600 - 1700

select date, title, medium
from met
where date like '%1600%';

-- #5 Not every American decoration is from the Americas… where are they are coming from? Find the top 10 countries with the most pieces in the collection.
select country, count(*)
from met
group by 1
order by 2 desc
limit 10;

-- #6 There are all kinds of American decorative art in the Met’s collection.Find the categories HAVING more than 100 pieces.
select category, count(*)
from met
group by 1
having count(*) > 100;

-- #7 Lastly, let’s look at some bling! Count the number of pieces where the medium contains ‘gold’ or ‘silver’.
-- And sort in descending order.
select count(*),
 case
 when medium like '%gold%' then 'Gold'
 when medium like '%silver%' then 'Silver'
 else null
end as 'Bling'
from met
where Bling is not null
group by 2
order by 1 desc;