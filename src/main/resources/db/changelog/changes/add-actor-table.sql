CREATE TABLE actors (id BIGINT GENERATED ALWAYS AS IDENTITY,
                     name VARCHAR(255),
                     PRIMARY KEY (id),
                     country_id BIGINT,
                     CONSTRAINT fk_country FOREIGN KEY (country_id) references countries(id));