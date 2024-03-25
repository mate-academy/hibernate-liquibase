--liquibase formatted sql
--changeset yana:create-actors-table splitStatements:true endDelimiter:;
CREATE TABLE movies (
  id BIGINT AUTO_INCREMENT NOT NULL,
   title VARCHAR(255) NULL,
   CONSTRAINT pk_movies PRIMARY KEY (id)
);

CREATE TABLE movies_actors (
  actor_id BIGINT NOT NULL,
   movie_id BIGINT NOT NULL
) ENGINE = InnoDB;

ALTER TABLE movies_actors ADD CONSTRAINT fk_movact_on_actor FOREIGN KEY (actor_id) REFERENCES actors (id);

ALTER TABLE movies_actors ADD CONSTRAINT fk_movact_on_movie FOREIGN KEY (movie_id) REFERENCES movies (id);