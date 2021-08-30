-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-08-2021 a las 16:26:57
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Mounut`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` smallint(6) NOT NULL,
  `nombre_cargo` varchar(30) NOT NULL,
  `vigencia` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nombre_cargo`, `vigencia`) VALUES
(1, 'ADMINISTRADOR', b'1'),
(2, 'USUARIOS', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` smallint(6) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre_categoria`, `estado`) VALUES
(1, 'ZAPATOS', b'1'),
(2, 'CALCETINES', b'1'),
(3, 'ACCESORIOS', b'1'),
(4, 'PLAYERA', b'1'),
(5, 'PANTALON', b'1'),
(6, 'TENIS', b'1'),
(7, 'SACO', b'1'),
(49, 'TACONES', b'1'),
(52, 'VESTIDO', b'1'),
(53, 'CAMISA', b'0'),
(54, 'CHAMARRA', b'1'),
(55, 'SUDADERA', b'1'),
(56, 'SUETER', b'1'),
(57, 'GORRA', b'1'),
(58, 'DISFRAZ', b'1'),
(59, 'ZAPATILLAS', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) UNSIGNED NOT NULL,
  `Numero_doc` varchar(11) DEFAULT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `tipo_identificacion_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Numero_doc`, `Nombres`, `Direccion`, `Email`, `Password`, `tipo_identificacion_id`) VALUES
(17, '7775996014', 'Juan Perez', 'Calle hacienda de cocoyoc', 'ulises_stamfer@hotmail.com', '1234', 1),
(21, '7775996014', 'Adrian Rojo', 'Calle hacienda de cocoyoc', 'ulises_stamfer@hotmail.com', '1234', 1),
(22, '7775996014', 'Miguel', 'Calle hacienda de cocoyoc', 'ulises_stamfer@hotmail.com', '1234', 1),
(23, '7775996014', 'Jorge Andres', 'Calle hacienda de cocoyoc', 'ulises_stamfer@hotmail.com', '1234', 1),
(24, '7775996014', 'Antonio Perez', 'Calle hacienda de cocoyoc', 'ulises_stamfer@hotmail.com', '1234', 1),
(25, '7775996014', 'Héctor Ulises', 'Calle hacienda de cocoyoc', '20203TN159@utez.edu.mx', '1234', 1),
(26, '7775996014', 'Héctor Daniel', 'Calle Hacienda de cocoyoc', '20203tn158@utez.edu.mx', '1234', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompras` int(11) UNSIGNED NOT NULL,
  `idCliente` int(11) UNSIGNED NOT NULL,
  `idPago` int(11) UNSIGNED NOT NULL,
  `FechaCompras` date DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `Despachado` bit(1) NOT NULL,
  `Anular` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompras`, `idCliente`, `idPago`, `FechaCompras`, `Monto`, `Estado`, `Despachado`, `Anular`) VALUES
(7, 17, 16, '2021-06-08', 3500, 'E', b'0', b'1'),
(8, 21, 18, '2021-06-08', 6829, 'R', b'1', b'1'),
(9, 22, 19, '2021-06-03', 9197, 'E', b'0', b'1'),
(10, 17, 20, '2021-06-10', 13500, 'E', b'0', b'1'),
(11, 17, 21, '2021-06-10', 8000, 'R', b'1', b'1'),
(12, 17, 22, '2021-06-10', 2250, 'E', b'0', b'0'),
(13, 17, 23, '2021-06-10', 6000, 'R', b'1', b'0'),
(14, 21, 24, '2021-08-25', 3000, 'E', b'0', b'0'),
(15, 21, 25, '2021-08-25', 1500, 'E', b'0', b'0'),
(16, 21, 26, '2021-08-26', 4500, 'E', b'0', b'0'),
(17, 21, 27, '2021-08-29', 3000, 'R', b'1', b'0'),
(18, 25, 28, '2021-08-30', 4700, 'E', b'0', b'0'),
(19, 25, 29, '2021-08-30', 1500, 'E', b'0', b'0'),
(20, 25, 30, '2021-08-30', 450, 'E', b'0', b'0'),
(21, 26, 31, '2021-08-30', 700, 'E', b'0', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `idProducto` int(11) UNSIGNED NOT NULL,
  `idCompras` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioCompra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`idDetalle`, `idProducto`, `idCompras`, `Cantidad`, `PrecioCompra`) VALUES
(9, 20, 7, 5, 700),
(10, 38, 7, 1, 2199),
(11, 26, 7, 1, 4500),
(12, 31, 7, 2, 5600),
(13, 31, 8, 1, 5600),
(14, 32, 8, 2, 500),
(15, 45, 8, 1, 229),
(16, 37, 9, 2, 3499),
(17, 38, 9, 1, 2199),
(18, 26, 10, 3, 4500),
(19, 22, 11, 5, 1600),
(20, 30, 12, 5, 450),
(21, 24, 13, 2, 3000),
(22, 21, 14, 2, 1500),
(23, 29, 15, 1, 1500),
(24, 21, 16, 3, 1500),
(25, 21, 17, 2, 1500),
(26, 21, 18, 1, 1500),
(27, 22, 18, 2, 1600),
(28, 21, 19, 1, 1500),
(29, 30, 20, 1, 450),
(30, 20, 21, 1, 700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` smallint(6) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` char(9) NOT NULL,
  `sexo` char(1) NOT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `tipo_identificacion_id` smallint(6) DEFAULT NULL,
  `numero_identicacion` char(11) DEFAULT NULL,
  `cargo_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` smallint(6) NOT NULL,
  `nombre_marca` varchar(50) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre_marca`, `estado`) VALUES
