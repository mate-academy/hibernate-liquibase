--liquibase formatted sql
--changeset mbrynkiewicz:create-movies-actors-table splitStatements:true endDelimiter:;
CREATE TABLE movies_actors (movie_id BIGINT not null, actor_id BIGINT not null);


--rollback DROP TABLE movies-actors;