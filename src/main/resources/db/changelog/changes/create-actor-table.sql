CREATE TABLE actor (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       country_id BIGINT,
                       CONSTRAINT fk_actor_country FOREIGN KEY (country_id)
                           REFERENCES country(id)
);
