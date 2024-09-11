/*
Term Project Description and Requirements
MSIT 630 Database Systems
Total: 25 points
Description
You are required to design and implement a small database application to manage any data you are
interested in. Some examples are listed below for your reference:
1, if you have a collection of CDs, you can manage the data of albums, musicians, songs,
companies etc.
2, if you are interested in NBA/NFL games, you can manage the data of players, teams,
coaches, matches etc.
3, you can also manage your favorite movies by storing and manipulating the data of movies,
actors/actresses, directors etc.
Design and Implementation
Perform the conceptual database design using Entity-Relationship model. You must submit the
Entity-Relationship diagram of your database. In the E-R diagram,
1, there must be at least 4 entities;
2, there must be at least 2 one-to-many/one-to-one relationships;
3, there must be at least 1 many-to-many relationship.
Convert your E-R diagram to logical database model. You are to design the table structure, including
all needed attributes for each table. You must submit the relational database schema, which consists
of the description of all tables, constraints in your database. For each table, please specify the
primary key and foreign keys.
Implement your design using any DBMS. You are required to create all the tables and develop
queries in the target DBMS. You must generate and load appropriate, consistent data into your
database. Two options are listed below,
1, MySQL: for this option, you must submit the DDL statements you used to create the
tables, to define the constraints, and the SQL statements for all the queries;
2, Microsoft Office Access: for this option, you must submit the screen snapshots of design
views of all tables and queries. For each query, the equivalent SQL statement must be
provided as well. You must also include the database relationships diagram, which shows the
relationships between tables.
For other DBMSs, the requirements are similar to option#1. The bottom line is that you have to
submit materials to show how you created the tables and queries.
Queries
You must design and develop at least 6 queries in your database application, among them,
1, at least 2 queries are multi-table queries;
2, at least 2 queries use SQL aggregate functions;
3, at least 1 query uses subquery;
4, NULL search condition should be used at least once;
5, GROUP BY and HAVING clause should be used as least once
*/


-- Create the database
CREATE DATABASE IF NOT EXISTS MovieDB;
USE MovieDB;

-- Table: Movies
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year YEAR NOT NULL,
    duration_minutes INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    genre_id INT,
    director VARCHAR(255) NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Table: Genres
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Table: Actors
CREATE TABLE Actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

-- Table: Users (1-to-1 with UserProfiles)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Table: UserProfiles (1-to-1 with Users)
CREATE TABLE UserProfiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Many-to-Many Relationship: Movies and Actors
CREATE TABLE MovieActors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

-- Insert Genres
INSERT INTO Genres (genre_name) VALUES
('Action'), ('Comedy'), ('Drama'), ('Thriller'), ('Sci-Fi'), ('Horror'), ('Romance');

-- Insert Actors
INSERT INTO Actors (first_name, last_name) VALUES
('Robert', 'Downey Jr.'),
('Chris', 'Hemsworth'),
('Scarlett', 'Johansson'),
('Brad', 'Pitt'),
('Angelina', 'Jolie'),
('Tom', 'Hanks'),
('Leonardo', 'DiCaprio'),
('Johnny', 'Depp'),
('Emma', 'Stone'),
('Jennifer', 'Lawrence'),
('Denzel', 'Washington'),
('Morgan', 'Freeman'),
('Matt', 'Damon'),
('Tom', 'Cruise'),
('Anne', 'Hathaway');

