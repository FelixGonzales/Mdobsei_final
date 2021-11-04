-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2021 at 03:04 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mdobsei`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblequipos`
--

CREATE TABLE `tblequipos` (
  `id` int(10) NOT NULL,
  `codigo_patrimonio` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `orden_compra` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `serie_numero` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_bien` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `marca` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `idestado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tblequipos`
--

INSERT INTO `tblequipos` (`id`, `codigo_patrimonio`, `orden_compra`, `serie_numero`, `nombre_bien`, `marca`, `idestado`) VALUES
(1, 'NT', 'NT', 'CL6RC42', 'SERVIDOR', 'DELL', 4),
(2, 'NT', 'NT', 'BH2RD42', 'SERVIDOR', 'DELL', 4),
(3, '740892000336', '466-2010', 'DFXNJN1', 'SERVIDOR', 'DELL', 4),
(4, '740892000351', '466-2010', '16GNJN1', 'SERVIDOR', 'DELL', 4),
(5, '740892000370', '504-2010', 'JKLNQN1', 'SERVIDOR', 'DELL', 2),
(6, '740892000244', '466-2010', 'BFMGJN1', 'SERVIDOR', 'DELL', 3),
(7, '740892000311', '466-2010', 'CRMNJN1', 'SERVIDOR', 'DELL', 3),
(15, '740892000271', '466-2010', '9GXNJN1', 'SERVIDOR', 'DELL', 2),
(16, '740892000324', '466-2010', '8NTGJN1', 'SERVIDOR', 'DELL', 2),
(17, '740892000262', '466-2010', '2HXNJN1', 'SERVIDOR', 'DELL', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblequipos_old`
--

CREATE TABLE `tblequipos_old` (
  `id` int(11) NOT NULL,
  `codigo_patrimonio` varchar(15) NOT NULL,
  `orden_compra` varchar(25) CHARACTER SET utf8 NOT NULL,
  `serie_numero` varchar(30) CHARACTER SET utf8 NOT NULL,
  `nombre_bien` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `marca` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idestado` int(11) DEFAULT 5,
  `fecha_registro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblequipos_old`
--

INSERT INTO `tblequipos_old` (`id`, `codigo_patrimonio`, `orden_compra`, `serie_numero`, `nombre_bien`, `marca`, `idestado`, `fecha_registro`) VALUES
(1, '', '', '', 'Printer', '', 5, 2021),
(2, '', '', '', 'Laptop', '', 1, 2015),
(3, '', '', '', 'Monitor', '', 1, 2000),
(4, '', '', '', 'PC', '', 1, 2016),
(5, '', '', '', 'Impresora', '', 4, 2019),
(6, '', '', '', 'Escanner', '', 4, 2002),
(7, '', '', '', 'Monitor', '', 4, 2004),
(8, '', '', '', 'Laptop', '', 4, 2020),
(9, '', '', '', 'Laptop', '', 3, 1996),
(10, '', '', '', 'Servidor', '', 5, NULL),
(11, 'E010', '455-2021', '897612', 'Laptop', 'Dell', 5, NULL),
(12, 'E011', '466-2021', 'ABC987', 'Celular', 'Sony', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblestado`
--

CREATE TABLE `tblestado` (
  `idestado` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblestado`
--

INSERT INTO `tblestado` (`idestado`, `estado`) VALUES
(1, 'Inoperativo mantenimiento correctivo'),
(2, 'Inoperativo obsolescencia tecnica'),
(3, 'Operativo obsolescencia tecnica'),
(4, 'Operativo sin observaciones'),
(5, 'Sin Revisar');

-- --------------------------------------------------------

--
-- Table structure for table `tblfuncion`
--

CREATE TABLE `tblfuncion` (
  `idfuncion` int(11) NOT NULL,
  `funcion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblfuncion`
--

INSERT INTO `tblfuncion` (`idfuncion`, `funcion`) VALUES
(1, 'EN USO'),
(2, 'EN ALMACEN');

-- --------------------------------------------------------

--
-- Table structure for table `tblinventario`
--

CREATE TABLE `tblinventario` (
  `idinventario` int(11) NOT NULL,
  `patrimonio` varchar(25) DEFAULT NULL,
  `informatico` varchar(25) DEFAULT NULL,
  `periodo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblpersona`
--

CREATE TABLE `tblpersona` (
  `idpersona` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `idrol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpersona`
--

INSERT INTO `tblpersona` (`idpersona`, `nombre`, `apellido`, `idrol`) VALUES
(1, 'Julio', 'Cervera', 1),
(2, 'Karen', 'Obregon', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblrol`
--

CREATE TABLE `tblrol` (
  `idrol` int(11) NOT NULL,
  `rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblrol`
--

INSERT INTO `tblrol` (`idrol`, `rol`) VALUES
(1, 'admin'),
(2, 'vendedor');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `iduser` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `idpersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`iduser`, `usuario`, `pass`, `idpersona`) VALUES
(1, 'admin', 'admin', 1),
(2, 'karito', 'karito', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `last_session` datetime DEFAULT '1970-01-02 00:00:00',
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `username`, `password`, `tipo`, `last_session`, `fecha_creacion`) VALUES
(1, 'soporte', 'soporte', 1, '2021-10-05 23:27:19', '2021-06-20 19:30:50'),
(2, 'admin', 'admin', 2, '2021-10-11 21:56:25', '2021-07-21 18:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_info`
--

CREATE TABLE `usuarios_info` (
  `idusuarios_info` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios_info`
--

INSERT INTO `usuarios_info` (`idusuarios_info`, `nombre`, `apellido`, `idusuario`) VALUES
(1, 'Julio', 'Cervera', 1),
(2, 'Administrador', 'Admin', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblequipos`
--
ALTER TABLE `tblequipos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblequipos_old`
--
ALTER TABLE `tblequipos_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblestado`
--
ALTER TABLE `tblestado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indexes for table `tblfuncion`
--
ALTER TABLE `tblfuncion`
  ADD PRIMARY KEY (`idfuncion`);

--
-- Indexes for table `tblinventario`
--
ALTER TABLE `tblinventario`
  ADD PRIMARY KEY (`idinventario`);

--
-- Indexes for table `tblpersona`
--
ALTER TABLE `tblpersona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indexes for table `tblrol`
--
ALTER TABLE `tblrol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indexes for table `usuarios_info`
--
ALTER TABLE `usuarios_info`
  ADD PRIMARY KEY (`idusuarios_info`),
  ADD KEY `usri_ibfk_1` (`idusuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblequipos`
--
ALTER TABLE `tblequipos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblequipos_old`
--
ALTER TABLE `tblequipos_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblestado`
--
ALTER TABLE `tblestado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblfuncion`
--
ALTER TABLE `tblfuncion`
  MODIFY `idfuncion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblinventario`
--
ALTER TABLE `tblinventario`
  MODIFY `idinventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblpersona`
--
ALTER TABLE `tblpersona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblrol`
--
ALTER TABLE `tblrol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios_info`
--
ALTER TABLE `usuarios_info`
  MODIFY `idusuarios_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `usuarios_info`
--
ALTER TABLE `usuarios_info`
  ADD CONSTRAINT `usri_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
