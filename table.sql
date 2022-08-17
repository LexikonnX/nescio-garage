CREATE TABLE `nesciogarage` (
  `identifier` varchar(80) NOT NULL,
  `garage` varchar(100) NOT NULL,
  `locked` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;
ALTER TABLE `owned_vehicles` ADD `impound` INT(1) NOT NULL DEFAULT '0' AFTER `type`, ADD `ngarage` VARCHAR(100) NULL DEFAULT NULL AFTER `impound`;