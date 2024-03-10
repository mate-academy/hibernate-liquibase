--liquibase formatted sql
--changeset AdamMudrak:alter-movies_actors-table_actor
ALTER TABLE movies_actors
ADD CONSTRAINT FK_movies_actors_actor
FOREIGN KEY (actor_id)
REFERENCES actors (id)

