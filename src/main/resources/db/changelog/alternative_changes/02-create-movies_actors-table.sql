--liquibase formatted sql
--changeset AdamMudrak:create-movies_actors-table
CREATE TABLE movies_actors (
actor_id BIGINT NOT NULL,
movie_id BIGINT NOT NULL)