(1, 'CARLO CARMONA RUIZ', b'1'),
(2, 'DIEGO FERNÁNDEZ GARCÍA', b'1'),
(3, 'HECTOR  DANIEL MARQUINA RODRIGUEZ', b'1'),
(4, 'LUIS DANIEL LOPEZ WONG', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) UNSIGNED NOT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idPago`, `Monto`) VALUES
(16, 3500),
(18, 6829),
(19, 9197),
(20, 13500),
(21, 8000),
(22, 2250),
(23, 6000),
(24, 3000),
(25, 1500),
(26, 4500),
(27, 3000),
(28, 4700),
(29, 1500),
(30, 450),
(31, 700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) UNSIGNED NOT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int(11) UNSIGNED DEFAULT NULL,
  `categoria_id` smallint(6) DEFAULT NULL,
  `marca_id` smallint(6) NOT NULL,
  `proveedor_id` smallint(6) NOT NULL,
  `estado` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Nombres`, `Foto`, `Descripcion`, `Precio`, `Stock`, `categoria_id`, `marca_id`, `proveedor_id`, `estado`) VALUES
(20, 'Vestido de Flores', 'http://localhost:80/carrito/vestido.png', 'Un vestido elegante de flores', 700, 78, 52, 1, 1, b'1'),
(21, 'Bufanda Rojo', 'http://localhost:80/carrito/bufanda.png', 'Una bufanda roja', 1500, 989, 3, 1, 1, b'0'),
(22, 'Camisa de vestir', 'http://localhost:80/carrito/camisa.png', 'Una camisa blanca de vestir', 1600, 992, 53, 1, 1, b'1'),
(23, 'Playera Gris', 'http://localhost:80/carrito/playeras.png', 'Playera gris para salir', 150, 98, 4, 1, 1, b'1'),
(24, 'Chamarra Azul', 'http://localhost:80/carrito/Chamarra.png', 'Una chamarra azul', 3000, 698, 54, 1, 1, b'1'),
(25, 'Tenis rayo mcqueen', 'http://localhost:80/carrito/cuchao.png', 'Unos tenis del rayo mcqueen para ir bien rapido', 200, 1000, 6, 1, 1, b'1'),
(26, 'Paliacate', 'http://localhost:80/carrito/paliacate.png', 'Un paliacate para navajear', 4500, 996, 3, 1, 1, b'1'),
(28, 'Pantalones buchon', 'http://localhost:80/carrito/panta buchon.png', 'Pantalones de buchon', 16200, 1000, 5, 1, 1, b'1'),
(29, 'Calcetines Patricio', 'http://localhost:80/carrito/pat.png', 'Unos calcetines de patricio', 1500, 4999, 2, 1, 1, b'1'),
(30, 'Playera de Starlord', 'http://localhost:80/carrito/star.png', 'Playera de Starlord', 450, 1194, 4, 1, 1, b'1'),
(31, 'Sudadera Buggs Bunny', 'http://localhost:80/carrito/bunny.png', 'Una sudadera de buggs bunny', 5600, 97, 56, 1, 1, b'1'),
(32, 'Playera Snoopy', 'http://localhost:80/carrito/snopy.png', 'Playera de snoopy ', 500, 198, 4, 1, 1, b'1'),
(37, 'Traje Spiderman', 'http://localhost:80/carrito/spidey.png', 'Traje de spiderman para fiestas infantiles', 3499, 98, 58, 1, 1, b'1'),
(38, 'Sueter SpiderMan', 'http://localhost:80/carrito/sueter.png', 'Sueter de Spiderman', 2199, 498, 56, 1, 1, b'1'),
(39, 'Gorra Forest', 'http://localhost:80/carrito/forrest.png', 'Una gorra de forest', 4599, 250, 57, 1, 1, b'1'),
(45, 'Tenis Jbalvin', 'http://localhost:80/carrito/jbalvin.png', 'Tenis de jbalvin', 229, 228, 6, 1, 1, b'1'),
(48, 'Zapatillas Rosas', 'http://localhost:80/carrito/chamarra.png', 'Unas zapatilals rosas', 234, 123, 59, 1, 1, b'0'),
(49, 'Pantalon', 'http://localhost:80/carrito/snopy.png', 'Un pantalon de vestir elegante', 200, 123, 5, 2, 3, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` smallint(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tipo_identificacion_id` smallint(6) DEFAULT NULL,
  `telefono` varchar(11) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `direccion`, `telefono`, `email`, `tipo_identificacion_id`, `telefono`, `estado`) VALUES
