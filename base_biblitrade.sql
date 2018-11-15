-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.23 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bibliotrade
CREATE DATABASE IF NOT EXISTS `bibliotrade` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bibliotrade`;

-- Volcando estructura para tabla bibliotrade.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`) VALUES
	(1, 'terror'),
	(2, 'romance');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla bibliotrade.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuario_a_comentario` (`usuario_id`),
  KEY `FK_libro_a_comentario` (`libro_id`),
  CONSTRAINT `FK_libro_a_comentario` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`),
  CONSTRAINT `FK_usuario_a_comentario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.comentario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;

-- Volcando estructura para tabla bibliotrade.comuna
CREATE TABLE IF NOT EXISTS `comuna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.comuna: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `comuna` DISABLE KEYS */;
INSERT INTO `comuna` (`id`, `nombre`) VALUES
	(1, 'puerto montt'),
	(2, 'pellico');
/*!40000 ALTER TABLE `comuna` ENABLE KEYS */;

-- Volcando estructura para tabla bibliotrade.estado_intercambio
CREATE TABLE IF NOT EXISTS `estado_intercambio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.estado_intercambio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estado_intercambio` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_intercambio` ENABLE KEYS */;

-- Volcando estructura para tabla bibliotrade.intercambio
CREATE TABLE IF NOT EXISTS `intercambio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libro_1_id` int(11) NOT NULL,
  `libro_2_id` int(11) NOT NULL,
  `estado_intercambio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_libro1_a_intercambio` (`libro_1_id`),
  KEY `FK_libro2_a_intercambio` (`libro_2_id`),
  KEY `FK_estado_int_a_intercambio` (`estado_intercambio_id`),
  CONSTRAINT `FK_estado_int_a_intercambio` FOREIGN KEY (`estado_intercambio_id`) REFERENCES `estado_intercambio` (`id`),
  CONSTRAINT `FK_libro1_a_intercambio` FOREIGN KEY (`libro_1_id`) REFERENCES `libro` (`id`),
  CONSTRAINT `FK_libro2_a_intercambio` FOREIGN KEY (`libro_2_id`) REFERENCES `libro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.intercambio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `intercambio` DISABLE KEYS */;
/*!40000 ALTER TABLE `intercambio` ENABLE KEYS */;

-- Volcando estructura para tabla bibliotrade.libro
CREATE TABLE IF NOT EXISTS `libro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(150) NOT NULL,
  `autor` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuario_a_libro` (`usuario_id`),
  KEY `FK_categoria_a_libro` (`categoria_id`),
  CONSTRAINT `FK_categoria_a_libro` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `FK_usuario_a_libro` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.libro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;

-- Volcando estructura para tabla bibliotrade.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(150) NOT NULL,
  `contrasenia` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.login: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

-- Volcando estructura para tabla bibliotrade.tipo_estado
CREATE TABLE IF NOT EXISTS `tipo_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.tipo_estado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_estado` ENABLE KEYS */;

-- Volcando estructura para tabla bibliotrade.tipo_usuario
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.tipo_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;

-- Volcando estructura para tabla bibliotrade.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comuna_id` int(11) NOT NULL DEFAULT '0',
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `categoria_preferencia_id` int(11) DEFAULT NULL,
  `tipo_usuario_id` int(11) NOT NULL,
  `rut` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comuna_a_usuario` (`comuna_id`),
  KEY `FK_categoria_a_usuario` (`categoria_preferencia_id`),
  KEY `FK_tipo_usu_a_usuario` (`tipo_usuario_id`),
  CONSTRAINT `FK_categoria_a_usuario` FOREIGN KEY (`categoria_preferencia_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `FK_comuna_a_usuario` FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`),
  CONSTRAINT `FK_tipo_usu_a_usuario` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bibliotrade.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
