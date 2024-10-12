
-- Drop the database if exist
DROP DATABASE IF EXISTS MovieDB;
-- Create the database
CREATE DATABASE IF NOT EXISTS MovieDB;
USE MovieDB;

-- Table: Directors
CREATE TABLE  Directors (
	 director_id INT AUTO_INCREMENT PRIMARY KEY,
     first_name VARCHAR(255) NOT NULL,
     last_name VARCHAR(255) NOT NULL,
	 date_of_birth DATE,
     overview TEXT,
     website VARCHAR(255) NOT NULL
);


-- Table: Writters
CREATE TABLE  Writter (
	 writter_id INT AUTO_INCREMENT PRIMARY KEY,
     first_name VARCHAR(255) NOT NULL,
     last_name VARCHAR(255) NOT NULL,
     date_of_birth DATE,
     overview TEXT,
     website VARCHAR(255) NOT NULL
);

-- Table: Movies
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year YEAR NOT NULL,
    duration_minutes INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    overview TEXT NOT NULL,
    direcotr_id INT,
    genre_id INT,
    FOREIGN KEY (director_id) REFERENCES Directors(director_id),
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

-- Many-to-Many Relationshipos Movies with Writters: Many Movies can have many directors
CREATE TABLE MovieWritters (
	movie_id INT,
    Writter_id INT,
    PRIMARY KEY (movie_id, writter_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (writter_id) REFERENCES Writter(writter_id)
);

CREATE TABLE UserPreferenceActors (
    user_id int,
    actor_id int,
    PRIMARY KEY (user_id, actor_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)    
);

CREATE TABLE UserPreferenceWritters (
    user_id int,
    writter_id int,
    PRIMARY KEY (user_id, writter_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (writter_id) REFERENCES Writter(writter_id)    
);

CREATE TABLE UserPreferenceGenre (
    user_id int,
    genre_id int,
    PRIMARY KEY (user_id, genre_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)    
);
