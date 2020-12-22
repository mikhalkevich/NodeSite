-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 17 2020 г., 20:59
-- Версия сервера: 10.4.12-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bank`
--

-- --------------------------------------------------------

--
-- Структура таблицы `maintexts`
--

CREATE TABLE `maintexts` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `body` text DEFAULT NULL,
  `url` tinytext NOT NULL,
  `lang` enum('rus','eng') NOT NULL DEFAULT 'rus',
  `showhide` enum('show','hide') NOT NULL DEFAULT 'show',
  `putdate` date DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `maintexts`
--

INSERT INTO `maintexts` (`id`, `name`, `body`, `url`, `lang`, `showhide`, `putdate`, `createdAt`, `updatedAt`) VALUES
(1, 'Добро пожаловать на сайт', '<p>Привет</p>', 'index', 'rus', 'show', '2020-12-10', NULL, NULL),
(2, 'Контакты', '<p>нет их</p>', 'contacts', 'rus', 'show', '2020-12-10', NULL, NULL),
(3, 'Информация о сайте', '<p>Мы лучшие</p>', 'infos', 'rus', 'show', '2020-12-10', NULL, NULL),
(4, 'Услуги', 'Мы предоставляем услуги ', 'services', 'rus', 'show', '2020-12-15', NULL, NULL),
(6, 'Портфолио', 'Наши работы ', 'portfolio', 'rus', 'show', '2020-12-15', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` tinytext DEFAULT NULL,
  `email` tinytext NOT NULL,
  `password` tinytext NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  `status` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`, `status`) VALUES
(8, 'poi', 'poi@gmail.com', 'poi', '2020-12-17', '2020-12-17', NULL),
(9, 'qwe', 'qwe@gmail.com', 'qwe', '2020-12-17', '2020-12-17', NULL);
-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fio` tinytext DEFAULT NULL,
  `phone` tinytext NOT NULL,
  `file_name` tinytext NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  `status` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `maintexts`
--
ALTER TABLE `maintexts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `maintexts`
--
ALTER TABLE `maintexts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
