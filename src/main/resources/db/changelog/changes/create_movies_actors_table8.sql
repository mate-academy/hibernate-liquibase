create table movies_actors (
movie_id bigint,
actor_id bigint,
primary key (movie_id, actor_id),
CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES actors (id),
CONSTRAINT fk_movie FOREIGN KEY (movie_id) REFERENCES movies (id)
);