(1, 'GRUPO A', 'DSDASDASD', '5435435', 'DSADSADSA', 2, '321312', b'0');
(2, 'GRUPO B', 'DSDASDASD', '5435435', 'DSADSADSA', 2, '321312', b'0');
(3, 'GRUPO C', 'DSDASDASD', '5435435', 'DSADSADSA', 2, '321312', b'0'),
(4, 'GRUPO D', 'DSDASDASD', '5435435', 'DSADSADSA', 2, '321312', b'0'),
(5, 'GRUPO E', 'DSDASDASD', '5435435', 'DSADSADSA', 2, '321312', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_identificacion`
--

CREATE TABLE `tipo_identificacion` (
  `id_tipo_identificacion` smallint(6) NOT NULL,
  `nombre_tipo_identifacion` char(20) DEFAULT NULL,
  `vigencia` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_identificacion`
--

INSERT INTO `tipo_identificacion` (`id_tipo_identificacion`, `nombre_tipo_identifacion`, `vigencia`) VALUES
(1, 'CELULAR', b'1'),
(2, 'RUC', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` smallint(6) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `clave` varchar(15) NOT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `empleado_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `clave`, `vigencia`, `empleado_id`) VALUES
(1, 'admin', 'admin123', b'0', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `cliente_tipo_identificacion_id` (`tipo_identificacion_id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `Compras_FKIndex1` (`idPago`),
  ADD KEY `Compras_FKIndex2` (`idCliente`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`,`idProducto`,`idCompras`),
  ADD KEY `Producto_has_Compras_FKIndex1` (`idProducto`),
  ADD KEY `Producto_has_Compras_FKIndex2` (`idCompras`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_empleado_cargo` (`cargo_id`),
  ADD KEY `fk_empleado_tipo_identificacion` (`tipo_identificacion_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_producto_categoria` (`categoria_id`),
  ADD KEY `fk_producto_marca` (`marca_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_identificacion`
--
ALTER TABLE `tipo_identificacion`
  ADD PRIMARY KEY (`id_tipo_identificacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_empleado` (`empleado_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_identificacion`
--
ALTER TABLE `tipo_identificacion`
  MODIFY `id_tipo_identificacion` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_tipo_identificacion_id` FOREIGN KEY (`tipo_identificacion_id`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_cargo` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id_cargo`),
  ADD CONSTRAINT `fk_empleado_tipo_identificacion` FOREIGN KEY (`tipo_identificacion_id`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `fk_producto_marca` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
