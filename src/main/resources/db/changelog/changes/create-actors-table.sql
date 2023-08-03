--liquibase formatted sql
--changeset yuriykhilko:create-actors-table splitStatements:true endDelimiter:;

create table actors (id bigint not null auto_increment, name varchar(255), country_id bigint, primary key (id)) engine=MyISAM;

--rollback DROP TABLE actors;