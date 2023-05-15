-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/

-- Хост: mysql
-- Время создания: Май 14 2023 г., 18:56
-- Версия сервера: 8.0.32
-- Версия PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `active_account_for_user`
--

CREATE TABLE `active_account_for_user` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `direct_id` int NOT NULL,
  `is_actual` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `active_account_for_user`
--

INSERT INTO `active_account_for_user` (`id`, `user_id`, `direct_id`, `is_actual`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2023-04-30 13:51:09', '2023-04-30 13:51:09'),
(2, 1, 2, 1, '2023-04-30 13:51:09', '2023-04-30 13:51:09');

-- --------------------------------------------------------

--
-- Структура таблицы `direct_auth_tokens`
--

CREATE TABLE `direct_auth_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acess_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_actual` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `direct_auth_tokens`
--

INSERT INTO `direct_auth_tokens` (`id`, `client_id`, `client_secret`, `acess_token`, `created_at`, `updated_at`, `code`, `is_actual`) VALUES
(1, '1cb1ea6902fd405db33ea380565e4b03', '466d8720425841aaabe17362ba5cef43', 'y0_AgAAAAAU6_77AAmqzQAAAADgisdQvP6c9ISjTZO4xK4Trssb4qcxqpc', '2023-04-30 13:47:52', '2023-04-30 13:50:26', '4753590', 0),
(2, '1cb1ea6902fd405db33ea380565e4b03', '466d8720425841aaabe17362ba5cef43', 'y0_AgAAAAAU6_77AAmqzQAAAADgisdQvP6c9ISjTZO4xK4Trssb4qcxqpc', '2023-04-30 13:50:20', '2023-04-30 13:50:26', '4753590', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'bd665967-5482-4257-9c3d-ec67c4ffd1d8', 'database', 'default', '{\"uuid\":\"bd665967-5482-4257-9c3d-ec67c4ffd1d8\",\"displayName\":\"App\\\\Jobs\\\\RecoveryPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\RecoveryPasswordJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\RecoveryPasswordJob\\\":4:{s:8:\\\"\\u0000*\\u0000email\\\";s:24:\\\"antonov.pavel.00@mail.ru\\\";s:7:\\\"\\u0000*\\u0000name\\\";s:13:\\\"PavelAntonov1\\\";s:8:\\\"\\u0000*\\u0000token\\\";s:20:\\\"Jse1jpmHvonxiyTIubrE\\\";s:7:\\\"batchId\\\";s:36:\\\"9910b67c-c31a-440e-9cad-a4fe0e96f2e2\\\";}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"antonov.pavel.00@yandex.ru\" using the following authenticators: \"LOGIN\", \"PLAIN\", \"XOAUTH2\". Authenticator \"LOGIN\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.8 Error: authentication failed: Invalid user or password! 1682970604-3oSev2iDY8c0\".\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.8 Error: authentication failed: Invalid user or password! 1682970604-3oSev2iDY8c0\".\". Authenticator \"XOAUTH2\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.8 Error: authentication failed: Invalid user or password! 1682970604-3oSev2iDY8c0\".\". in /var/www/html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php:212\nStack trace:\n#0 /var/www/html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(148): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 /var/www/html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(105): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(254): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO [127.0.0.1...\', Array)\n#3 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(277): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(213): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 /var/www/html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(539): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(303): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'mail.recovery\', Array, Object(Closure))\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(325): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#13 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(269): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\RecoveryPasswordMail))\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\RecoveryPasswordMail))\n#15 /var/www/html/app/Jobs/RecoveryPasswordJob.php(32): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\RecoveryPasswordMail))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\RecoveryPasswordJob->handle()\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(661): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#22 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#24 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\RecoveryPasswordJob), false)\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\RecoveryPasswordJob))\n#30 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(434): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(384): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(175): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(136): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(119): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(661): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(194): Illuminate\\Container\\Container->call(Array)\n#42 /var/www/html/vendor/symfony/console/Command/Command.php(312): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(163): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 /var/www/html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/vendor/symfony/console/Application.php(314): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/vendor/symfony/console/Application.php(168): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(200): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 /var/www/html/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 {main}', '2023-05-01 19:50:04'),
(2, '769fb700-633a-46a4-b4f9-fd3ae6d60ebe', 'database', 'default', '{\"uuid\":\"769fb700-633a-46a4-b4f9-fd3ae6d60ebe\",\"displayName\":\"App\\\\Jobs\\\\RecoveryPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\RecoveryPasswordJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\RecoveryPasswordJob\\\":4:{s:8:\\\"\\u0000*\\u0000email\\\";s:24:\\\"antonov.pavel.00@mail.ru\\\";s:7:\\\"\\u0000*\\u0000name\\\";s:13:\\\"PavelAntonov1\\\";s:8:\\\"\\u0000*\\u0000token\\\";s:20:\\\"4Ohz2CXQcy9rgEvARJDL\\\";s:7:\\\"batchId\\\";s:36:\\\"9910b75a-7907-459d-b917-1202a5b37113\\\";}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"antonov.pavel.00@yandex.ru\" using the following authenticators: \"LOGIN\", \"PLAIN\", \"XOAUTH2\". Authenticator \"LOGIN\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.8 Error: authentication failed: Invalid user or password! 1682970749-TqSuZohDVKo0\".\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.8 Error: authentication failed: Invalid user or password! 1682970749-TqSuZohDVKo0\".\". Authenticator \"XOAUTH2\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.8 Error: authentication failed: Invalid user or password! 1682970749-TqSuZohDVKo0\".\". in /var/www/html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php:212\nStack trace:\n#0 /var/www/html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(148): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 /var/www/html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(105): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(254): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO [127.0.0.1...\', Array)\n#3 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(277): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(213): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 /var/www/html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(539): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(303): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'mail.recovery\', Array, Object(Closure))\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(325): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#13 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(269): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\RecoveryPasswordMail))\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\RecoveryPasswordMail))\n#15 /var/www/html/app/Jobs/RecoveryPasswordJob.php(32): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\RecoveryPasswordMail))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\RecoveryPasswordJob->handle()\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(661): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#22 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#24 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\RecoveryPasswordJob), false)\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\RecoveryPasswordJob))\n#30 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(434): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(384): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(175): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(136): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(119): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(661): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(194): Illuminate\\Container\\Container->call(Array)\n#42 /var/www/html/vendor/symfony/console/Command/Command.php(312): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(163): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 /var/www/html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/vendor/symfony/console/Application.php(314): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/vendor/symfony/console/Application.php(168): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(200): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 /var/www/html/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 {main}', '2023-05-01 19:52:29'),
(3, '3a54b39c-24e7-4132-a9e1-aa2ef2bb4338', 'database', 'default', '{\"uuid\":\"3a54b39c-24e7-4132-a9e1-aa2ef2bb4338\",\"displayName\":\"App\\\\Jobs\\\\RecoveryPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\RecoveryPasswordJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\RecoveryPasswordJob\\\":4:{s:8:\\\"\\u0000*\\u0000email\\\";s:24:\\\"antonov.pavel.00@mail.ru\\\";s:7:\\\"\\u0000*\\u0000name\\\";s:13:\\\"PavelAntonov1\\\";s:8:\\\"\\u0000*\\u0000token\\\";s:20:\\\"iUXfMuz7Sb5nEdWIaFro\\\";s:7:\\\"batchId\\\";s:36:\\\"9910b77e-1f02-4a69-8ce2-9240e586a871\\\";}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"antonov.pavel.00@yandex.ru\" using the following authenticators: \"LOGIN\", \"PLAIN\", \"XOAUTH2\". Authenticator \"LOGIN\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.8 Error: authentication failed: Invalid user or password! 1682970770-oqSQTmhWmCg0\".\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.8 Error: authentication failed: Invalid user or password! 1682970770-oqSQTmhWmCg0\".\". Authenticator \"XOAUTH2\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.8 Error: authentication failed: Invalid user or password! 1682970770-oqSQTmhWmCg0\".\". in /var/www/html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php:212\nStack trace:\n#0 /var/www/html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(148): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 /var/www/html/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(105): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(254): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO [127.0.0.1...\', Array)\n#3 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(277): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(213): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 /var/www/html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(539): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(303): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'mail.recovery\', Array, Object(Closure))\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(325): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#13 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(269): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\RecoveryPasswordMail))\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\RecoveryPasswordMail))\n#15 /var/www/html/app/Jobs/RecoveryPasswordJob.php(32): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\RecoveryPasswordMail))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\RecoveryPasswordJob->handle()\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(661): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#22 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#24 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\RecoveryPasswordJob), false)\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\RecoveryPasswordJob))\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\RecoveryPasswordJob))\n#30 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(434): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(384): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(175): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(136): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(119): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(661): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(194): Illuminate\\Container\\Container->call(Array)\n#42 /var/www/html/vendor/symfony/console/Command/Command.php(312): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(163): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 /var/www/html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/vendor/symfony/console/Application.php(314): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/vendor/symfony/console/Application.php(168): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(200): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 /var/www/html/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 {main}', '2023-05-01 19:52:50');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(25, 'default', '{\"uuid\":\"800e8aa5-1d92-4185-bd91-760026e05780\",\"displayName\":\"App\\\\Notifications\\\\TwoFactorCode\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\TwoFactorCode\\\":1:{s:2:\\\"id\\\";s:36:\\\"8aa8fe04-0a0b-44bd-baec-0e9bd0332f94\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1683480599, 1683480599),
(26, 'default', '{\"uuid\":\"30091c85-306a-4f4d-a584-addf44c769f9\",\"displayName\":\"App\\\\Notifications\\\\TwoFactorCode\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\TwoFactorCode\\\":1:{s:2:\\\"id\\\";s:36:\\\"53a1d34f-a7f9-4b44-b07d-e9d7eeceb95f\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1683480848, 1683480848),
(27, 'default', '{\"uuid\":\"87477d05-5554-4ced-93ec-9bcf0f00fbc6\",\"displayName\":\"App\\\\Notifications\\\\TwoFactorCode\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\TwoFactorCode\\\":1:{s:2:\\\"id\\\";s:36:\\\"be3efd93-243a-4edb-9174-9fd5324d5388\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1683481053, 1683481053),
(28, 'default', '{\"uuid\":\"b8452cc1-62be-4a07-badf-662d8c612ece\",\"displayName\":\"App\\\\Notifications\\\\TwoFactorCode\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\TwoFactorCode\\\":1:{s:2:\\\"id\\\";s:36:\\\"45c5dfb3-528d-4135-ae7e-25e61e8f60db\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1683481216, 1683481216),
(29, 'default', '{\"uuid\":\"380b4877-63a8-44d5-b0ad-67af8387650a\",\"displayName\":\"App\\\\Notifications\\\\TwoFactorCode\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\TwoFactorCode\\\":1:{s:2:\\\"id\\\";s:36:\\\"eff389ba-133c-4ba3-b4ee-79b6a821348c\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1683481306, 1683481306),
(30, 'default', '{\"uuid\":\"525e7329-b8cf-44c9-8d6c-88caeb617f10\",\"displayName\":\"App\\\\Notifications\\\\TwoFactorCode\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\TwoFactorCode\\\":1:{s:2:\\\"id\\\";s:36:\\\"cae6c52b-cedc-43bd-90ed-e705739366ee\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1683490310, 1683490310);

-- --------------------------------------------------------

--
-- Структура таблицы `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9910b67c-c31a-440e-9cad-a4fe0e96f2e2', '', 1, 1, 1, '[\"bd665967-5482-4257-9c3d-ec67c4ffd1d8\"]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005680000000000000000\";}\";s:4:\"hash\";s:44:\"XbUZHzrNiGIrlEQbixqgTEfYM0AgOwwPiukrygkZFwQ=\";}}}}', 1682970604, 1682970601, 1682970604),
('9910b75a-7907-459d-b917-1202a5b37113', '', 1, 1, 1, '[\"769fb700-633a-46a4-b4f9-fd3ae6d60ebe\"]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005680000000000000000\";}\";s:4:\"hash\";s:44:\"XbUZHzrNiGIrlEQbixqgTEfYM0AgOwwPiukrygkZFwQ=\";}}}}', 1682970749, 1682970746, 1682970749),
('9910b77e-1f02-4a69-8ce2-9240e586a871', '', 1, 1, 1, '[\"3a54b39c-24e7-4132-a9e1-aa2ef2bb4338\"]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005680000000000000000\";}\";s:4:\"hash\";s:44:\"XbUZHzrNiGIrlEQbixqgTEfYM0AgOwwPiukrygkZFwQ=\";}}}}', 1682970770, 1682970770, 1682970770),
('9910b802-2cae-4d11-b5e5-8946ab57728f', '', 1, 0, 0, '[]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005680000000000000000\";}\";s:4:\"hash\";s:44:\"XbUZHzrNiGIrlEQbixqgTEfYM0AgOwwPiukrygkZFwQ=\";}}}}', NULL, 1682970856, 1682970857),
('9910b86d-b136-4fb6-9fe5-6961c229652c', '', 1, 0, 0, '[]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005680000000000000000\";}\";s:4:\"hash\";s:44:\"XbUZHzrNiGIrlEQbixqgTEfYM0AgOwwPiukrygkZFwQ=\";}}}}', NULL, 1682970927, 1682970930),
('9910bba0-b955-4285-b8bc-1a01b2827af5', '', 1, 0, 0, '[]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005680000000000000000\";}\";s:4:\"hash\";s:44:\"XbUZHzrNiGIrlEQbixqgTEfYM0AgOwwPiukrygkZFwQ=\";}}}}', NULL, 1682971464, 1682971466),
('9910bbe7-fb88-4116-93d0-f27d5e3793c6', '', 1, 0, 0, '[]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005680000000000000000\";}\";s:4:\"hash\";s:44:\"XbUZHzrNiGIrlEQbixqgTEfYM0AgOwwPiukrygkZFwQ=\";}}}}', NULL, 1682971510, 1682971512),
('9910bc02-d267-42ec-8f4f-4a289740fe4c', '', 1, 0, 0, '[]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005680000000000000000\";}\";s:4:\"hash\";s:44:\"XbUZHzrNiGIrlEQbixqgTEfYM0AgOwwPiukrygkZFwQ=\";}}}}', NULL, 1682971528, 1682971530),
('9910be10-0c0f-423e-9fbb-49a1e499c18b', '', 1, 0, 0, '[]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005680000000000000000\";}\";s:4:\"hash\";s:44:\"XbUZHzrNiGIrlEQbixqgTEfYM0AgOwwPiukrygkZFwQ=\";}}}}', NULL, 1682971872, 1682971874),
('9910ce0a-0e15-40b4-8f88-76a25ea1cab4', '', 1, 0, 0, '[]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005690000000000000000\";}\";s:4:\"hash\";s:44:\"pjk0Xpf+MyudJBLZ99y6FbI6zK/zXdT55JImfvdvFxM=\";}}}}', NULL, 1682974552, 1683476606),
('9910ceb1-55b9-4eb7-a61b-664735872974', '', 1, 0, 0, '[]', 'a:1:{s:5:\"catch\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:435:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:8:\"hasFaild\";b:0;}s:8:\"function\";s:195:\"function (\\Illuminate\\Bus\\Batch $batch, \\Throwable $e) use (&$hasFaild) {\n                $hasFaild = true;\n                \\Illuminate\\Support\\Facades\\Log::error($e->__toString());\n            }\";s:5:\"scope\";s:39:\"App\\Http\\Controllers\\RecoveryController\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000005690000000000000000\";}\";s:4:\"hash\";s:44:\"pjk0Xpf+MyudJBLZ99y6FbI6zK/zXdT55JImfvdvFxM=\";}}}}', NULL, 1682974662, 1683476607);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2023_03_31_204043_direct_auth_token', 1),
(11, '2023_04_01_092502_add_column_for_direct_auth_tokens', 1),
(12, '2023_04_02_124445_add_column_token_recovery_for_users', 1),
(13, '2023_04_02_125739_create_tabe_for_token_recovery', 1),
(14, '2023_04_04_182759_create_jobs_table', 1),
(15, '2023_04_08_103123_activa_direct_account_for_user', 1),
(16, '2023_04_20_075600_add_column_is_actua_for_direct_auth_tokens', 1),
(17, '2023_04_23_131251_create_job_batches_table', 1),
(18, '2023_05_07_111437_add_column_two_factor', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('09d7dbc717516afdaddf9edd3113df88558225a7e5a7f2c22227c737398865aed6154cd58dc7ab80', 1, 1, 'main', '[]', 0, '2023-05-07 20:11:50', '2023-05-07 20:11:50', '2024-05-07 20:11:50');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'wVY6ClAoqdefjkRWEBQh0jA8k6gAzxFdS7PlVlaB', NULL, 'http://localhost', 1, 0, 0, '2023-04-30 13:46:54', '2023-04-30 13:46:54'),
(2, NULL, 'Laravel Password Grant Client', 'zXqaqVONk5o2YnAJlfyRp9OsgT3P6sb2c3nsjzi5', 'users', 'http://localhost', 0, 1, 0, '2023-04-30 13:46:54', '2023-04-30 13:46:54');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-30 13:46:54', '2023-04-30 13:46:54');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tokens_recovery`
--

CREATE TABLE `tokens_recovery` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `recovery_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_actual` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tokens_recovery`
--

INSERT INTO `tokens_recovery` (`id`, `user_id`, `recovery_token`, `is_actual`, `created_at`, `updated_at`) VALUES
(9, 1, 'twagY0CHUq3Wfnyh8AzG', 0, '2023-05-01 20:11:12', '2023-05-01 20:43:01'),
(10, 1, 'lCbBGd4Twyir6NvhEjk9', 0, '2023-05-01 20:55:52', '2023-05-01 20:56:23'),
(11, 1, '2ZgNIYjoz5DeVLKdGpmT', 0, '2023-05-01 20:57:42', '2023-05-01 20:58:42');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `two_factor_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `two_factor_code`, `two_factor_expires_at`) VALUES
(1, 'PavelAntonov1', 'antonov.pavel.00@mail.ru', NULL, '$2y$10$K7s.6pgxEFs8zEHTC8xwQu3SZpR.wHXFS7OJdZfr/yZgRgN2xb3CS', NULL, '2023-04-30 13:44:36', '2023-05-01 20:58:42', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `active_account_for_user`
--
ALTER TABLE `active_account_for_user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `direct_auth_tokens`
--
ALTER TABLE `direct_auth_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `tokens_recovery`
--
ALTER TABLE `tokens_recovery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `active_account_for_user`
--
ALTER TABLE `active_account_for_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `direct_auth_tokens`
--
ALTER TABLE `direct_auth_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tokens_recovery`
--
ALTER TABLE `tokens_recovery`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
