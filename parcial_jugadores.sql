-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2022 a las 16:20:53
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial_jugadores`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociacion`
--

CREATE TABLE `asociacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `presidente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asociacion`
--

INSERT INTO `asociacion` (`id`, `nombre`, `pais`, `presidente`) VALUES
(2, 'Asociacion de Futbol Argentino', 'Argentina', 'Claudio Fabian'),
(3, 'Asociacion de Futbol Colombiano', 'Colombia', 'Gionni Fantino'),
(4, 'Asociacion de Futbol Mexicano', 'Mexico', 'Carlos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club`
--

CREATE TABLE `club` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `asociacion_id` int(11) DEFAULT NULL,
  `entrenador_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `club`
--

INSERT INTO `club` (`id`, `nombre`, `asociacion_id`, `entrenador_id`) VALUES
(1, 'Santa Fe', 3, 1),
(2, 'Nacional', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club_competencia`
--

CREATE TABLE `club_competencia` (
  `club_id` int(11) NOT NULL,
  `competencia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competicion`
--

CREATE TABLE `competicion` (
  `id` int(11) NOT NULL,
  `fecha_fin` varchar(255) DEFAULT NULL,
  `fecha_inicio` varchar(255) DEFAULT NULL,
  `monto_premio` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `competicion`
--

INSERT INTO `competicion` (`id`, `fecha_fin`, `fecha_inicio`, `monto_premio`, `nombre`) VALUES
(1, '2022-12-08', '2022-11-15', '123124', 'Copa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--

CREATE TABLE `entrenador` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `edad` varchar(255) DEFAULT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `entrenador`
--

INSERT INTO `entrenador` (`id`, `apellido`, `edad`, `nacionalidad`, `nombre`) VALUES
(1, 'Espinosa', '29', 'Colombiana', 'Carlos'),
(2, 'Barba', '36', 'Colombiana', 'Lessly '),
(3, 'Garcia', '30', 'Colombiana', 'Jose');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `posicion` varchar(255) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id`, `apellido`, `nombre`, `numero`, `posicion`, `club_id`) VALUES
(1, 'Morelo', 'Wilson', '15', 'Delantero', 1),
(2, 'Gomez', 'Sebastian', '3', 'Defensa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asociacion`
--
ALTER TABLE `asociacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_cotas3p5k5u2ej7t8vkpfifar` (`nombre`),
  ADD KEY `FKp4usa0l4043loka6wr97d2s5u` (`asociacion_id`),
  ADD KEY `FKe6iihqa19if0x6ibnc92m20np` (`entrenador_id`);

--
-- Indices de la tabla `club_competencia`
--
ALTER TABLE `club_competencia`
  ADD PRIMARY KEY (`club_id`,`competencia_id`),
  ADD KEY `FKmj85ocbaruavv9v93ka5j0hi` (`competencia_id`);

--
-- Indices de la tabla `competicion`
--
ALTER TABLE `competicion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK111u32peq23708kox3mamcqs5` (`club_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asociacion`
--
ALTER TABLE `asociacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `club`
--
ALTER TABLE `club`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `competicion`
--
ALTER TABLE `competicion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `FKe6iihqa19if0x6ibnc92m20np` FOREIGN KEY (`entrenador_id`) REFERENCES `entrenador` (`id`),
  ADD CONSTRAINT `FKp4usa0l4043loka6wr97d2s5u` FOREIGN KEY (`asociacion_id`) REFERENCES `asociacion` (`id`);

--
-- Filtros para la tabla `club_competencia`
--
ALTER TABLE `club_competencia`
  ADD CONSTRAINT `FKh37akq1ul5tdvxiucoqu2rwor` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`),
  ADD CONSTRAINT `FKmj85ocbaruavv9v93ka5j0hi` FOREIGN KEY (`competencia_id`) REFERENCES `competicion` (`id`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `FK111u32peq23708kox3mamcqs5` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
