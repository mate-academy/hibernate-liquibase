--liquibase formatted sql
--changeset opopovich:create-actor-table splitStatement:true endDelimiter:;
alter table actors add constraint FK3q70xcqpuh355qt8t7f9xdr6k foreign key (country_id) references countries (id)