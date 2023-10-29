--liquibase formatted sql
--changeset zorro:create-actor-table splitStatements:true endDelimiter:;
CREATE TABLE MOVIE (id BIGINT NOT NULL AUTO_INCREMENT, title VARCHAR(255), PRIMARY KEY (id)) ENGINE=InnoDB;

--rollback DROP TABLE actor;