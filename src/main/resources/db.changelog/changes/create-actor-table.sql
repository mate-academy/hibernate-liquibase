--liquibase formatted sql
--changeset Nikolya7777777:create-actor-table splitStatements:true endDelimiter:;
CREATE TABLE actors (id BIGINT NOT NULL AUTO_INCREMENT, name VARCHAR(255), country_id BIGINT, PRIMARY KEY(id) ENGINE=InnoDB;
INSERT INTO actors VALUES (1, "DI Caprio", null);

--rollback DROP TABLE actors;