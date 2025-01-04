-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Янв 03 2025 г., 15:01
-- Версия сервера: 9.1.0
-- Версия PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hd_DB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Клиенты`
--

CREATE TABLE `Клиенты` (
  `id` int NOT NULL,
  `Имя` varchar(45) DEFAULT NULL,
  `Телефон` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Прокат`
--

CREATE TABLE `Прокат` (
  `id` int NOT NULL,
  `Дата начала` varchar(45) DEFAULT NULL,
  `Дата окончания` varchar(45) DEFAULT NULL,
  `Общая стоимость` varchar(45) DEFAULT NULL,
  `Клиенты_id` int NOT NULL,
  `Снаряжение_id` int NOT NULL,
  `Тарифы_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Снаряжение`
--

CREATE TABLE `Снаряжение` (
  `id` int NOT NULL,
  `Тип` varchar(45) DEFAULT NULL,
  `Рамзер` varchar(45) DEFAULT NULL,
  `Бренд` varchar(45) DEFAULT NULL,
  `Статус` enum('доступно','недоступно','в ремонте') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Тарифы`
--

CREATE TABLE `Тарифы` (
  `id` int NOT NULL,
  `Название` varchar(45) DEFAULT NULL,
  `Стоимость` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Клиенты`
--
ALTER TABLE `Клиенты`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Прокат`
--
ALTER TABLE `Прокат`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Прокат_Клиенты_idx` (`Клиенты_id`),
  ADD KEY `fk_Прокат_Снаряжение1_idx` (`Снаряжение_id`),
  ADD KEY `fk_Прокат_Тарифы1_idx` (`Тарифы_id`);

--
-- Индексы таблицы `Снаряжение`
--
ALTER TABLE `Снаряжение`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Тарифы`
--
ALTER TABLE `Тарифы`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Клиенты`
--
ALTER TABLE `Клиенты`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Снаряжение`
--
ALTER TABLE `Снаряжение`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Прокат`
--
ALTER TABLE `Прокат`
  ADD CONSTRAINT `fk_Прокат_Клиенты` FOREIGN KEY (`Клиенты_id`) REFERENCES `Клиенты` (`id`),
  ADD CONSTRAINT `fk_Прокат_Снаряжение1` FOREIGN KEY (`Снаряжение_id`) REFERENCES `Снаряжение` (`id`),
  ADD CONSTRAINT `fk_Прокат_Тарифы1` FOREIGN KEY (`Тарифы_id`) REFERENCES `Тарифы` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
