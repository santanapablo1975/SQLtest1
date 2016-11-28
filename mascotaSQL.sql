-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.19-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para mascotas
DROP DATABASE IF EXISTS `mascotas`;
CREATE DATABASE IF NOT EXISTS `mascotas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mascotas`;

-- Volcando estructura para procedimiento mascotas.ActualizarPersona
DROP PROCEDURE IF EXISTS `ActualizarPersona`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPersona`(
	IN `Pidpersona` INT,
	IN `Pnombre` VARCHAR(20),
	IN `Papellido` VARCHAR(20)
)
BEGIN

update personas

set	nombre=Pnombre,
		apellido=Papellido
		
where idpersona = Pidpersona;
		

END//
DELIMITER ;

-- Volcando estructura para procedimiento mascotas.BorrarPersona
DROP PROCEDURE IF EXISTS `BorrarPersona`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrarPersona`(
	IN `Pidpersona` INT
)
BEGIN

delete from personas
where idpersona = Pidpersona;


END//
DELIMITER ;

-- Volcando estructura para procedimiento mascotas.ConsultarPesona
DROP PROCEDURE IF EXISTS `ConsultarPesona`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarPesona`()
    COMMENT 'procedimiento test'
BEGIN

select * from personas;


END//
DELIMITER ;

-- Volcando estructura para procedimiento mascotas.InsertarPersona
DROP PROCEDURE IF EXISTS `InsertarPersona`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPersona`(
	IN `Pnombre` VARCHAR(20),
	IN `Papellido` VARCHAR(20)
)
BEGIN

insert into personas(nombre, apellido)
values(Pnombre, Papellido);

END//
DELIMITER ;

-- Volcando estructura para tabla mascotas.mascota
DROP TABLE IF EXISTS `mascota`;
CREATE TABLE IF NOT EXISTS `mascota` (
  `idMascota` int(11) NOT NULL AUTO_INCREMENT COMMENT 'test',
  `nombre` varchar(20) NOT NULL DEFAULT '0',
  `nacimiento` date NOT NULL,
  `idpersona` int(11) NOT NULL,
  PRIMARY KEY (`idMascota`),
  KEY `idpersona` (`idpersona`),
  CONSTRAINT `idpersona` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='el nombre de la tabla va en singular';

-- Volcando datos para la tabla mascotas.mascota: ~3 rows (aproximadamente)
DELETE FROM `mascota`;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` (`idMascota`, `nombre`, `nacimiento`, `idpersona`) VALUES
	(4, 'frank', '2016-11-27', 2),
	(5, 'rex', '2016-11-27', 2),
	(6, 'lazy', '2016-11-27', 3);
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;

-- Volcando estructura para tabla mascotas.personas
DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla mascotas.personas: ~5 rows (aproximadamente)
DELETE FROM `personas`;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` (`idpersona`, `nombre`, `apellido`) VALUES
	(1, 'juan', 'santana'),
	(2, 'Maria', 'Solano'),
	(3, 'Juelta', 'suarez'),
	(4, 'xxx', 'yyy');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
