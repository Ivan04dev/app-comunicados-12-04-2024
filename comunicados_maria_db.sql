-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-04-2024 a las 05:58:12
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
-- Base de datos: `comunicados`
--
CREATE DATABASE comunicados;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atc_lectura`
--

CREATE TABLE `atc_lectura` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHACREADO` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TITULO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `TIPOLECTURA` varchar(255) NOT NULL,
  `USUARIO` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atc_reportelectura`
--

CREATE TABLE `atc_reportelectura` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDLECTURA` int(11) NOT NULL,
  `USUARIORED` varchar(255) NOT NULL,
  `CIUDAD` varchar(255) NOT NULL,
  `TITULO` varchar(255) NOT NULL,
  `ESTATUS` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  `APERTURAPAG` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHALEIDO` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atc_staff`
--

CREATE TABLE `atc_staff` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMEMPLEADO` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `APPATERNO` varchar(255) NOT NULL,
  `APMATERNO` varchar(255) NOT NULL,
  `CORREO` varchar(255) NOT NULL,
  `SUCURSAL` varchar(255) NOT NULL,
  `PUESTO` varchar(255) NOT NULL,
  `USUARIORED` varchar(255) NOT NULL,
  `ULTIMASESION` timestamp NOT NULL DEFAULT current_timestamp(),
  `CONTRASENIA` varchar(255) NOT NULL,
  `FECHAINGRESO` date NOT NULL,
  `USUARIOMODIFICA` varchar(255) NOT NULL,
  `FECHAMODIFICACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `ESTADO` varchar(255) NOT NULL,
  `NIVEL` varchar(255) NOT NULL,
  `RFC` varchar(255) NOT NULL,
  `FECHANACIMIENTO` varchar(255) NOT NULL,
  `IDSIEBEL` varchar(255) NOT NULL,
  `IDSIEBEL2` varchar(255) NOT NULL,
  `PERFILSIEBEL` varchar(255) NOT NULL,
  `SISTEMACOBRO` varchar(255) NOT NULL,
  `NOMBRESIEBEL` varchar(255) NOT NULL,
  `NUMEROPLAZA` varchar(255) NOT NULL,
  `NOMINERA` varchar(255) NOT NULL,
  `AREA` varchar(255) NOT NULL,
  `GENERO` varchar(255) NOT NULL,
  `USUARIOREDII` varchar(255) NOT NULL,
  `IDVLOCITY` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `atc_sucursal`
--


CREATE TABLE `atc_sucursal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIVISION` varchar(255) DEFAULT NULL,
  `REGION` varchar(255) NOT NULL,
  `CIUDAD` varchar(255) NOT NULL,
  `SUCURSAL` varchar(255) NOT NULL,
  `HUB` varchar(255) DEFAULT NULL,
  `MARCA` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `HORARIOLV` varchar(255) DEFAULT NULL,
  `HORARIOSAB` varchar(255) DEFAULT NULL,
  `HORARIODOM` varchar(255) DEFAULT NULL,
  `GEOLOCALIZACION` varchar(255) DEFAULT NULL,
  `ENFUNCIONAMIENTO` varchar(255) DEFAULT NULL,
  `SAPID` varchar(255) DEFAULT NULL,
  `FELXII` varchar(255) DEFAULT NULL,
  `TT` varchar(255) DEFAULT NULL,
  `ATM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `comunicados_tabla`
--

CREATE TABLE `comunicados_tabla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `portada` varchar(255) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `puesto` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `division` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


