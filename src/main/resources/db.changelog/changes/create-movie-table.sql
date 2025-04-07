--liquibase formatted sql
--changeset Nikolya7777777:create-actor-table splitStatements:true endDelimiter:;
CREATE TABLE movies (id BIGINT NOT NULL AUTO_INCREMENT, name VARCHAR(255), PRIMARY KEY(id) ENGINE=InnoDB;
INSERT INTO movies VALUES (1, "Fast And Furious");

--rollback DROP TABLE movies;