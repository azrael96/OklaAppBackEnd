-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-12-2024 a las 20:30:58
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
(5, 'E1504FA-NJ474-1', 'ASUS E1504FA-NJ940 R5 7520U 16GB SSD 1TB 15″ FHD', 'Portátil ASUS E1504FA-NJ940 con un procesador AMD Ryzen5 R5-7520U, con 16 GB de memoria RAM, con un SSD de 1 TB de almacenamiento y una pantalla de 15\" Full HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/06/D_NQ_NP_607480-MLU69877099529_062023-O.webp', '1999900', '5', 'Activo'),
(6, '90NB11A2-M00AC0', 'ASUS M3604YA-MB281 R7 7730U 16GB/SSD1TB/16″ WUXGA', 'Portátil ASUS M3604YA-MB281 con un procesador AMD Ryzen7 R7-7730U, con 16 GB de memoria RAM, con un SSD de 1 TB de almacenamiento y una pantalla de 16\" WUXGA, ideal para diseño, negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/09/ASUS-L1011-2-850x850.png', '2479900', '5', 'Activo'),
(7, 'HN114', 'ASUS FX507ZC4-HN114 CI5 12500H 16GB 512GB 15.6″ RTX3050 4GB', 'Portátil Gamer ASUS TUF FX507ZC4-HN114 con un procesador Intel  Core CI5-12500H, con 16 GB de memoria RAM, con un SSD M.2 NVMe de 512 GB de almacenamiento y una pantalla de 15,6\" Full HD, ideal para juegos, diseño, negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/05/1-2-850x850.png', '3639900', '5', 'Activo'),
(8, 'A3202WBAK', 'ASUS AIO A3202WBAK-WPB003M CI3 1215U 16GB 512GB 21.5″', 'Computador Todo en Uno ASUS AIO A3202WBAK-WPB003M con un procesador Intel  Core CI3-1215U, con 16 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 21,5\" HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2022/07/1-850x850.png', '1739900', '5', 'Activo'),
(9, 'NH.QEKAL014', 'ACER NITRO AN515-58-79S3 CI7 12650H 8GB 512GB RTX 3050 4GB', 'Computador Gamer ACER NITRO AN515-58-79S3 con un procesador Intel  Core CI7-12650H, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" Full HD, ideal para juegos, diseño, negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/03/ACER-NITRO-5-850x850.png', '4219900', '3', 'Activo'),
(10, 'INSPIRON-3520 CI7-1-1', 'DELL 3520 CI5 1235U 8GB 512 PANTALLA 15.6 PLATA W11PRO', 'Portátil DELL INSPIRON 3520 con un procesador Intel  Core CI5-1235U, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" HD, ideal para negocios y oficinas.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/06/DELL-INSPIRON-3511-3-850x850.png', '2100000', '2', 'Activo'),
(11, '81WB01E2LM', 'LENOVO IP S3 CI3 N305 8GB 512SSD 15.6″ FROST BLUE', 'Portátil LENOVO IP S3 con un procesador Intel  Core CI3-N305, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2022/10/1-850x850.png', '1369900', '5', 'Activo'),
(12, 'lenovor3', 'LENOVO V14 G4 AMN R3 7320U 16GB 256SSD 14″ FHD', 'Portátil LENOVO V14 G4 con un procesador Intel  Core R3-7320U, con 16 GB de memoria RAM, con un SSD de 256 GB de almacenamiento y una pantalla de 14\" Full HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/02/gsc_123287180_3628205_5-850x850.jpeg', '1242000', '3', 'Activo'),
(13, '83ER002YLM-1', 'LENOVO IP S3 CI5 12450H 8GB 512SSD 15.6″ TOUCH', 'Portátil LENOVO IP S3 con un procesador Intel  Core CI5-12450H, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" HD TACTIL, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2024/03/1-1-850x850.png', '1789900', '4', 'Activo'),
(14, 'LENOVO LOQ', 'LENOVO LOQ CI5 12450X RTX 3050 DE 6GB 12+12GB 512GB 15.6″', 'Portátil Gamer LENOVO LOQ con un procesador Intel  Core CI5-12450X, con 24 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 15,6\" Full HD, ideal para juegos, diseño, negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2024/10/1-850x850.png', '3479900', '5', 'Activo'),
(15, '12B6001MLS-1-1', 'LENOVO AIO NEO 50A CI5 13420H 16GB 512GB 23.8″ W11P', 'Computador LENOVO AIO NEO 50A con un procesador Intel  Core CI5-13420H, con 16 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 23,8\" Full HD, ideal para negocios y oficinas.', 'https://oklahomacomputadores.com/wp-content/uploads/2024/07/2-6-850x850.png', '3899900', '5', 'Activo'),
(16, 'AIO240G9', 'HP AIO 240 G9 CI3 1215U 8GB 256SSD PANTALLA 23.8″', 'Computador HP AIO 240 G9 con un procesador Intel  Core CI3-1215U, con 8 GB de memoria RAM, con un SSD de 256 GB de almacenamiento y una pantalla de 23,8\" HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2023/12/1-850x850.png', '1829900', '20', 'Activo'),
(17, '6H9E8LA#ABM-1', 'HP 14-DQ5012LA CI3 1215U 8GB 512SSD 14″ LINUX', 'Portátil HP 14-DQ5012LA con un procesador Intel  Core CI3-1215U, con 8 GB de memoria RAM, con un SSD de 512 GB de almacenamiento y una pantalla de 14\" HD, ideal para negocios, estudio y trabajo personal.', 'https://oklahomacomputadores.com/wp-content/uploads/2024/07/1-7-850x850.png', '1219900', '4', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ARTICULO`
--
ALTER TABLE `ARTICULO`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ARTICULO`
--
ALTER TABLE `ARTICULO`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
