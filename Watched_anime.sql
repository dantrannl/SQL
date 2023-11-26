-- Create a table containing all the anime I have watched 
 create table watched_anime(
	id INTEGER PRIMARY KEY,
    title TEXT,
  	episodes INTEGER,
  	status TEXT,
  	genre TEXT);

INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Hunter X Hunter", 148, "Finished airing", "Action, Adventure, Fantasy");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Dorohedoro", 12, "Finished airing", "Action, Horror, Fantasy");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Attack on Titan", 88, "Not finished", "Action, Drama");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Beastar", 12, "Finished airing", "Drama, Slice of life");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Jujutsu Kaisen", 24, "Finished airing", "Action, Fantasy");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Haikyuu", 85, "Finished airing", "Sports");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Naruto", 220, "Finished airing", "Action, Adventure, Fantasy");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Spirited Away", 1, "Finished airing", "Adventure, Supernatural");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Howl's moving castle", 1, "Finished airing", "Adventure, Fantasy, Romance");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("My neighbour Totoro", 1, "Finished airing", "Adventure, Supernatural");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Ponyo", 1, "Finished airing", "Adventure, Fantasy");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Kiki's delivery service", 1, "Finished airing", "Adventure, Fantasy");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("The Cat's return", 1, "Finished airing", "Adventure, Fantasy");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Anohana", 1, "Finished airing", "Drama, Supernatural");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Monthly Girl's Nozaki-kun", 12, "Finished airing", "Comedy, Romance");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("A Silent Voice", 1, "Finished airing", "Drama");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Doraemon", 1787, "Finished airing", "Adventure, Comedy, Fantasy");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Detective Conan", " ", "Not finished", "Adventure, Mystery");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Junji Ito: Collection", 12, "Finished airing", "Drama, Horror, Mystery");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Saiki K", 120, "Finished airing", "Comedy, Supernatural");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Cardcaptor Sakura", 70, "Finished airing", "Adventure, Fantasy, Romance");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Kakegurui", 24, "Finished airing", "Drama, Mystery");
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("Devilman Crybaby", 10, "Finished airing", "Fantasy, Horror, Supernatural");

select *
from watched_anime;

-- Sort anime that have the lowest to highest number of episodes
select *
from watched_anime
order by episodes ASC;

-- Which anime is a movie, which anime is a tv show
select *,
 case 
  when episodes > 1 then "Series"
  else "Movies"
 End as type
from watched_anime;

-- List the names of the genre (Not completed)
select VALUES
from 
  watched_anime
  CROSS APPLY STRING_SPLIT(genre, ',');

-- Practice deleting data from table
INSERT INTO watched_anime(title, episodes, status, genre) VALUES ("One Piece", " ", "Not finished", "Action, Adventure, Fantasy");
Delete from watched_anime where title = "One Piece";
