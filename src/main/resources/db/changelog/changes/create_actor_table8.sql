create table actors (
id bigint not null auto_increment,
name varchar(255),
primary key (id),
country_id bigint,
CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES countries (id));
