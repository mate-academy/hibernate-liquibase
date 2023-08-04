--liquibase formatted sql
--changeset yuriykhilko:create-movies_actors-table splitStatements:true endDelimiter:;
create table movies_actors (actor_id bigint not null, movie_id bigint not null);
--create table movies_actors (movie_id bigint not null, actor_id bigint not null) engine=MyISAM;

--rollback DROP TABLE movies_actors;