--liquibase formatted sql
--changeset mbrynkiewicz:alter-table-actors-table splitStatements:true endDelimiter:;
ALTER TABLE actors ADD CONSTRAINT fk_actor_country FOREIGN KEY (country_id) REFERENCES countries(id);

--rollback DROP TABLE actors;