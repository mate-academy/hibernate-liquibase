--liquibase formatted sql
--changeset yana:create-actors-table splitStatements:true endDelimiter:;
CREATE TABLE actors (
  id BIGINT AUTO_INCREMENT NOT NULL,
   name VARCHAR(255) NULL,
   country_id BIGINT NULL,
   CONSTRAINT pk_actors PRIMARY KEY (id)
) ENGINE = InnoDB;

ALTER TABLE actors ADD CONSTRAINT FK_ACTORS_ON_COUNTRY FOREIGN KEY (country_id) REFERENCES countries (id);