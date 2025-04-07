--liquibase formatted sql
--changeset Nikolya7777777:create-actor-table splitStatements:true endDelimiter:;
CREATE TABLE countries (id BIGINT NOT NULL AUTO_INCREMENT, name VARCHAR(255), PRIMARY KEY(id) ENGINE=InnoDB;
INSERT INTO countries VALUES (1, "Ukraine");

--rollback DROP TABLE countries;