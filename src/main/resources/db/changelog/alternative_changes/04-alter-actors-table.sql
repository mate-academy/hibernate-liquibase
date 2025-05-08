--liquibase formatted sql
--changeset AdamMudrak:alter-actors-table
ALTER TABLE actors
ADD CONSTRAINT FK_actors_country
FOREIGN KEY (country_id)
REFERENCES countries (id)