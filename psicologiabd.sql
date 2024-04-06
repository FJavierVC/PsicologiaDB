-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2024 a las 22:34:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `psicologiabd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antecedentes`
--

CREATE TABLE `antecedentes` (
  `IdAntecedentes` int(11) NOT NULL,
  `NoHistorial` int(11) NOT NULL,
  `Alimenticio` enum('Bueno','Malo','Regular','') NOT NULL,
  `Sueno` enum('Bueno','Malo','Regular','') NOT NULL,
  `Descanso` enum('Bueno','Malo','Regular','') NOT NULL,
  `Desarrollo_Psicomotor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `IdCita` int(11) NOT NULL,
  `IdPaciente` int(11) NOT NULL,
  `IdTerapeuta` int(11) NOT NULL,
  `FechaCita` datetime NOT NULL,
  `Duracion` time NOT NULL,
  `Modalidad` enum('Presencial','En linea','Telefonica','') NOT NULL,
  `Estado` enum('Pendiente','Confirmada','Cancelada','Completada') NOT NULL,
  `Notas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosfamiliares`
--

CREATE TABLE `datosfamiliares` (
  `IdFamiliar` int(11) NOT NULL,
  `NoHistorial` int(11) NOT NULL,
  `Nombre_M` varchar(255) NOT NULL,
  `Edad_M` int(11) NOT NULL,
  `Ocupacion_M` varchar(100) NOT NULL,
  `Nombre_P` varchar(255) NOT NULL,
  `Edad_P` int(11) NOT NULL,
  `Ocupacion_P` varchar(100) NOT NULL,
  `Hermanos` text NOT NULL,
  `Familiares_Anadidos` text NOT NULL,
  `Nombre_Conyugue` varchar(255) NOT NULL,
  `Edad_C` int(11) NOT NULL,
  `Ocupacion` varchar(100) NOT NULL,
  `Hijos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `IdDiagnostico` int(11) NOT NULL,
  `NoHistorial` int(11) NOT NULL,
  `Diagnostico` text NOT NULL,
  `Impresion_Clinica` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenesmentales`
--

CREATE TABLE `examenesmentales` (
  `IdExamenes` int(11) NOT NULL,
  `NoHistorial` int(11) NOT NULL,
  `Apariencia_General` enum('Aseado','Desalineado','Apropiado','Inapropiado para la situacion','Cansado','Agitado','Tranquilo') NOT NULL,
  `Actitud` enum('Positiva','Negativa','Depresiva','Ansiosa') NOT NULL,
  `Estado_Animo` enum('Alegre','Triste','Ansioso','Irritable','Apatetico','Euforico','Deprimido','Calmado','Confundido','Enojado') NOT NULL,
  `Contenido_Ideas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiales`
--

CREATE TABLE `historiales` (
  `NoHistorial` int(11) NOT NULL,
  `IdPaciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialescitas`
--

CREATE TABLE `historialescitas` (
  `IdHistorialCita` int(11) NOT NULL,
  `IdCita` int(11) NOT NULL,
  `Resumen` text NOT NULL,
  `Recomendaciones` text NOT NULL,
  `FechaRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivos`
--

CREATE TABLE `motivos` (
  `IdConsulta` int(11) NOT NULL,
  `NoHistorial` int(11) NOT NULL,
  `Motivo` text NOT NULL,
  `Pronostico` text NOT NULL,
  `FechaConsulta` date NOT NULL,
  `Inicio_Sintomas` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orientaciones`
--

CREATE TABLE `orientaciones` (
  `IdOrientacion` int(11) NOT NULL,
  `NoHistorial` int(11) NOT NULL,
  `Objetivo_Tratamiento` text NOT NULL,
  `Tecnicas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paceintes`
--

CREATE TABLE `paceintes` (
  `IdPaciente` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Lugar_Nacimiento` varchar(150) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Sexo` enum('Masculino','Femenino','Otro','') NOT NULL,
  `Estado_Civil` varchar(100) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Estudios` varchar(255) NOT NULL,
  `Ocupacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfilessociales`
--

CREATE TABLE `perfilessociales` (
  `IdSocial` int(11) NOT NULL,
  `NoHistorial` int(11) NOT NULL,
  `Relaciones_Afectivas` text NOT NULL,
  `Relaciones_Amistad` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terapeutas`
--

CREATE TABLE `terapeutas` (
  `IdTerapeuta` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Especialidad` varchar(150) NOT NULL,
  `Enfoque` varchar(150) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `ApellidoP` varchar(50) NOT NULL,
  `ApellidoM` varchar(50) NOT NULL,
  `Edad` int(11) NOT NULL,
  `NumeroTelefonico` varchar(20) NOT NULL,
  `Rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `antecedentes`
--
ALTER TABLE `antecedentes`
  ADD PRIMARY KEY (`IdAntecedentes`),
  ADD KEY `fk_antecedentes_historiales` (`NoHistorial`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`IdCita`),
  ADD KEY `fk_citas_paciente` (`IdPaciente`),
  ADD KEY `fk_citas_terapeutas` (`IdTerapeuta`);

--
-- Indices de la tabla `datosfamiliares`
--
ALTER TABLE `datosfamiliares`
  ADD PRIMARY KEY (`IdFamiliar`),
  ADD KEY `fk_datosfamiliares_historiales` (`NoHistorial`);

--
-- Indices de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`IdDiagnostico`),
  ADD KEY `fk_diagnosticos_Historiales` (`NoHistorial`);

--
-- Indices de la tabla `examenesmentales`
--
ALTER TABLE `examenesmentales`
  ADD PRIMARY KEY (`IdExamenes`),
  ADD KEY `fk_examenesmentales_historiales` (`NoHistorial`);

--
-- Indices de la tabla `historiales`
--
ALTER TABLE `historiales`
  ADD PRIMARY KEY (`NoHistorial`),
  ADD KEY `fk_historiales_pacientes` (`IdPaciente`);

--
-- Indices de la tabla `historialescitas`
--
ALTER TABLE `historialescitas`
  ADD PRIMARY KEY (`IdHistorialCita`),
  ADD KEY `fk_citas_historialcitas` (`IdCita`);

--
-- Indices de la tabla `motivos`
--
ALTER TABLE `motivos`
  ADD PRIMARY KEY (`IdConsulta`),
  ADD KEY `fk_motivos_Historial` (`NoHistorial`);

--
-- Indices de la tabla `orientaciones`
--
ALTER TABLE `orientaciones`
  ADD PRIMARY KEY (`IdOrientacion`),
  ADD KEY `fk_orientaciones_` (`NoHistorial`);

--
-- Indices de la tabla `paceintes`
--
ALTER TABLE `paceintes`
  ADD PRIMARY KEY (`IdPaciente`),
  ADD KEY `fk_pacientes_usuarios` (`IdUsuario`);

--
-- Indices de la tabla `perfilessociales`
--
ALTER TABLE `perfilessociales`
  ADD PRIMARY KEY (`IdSocial`),
  ADD KEY `fk_perfilessociales_historiales` (`NoHistorial`);

--
-- Indices de la tabla `terapeutas`
--
ALTER TABLE `terapeutas`
  ADD PRIMARY KEY (`IdTerapeuta`),
  ADD KEY `fk_terapeutas_usuarios` (`IdUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `antecedentes`
--
ALTER TABLE `antecedentes`
  MODIFY `IdAntecedentes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `IdCita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datosfamiliares`
--
ALTER TABLE `datosfamiliares`
  MODIFY `IdFamiliar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `IdDiagnostico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examenesmentales`
--
ALTER TABLE `examenesmentales`
  MODIFY `IdExamenes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historiales`
--
ALTER TABLE `historiales`
  MODIFY `NoHistorial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historialescitas`
--
ALTER TABLE `historialescitas`
  MODIFY `IdHistorialCita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `motivos`
--
ALTER TABLE `motivos`
  MODIFY `IdConsulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orientaciones`
--
ALTER TABLE `orientaciones`
  MODIFY `IdOrientacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paceintes`
--
ALTER TABLE `paceintes`
  MODIFY `IdPaciente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfilessociales`
--
ALTER TABLE `perfilessociales`
  MODIFY `IdSocial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `terapeutas`
--
ALTER TABLE `terapeutas`
  MODIFY `IdTerapeuta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `antecedentes`
--
ALTER TABLE `antecedentes`
  ADD CONSTRAINT `fk_antecedentes_historiales` FOREIGN KEY (`NoHistorial`) REFERENCES `historiales` (`NoHistorial`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_citas_paciente` FOREIGN KEY (`IdPaciente`) REFERENCES `paceintes` (`IdPaciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_citas_terapeutas` FOREIGN KEY (`IdTerapeuta`) REFERENCES `terapeutas` (`IdTerapeuta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datosfamiliares`
--
ALTER TABLE `datosfamiliares`
  ADD CONSTRAINT `fk_datosfamiliares_historiales` FOREIGN KEY (`NoHistorial`) REFERENCES `historiales` (`NoHistorial`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD CONSTRAINT `fk_diagnosticos_Historiales` FOREIGN KEY (`NoHistorial`) REFERENCES `historiales` (`NoHistorial`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `examenesmentales`
--
ALTER TABLE `examenesmentales`
  ADD CONSTRAINT `fk_examenesmentales_historiales` FOREIGN KEY (`NoHistorial`) REFERENCES `historiales` (`NoHistorial`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historiales`
--
ALTER TABLE `historiales`
  ADD CONSTRAINT `fk_historiales_pacientes` FOREIGN KEY (`IdPaciente`) REFERENCES `paceintes` (`IdPaciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historialescitas`
--
ALTER TABLE `historialescitas`
  ADD CONSTRAINT `fk_citas_historialcitas` FOREIGN KEY (`IdCita`) REFERENCES `citas` (`IdCita`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `motivos`
--
ALTER TABLE `motivos`
  ADD CONSTRAINT `fk_motivos_Historial` FOREIGN KEY (`NoHistorial`) REFERENCES `historiales` (`NoHistorial`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orientaciones`
--
ALTER TABLE `orientaciones`
  ADD CONSTRAINT `fk_orientaciones_` FOREIGN KEY (`NoHistorial`) REFERENCES `historiales` (`NoHistorial`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paceintes`
--
ALTER TABLE `paceintes`
  ADD CONSTRAINT `fk_pacientes_usuarios` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfilessociales`
--
ALTER TABLE `perfilessociales`
  ADD CONSTRAINT `fk_perfilessociales_historiales` FOREIGN KEY (`NoHistorial`) REFERENCES `historiales` (`NoHistorial`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `terapeutas`
--
ALTER TABLE `terapeutas`
  ADD CONSTRAINT `fk_terapeutas_usuarios` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
