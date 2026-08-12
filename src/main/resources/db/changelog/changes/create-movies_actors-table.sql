--liquibase formatted sql
--changeset zorro:create-movies_actors-table splitStatements:true endDelimiter:;
CREATE TABLE MOVIES_ACTORS (movie_id BIGINT NOT NULL, actor_id BIGINT NOT NULL) ENGINE=InnoDB;

--rollback DROP TABLE movies_actors;