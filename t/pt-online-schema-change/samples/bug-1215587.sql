/* ----- Create two test tables with FKs for scenario 1 and 2: ----- */
drop database if exists bug1215587;
CREATE DATABASE bug1215587;
USE bug1215587;

CREATE TABLE IF NOT EXISTS `Table1` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `T2ID` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `tagIndex` (`T2ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Table2` (
  `ID` smallint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `Table1`
  ADD CONSTRAINT `fkey1` FOREIGN KEY (`T2ID`) REFERENCES `Table2` (`ID`) ON DELETE NO ACTION;

ALTER TABLE `Table2`
  ADD CONSTRAINT `fkey2` FOREIGN KEY (`ID`) REFERENCES `Table1` (`T2ID`) ON DELETE NO ACTION;

