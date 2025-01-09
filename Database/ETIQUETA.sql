-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-12-2024 a las 20:30:15
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
(2, 'PORTATIL', 'DES', 'ACTIVO', NULL),
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
(66, '16\'\'', 'asd', 'ACTIVO', 13);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ETIQUETA`
--
ALTER TABLE `ETIQUETA`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PADRE_ID_FK` (`PADRE_ID_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ETIQUETA`
--
ALTER TABLE `ETIQUETA`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ETIQUETA`
--
ALTER TABLE `ETIQUETA`
  ADD CONSTRAINT `etiqueta_ibfk_1` FOREIGN KEY (`PADRE_ID_FK`) REFERENCES `ETIQUETA` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
