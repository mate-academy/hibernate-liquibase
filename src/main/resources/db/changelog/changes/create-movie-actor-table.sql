CREATE TABLE movie_actor (
                             movie_id BIGINT NOT NULL,
                             actor_id BIGINT NOT NULL,
                             CONSTRAINT pk_movie_actor PRIMARY KEY (movie_id, actor_id),
                             CONSTRAINT fk_movieactor_movie FOREIGN KEY (movie_id)
                                 REFERENCES movie(id),
                             CONSTRAINT fk_movieactor_actor FOREIGN KEY (actor_id)
                                 REFERENCES actor(id)
);
