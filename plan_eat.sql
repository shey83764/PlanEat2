-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2025 a las 18:01:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `plan eat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mealplan`
--

CREATE TABLE `mealplan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mealplan_recipes`
--

CREATE TABLE `mealplan_recipes` (
  `id` int(11) NOT NULL,
  `mealplan_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `dia_semana` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') DEFAULT NULL,
  `comida` enum('Desayuno','Almuerzo','Merienda','Cena') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progress`
--

CREATE TABLE `progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `medidas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`medidas`)),
  `notas` text DEFAULT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL,
  `categoria` enum('Desayuno','Almuerzo','Merienda','Cena') NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `carbohidratos` decimal(6,2) DEFAULT 0.00,
  `proteinas` decimal(6,2) DEFAULT 0.00,
  `grasas` decimal(6,2) DEFAULT 0.00,
  `ingredientes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`ingredientes`)),
  `procedimiento` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`procedimiento`)),
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `categoria`, `nombre`, `carbohidratos`, `proteinas`, `grasas`, `ingredientes`, `procedimiento`, `creadoEn`) VALUES
(1, 'Desayuno', 'Tostadas integrales con palta y huevo', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Pan integral\", \"cantidad\": \"60 g (2 rebanadas)\"}, {\"ingrediente\": \"Palta\", \"cantidad\": \"50 g\"}, {\"ingrediente\": \"Huevo\", \"cantidad\": \"1 grande (50 g)\"}, {\"ingrediente\": \"Queso untable descremado\", \"cantidad\": \"20 g\"}, {\"ingrediente\": \"Café o té sin azúcar\", \"cantidad\": \"\"}]', '[\"Tostar el pan integral.\",\"Pisar la palta con un poco de sal.\",\"Cocinar el huevo (hervido o a la plancha).\",\"Untar una tostada con queso, la otra con palta y colocar el huevo encima.\"]', '2025-09-16 14:38:31'),
(2, 'Desayuno', 'Avena con frutas y frutos secos', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Avena arrollada\", \"cantidad\": \"40 g\"}, {\"ingrediente\": \"Leche descremada\", \"cantidad\": \"200 ml\"}, {\"ingrediente\": \"Banana\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Almendras\", \"cantidad\": \"15 g\"}, {\"ingrediente\": \"Canela\", \"cantidad\": \"a gusto\"}]', '[\"Calentar la leche y añadir la avena, cocinando 5 min.\",\"Servir en bol, añadir rodajas de banana y almendras picadas.\",\"Espolvorear con canela.\"]', '2025-09-16 14:38:31'),
(3, 'Desayuno', 'Yogur natural con granola y frutos rojos', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Yogur natural descremado\", \"cantidad\": \"200 g\"}, {\"ingrediente\": \"Granola sin azúcar\", \"cantidad\": \"30 g\"}, {\"ingrediente\": \"Frutos rojos\", \"cantidad\": \"80 g\"}, {\"ingrediente\": \"Miel\", \"cantidad\": \"5 g\"}]', '[\"Colocar el yogur en un bol.\",\"Añadir la granola y frutos rojos.\",\"Endulzar con miel.\"]', '2025-09-16 14:38:31'),
(4, 'Desayuno', 'Batido de banana, avena y yogur', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Banana madura\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Avena arrollada\", \"cantidad\": \"30 g\"}, {\"ingrediente\": \"Yogur natural descremado\", \"cantidad\": \"200 ml\"}, {\"ingrediente\": \"Semillas de chía\", \"cantidad\": \"10 g\"}, {\"ingrediente\": \"Esencia de vainilla\", \"cantidad\": \"a gusto\"}]', '[\"Pelar la banana y cortarla en rodajas.\",\"Colocar en la licuadora junto con la avena, el yogur y la chía.\",\"Licuar hasta obtener una textura suave.\",\"Añadir vainilla para aromatizar.\",\"Servir frío.\"]', '2025-09-16 14:38:31'),
(5, 'Desayuno', 'Pan con ricota y miel', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Pan integral\", \"cantidad\": \"60 g\"}, {\"ingrediente\": \"Ricota magra\", \"cantidad\": \"40 g\"}, {\"ingrediente\": \"Miel\", \"cantidad\": \"10 g\"}, {\"ingrediente\": \"Infusión caliente\", \"cantidad\": \"a gusto\"}]', '[\"Tostar el pan.\",\"Untar la ricota y bañar con miel.\",\"Acompañar con la infusión.\"]', '2025-09-16 14:38:31'),
(6, 'Almuerzo', 'Ensalada de arroz integral y pollo', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Arroz integral cocido\", \"cantidad\": \"70 g (en seco 25 g)\"}, {\"ingrediente\": \"Pechuga de pollo\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Palta\", \"cantidad\": \"40 g\"}, {\"ingrediente\": \"Tomate\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Aceite de oliva\", \"cantidad\": \"10 g\"}]', '[\"Hervir el arroz hasta que esté tierno y cocinar el pollo a la plancha.\",\"Mezclar con tomate y palta en cubos.\",\"Aliñar con aceite de oliva.\"]', '2025-09-16 14:38:31'),
(7, 'Almuerzo', 'Arroz integral con filet de merluza y vegetales', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Arroz integral cocido\", \"cantidad\": \"70 g (en seco)\"}, {\"ingrediente\": \"Filet de merluza\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Brócoli\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Aceite de oliva\", \"cantidad\": \"10 g\"}]', '[\"Cocinar el arroz integral.\",\"Hornear o planchar el pescado.\",\"Hervir el brócoli.\",\"Servir todo junto y rociar con aceite.\"]', '2025-09-16 14:38:31'),
(8, 'Almuerzo', 'Wrap integral de atún', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Tortilla integral\", \"cantidad\": \"60 g\"}, {\"ingrediente\": \"Atún en agua\", \"cantidad\": \"80 g\"}, {\"ingrediente\": \"Queso untable descremado\", \"cantidad\": \"20 g\"}, {\"ingrediente\": \"Lechuga y tomate\", \"cantidad\": \"a gusto\"}, {\"ingrediente\": \"Aceite de oliva\", \"cantidad\": \"5 g\"}]', '[\"Untar la tortilla con queso.\",\"Colocar el atún escurrido, lechuga y tomate.\",\"Enrollar y dorar en sartén.\"]', '2025-09-16 14:38:31'),
(9, 'Almuerzo', 'Lentejas guisadas con vegetales', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Lentejas secas\", \"cantidad\": \"70 g\"}, {\"ingrediente\": \"Zanahoria\", \"cantidad\": \"50 g\"}, {\"ingrediente\": \"Cebolla\", \"cantidad\": \"50 g\"}, {\"ingrediente\": \"Aceite de oliva\", \"cantidad\": \"10 g\"}]', '[\"Hervir las lentejas hasta que estén tiernas.\",\"Saltear cebolla y zanahoria, añadir las lentejas.\",\"Servir caliente.\"]', '2025-09-16 14:38:31'),
(10, 'Almuerzo', 'Pasta integral con salsa de tomate y queso', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Pasta integral seca\", \"cantidad\": \"70 g\"}, {\"ingrediente\": \"Salsa de tomate natural\", \"cantidad\": \"150 g\"}, {\"ingrediente\": \"Queso parmesano\", \"cantidad\": \"15 g\"}, {\"ingrediente\": \"Aceite de oliva\", \"cantidad\": \"10 g\"}]', '[\"Cocinar la pasta.\",\"Calentar la salsa y mezclar con la pasta.\",\"Espolvorear queso y añadir aceite.\"]', '2025-09-16 14:38:31'),
(11, 'Merienda', 'Tostadas con mantequilla de maní', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Pan integral\", \"cantidad\": \"60 g\"}, {\"ingrediente\": \"Mantequilla de maní\", \"cantidad\": \"15 g\"}, {\"ingrediente\": \"Banana\", \"cantidad\": \"80 g\"}]', '[\"Tostar pan, untar mantequilla, añadir rodajas de banana.\"]', '2025-09-16 14:38:31'),
(12, 'Merienda', 'Yogur con avena y frutas', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Yogur descremado\", \"cantidad\": \"200 g\"}, {\"ingrediente\": \"Avena\", \"cantidad\": \"30 g\"}, {\"ingrediente\": \"Manzana\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Canela\", \"cantidad\": \"\"}]', '[\"Mezclar todo en un bol.\"]', '2025-09-16 14:38:31'),
(13, 'Merienda', 'Smoothie verde', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Leche\", \"cantidad\": \"200 ml\"}, {\"ingrediente\": \"Espinaca\", \"cantidad\": \"30 g\"}, {\"ingrediente\": \"Durazno\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Avena\", \"cantidad\": \"20 g\"}]', '[\"Licuar hasta homogéneo.\"]', '2025-09-16 14:38:31'),
(14, 'Merienda', 'Galletas caseras integrales', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Galletas integrales\", \"cantidad\": \"40 g\"}, {\"ingrediente\": \"Queso untable\", \"cantidad\": \"20 g\"}, {\"ingrediente\": \"Frutos rojos\", \"cantidad\": \"80 g\"}]', '[\"Servir untando el queso y decorando con frutas.\"]', '2025-09-16 14:38:31'),
(15, 'Merienda', 'Pan con queso y tomate', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Pan integral\", \"cantidad\": \"60 g\"}, {\"ingrediente\": \"Queso fresco magro\", \"cantidad\": \"40 g\"}, {\"ingrediente\": \"Tomate\", \"cantidad\": \"80 g\"}]', '[\"Armar sándwich.\"]', '2025-09-16 14:38:31'),
(16, 'Cena', 'Tortilla de espinaca y papas', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Papas\", \"cantidad\": \"150 g\"}, {\"ingrediente\": \"Espinaca\", \"cantidad\": \"50 g\"}, {\"ingrediente\": \"Huevo\", \"cantidad\": \"2 u\"}, {\"ingrediente\": \"Aceite\", \"cantidad\": \"10 g\"}]', '[\"Cocinar papas al vapor.\",\"Saltear espinaca.\",\"Batir huevos y unir todo.\",\"Dorar en sartén.\"]', '2025-09-16 14:38:31'),
(17, 'Cena', 'Sopa de verduras con huevo', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Caldito de verduras\", \"cantidad\": \"\"}, {\"ingrediente\": \"Zapallo\", \"cantidad\": \"150 g\"}, {\"ingrediente\": \"Zanahoria\", \"cantidad\": \"50 g\"}, {\"ingrediente\": \"Fideos integrales\", \"cantidad\": \"40 g\"}, {\"ingrediente\": \"Huevo\", \"cantidad\": \"1 u\"}]', '[\"Hervir las verduras junto con el caldito hasta que estén cocidas.\",\"Añadir los fideos hasta cocinarlos.\",\"Añadir huevo batido.\"]', '2025-09-16 14:38:31'),
(18, 'Cena', 'Pescado al horno con batata', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Filete de merluza\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Batata\", \"cantidad\": \"150 g\"}, {\"ingrediente\": \"Aceite\", \"cantidad\": \"10 g\"}]', '[\"Pincelar con aceite la fuente.\",\"Hornear la batata y el pescado juntos.\"]', '2025-09-16 14:38:31'),
(19, 'Cena', 'Ensalada tibia de garbanzos', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Garbanzos cocidos\", \"cantidad\": \"100 g\"}, {\"ingrediente\": \"Pimiento\", \"cantidad\": \"50 g\"}, {\"ingrediente\": \"Cebolla\", \"cantidad\": \"50 g\"}, {\"ingrediente\": \"Aceite\", \"cantidad\": \"10 g\"}]', '[\"Saltear vegetales, añadir garbanzos.\"]', '2025-09-16 14:38:31'),
(20, 'Cena', 'Omelette de champiñones', 69.00, 19.00, 17.00, '[{\"ingrediente\": \"Huevo\", \"cantidad\": \"2 u\"}, {\"ingrediente\": \"Clara extra\", \"cantidad\": \"1 u\"}, {\"ingrediente\": \"Champiñones\", \"cantidad\": \"80 g\"}, {\"ingrediente\": \"Aceite\", \"cantidad\": \"5 g\"}, {\"ingrediente\": \"Pan integral\", \"cantidad\": \"30 g\"}]', '[\"Saltear champiñones.\",\"Añadir huevos batidos y formar omelette.\",\"Servir con pan.\"]', '2025-09-16 14:38:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reminders`
--

