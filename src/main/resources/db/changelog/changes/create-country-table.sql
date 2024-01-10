--liquibase formatted sql
--changeset zorro:create-country-table splitStatements:true endDelimiter:;
CREATE TABLE COUNTRY (id BIGINT NOT NULL AUTO_INCREMENT, name VARCHAR(255), PRIMARY KEY (id)) ENGINE=InnoDB;

--rollback DROP TABLE country;