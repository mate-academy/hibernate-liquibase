--liquibase formatted sql
--changeset AdamMudrak:create-countries-table
--Use AUTO_INCREMENT for MySQL or GENERATED BY DEFAULT AS IDENTITY for HSQLDB
CREATE TABLE countries (
id BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY,
name VARCHAR(255),
PRIMARY KEY (id))