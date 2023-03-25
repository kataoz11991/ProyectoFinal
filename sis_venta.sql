SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



INSERT INTO `cliente` (`idcliente`, `nombre`, `telefono`, `direccion`, `usuario_id`, `estado`) VALUES
(1, 'Maria jose', '8296826298', 'S/D', 1, 1),
(2, 'Pedro luis', '2147483647', 'La Ceiba', 1, 1),
(4, 'Roberto', '33589304', 'Col. Melgar', 1, 1),
(5, 'Gladis', '9830384', 'Barrio Danto', 1, 1),
(6, 'Gabriel', '3493043', 'Barrio Mejia', 1, 1);


CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
(1, 'Sistema de Ventas KL', '925491523', 'info_ventasKL@gamil.com', 'La Ceiba');



CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `detalle_permisos` (`id`, `id_permiso`, `id_usuario`) VALUES
(8, 3, 2),
(9, 4, 2),
(10, 5, 2),
(11, 6, 2),
(12, 3, 3),
(13, 4, 3),
(14, 5, 3),
(15, 6, 3);


CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `id_usuario` varchar(50) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `detalle_venta` (`id`, `id_producto`, `id_venta`, `cantidad`, `precio`) VALUES
(1, 4, 1, 2, '13.00'),
(2, 3, 1, 1, '16.00'),
(3, 4, 2, 3, '13.00'),
(4, 2, 3, 1, '10.00'),
(5, 3, 4, 2, '16.00'),
(6, 2, 5, 1, '10.00'),
(7, 2, 6, 1, '10.00'),
(8, 2, 7, 1, '10.00'),
(9, 3, 8, 1, '16.00');



CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'configuración'),
(2, 'usuarios'),
(3, 'clientes'),
(4, 'productos'),
(5, 'ventas'),
(6, 'nueva_venta');



CREATE TABLE `producto` (
  `codproducto` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



INSERT INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`, `usuario_id`, `estado`) VALUES
(2, '321', 'Refresco', '10.00', 176, 1, 1),
(3, '654', 'Galletas', '16.00', 5, 1, 1),
(4, '987', 'Sandia', '13.00', 55, 1, 1),
(5, '12345', 'prueba', '1503.00', 50, 0, 0),
(6, '12345', 'prueba', '1503.00', 50, 0, 0);



CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`, `estado`) VALUES
(1, 'Kathya', 'kathya@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'denis', 'denis@gmail.com', 'denis', 'f4f068e71e0d87bf0ad51e6214ab84e9', 0),
(3, 'Lilian', 'lilian@gmail.com', 'lilian', '21232f297a57a5a743894a0e4a801fc3', 1);



CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `ventas` (`id`, `id_cliente`, `total`, `id_usuario`, `fecha`) VALUES
(1, 1, '42.00', 1, '2021-05-16 14:35:54'),
(2, 1, '39.00', 1, '2021-05-16 14:39:39'),
(3, 1, '10.00', 1, '2023-03-23 06:38:33'),
(4, 5, '32.00', 1, '2023-03-24 02:57:34'),
(5, 4, '10.00', 1, '2023-03-24 03:06:25'),
(6, 4, '10.00', 1, '2023-03-24 03:07:49'),
(7, 6, '10.00', 1, '2023-03-24 03:18:35'),
(8, 4, '16.00', 1, '2023-03-24 03:39:27');


ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);


ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `detalle_permisos`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`);


ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);


ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `detalle_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;


ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;


