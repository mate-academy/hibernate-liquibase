--liquibase formatted sql
--changeset mbrynkiewicz:alter-table-movies-actors-table splitStatements:true endDelimiter:;
ALTER TABLE movies_actors ADD CONSTRAINT fk_ma_movie FOREIGN KEY (movie_id) REFERENCES movies(id);
ALTER TABLE movies_actors ADD CONSTRAINT fk_ma_actor FOREIGN KEY (actor_id) REFERENCES actors(id);

--rollback DROP TABLE movies_actors;