-- Insert Movies
INSERT INTO Movies (title, release_year, duration_minutes, rating, genre_id, director) VALUES
('Iron Man', 2008, 126, 7.9, 1, 'Jon Favreau'),
('Avengers: Endgame', 2019, 181, 8.4, 1, 'Anthony Russo'),
('Inception', 2010, 148, 8.8, 5, 'Christopher Nolan'),
('Fight Club', 1999, 139, 8.8, 4, 'David Fincher'),
('The Matrix', 1999, 136, 8.7, 5, 'The Wachowskis'),
('Titanic', 1997, 195, 7.8, 7, 'James Cameron'),
('Forrest Gump', 1994, 142, 8.8, 3, 'Robert Zemeckis'),
('The Wolf of Wall Street', 2013, 180, 8.2, 3, 'Martin Scorsese'),
('Pirates of the Caribbean', 2003, 143, 8.0, 1, 'Gore Verbinski'),
('La La Land', 2016, 128, 8.0, 7, 'Damien Chazelle'),
('The Dark Knight', 2008, 152, 9.0, 1, 'Christopher Nolan'),
('Shutter Island', 2010, 138, 8.2, 4, 'Martin Scorsese'),
('Interstellar', 2014, 169, 8.6, 5, 'Christopher Nolan'),
('The Departed', 2006, 151, 8.5, 3, 'Martin Scorsese'),
('Mad Max: Fury Road', 2015, 120, 8.1, 1, 'George Miller'),
('Gladiator', 2000, 155, 8.5, 1, 'Ridley Scott'),
('Joker', 2019, 122, 8.5, 4, 'Todd Phillips'),
('Pulp Fiction', 1994, 154, 8.9, 4, 'Quentin Tarantino'),
('Django Unchained', 2012, 165, 8.4, 4, 'Quentin Tarantino'),
('The Silence of the Lambs', 1991, 118, 8.6, 6, 'Jonathan Demme'),
('The Godfather', 1972, 175, 9.2, 3, 'Francis Ford Coppola'),
('The Godfather: Part II', 1974, 202, 9.0, 3, 'Francis Ford Coppola'),
('The Shawshank Redemption', 1994, 142, 9.3, 3, 'Frank Darabont'),
('Schindler\'s List', 1993, 195, 9.0, 3, 'Steven Spielberg'),
('Braveheart', 1995, 178, 8.4, 1, 'Mel Gibson'),
('The Avengers', 2012, 143, 8.0, 1, 'Joss Whedon'),
('Guardians of the Galaxy', 2014, 121, 8.0, 5, 'James Gunn'),
('Spider-Man: Homecoming', 2017, 133, 7.4, 1, 'Jon Watts'),
('Thor: Ragnarok', 2017, 130, 7.9, 1, 'Taika Waititi'),
('Black Panther', 2018, 134, 7.3, 1, 'Ryan Coogler'),
('Wonder Woman', 2017, 141, 7.4, 1, 'Patty Jenkins'),
('The Lion King', 1994, 88, 8.5, 3, 'Roger Allers'),
('Frozen', 2013, 102, 7.4, 7, 'Chris Buck'),
('Finding Nemo', 2003, 100, 8.1, 7, 'Andrew Stanton'),
('Up', 2009, 96, 8.2, 7, 'Pete Docter'),
('Toy Story', 1995, 81, 8.3, 7, 'John Lasseter'),
('Toy Story 3', 2010, 103, 8.3, 7, 'Lee Unkrich'),
('Inside Out', 2015, 95, 8.1, 7, 'Pete Docter'),
('The Incredibles', 2004, 115, 8.0, 7, 'Brad Bird'),
('Coco', 2017, 105, 8.4, 7, 'Lee Unkrich'),
('Avengers: Infinity War', 2018, 149, 8.4, 1, 'Anthony Russo'),
('Star Wars: Episode IV - A New Hope', 1977, 121, 8.6, 5, 'George Lucas'),
('Star Wars: Episode V - The Empire Strikes Back', 1980, 124, 8.7, 5, 'Irvin Kershner'),
('Star Wars: Episode VI - Return of the Jedi', 1983, 131, 8.3, 5, 'Richard Marquand'),
('The Lord of the Rings: The Fellowship of the Ring', 2001, 178, 8.8, 5, 'Peter Jackson'),
('The Lord of the Rings: The Two Towers', 2002, 179, 8.7, 5, 'Peter Jackson'),
('The Lord of the Rings: The Return of the King', 2003, 201, 8.9, 5, 'Peter Jackson'),
('Harry Potter and the Sorcerer\'s Stone', 2001, 152, 7.6, 5, 'Chris Columbus');

-- Insert Movie-Actor relations
INSERT INTO MovieActors (movie_id, actor_id) VALUES
(1, 1), (2, 1), (2, 2), (3, 7), (4, 4), (5, 7), 
(6, 7), (7, 6), (8, 7), (9, 8), (10, 9), (11, 1),
(12, 7), (13, 7), (14, 7), (15, 5), (16, 5), 
(17, 13), (18, 4), (19, 4), (20, 5), (21, 7),
(22, 10), (23, 7), (24, 7), (25, 7), (26, 
