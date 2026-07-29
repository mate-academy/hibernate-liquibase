--liquibase formatted sql

--changeset Andrii:create-movies-actors-table

CREATE TABLE movies_actors
(
    movie_id BIGINT NOT NULL,
    actor_id BIGINT NOT NULL,

    PRIMARY KEY (movie_id, actor_id),

    CONSTRAINT fk_movies_actors_movie
        FOREIGN KEY (movie_id)
            REFERENCES movies (id),

    CONSTRAINT fk_movies_actors_actor
        FOREIGN KEY (actor_id)
            REFERENCES actors (id)
);
