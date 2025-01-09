-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-01-2025 a las 14:25:07
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_appOkla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ARTICULO`
--

CREATE TABLE `ARTICULO` (
  `ID` int(10) UNSIGNED NOT NULL,
  `REFERENCIA` text NOT NULL,
  `NOMBRE` text NOT NULL,
  `DESCRIPCION` text DEFAULT NULL,
  `IMAGEN` text DEFAULT NULL,
  `PRECIO` text DEFAULT NULL,
  `STOCK` text DEFAULT NULL,
  `ESTADO` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ARTICULO`
--

INSERT INTO `ARTICULO` (`ID`, `REFERENCIA`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `PRECIO`, `STOCK`, `ESTADO`) VALUES
(1, '6K6X8LT#ABM ', 'HP 240 G9 CEL N4500 8GB/256GB/14″  LINUX', 'Portátil HP 240 G9 con un procesador Intel Celeron N100, con 8 de memoria RAM, con un HHD de 512 GB de almacenamiento y una pantalla de 14\" Full HD, ideal para el hogar y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/03/hp-240-g9-850x850.png', '820000', '225', 'ACTIVO'),
(2, '90NB1022-M01SB0', 'ASUS X1504ZA-NJ1200 CI3-1215U 12GB 512SSD 15.6″', 'Computador ASUS VIVOBOOK X1504ZA-NJ1200 con un procesador Intel  Core CI3-1215U, con 12 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" Full HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2024/02/1-30-850x850.png', '1399900', '5', 'ACTIVO'),
(5, 'E1504FA-NJ474-1', 'ASUS E1504FA-NJ940 R5 7520U 16GB SSD 1TB 15″ FHD', 'Portátil ASUS E1504FA-NJ940 con un procesador AMD Ryzen5 R5-7520U, con 16 GB de memoria RAM, con un SSD de 1 TB de almacenamiento y una pantalla de 15\" Full HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/06/D_NQ_NP_607480-MLU69877099529_062023-O.webp', '1999900', '5', 'ACTIVO'),
(6, '90NB11A2-M00AC0', 'ASUS M3604YA-MB281 R7 7730U 16GB/SSD1TB/16″ WUXGA', 'Portátil ASUS M3604YA-MB281 con un procesador AMD Ryzen7 R7-7730U, con 16 GB de memoria RAM, con un SSD de 1 TB de almacenamiento y una pantalla de 16\" WUXGA, ideal para diseño, negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/09/ASUS-L1011-2-850x850.png', '2479900', '5', 'ACTIVO'),
(7, 'HN114', 'ASUS FX507ZC4-HN114 CI5 12500H 16GB 512GB 15.6″ RTX3050 4GB', 'Portátil Gamer ASUS TUF FX507ZC4-HN114 con un procesador Intel  Core CI5-12500H, con 16 GB de memoria RAM, con un SSD M.2 NVMe de 512 GB de almacenamiento y una pantalla de 15,6\" Full HD, ideal para juegos, diseño, negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/05/1-2-850x850.png', '3639900', '5', 'ACTIVO'),
(8, 'A3202WBAK', 'ASUS AIO A3202WBAK-WPB003M CI3 1215U 16GB 512GB 21.5″', 'Computador Todo en Uno ASUS AIO A3202WBAK-WPB003M con un procesador Intel  Core CI3-1215U, con 16 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 21,5\" HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2022/07/1-850x850.png', '1739900', '5', 'ACTIVO'),
(9, 'NH.QEKAL014', 'ACER NITRO3 AN515-58-79S3 CI7 12650H 8GB 512GB RTX 3050 4GB', 'Computador Gamer ACER NITRO AN515-58-79S3 con un procesador Intel  Core CI7-12650H, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" Full HD, ideal para juegos, diseño, negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/03/ACER-NITRO-5-850x850.png', '4219900', '3', 'ACTIVO'),
(10, 'INSPIRON-3520 CI7-1-1', 'DELL 3520 CI5 1235U 8GB 512 PANTALLA 15.6 PLATA W11PRO', 'Portátil DELL INSPIRON 3520 con un procesador Intel  Core CI5-1235U, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" HD, ideal para negocios y oficinas.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/06/DELL-INSPIRON-3511-3-850x850.png', '2100000', '2', 'ACTIVO'),
(11, '81WB01E2LM', 'LENOVO IP S3 CI3 N305 8GB 512SSD 15.6″ FROST BLUE', 'Portátil LENOVO IP S3 con un procesador Intel  Core CI3-N305, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2022/10/1-850x850.png', '1369900', '5', 'ACTIVO'),
(12, 'lenovor3', 'LENOVO V14 G4 AMN R3 7320U 16GB 256SSD 14″ FHD', 'Portátil LENOVO V14 G4 con un procesador Intel  Core R3-7320U, con 16 GB de memoria RAM, con un SSD de 256 GB de almacenamiento y una pantalla de 14\" Full HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/02/gsc_123287180_3628205_5-850x850.jpeg', '1242000', '3', 'ACTIVO'),
(13, '83ER002YLM-1', 'LENOVO IP S3 CI5 12450H 8GB 512SSD 15.6″ TOUCH', 'Portátil LENOVO IP S3 con un procesador Intel  Core CI5-12450H, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" HD TACTIL, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2024/03/1-1-850x850.png', '1789900', '4', 'ACTIVO'),
(14, 'LENOVO LOQ', 'LENOVO LOQ CI5 12450X RTX 3050 DE 6GB 12+12GB 512GB 15.6″', 'Portátil Gamer LENOVO LOQ con un procesador Intel  Core CI5-12450X, con 24 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" Full HD, ideal para juegos, diseño, negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2024/10/1-850x850.png', '3479900', '25', 'ACTIVO'),
(15, '12B6001MLS-1-1', 'LENOVO AIO NEO 50A CI5 13420H 16GB 512GB 23.8″ W11P', 'Computador LENOVO AIO NEO 50A con un procesador Intel  Core CI5-13420H, con 16 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 23,8\" Full HD, ideal para negocios y oficinas.', 'https://oklahomacomputadores.com/wp-content/uploads/2024/07/2-6-850x850.png', '3899900', '5', 'ACTIVO'),
(16, 'AIO240G9', 'HP AIO 240 G9 CI3 1215U 8GB 256SSD PANTALLA 23.8″', 'Computador HP AIO 240 G9 con un procesador Intel  Core CI3-1215U, con 8 GB de memoria RAM, con un SSD de 256 GB de almacenamiento y una pantalla de 23,8\" HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/12/1-850x850.png', '1829900', '20', 'INHABILITADO'),
(17, '6H9E8LA#ABM-1', 'HP 14-DQ5012LA CI3 1215U 8GB 512SSD 14″ LINUX', 'Portátil HP 14-DQ5012LA con un procesador Intel  Core CI3-1215U, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 14\" HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2024/07/1-7-850x850.png', '1219900', '4', 'ACTIVO'),
(18, 'bad', 'Prueba No Atri', 'bad', 'https://oklahomacomputadores.com/wp-content/uploads/2021/10/impresora-epson-l3210-colombia-1-450x450.jpg', '150', '1', 'INHABILITADO'),
(20, 'Vac', 'Vacio', 'vac', 'https://media.geeksforgeeks.org/gfg-gg-logo.svg', '0', '1', 'INHABILITADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ATRIBUTO`
--

CREATE TABLE `ATRIBUTO` (
  `ID` int(10) UNSIGNED NOT NULL,
  `ARTICULO_ID_FK` int(10) UNSIGNED NOT NULL,
  `ETIQUETA_ID_FK` int(10) UNSIGNED NOT NULL,
  `ESPECIFICACION` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ATRIBUTO`
--

INSERT INTO `ATRIBUTO` (`ID`, `ARTICULO_ID_FK`, `ETIQUETA_ID_FK`, `ESPECIFICACION`) VALUES
(213, 1, 30, 'ALMACENAMIENTO TIPO HHD'),
(214, 1, 53, 'PROCESADOR INTEL CELERON N100'),
(215, 1, 35, 'RAM CAPACIDAD 8GB'),
(216, 1, 39, 'RAM TIPO DDR4'),
(217, 1, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(218, 1, 14, 'PANTALLA TAMAÑO 15″'),
(219, 1, 20, 'PANTALLA TIPO FULL HD'),
(220, 1, 6, 'FUNCIONALIDAD HOGAR'),
(221, 2, 54, 'PROCESADOR INTEL CORE I3 CI3-1215U'),
(224, 2, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(225, 2, 31, 'ALMACENAMIENTO TIPO SSD'),
(227, 2, 20, 'PANTALLA TIPO FULL HD'),
(230, 2, 39, 'RAM TIPO DDR4'),
(232, 2, 7, 'FUNCIONALIDAD OFICINA'),
(233, 2, 2, 'PORTATIL'),
(235, 2, 15, 'PANTALLA TAMAÑO 15.6″'),
(237, 2, 36, 'RAM CAPACIDAD 12GB'),
(238, 1, 2, 'PORTATIL'),
(239, 5, 51, 'PROCESADOR AMD RYZEN5 R5-7520U'),
(240, 5, 37, 'RAM CAPACIDAD 16GB'),
(241, 5, 39, 'RAM TIPO DDR4'),
(242, 5, 28, 'ALMACENAMIENTO CAPACIDAD 1T'),
(243, 5, 31, 'ALMACENAMIENTO TIPO SSD'),
(244, 5, 15, 'PANTALLA TAMAÑO 15.6″'),
(245, 5, 20, 'PANTALLA TIPO FULL HD'),
(246, 5, 7, 'FUNCIONALIDAD OFICINA'),
(247, 6, 52, 'PROCESADOR AMD RYZEN7 R7-7730U'),
(248, 6, 37, 'RAM CAPACIDAD 16GB'),
(249, 6, 39, 'RAM TIPO DDR4'),
(250, 6, 28, 'ALMACENAMIENTO CAPACIDAD 1T'),
(251, 6, 31, 'ALMACENAMIENTO TIPO SSD'),
(252, 6, 66, 'PANTALLA TAMAÑO 16\'\''),
(253, 6, 22, 'PANTALLA TIPO WUXGA'),
(254, 6, 8, 'FUNCIONALIDAD DISEÑO'),
(255, 7, 56, 'PROCESADOR INTEL CORE I5 CI5-12500H'),
(256, 7, 37, 'RAM CAPACIDAD 16GB'),
(257, 7, 39, 'RAM TIPO DDR4'),
(258, 7, 32, 'ALMACENAMIENTO TIPO SSD M.2 NVMe'),
(259, 7, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(260, 7, 15, 'PANTALLA TAMAÑO 15.6″'),
(261, 7, 20, 'PANTALLA TIPO FULL HD'),
(262, 7, 9, 'FUNCIONALIDAD GAMER'),
(263, 8, 54, 'PROCESADOR INTEL CORE I3 CI3-1215U'),
(264, 8, 37, 'RAM CAPACIDAD 16GB'),
(265, 8, 39, 'RAM TIPO DDR4'),
(266, 8, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(267, 8, 31, 'ALMACENAMIENTO TIPO SSD'),
(268, 8, 16, 'PANTALLA TAMAÑO 21.5″'),
(269, 8, 21, 'PANTALLA TIPO HD'),
(270, 8, 7, 'FUNCIONALIDAD OFICINA'),
(271, 9, 62, 'PROCESADOR INTEL CORE I7 CI7-12650H'),
(272, 9, 35, 'RAM CAPACIDAD 8GB'),
(273, 9, 39, 'RAM TIPO DDR4'),
(274, 9, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(275, 9, 31, 'ALMACENAMIENTO TIPO SSD'),
(276, 9, 15, 'PANTALLA TAMAÑO 15.6″'),
(277, 9, 20, 'PANTALLA TIPO FULL HD'),
(278, 9, 9, 'FUNCIONALIDAD GAMER'),
(279, 10, 57, 'PROCESADOR INTEL CORE I5 CI5-1235U'),
(280, 10, 35, 'RAM CAPACIDAD 8GB'),
(281, 10, 39, 'RAM TIPO DDR4'),
(282, 10, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(283, 10, 31, 'ALMACENAMIENTO TIPO SSD'),
(284, 10, 15, 'PANTALLA TAMAÑO 15.6″'),
(285, 10, 21, 'PANTALLA TIPO HD'),
(286, 10, 10, 'FUNCIONALIDAD CORPORATIVO'),
(287, 11, 55, 'PROCESADOR INTEL CORE I3 CI3-N305'),
(288, 11, 35, 'RAM CAPACIDAD 8GB'),
(289, 11, 39, 'RAM TIPO DDR4'),
(290, 11, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(291, 11, 31, 'ALMACENAMIENTO TIPO SSD'),
(292, 11, 15, 'PANTALLA TAMAÑO 15.6″'),
(293, 11, 21, 'PANTALLA TIPO HD'),
(294, 11, 7, 'FUNCIONALIDAD OFICINA'),
(295, 12, 50, 'PROCESADOR AMD RYZEN3 R3-7320U'),
(296, 12, 37, 'RAM CAPACIDAD 16GB'),
(297, 12, 39, 'RAM TIPO DDR4'),
(298, 12, 29, 'ALMACENAMIENTO CAPACIDAD 256GB'),
(299, 12, 31, 'ALMACENAMIENTO TIPO SSD'),
(300, 12, 20, 'PANTALLA TIPO FULL HD'),
(301, 12, 18, 'PANTALLA TAMAÑO 14″'),
(302, 12, 7, 'FUNCIONALIDAD OFICINA'),
(303, 13, 58, 'PROCESADOR INTEL CORE I5 CI5-12450H'),
(304, 13, 35, 'RAM CAPACIDAD 8GB'),
(305, 13, 39, 'RAM TIPO DDR4'),
(306, 13, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(307, 13, 31, 'ALMACENAMIENTO TIPO SSD'),
(308, 13, 15, 'PANTALLA TAMAÑO 15.6″'),
(309, 13, 23, 'PANTALLA TIPO HD TACTIL'),
(310, 13, 7, 'FUNCIONALIDAD OFICINA'),
(311, 14, 59, 'PROCESADOR INTEL CORE I5 CI5-12450X'),
(312, 14, 38, 'RAM CAPACIDAD 24GB'),
(313, 14, 39, 'RAM TIPO DDR4'),
(314, 14, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(315, 14, 31, 'ALMACENAMIENTO TIPO SSD'),
(316, 14, 15, 'PANTALLA TAMAÑO 15.6″'),
(317, 14, 20, 'PANTALLA TIPO FULL HD'),
(318, 14, 9, 'FUNCIONALIDAD GAMER'),
(319, 15, 60, 'PROCESADOR INTEL CORE I5 CI5-13420H'),
(320, 15, 37, 'RAM CAPACIDAD 16GB'),
(321, 15, 39, 'RAM TIPO DDR4'),
(322, 15, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(323, 15, 31, 'ALMACENAMIENTO TIPO SSD'),
(324, 15, 17, 'PANTALLA TAMAÑO 23.8″'),
(325, 15, 20, 'PANTALLA TIPO FULL HD'),
(326, 15, 10, 'FUNCIONALIDAD CORPORATIVO'),
(327, 16, 54, 'PROCESADOR INTEL CORE I3 CI3-1215U'),
(328, 16, 35, 'RAM CAPACIDAD 8GB'),
(329, 16, 39, 'RAM TIPO DDR4'),
(330, 16, 31, 'ALMACENAMIENTO TIPO SSD'),
(331, 16, 29, 'ALMACENAMIENTO CAPACIDAD 256GB'),
(332, 16, 17, 'PANTALLA TAMAÑO 23.8″'),
(333, 16, 21, 'PANTALLA TIPO HD'),
(334, 16, 7, 'FUNCIONALIDAD OFICINA'),
(335, 17, 54, 'PROCESADOR INTEL CORE I3 CI3-1215U'),
(336, 17, 35, 'RAM CAPACIDAD 8GB'),
(337, 17, 39, 'RAM TIPO DDR4'),
(338, 17, 27, 'ALMACENAMIENTO CAPACIDAD 512GB'),
(339, 17, 31, 'ALMACENAMIENTO TIPO SSD'),
(340, 17, 18, 'PANTALLA TAMAÑO 14″'),
(341, 17, 21, 'PANTALLA TIPO HD'),
(342, 17, 7, 'FUNCIONALIDAD OFICINA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CATEGORIAS`
--

CREATE TABLE `CATEGORIAS` (
  `ID` int(10) UNSIGNED NOT NULL,
  `NOMBRE` text DEFAULT NULL,
  `DESCRIPCION` text DEFAULT NULL,
  `ESTADO` text DEFAULT NULL,
  `F_CREACION` date DEFAULT NULL,
  `F_MOD` date DEFAULT NULL,
  `COD_PADRE` int(10) UNSIGNED DEFAULT NULL,
  `IMAGEN` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COTIZACIONES`
--

CREATE TABLE `COTIZACIONES` (
  `ID` int(10) UNSIGNED NOT NULL,
  `DETAL_PEDIDO_ID` int(10) UNSIGNED NOT NULL,
  `USUARIOS_ID` int(10) UNSIGNED NOT NULL,
  `OBSERVACION` text DEFAULT NULL,
  `F_CREACION` date DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `TIPO_OC` int(11) DEFAULT NULL,
  `F_VENCIMIENTO` date DEFAULT NULL,
  `FLETE` float DEFAULT NULL,
  `TOTAL` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DETAL_PEDIDO`
--

CREATE TABLE `DETAL_PEDIDO` (
  `ID` int(10) UNSIGNED NOT NULL,
  `PRODUCTO_ID` int(10) UNSIGNED NOT NULL,
  `CANTIDAD` int(10) UNSIGNED DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  `PRECIO_T` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DIRECCIONES`
--

CREATE TABLE `DIRECCIONES` (
  `ID` int(10) UNSIGNED NOT NULL,
  `USUARIOS_ID` int(10) UNSIGNED NOT NULL,
  `DIRECCION` text DEFAULT NULL,
  `CIUDAD` text DEFAULT NULL,
  `DEPARTAMENTO` text DEFAULT NULL,
  `TELEFONO` text DEFAULT NULL,
  `OBSERVACION` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ETIQUETA`
--

CREATE TABLE `ETIQUETA` (
  `ID` int(10) UNSIGNED NOT NULL,
  `NOMBRE` text NOT NULL,
  `DESCRIPCION` text DEFAULT NULL,
  `ESTADO` text NOT NULL,
  `PADRE_ID_FK` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ETIQUETA`
--

INSERT INTO `ETIQUETA` (`ID`, `NOMBRE`, `DESCRIPCION`, `ESTADO`, `PADRE_ID_FK`) VALUES
(1, 'COMPUTADOR', 'DES', 'ACTIVO', NULL),
(2, 'PORTATIL', 'DES', 'INHABILITADO', NULL),
(3, 'PROCESADOR', 'DES', 'ACTIVO', NULL),
(4, 'RAM', 'DES', 'ACTIVO', NULL),
(5, 'FUNCIONALIDAD', 'S', 'ACTIVO', NULL),
(6, 'HOGAR', 'DD', 'ACTIVO', 5),
(7, 'OFICINA', 'D', 'ACTIVO', 5),
(8, 'DISEÑO', 'D', 'ACTIVO', 5),
(9, 'GAMER', 'DD', 'ACTIVO', 5),
(10, 'CORPORATIVO', 'D', 'ACTIVO', 5),
(11, 'PANTALLA', 'DSA', 'ACTIVO', NULL),
(12, 'TIPO', 'DD', 'ACTIVO', 11),
(13, 'TAMAÑO', 'D', 'ACTIVO', 11),
(14, '15″', 'F', 'ACTIVO', 13),
(15, '15.6″', 'ASD', 'ACTIVO', 13),
(16, '21.5″', 'ASD', 'ACTIVO', 13),
(17, '23.8″', 'ASDAS', 'ACTIVO', 13),
(18, '14″', 'ASD', 'ACTIVO', 13),
(19, '19.5″', 'ASDAS', 'ACTIVO', 13),
(20, 'FULL HD', 'ASDSA', 'ACTIVO', 12),
(21, 'HD', 'ASDA', 'ACTIVO', 12),
(22, 'WUXGA', 'SADAS', 'ACTIVO', 12),
(23, 'HD TACTIL', 'ASDAS', 'ACTIVO', 12),
(24, 'ALMACENAMIENTO', 'SDF', 'ACTIVO', NULL),
(25, 'CAPACIDAD', 'SAD', 'ACTIVO', 24),
(26, 'TIPO', 'AFSDF', 'ACTIVO', 24),
(27, '512GB', 'ASD', 'ACTIVO', 25),
(28, '1T', 'ASD', 'ACTIVO', 25),
(29, '256GB', 'SAD', 'ACTIVO', 25),
(30, 'HHD', 'ASD', 'ACTIVO', 26),
(31, 'SSD', 'AASDA', 'ACTIVO', 26),
(32, 'SSD M.2 NVMe', 'SDF', 'ACTIVO', 26),
(33, 'TIPO', 'ASADS', 'ACTIVO', 4),
(34, 'CAPACIDAD', 'ASD', 'ACTIVO', 4),
(35, '8GB', 'ASD', 'ACTIVO', 34),
(36, '12GB', 'SFAD', 'ACTIVO', 34),
(37, '16GB', 'SAF', 'ACTIVO', 34),
(38, '24GB', 'SADASDA', 'ACTIVO', 34),
(39, 'DDR4', 'SAD', 'ACTIVO', 33),
(40, 'INTEL', 'DSASD', 'ACTIVO', 3),
(41, 'AMD', 'ASDDS', 'ACTIVO', 3),
(42, 'RYZEN3', 'ASDDSA', 'ACTIVO', 41),
(43, 'RYZEN5', 'SAFASD', 'ACTIVO', 41),
(44, 'RYZEN7', 'SADADASD', 'ACTIVO', 41),
(45, 'CORE', 'ASD', 'ACTIVO', 40),
(46, 'CELERON', 'SAD', 'ACTIVO', 40),
(47, 'I3', 'SDF', 'ACTIVO', 45),
(48, 'I5', 'SDFSD', 'ACTIVO', 45),
(49, 'I7', 'SDF', 'ACTIVO', 45),
(50, 'R3-7320U', 'SAD', 'ACTIVO', 42),
(51, 'R5-7520U', 'ADS', 'ACTIVO', 43),
(52, 'R7-7730U', 'DDD', 'ACTIVO', 44),
(53, 'N100', 'ASDAS', 'ACTIVO', 46),
(54, 'CI3-1215U', 'ASDASD', 'ACTIVO', 47),
(55, 'CI3-N305', 'ASDASDASD', 'ACTIVO', 47),
(56, 'CI5-12500H', 'ASDAS', 'ACTIVO', 48),
(57, 'CI5-1235U', 'ASD', 'ACTIVO', 48),
(58, 'CI5-12450H', 'ASDAS', 'ACTIVO', 48),
(59, 'CI5-12450X', 'ASDASD', 'ACTIVO', 48),
(60, 'CI5-13420H', 'SADASD', 'ACTIVO', 48),
(61, 'CI5-12500T', 'XXXX', 'ACTIVO', 48),
(62, 'CI7-12650H', 'DSAASD', 'ACTIVO', 49),
(63, 'CI7-1260P', 'ASDASD', 'ACTIVO', 49),
(64, 'N4500', 'ASDA', 'ACTIVO', 46),
(65, 'TODO EN UNO', 'sadadad', 'ACTIVO', NULL),
(66, '16\'\'', 'asd', 'ACTIVO', 13),
(67, 'SEGMENTO', 'JEJE', 'ACTIVO', NULL),
(69, 'CONSUMO', 'JEJE', 'INHABILITADO', 67),
(70, 'IMPRESORA', 'ASD', 'ACTIVO', NULL),
(71, 'EPSON', 'FDSA', 'ACTIVO', 70),
(72, 'BROTHER', 'sdfasdf', 'ACTIVO', 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `HISTORIAL_CLIENTE`
--

CREATE TABLE `HISTORIAL_CLIENTE` (
  `ID` int(10) UNSIGNED NOT NULL,
  `USUARIOS_ID` int(10) UNSIGNED NOT NULL,
  `PRODUCTO_ID` int(10) UNSIGNED NOT NULL,
  `COMPRA` int(10) UNSIGNED DEFAULT NULL,
  `VISTA` int(10) UNSIGNED DEFAULT NULL,
  `PRECIO` int(10) UNSIGNED DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `UNIDADES` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PEDIDO`
--

CREATE TABLE `PEDIDO` (
  `ID` int(10) UNSIGNED NOT NULL,
  `DIRECCIONES_ID` int(10) UNSIGNED NOT NULL,
  `COTIZACIONES_ID` int(10) UNSIGNED NOT NULL,
  `OBSERVACION` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PQR`
--

CREATE TABLE `PQR` (
  `USUARIOS_ID` int(10) UNSIGNED NOT NULL,
  `DESCRIPCION` text DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ESTADO` text DEFAULT NULL,
  `RESPUESTA` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PRECIO_OFERTA`
--

CREATE TABLE `PRECIO_OFERTA` (
  `USUARIOS_ID` int(10) UNSIGNED NOT NULL,
  `PRODUCTO_ID` int(10) UNSIGNED NOT NULL,
  `PRECIO` float DEFAULT NULL,
  `OBSERVACION` text DEFAULT NULL,
  `F_VENCIMIENTO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PRODUCTO`
--

CREATE TABLE `PRODUCTO` (
  `ID` int(10) UNSIGNED NOT NULL,
  `CATEGORIAS_ID` int(10) UNSIGNED NOT NULL,
  `REFERENCIA` text DEFAULT NULL,
  `NOMBRE` text DEFAULT NULL,
  `IMAGEN` text DEFAULT NULL,
  `PRECIO` float UNSIGNED DEFAULT NULL,
  `STOCK` int(10) UNSIGNED DEFAULT NULL,
  `ESTADO` text DEFAULT NULL,
  `F_CREACION` date DEFAULT NULL,
  `F_MOD` date DEFAULT NULL,
  `PROCESADOR` text DEFAULT NULL,
  `MARCA_PROCESADOR` text DEFAULT NULL,
  `GENERACION_SERIE` text DEFAULT NULL,
  `RAM` text DEFAULT NULL,
  `TIPO_RAM` text DEFAULT NULL,
  `STORAGE` text DEFAULT NULL,
  `TIPO_STORAGE` text DEFAULT NULL,
  `PANTALLA` text DEFAULT NULL,
  `TIPO_PANTALLA` text DEFAULT NULL,
  `TAMANO_PANTALLA` text DEFAULT NULL,
  `BATERIA` text DEFAULT NULL,
  `CAMARA` text DEFAULT NULL,
  `FUNCIONALIDAD` text DEFAULT NULL,
  `CONEXION` text DEFAULT NULL,
  `SISTEMA` text DEFAULT NULL,
  `SO` text DEFAULT NULL,
  `SEGMENTO` text DEFAULT NULL,
  `FRECUENCIA` text DEFAULT NULL,
  `MATERIAL` text DEFAULT NULL,
  `COLOR` text DEFAULT NULL,
  `PESO` float UNSIGNED DEFAULT NULL,
  `LARGO` float UNSIGNED DEFAULT NULL,
  `ANCHO` float UNSIGNED DEFAULT NULL,
  `ALTO` float UNSIGNED DEFAULT NULL,
  `DISTRIBUCION` text DEFAULT NULL,
  `IDIOMA` text DEFAULT NULL,
  `RESOLUCION` text DEFAULT NULL,
  `DESCRIPCION` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIOS`
--

CREATE TABLE `USUARIOS` (
  `ID` int(10) UNSIGNED NOT NULL,
  `DOCUMENTO` text NOT NULL,
  `NOMBRE_RAZON_SOCIAL` text DEFAULT NULL,
  `ESTADO` text DEFAULT NULL,
  `TELEFONO` text DEFAULT NULL,
  `CORREO` text DEFAULT NULL,
  `ROL` text DEFAULT NULL,
  `USERNAME` text DEFAULT NULL,
  `PASS` text DEFAULT NULL,
  `TIPO_DOC` int(11) DEFAULT NULL,
  `AVATAR` text DEFAULT NULL,
  `VENDEDOR_FK` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `USUARIOS`
--

INSERT INTO `USUARIOS` (`ID`, `DOCUMENTO`, `NOMBRE_RAZON_SOCIAL`, `ESTADO`, `TELEFONO`, `CORREO`, `ROL`, `USERNAME`, `PASS`, `TIPO_DOC`, `AVATAR`, `VENDEDOR_FK`) VALUES
(1, '1100969646', 'Azra', 'ACTIVO', '3204040444', 'a@g.com', 'ADMIN', 'PRUEBA', '$2y$11$acE7.6cUj2s3wmGCNgUvEOalewuXt4gPBgIjub/bfoaWVtknoD6d2', 0, '', NULL),
(2, '1100000003', 'Layla Sandoval', 'ACTIVO', '3248888888', 'b@gmail.com', 'VENDEDOR', 'LaylaVEND', '$2y$11$SbZ5b85Y.DrjoAcjD6FFfOJl5yHjn99GSzoe1Yu5pgyBNGr/fKwoW', 0, '', NULL),
(4, '1100000004', 'Andres Jose', 'BLOQUEADO', '9875422365', 'a@d.com', 'DISTRIBUIDOR', 'AndresDIST', '$2y$11$nBX8feY9qaQfq14OB60tH.IyMIewgl39B/j9D2pucNDIe/kgahY3a', 0, '', NULL),
(5, '1100000002', 'Susana Maria', 'ACTIVO', '3002255525', 'g@d.com', 'GERENTE', 'SusanaGER', '$2y$11$46x1Fv24r6N4pSMwqsLz9.ufKAyak4CskVLbMZLoAfrbbmtRab50a', 0, '', NULL),
(6, '1100000001', 'Jose Andres', 'INHABILITADO', '3001122111', 'a@g.com', 'ADMIN', 'JoseADMIN', '$2y$11$I/5eXASa8KuSwwD.rCTMROIigJQGayPrOmBIm3HLv1q8zsP/88MwO', 0, '', NULL),
(7, '1100000006', 'Maria G', 'ACTIVO', '3000000000', 'a@d.com', 'VENDEDOR', 'MariaVEND', '$2y$11$mim5qdB4h8gdk6dJzykwYusei8eO6zkWDhiwdusGOKPEqFz506x7q', 0, '', NULL),
(8, '1100000098', 'Pablo C', 'ACTIVO', '300212121', 'x@m.com', 'DISTRIBUIDOR', 'PabloDIST', '$2y$11$.yJdmdfToxgfh0q5xEEhfODCDNKZgHCaoAEv5fnvuf7glcOLioCyy', 0, '', NULL),
(11, '45456645', 'test del', 'EN PROCESO', '45646645', '5645646@g.com', 'DISTRIBUIDOR', '', '$2y$11$U8qBtxOlaFWLjVFI1huED./Hzv5PWYg4fPlATaiQiOKlYZdkui6xm', 0, '', NULL),
(12, '456789258', 'EmpresaX', 'EN PROCESO', '78958525', 'a@g.com', 'DISTRIBUIDOR', '', '$2y$11$c1SCOKm.R2WvnSf5YuxxFeq3Ah0OkikxVSbPSW5yFiy5aWklpoD2G', 0, '', NULL),
(13, '123', 'asd', 'EN PROCESO', '312', 'a@gmail.com', 'DISTRIBUIDOR', '', '$2y$11$kT6shtw/xoFmGFqPl13Wr.oc/gluv4appFnY5/p09xIqufjq5KylC', 0, '', NULL),
(14, '22', 'qwe', 'EN PROCESO', '332', 'qew@gmail.com', 'DISTRIBUIDOR', '', '$2y$11$RPTTVHOfaombpznp91ju/uaHMkK3IYrdB.iSZmfP78QX3WTih7tSe', 0, '', NULL),
(15, '3333', 'aaaa', 'EN PROCESO', '3333', 'a@gmail.com', 'DISTRIBUIDOR', '', '$2y$11$MPoc4KXtb7rEpX3mKkK3kea4c5m5U7Udh0D9nz2E9ADfaVGee1.Gu', 0, '', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ARTICULO`
--
ALTER TABLE `ARTICULO`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ATRIBUTO`
--
ALTER TABLE `ATRIBUTO`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ARTICULO_ID_FK` (`ARTICULO_ID_FK`),
  ADD KEY `ETIQUETA_ID_FK` (`ETIQUETA_ID_FK`);

--
-- Indices de la tabla `CATEGORIAS`
--
ALTER TABLE `CATEGORIAS`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `COTIZACIONES`
--
ALTER TABLE `COTIZACIONES`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USUARIOS_ID` (`USUARIOS_ID`),
  ADD KEY `DETAL_PEDIDO_ID` (`DETAL_PEDIDO_ID`);

--
-- Indices de la tabla `DETAL_PEDIDO`
--
ALTER TABLE `DETAL_PEDIDO`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DETAL_PEDIDO_FKIndex1` (`PRODUCTO_ID`);

--
-- Indices de la tabla `DIRECCIONES`
--
ALTER TABLE `DIRECCIONES`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USUARIOS_ID` (`USUARIOS_ID`);

--
-- Indices de la tabla `ETIQUETA`
--
ALTER TABLE `ETIQUETA`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PADRE_ID_FK` (`PADRE_ID_FK`);

--
-- Indices de la tabla `HISTORIAL_CLIENTE`
--
ALTER TABLE `HISTORIAL_CLIENTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `HISTORIAL_CLIENTE_FKIndex1` (`PRODUCTO_ID`),
  ADD KEY `USUARIOS_ID` (`USUARIOS_ID`);

--
-- Indices de la tabla `PEDIDO`
--
ALTER TABLE `PEDIDO`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `COTIZACIONES_ID` (`COTIZACIONES_ID`),
  ADD KEY `DIRECCIONES_ID` (`DIRECCIONES_ID`);

--
-- Indices de la tabla `PQR`
--
ALTER TABLE `PQR`
  ADD KEY `USUARIOS_ID` (`USUARIOS_ID`);

--
-- Indices de la tabla `PRECIO_OFERTA`
--
ALTER TABLE `PRECIO_OFERTA`
  ADD PRIMARY KEY (`USUARIOS_ID`,`PRODUCTO_ID`),
  ADD KEY `PRECIO_OFERTA_FKIndex1` (`PRODUCTO_ID`);

--
-- Indices de la tabla `PRODUCTO`
--
ALTER TABLE `PRODUCTO`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CATEGORIAS_ID` (`CATEGORIAS_ID`);

--
-- Indices de la tabla `USUARIOS`
--
ALTER TABLE `USUARIOS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `VENDEDOR_FK` (`VENDEDOR_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ARTICULO`
--
ALTER TABLE `ARTICULO`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ATRIBUTO`
--
ALTER TABLE `ATRIBUTO`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT de la tabla `CATEGORIAS`
--
ALTER TABLE `CATEGORIAS`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `COTIZACIONES`
--
ALTER TABLE `COTIZACIONES`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `DETAL_PEDIDO`
--
ALTER TABLE `DETAL_PEDIDO`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `DIRECCIONES`
--
ALTER TABLE `DIRECCIONES`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ETIQUETA`
--
ALTER TABLE `ETIQUETA`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `HISTORIAL_CLIENTE`
--
ALTER TABLE `HISTORIAL_CLIENTE`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PEDIDO`
--
ALTER TABLE `PEDIDO`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PRODUCTO`
--
ALTER TABLE `PRODUCTO`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `USUARIOS`
--
ALTER TABLE `USUARIOS`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ATRIBUTO`
--
ALTER TABLE `ATRIBUTO`
  ADD CONSTRAINT `atributo_ibfk_1` FOREIGN KEY (`ARTICULO_ID_FK`) REFERENCES `ARTICULO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `atributo_ibfk_2` FOREIGN KEY (`ETIQUETA_ID_FK`) REFERENCES `ETIQUETA` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `COTIZACIONES`
--
ALTER TABLE `COTIZACIONES`
  ADD CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `USUARIOS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`DETAL_PEDIDO_ID`) REFERENCES `DETAL_PEDIDO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `DETAL_PEDIDO`
--
ALTER TABLE `DETAL_PEDIDO`
  ADD CONSTRAINT `detal_pedido_ibfk_1` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `PRODUCTO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `DIRECCIONES`
--
ALTER TABLE `DIRECCIONES`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `USUARIOS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ETIQUETA`
--
ALTER TABLE `ETIQUETA`
  ADD CONSTRAINT `etiqueta_ibfk_1` FOREIGN KEY (`PADRE_ID_FK`) REFERENCES `ETIQUETA` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `HISTORIAL_CLIENTE`
--
ALTER TABLE `HISTORIAL_CLIENTE`
  ADD CONSTRAINT `historial_cliente_ibfk_1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `USUARIOS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `historial_cliente_ibfk_2` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `PRODUCTO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `PEDIDO`
--
ALTER TABLE `PEDIDO`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`COTIZACIONES_ID`) REFERENCES `COTIZACIONES` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`DIRECCIONES_ID`) REFERENCES `DIRECCIONES` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `PQR`
--
ALTER TABLE `PQR`
  ADD CONSTRAINT `pqr_ibfk_1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `USUARIOS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `PRECIO_OFERTA`
--
ALTER TABLE `PRECIO_OFERTA`
  ADD CONSTRAINT `precio_oferta_ibfk_1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `USUARIOS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `precio_oferta_ibfk_2` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `PRODUCTO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `PRODUCTO`
--
ALTER TABLE `PRODUCTO`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`CATEGORIAS_ID`) REFERENCES `CATEGORIAS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `USUARIOS`
--
ALTER TABLE `USUARIOS`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`VENDEDOR_FK`) REFERENCES `USUARIOS` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