CREATE TABLE `reminders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_hora` datetime NOT NULL,
  `recurrente` enum('ninguno','diario','semanal','mensual') DEFAULT 'ninguno',
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `genero` enum('masculino','femenino','otro') NOT NULL,
  `edad` int(11) DEFAULT NULL CHECK (`edad` > 0),
  `altura` decimal(5,2) DEFAULT NULL CHECK (`altura` > 0),
  `peso` decimal(5,2) DEFAULT NULL CHECK (`peso` > 0),
  `actividad` enum('sedentario','ligera','moderada','intensa','muy_intensa') NOT NULL,
  `objetivo` enum('bajar_peso','mantener','ganar_musculo') NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mealplan`
--
ALTER TABLE `mealplan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `mealplan_recipes`
--
ALTER TABLE `mealplan_recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mealplan_id` (`mealplan_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indices de la tabla `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mealplan`
--
ALTER TABLE `mealplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mealplan_recipes`
--
ALTER TABLE `mealplan_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `progress`
--
ALTER TABLE `progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mealplan`
--
ALTER TABLE `mealplan`
  ADD CONSTRAINT `mealplan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mealplan_recipes`
--
ALTER TABLE `mealplan_recipes`
  ADD CONSTRAINT `mealplan_recipes_ibfk_1` FOREIGN KEY (`mealplan_id`) REFERENCES `mealplan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mealplan_recipes_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recetas` (`id`);

--
-- Filtros para la tabla `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
