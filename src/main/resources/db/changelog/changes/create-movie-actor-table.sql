--liquidbase formatted sql
CREATE TABLE movies_actors (
                               movie_id BIGINT,
                               actor_id BIGINT,
                               PRIMARY KEY (movie_id, actor_id),
                               FOREIGN KEY (movie_id) REFERENCES movies(id),
                               FOREIGN KEY (actor_id) REFERENCES actors(id)
)