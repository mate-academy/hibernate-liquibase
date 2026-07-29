CREATE TABLE movies_actors (movie_id BIGINT NOT NULL,
                          actor_id BIGINT NOT NULL,
                          PRIMARY KEY (movie_id, actor_id),
                          CONSTRAINT fk_movie FOREIGN KEY (movie_id) references movies(id),
                          CONSTRAINT fk_actor FOREIGN KEY (actor_id) references actors(id));