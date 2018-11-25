-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-11-2018 a las 15:03:32
-- Versión del servidor: 10.2.17-MariaDB
-- Versión de PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u868365439_turis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerta`
--

CREATE TABLE `alerta` (
  `id` int(11) NOT NULL,
  `iniciador` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `latutud` double NOT NULL,
  `longitud` double NOT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `monto` double NOT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `lat_origen` double NOT NULL,
  `lon_origen` double NOT NULL,
  `lat_destino` double NOT NULL,
  `lon_destino` double NOT NULL,
  `monto` double NOT NULL,
  `estado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_conductor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `fecha`, `hora`, `lat_origen`, `lon_origen`, `lat_destino`, `lon_destino`, `monto`, `estado`, `id_solicitud`, `id_vehiculo`, `id_conductor`) VALUES
(1, '2018-10-22', '12:35:20', -17.7943563, -63.1841529, -17.797086143487142, -63.186093270778656, 25, 'proceso', 6, 6, 69);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `id` int(11) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `lat_origen` double NOT NULL,
  `lon_origen` double NOT NULL,
  `lat_destino` double NOT NULL,
  `lon_destino` double NOT NULL,
  `estado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`id`, `fecha`, `hora`, `lat_origen`, `lon_origen`, `lat_destino`, `lon_destino`, `estado`, `id_cliente`) VALUES
(6, '2018-10-22', '12:35:20', -17.7943563, -63.1841529, -17.797086143487142, -63.186093270778656, 'aceptado', 16),
(8, '2018-10-24', '13:27:11', -17.7934318, -63.1866197, -17.78459960647026, -63.182306326925755, 'enviado', 17),
(9, '2018-10-31', '17:18:22', -17.7944117, -63.1841442, -17.79617633148729, -63.18654756993055, 'enviado', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `ci` int(11) DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipoCliente` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `tipoConductor` varchar(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `ci`, `nombre`, `apellido`, `telefono`, `direccion`, `foto`, `email`, `password`, `tipoCliente`, `tipoConductor`) VALUES
(1, 2413578, 'juan', 'vargas', '4587126', 'av. irala', 'https://definicion.mx/wp-content/uploads/2014/04/persona.jpg', 'juan@gmail.com', '123456', 'no', 'si'),
(2, 0, 'luis pedro', 'vargas', '75071150', 'null', 'null', 'luis@gmail.com', '123456', 'si', 'no'),
(3, 0, 'rodri', 'medrsno', '3456321', 'null', 'null', 'roderi@gmail.com', '123456', 'si', 'no'),
(5, 0, 'lucho', 'quispe', '2345642', 'null', 'null', 'lucho@gmail.com', '123455', 'si', 'no'),
(6, 0, 'mmmm', 'mmmm', '2456678', 'null', 'null', 'mmm@gmail.com', '123456', 'si', 'no'),
(7, 0, 'nnnn', 'nnnnn', '12344567', 'null', 'null', 'nnn@gmail.com', '123456', 'si', 'no'),
(8, 0, 'jjjjj', 'jjjjj', '12345355', 'null', 'null', 'jjj@gmail.com', '123456', 'si', 'no'),
(9, 0, 'Ppp', 'Ppp', '123456', 'null', 'null', 'ppp@gmail.com', '123456', 'si', 'no'),
(10, 0, 'Hhh', 'Hhh', '123566', 'null', 'null', 'hhh@gmail.com', '123456', 'si', 'no'),
(11, 0, 'lll', 'lll', '2464146', 'null', 'null', 'lll@gmail.com', '123456', 'si', 'no'),
(12, 0, 'Yyy', 'Yyyy', '1294948', 'null', 'null', 'yyy@gmail.com', '123456', 'si', 'no'),
(13, 0, 'Ggg', 'Ggg', '1234567', 'null', 'null', 'ggg@gmail.com', '123456', 'si', 'no'),
(14, 0, 'null', 'null', 'null', 'null', 'null', 'ooo@gmail.com', '123456', 'si', 'no'),
(15, 0, 'null', 'null', 'null', 'null', 'null', 'ttt@gmail.com', '123456', 'si', 'no'),
(16, 0, 'null', 'null', 'null', 'null', 'null', '', '', 'si', 'no'),
(17, 0, 'null', 'null', 'null', 'null', 'null', 'zzz@gmail.com', '123456', 'si', 'no'),
(18, 0, 'null', 'null', 'null', 'null', 'null', 'xxx@gmail.com', '123456', 'si', 'no'),
(19, 0, 'null', 'null', 'null', 'null', 'null', 'xyz@gmail.com', '123456', 'si', 'no'),
(20, 98564, 'cesar', 'xxx', '76545734', 'sdvsdvsdvsdfcdcd', 'dfsdfsdf', 'cesarmundoparati@hotmail.com', '98564', 'no', 'si'),
(21, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(22, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(23, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(24, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(25, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(26, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(27, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(28, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(29, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(30, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(31, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(32, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(33, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(34, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(35, 9796438, 'cesar matehus', 'fuentes jucha', '73643349', 'plan 3000', 'dfsdfsdf', 'cesarfuentes120594@gmail.com', '9796438', 'no', 'si'),
(36, 9796438, 'cesar', 'zzzz', '8574634', 'asfas', '01.PNG', 'Josuecocoman.jc@gmail.com', '9796438', 'no', 'si'),
(37, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(38, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(39, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(40, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(41, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(42, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(43, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(44, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(45, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(46, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(47, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(48, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(49, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(50, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(51, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(52, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(53, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(54, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(55, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(56, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(57, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(58, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(59, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(60, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(61, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(62, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(63, 324, 'cesar', 'sdfsdsdgcdcdcdcd', '7453475', 'asfas', '[object Object]', 'Josuecocoman.jc@gmail.com', '324', 'no', 'si'),
(64, 4556, 'luis', 'medrano cabalero', '75071150', 'calle valle grande', '[object Object]', 'rodrigomedrano.0108@gmail.com', '4556', 'no', 'si'),
(65, 4556, 'luis', 'medrano cabalero', '75071150', 'calle valle grande', '[object Object]', 'rodrigomedrano.0108@gmail.com', '4556', 'no', 'si'),
(66, 4556, 'luis', 'medrano cabalero', '75071150', 'calle valle grande', '[object Object]', 'rodrigomedrano.0108@gmail.com', '4556', 'no', 'si'),
(67, 5374562, 'luis', 'medrano cabalero', '75071150', 'calle valle grande', '[object Object]', 'luis1@gmail.com', '5374562', 'no', 'si'),
(68, 0, 'null', 'null', 'null', 'null', 'null', 'wse@gmail.com', '123456', 'si', 'no'),
(69, 74851266, 'juncho', 'vargas perez', '4712896', 'calle valle grande', NULL, '', '', 'no', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL,
  `placa` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `ruat` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `modelo` int(11) NOT NULL,
  `marca` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `color` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `foto` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_conductor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id`, `placa`, `ruat`, `modelo`, `marca`, `color`, `foto`, `id_conductor`) VALUES
(1, '2632zae', '8484321646', 2010, 'jinyee', 'negro', 'asdfsdfsdf', 34),
(2, '2632zae', '8484321646', 2010, 'jinyee', 'negro', 'asdfsdfsdf', 35),
(3, '', '8484321646', 2010, 'jinyee', 'blanco', 'ascac.png', 36),
(4, '454dfg', '45645564', 6456, 'sdfsdg', 'sgsdg', 'NOCDB.jpg', 66),
(5, '454dfg', '45645564', 6456, 'sdfsdg', 'sgsdg', 'asmsnmp.jpg', 67),
(6, '7485-kiu', '124589', 2018, 'zuzuki', 'verde', '', 69);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_conductor` (`id_conductor`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_conductor` (`id_conductor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alerta`
--
ALTER TABLE `alerta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD CONSTRAINT `alerta_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_conductor`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_conductor`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
