--liquibase formatted sql
--changeset AdamMudrak:alter-movies_actors-table_movie
ALTER TABLE movies_actors
ADD CONSTRAINT FK_movies_actors_movie
FOREIGN KEY (movie_id)
REFERENCES movies (id)