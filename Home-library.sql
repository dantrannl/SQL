
CREATE TABLE Books (
  id int PRIMARY KEY,
  Title TEXT,
  Author TEXT,
  Genre TEXT,
  Year_published int,
  Price varchar(50),
  Status TEXT,
  Rating varchar(50),
  Comment TEXT);
  
insert into Books VALUES (1, "Daughter of Moon Goddess", "Sue Lyn Tan", "Fantasy, Romance, Mythology", 2022, "£16.99", "Not finished", " ", " ");
insert or Ignore into Books VALUES (2, "Norwegian Wood", "Haruki Murakami", "Fiction, Romance", 1987, "£9.99", "Not finished", " ", "Not really loving the mysogynist undertone. Beautiful description of scenery");
insert or Ignore into Books VALUES (3, "On Earth We're Briefly Gorgeous", "Ocean Vuong", "Comtemporary fiction, LGBTQ", 2019, "£8.99", "Finished", "9/10", "Hits too close to home");
insert or Ignore into Books VALUES (4, "No longer human", "Osamu Dazai", "Fiction, Classics", 1948, "£10.99", "Finished", "9/10", "Painfully relatable");
insert or Ignore into Books VALUES (5, "Before the coffee gets cold", "Toshikazu Kawaguchi", "Comtemporary fiction, Magical Realism, Fantasy", 2015, "£9.99", "Finished", "10/10", "I cried");
insert or Ignore into Books VALUES (6, "Tales from the cafe", "Toshikazu Kawaguchi", "Comtemporary fiction, Magical Realism, Fantasy",2017, "£9.99", "Finished", "10/10", "I cried");
insert or Ignore into Books VALUES (7, "The Vegetarian", "Han Kang", "Comtemporary fiction, Horror", 2007, "£8.99", "Finished", "10/10", "Would die to read it again for the first time");
insert or Ignore into Books VALUES (8, "The White Book", "Han Kang", "Poetry, Comtemporary fiction", 2016, "£8.99", "Not finished", " ", "Not as interesting as I thought");
insert or Ignore into Books VALUES (9, "Convenience Store Woman", "Sayaka Murata", "Comtemporary fiction", 2016, "£9.99", "Not finished", " ", " ");
insert or Ignore into Books VALUES (10, "Shoko's Smile", "Choi Eunyoung", "Comtemporary fiction", 2016, "£9.99", "Not started", " ", " ");
insert or Ignore into Books VALUES (11, "The Master and the Margarita", "Mikhail Bulgakov", "Fiction, Fantasy, Magical Realism", 1967, "£10.99", "Not finished", " ", "Interesting but not an easy read");
insert or Ignore into Books VALUES (12, "The Haunting of Hill house", "Shirley Jackson", "Horror, Fiction, Mystery", 1959, "£9.99", "Finished", "9/10", "Spooky");
insert or Ignore into Books VALUES (13, "Girl in pieces", "Kathleen Glassgow", "Comtemporary fiction, Mental Health, Romance", 2016, "£9.99", "Finished", "10/10", "Completely destroyed me. Loved it so much got a quote tattooed");
insert or Ignore into Books VALUES (14, "The Virgin Suicides", "Jeffrey Eugenides", "Comtemporary fiction, Classics", 1993, "£9.99", "Not started", " ", "Heard it's good");
insert or Ignore into Books VALUES (15, "A Street Cat named Bob", "James Bowen", "Biography, Memoir", 2012, "£9.99", "Finished", "8/10", "Cute as hell");
insert or Ignore into Books VALUES (16, "They both died at the end", "Adam Silvera", "Comtemporary fiction, Romance, LGBTQ", 2017, "£9.99", "Finished", "6/10", "Teenage me would have loved this");
insert or Ignore into Books VALUES (17, "The Kiss Quotient", "Helen Hoang", "Comtemporary fiction, Romance", 2018, "£9.99", "Finished", "7/10", "Not really my type of book. Straight up smut");
insert or Ignore into Books VALUES (18, "Children's Encyclopedia", "Christopher Lloyd", "Science, Non-fiction", 2020, "£21.99", "Finished", "10/10", " ");
insert or Ignore into Books VALUES (19, "The Collector", "John Fowles", "Fiction, Classics, Thriller, Mystery", 1963, "£9.99", "Finished", "7/10", "Boring. Would rather do something else");
insert or Ignore into Books VALUES (20, "The Picture of Dorian Gray", "Oscar Wilde", "Classics, Fiction, Horror, Mystery", 1890, "£10.99", "Not started", " ", " ");
show table;

--Queries

--Sort the books in alphabetical order
Select *
from Books order by Title ASC;

--Sort the books from best to worst rating
Select id, Title, Author, Rating ,
	CASE
    	when Rating like "10/10" then substr(Rating, 1, 2)
        ELSE trim(Rating, '/10') 
    end as NewRating
from Books
where Rating is not " "
ORDER BY CAST(NewRating AS INTEGER) DESC;

--Sort books by prices DESC
Select price, 
	CASE
    	when Price like '%1%' then substr(Price, 2, 5) 
        else substr(Price, 2, 4)
    End as NewPrice
from Books
ORder by CAST(NewPrice AS INTEGER) DESC;

--How many books have i read, not read and not finished
Select count(Status) as Finished
from Books
where Status like "F%";

Select count(Status) as Unfinished
from Books
where Status like "Not F%";

Select count(Status) as NotStarted
from Books
where Status like "Not s%";
