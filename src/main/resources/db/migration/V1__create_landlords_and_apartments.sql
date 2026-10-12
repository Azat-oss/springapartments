CREATE TABLE landlords (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           name VARCHAR(255) NOT NULL UNIQUE,
                           phone VARCHAR(50) NOT NULL
);

CREATE TABLE apartments (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            landlords_id INT NOT NULL,
                            room_count INT NOT NULL,
                            price INT NOT NULL,
                            address TEXT,
                            description TEXT,
                            CONSTRAINT fk_apartment_landlord
                                FOREIGN KEY (landlords_id) REFERENCES landlords(id)
);
