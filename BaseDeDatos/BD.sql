-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para ppi
DROP DATABASE IF EXISTS `ppi`;
CREATE DATABASE IF NOT EXISTS `ppi` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ppi`;

-- Volcando estructura para tabla ppi.tb_carrito
DROP TABLE IF EXISTS `tb_carrito`;
CREATE TABLE IF NOT EXISTS `tb_carrito` (
  `id_carrito` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  `id_pedido` int(11) NOT NULL,
  PRIMARY KEY (`id_carrito`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `tb_carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`),
  CONSTRAINT `tb_carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tb_productos` (`id_producto`),
  CONSTRAINT `tb_carrito_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `tb_pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ppi.tb_carrito: ~11 rows (aproximadamente)
DELETE FROM `tb_carrito`;
INSERT INTO `tb_carrito` (`id_carrito`, `id_usuario`, `id_producto`, `estado`, `id_pedido`) VALUES
	(1, 2, 2, b'1', 2),
	(2, 4, 14, b'1', 2),
	(3, 5, 12, b'1', 1),
	(4, 6, 8, b'1', 2),
	(5, 2, 3, b'1', 3),
	(6, 8, 2, b'1', 2),
	(7, 7, 5, b'1', 1),
	(8, 5, 13, b'1', 3),
	(9, 2, 10, b'1', 2),
	(10, 4, 1, b'1', 3),
	(11, 8, 4, b'1', 1);

-- Volcando estructura para tabla ppi.tb_categorias
DROP TABLE IF EXISTS `tb_categorias`;
CREATE TABLE IF NOT EXISTS `tb_categorias` (
  `id_categoria` int(4) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ppi.tb_categorias: ~4 rows (aproximadamente)
DELETE FROM `tb_categorias`;
INSERT INTO `tb_categorias` (`id_categoria`, `nombre_categoria`, `descripcion`, `estado`) VALUES
	(1, 'Limpieza', 'productos de limpieza para el hogar', b'0'),
	(2, 'Cereales y galletas', 'productos alimenticios', b'1'),
	(3, 'Lacteos', 'leche, yougurt, quesos, mantequilla, queso crema', b'1'),
	(4, 'Panaderia', 'pan, queques, tortas, pasteles', b'0');

-- Volcando estructura para tabla ppi.tb_ciudad
DROP TABLE IF EXISTS `tb_ciudad`;
CREATE TABLE IF NOT EXISTS `tb_ciudad` (
  `id_ciudad` int(4) NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(45) NOT NULL,
  `cobertura` bit(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ppi.tb_ciudad: ~4 rows (aproximadamente)
DELETE FROM `tb_ciudad`;
INSERT INTO `tb_ciudad` (`id_ciudad`, `nombre_ciudad`, `cobertura`, `created_at`) VALUES
	(1, 'Cochabamba', b'1', '2023-09-28 19:54:36'),
	(2, 'La Paz', b'0', '2023-09-28 19:54:36'),
	(3, 'Tarija', b'1', '2023-09-28 19:54:36'),
	(4, 'Sucre', b'0', '2023-09-28 19:54:36');

-- Volcando estructura para tabla ppi.tb_oferta
DROP TABLE IF EXISTS `tb_oferta`;
CREATE TABLE IF NOT EXISTS `tb_oferta` (
  `id_oferta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_oferta` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_oferta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ppi.tb_oferta: ~5 rows (aproximadamente)
DELETE FROM `tb_oferta`;
INSERT INTO `tb_oferta` (`id_oferta`, `nombre_oferta`, `descripcion`, `estado`, `fecha_inicio`, `fecha_fin`) VALUES
	(1, 'Feliz dia MAMA', 'oferta por el dia de la madre', NULL, '2023-05-01', '2023-05-30'),
	(2, 'Feliz dia PAPA', 'oferta por el dia del padre', NULL, '2023-03-01', '2023-03-30'),
	(3, 'NAVIDAD', 'oferta por epocas navideñas', NULL, '2023-12-01', '2023-12-30'),
	(4, 'Black Friday', 'oferta por viernes negro', NULL, '2023-11-24', '2023-11-26'),
	(5, 'OfertaOFF', 'no existe oferta', NULL, '0000-00-00', '0000-00-00');

-- Volcando estructura para tabla ppi.tb_pedido
DROP TABLE IF EXISTS `tb_pedido`;
CREATE TABLE IF NOT EXISTS `tb_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_pago` date NOT NULL,
  `metodo_pago` varchar(45) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ppi.tb_pedido: ~3 rows (aproximadamente)
DELETE FROM `tb_pedido`;
INSERT INTO `tb_pedido` (`id_pedido`, `fecha_pago`, `metodo_pago`, `estado`) VALUES
	(1, '2022-12-08', 'Tarjeta debito', 'pagado'),
	(2, '2023-01-15', 'QR', 'pagado'),
	(3, '2023-10-05', 'Paypal', 'pendiente');

-- Volcando estructura para tabla ppi.tb_productos
DROP TABLE IF EXISTS `tb_productos`;
CREATE TABLE IF NOT EXISTS `tb_productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_productos` varchar(45) NOT NULL,
  `id_categoria` int(4) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(4) NOT NULL,
  `id_oferta` int(4) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_oferta` (`id_oferta`),
  CONSTRAINT `tb_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categorias` (`id_categoria`),
  CONSTRAINT `tb_productos_ibfk_2` FOREIGN KEY (`id_oferta`) REFERENCES `tb_oferta` (`id_oferta`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ppi.tb_productos: ~14 rows (aproximadamente)
DELETE FROM `tb_productos`;
INSERT INTO `tb_productos` (`id_producto`, `descripcion_productos`, `id_categoria`, `precio`, `cantidad`, `id_oferta`) VALUES
	(1, 'detergente', 1, 12, 20, 4),
	(2, 'dona', 4, 3, 15, 5),
	(3, 'chocapic', 2, 20, 50, 1),
	(4, 'leche', 3, 4, 40, 5),
	(5, 'queso', 3, 2, 18, 5),
	(6, 'jabon', 1, 5, 80, 1),
	(7, 'oreo', 2, 3, 50, 2),
	(8, 'torta moka', 4, 25, 5, 2),
	(9, 'escoba', 1, 15, 90, 1),
	(10, 'yogurt frutilla', 3, 12, 30, 2),
	(11, 'yogurt durazno', 3, 12, 30, 2),
	(12, 'yogurt mango', 3, 12, 30, 5),
	(13, 'empanadas', 4, 2, 20, 5),
	(14, 'lava vajillas', 1, 10, 60, 1);

-- Volcando estructura para tabla ppi.tb_rol
DROP TABLE IF EXISTS `tb_rol`;
CREATE TABLE IF NOT EXISTS `tb_rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ppi.tb_rol: ~4 rows (aproximadamente)
DELETE FROM `tb_rol`;
INSERT INTO `tb_rol` (`id_rol`, `descripcion`, `nombre`) VALUES
	(1, 'Tiene todos los permisos otorgados', 'Administrador'),
	(2, 'No tiene permisos para realizar cambios a cli', 'Empleado'),
	(3, 'Tiene ofertas 1 vez al mes', 'Cliente premium'),
	(4, 'Tiene ofertas 1 vez al año', 'Cliente');

-- Volcando estructura para tabla ppi.tb_usuarios
DROP TABLE IF EXISTS `tb_usuarios`;
CREATE TABLE IF NOT EXISTS `tb_usuarios` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(60) NOT NULL,
  `id_ciudad` int(4) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `id_refiere` int(10) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `contraseña_usuario` varchar(10) DEFAULT NULL,
  `correo_usuario` varchar(45) DEFAULT NULL,
  `telefono_usuario` int(13) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `tb_usuarios_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `tb_ciudad` (`id_ciudad`),
  CONSTRAINT `tb_usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `tb_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ppi.tb_usuarios: ~8 rows (aproximadamente)
DELETE FROM `tb_usuarios`;
INSERT INTO `tb_usuarios` (`id_usuario`, `nombre_usuario`, `id_ciudad`, `direccion`, `id_rol`, `id_refiere`, `estado`, `contraseña_usuario`, `correo_usuario`, `telefono_usuario`, `created_at`) VALUES
	(1, 'Daniel Soliz', 1, 'Av Simon Lopez', 2, NULL, b'1', '*****', 'danysol@gmail.com', 75767123, '2023-09-28 20:23:30'),
	(2, 'Erick Osinaga', 3, 'Av Beiging', 4, NULL, b'1', '********', 'ericko@gmail.com', 65897423, '2023-09-28 20:23:30'),
	(3, 'Margaret Vasquez', 2, 'Av America', 1, NULL, b'0', '**********', 'marvasquez@gmail.com', 78820063, '2023-09-28 20:23:30'),
	(4, 'Adela Cespedes', 3, 'C. Pulacayo', 4, NULL, b'1', '*****', 'adeces@gmail.com', 68698452, '2023-09-28 20:23:30'),
	(5, 'Gloria Triveño', 4, 'C. Adela Zamudio', 3, NULL, b'1', '*****', 'gloriatrive@gmail.com', 67939035, '2023-09-28 22:43:36'),
	(6, 'Nirvana Cespedes', 1, 'Av Segunda', 4, NULL, b'1', '*******', 'nirvces@gmail.com', 78562316, '2023-09-28 22:43:36'),
	(7, 'Kezia Soliz', 4, 'C. Uncia', 3, NULL, b'1', '******', 'keziasol@gmail.com', 75623148, '2023-09-28 22:43:36'),
	(8, 'Samir Delgado', 3, 'C. Suazo', 4, NULL, b'1', '*********', 'samdel@gmail.com', 65897452, '2023-09-28 22:43:36');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
