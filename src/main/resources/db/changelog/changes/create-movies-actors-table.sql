--liquibase formatted sql
--changeset yaroslav:create-movies-actors-table endDelimiter:;

CREATE TABLE IF NOT EXISTS movies_actors (
movie_id BIGINT NOT NULL,
actor_id BIGINT NOT NULL,
CONSTRAINT actors_movies_actors_fk
FOREIGN KEY (actor_id)
REFERENCES actors (id),
CONSTRAINT actors_movies_movies_fk
FOREIGN KEY (movie_id)
REFERENCES movies (id));

--rollback DROP TABLE movies_actors;