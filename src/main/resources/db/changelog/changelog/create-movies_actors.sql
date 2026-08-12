CREATE TABLE movies_actors (
    movie_id BIGINT NOT NULL,
    actor_id BIGINT NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movie(id),
    FOREIGN KEY (actor_id) REFERENCES actor(id)
) ENGINE=InnoDB;