--liquibase formatted sql
--changeset mbrynkiewicz:alter-table-movies-actors-table splitStatements:true endDelimiter:;
ALTER TABLE movies_actors ADD CONSTRAINT pk_movies_actors PRIMARY KEY (movie_id, actor_id);

--rollback DROP TABLE movies_actors;