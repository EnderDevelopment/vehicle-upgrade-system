CREATE TABLE IF NOT EXISTS vehicle_upgrades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plate VARCHAR(8) NOT NULL,
    component VARCHAR(20) NOT NULL,
    variant INT NOT NULL,
    UNIQUE KEY unique_upgrade (plate, component)
);

INSERT INTO vehicle_upgrades (plate, component, variant) VALUES
('ABC123', 'piston', 0),
('ABC123', 'connecting_rod', 0),
('ABC123', 'cylinder_head', 0),
('ABC123', 'valve_command', 0),
('ABC123', 'radiator', 0),
('ABC123', 'turbocharger', 0);