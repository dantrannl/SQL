-- #1 startups table
select *
from startups;

-- #2 Calculate the total number of companies in the table.
select count(*)
from startups;

-- #3 We want to know the total value of all companies in this table.
-- Calculate this by getting the SUM() of the valuation column.
select sum(valuation)
from startups;

-- #4 What is the highest amount raised by a startup? Return the maximum amount of money raised.
select max(raised)
from startups
where stage = 'Seed';

-- #5 Return the average valuation, in each category. Round the averages to two decimal places.
-- Lastly, order the list from highest averages to lowest.
select round(avg(valuation),2), category
from startups
group by 2
order by 1 desc;

-- #6 Next, filter the result to only include categories that have more than three companies in them.
-- What are the most competitive markets?
select category, count(*)
from startups
group by 1
having count(*) > 3
order by 2 desc;

-- #7 What is the average size of a startup in each location, with average sizes above 500?
select location, avg(employees)
from startups
group by 1
having avg(employees) > 500;




