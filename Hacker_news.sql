-- #1 hacker_news table
-- Find the top 5 stories with the highest score s
select title, score 
from hacker_news
order by score desc
limit 5;

-- #2 Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule).
-- Is this true of Hacker News?
-- Is a small percentage of Hacker News submitters taking the majority of the points?
-- First, find the total score of all the stories.
select sum(score)
from hacker_news;

-- #3 Next, we need to pinpoint the users who have accumulated a lot of points across their stories.
-- Find the individual users who have gotten combined scores of more than 200, and their combined scores.
select user, sum(score)
from hacker_news
group by user
having sum(score) > 200
order by 2 desc;

-- #4 While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding.
--The url of the video is:
-- https://www.youtube.com/watch?v=dQw4w9WgXcQ
-- How many times has each offending user posted this link?
select user, count(*)
from hacker_news
where url like '%watch?v=dQw4w9WgXcQ'
group by 1
order by 2 desc;

-- #5 Hacker News stories are essentially links that take users to other websites.
-- Which of these sites feed Hacker News the most:
-- GitHub, Medium, or New York Times?
-- First, we want to categorize each story based on their source.
-- Add a column for the number of stories from each URL using COUNT().
-- Also, GROUP BY the CASE statement.
select case
 when url like '%github.com%' then
 'GitHub'
 when url like '%medium.com%' then 
 'Medium'
 when url like '%nytimes.com%' then 
 'New York Times'
 else 'Other'
 end as 'Source',
 count(*)
from hacker_news
group by 1;

-- #6&7 Write a query that returns three columns:
-- 1. The hours of the timestamp
-- 2. The average score for each hour
-- 3. The count of stories for each hour

--Edit a few things in the previous query:
-- 1. Round the average scores (ROUND()).
-- 2. Rename the columns to make it more readable (AS).
-- 3. Add a WHERE clause to filter out the NULL values in timestamp.
select strftime('%H', timestamp) as 'hour',
 round(avg(score),1) as 'Average score',
 count(*) as 'number'
from hacker_news
where timestamp is not null
group by 1
order by 2 desc;



