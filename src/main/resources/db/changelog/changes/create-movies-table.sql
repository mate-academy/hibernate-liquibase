--liquibase formatted sql
--changeset yuriykhilko:create-movies-table splitStatements:true endDelimiter:;
create table movies (id bigint not null auto_increment, title varchar(255), primary key (id)) engine=MyISAM;

--rollback DROP TABLE actors;