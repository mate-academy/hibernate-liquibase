CREATE TABLE actor (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    country_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES country(id)
) ENGINE=InnoDB;