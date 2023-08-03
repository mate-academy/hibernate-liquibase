--liquibase formatted sql
--changeset yuriykhilko:create-counties-table splitStatements:true endDelimiter:;
create table countries (id bigint not null auto_increment, name varchar(255), primary key (id)) engine=MyISAM;

--rollback DROP TABLE countries;