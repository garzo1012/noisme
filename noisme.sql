-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-04-2013 a las 00:58:34
-- Versión del servidor: 5.5.29
-- Versión de PHP: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `pruebasNoisme`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id_notificacion` int(4) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(8) NOT NULL,
  `texto` varchar(300) NOT NULL,
  `id_publicacion` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_notificacion`),
  KEY `id_publicacion` (`id_publicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id_pregunta` int(4) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(8) NOT NULL,
  `texto` varchar(500) NOT NULL,
  `id_usuario` int(4) NOT NULL,
  PRIMARY KEY (`id_pregunta`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `id_publicacion` int(5) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) NOT NULL,
  `texto` varchar(140) NOT NULL,
  `tw/fb` int(1) NOT NULL,
  `archivo` varchar(50) NOT NULL,
  `fecha` varchar(8) NOT NULL,
  `like` int(3) NOT NULL,
  `dislike` int(3) NOT NULL,
  `id_usuario` int(4) NOT NULL,
  PRIMARY KEY (`id_publicacion`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id_respuesta` int(4) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(8) NOT NULL,
  `texto` varchar(300) NOT NULL,
  `like` int(2) NOT NULL,
  `dislike` int(2) NOT NULL,
  `id_usuario` int(4) NOT NULL,
  `id_pregunta` int(4) NOT NULL,
  PRIMARY KEY (`id_respuesta`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pregunta` (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usr-not`
--

CREATE TABLE `usr-not` (
  `id_usuario` int(4) NOT NULL,
  `id_notificacion` int(4) NOT NULL,
  `leido` int(1) NOT NULL,
  KEY `id_usuario` (`id_usuario`),
  KEY `id_notificacion` (`id_notificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(4) NOT NULL AUTO_INCREMENT,
  `token` varchar(20) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `puntos` varchar(4) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id_publicacion`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usr-not`
--
ALTER TABLE `usr-not`
  ADD CONSTRAINT `usr@002dnot_ibfk_2` FOREIGN KEY (`id_notificacion`) REFERENCES `notificacion` (`id_notificacion`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `usr@002dnot_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE NO ACTION;
