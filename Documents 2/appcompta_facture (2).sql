-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 09 nov. 2023 à 16:53
-- Version du serveur : 5.7.44
-- Version de PHP : 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `appcompta_facture`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse_clients`
--

CREATE TABLE `adresse_clients` (
  `id` int(11) NOT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `code_postale` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `adresse_fournisseurs`
--

CREATE TABLE `adresse_fournisseurs` (
  `id` int(11) NOT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `fournisseurId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_modules`
--

CREATE TABLE `auth_modules` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_modules`
--

INSERT INTO `auth_modules` (`id`, `nom`, `etat`) VALUES
(1, 'Entreprise', NULL),
(2, 'Taxes', NULL),
(5, 'Utilisateur', NULL),
(6, 'Role', NULL),
(7, 'Dashboard', NULL),
(8, 'Client', NULL),
(13, 'Devis', NULL),
(16, 'Facture Vente', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `auth_module_permissions`
--

CREATE TABLE `auth_module_permissions` (
  `id` int(11) NOT NULL,
  `etat` int(11) DEFAULT NULL,
  `authModuleId` int(11) DEFAULT NULL,
  `authPermissionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_module_permissions`
--

INSERT INTO `auth_module_permissions` (`id`, `etat`, `authModuleId`, `authPermissionId`) VALUES
(1, NULL, 1, 1),
(2, NULL, 1, 3),
(3, NULL, 2, 1),
(4, NULL, 2, 2),
(5, NULL, 2, 3),
(12, NULL, 5, 1),
(13, NULL, 5, 2),
(14, NULL, 5, 3),
(15, NULL, 5, 7),
(16, NULL, 6, 1),
(17, NULL, 6, 2),
(18, NULL, 6, 3),
(19, NULL, 6, 7),
(20, NULL, 7, 1),
(21, NULL, 8, 1),
(22, NULL, 8, 2),
(23, NULL, 8, 3),
(24, NULL, 8, 4),
(45, NULL, 13, 1),
(46, NULL, 13, 2),
(47, NULL, 13, 3),
(48, NULL, 13, 4),
(49, NULL, 13, 5),
(61, NULL, 16, 1),
(62, NULL, 16, 2),
(63, NULL, 16, 3),
(64, NULL, 16, 4),
(65, NULL, 16, 5),
(66, NULL, 16, 9);

-- --------------------------------------------------------

--
-- Structure de la table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `nom`, `etat`) VALUES
(1, 'Affichage', NULL),
(2, 'Ajout', NULL),
(3, 'Mise à jour', NULL),
(4, 'Changement d\'État', NULL),
(5, 'Visalisation PDF ', NULL),
(6, 'Ajout Des Taches', NULL),
(7, 'Suppression', NULL),
(8, 'Acompte', NULL),
(9, 'Paiement', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `auth_roles`
--

CREATE TABLE `auth_roles` (
  `id` int(11) NOT NULL,
  `etat` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_roles`
--

INSERT INTO `auth_roles` (`id`, `etat`, `nom`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Admin', '2022-02-06 00:10:29', '2022-02-06 00:10:29'),
(2, 0, 'Superviseur', '2022-02-07 16:05:45', '2022-05-13 14:48:44'),
(8, 1, 'Comptable', '2022-04-15 00:21:57', '2022-04-15 01:04:20'),
(9, 1, 'Artisan', '2022-04-15 00:23:14', '2022-05-13 14:49:24');

-- --------------------------------------------------------

--
-- Structure de la table `auth_role_module_permissions`
--

CREATE TABLE `auth_role_module_permissions` (
  `id` int(11) NOT NULL,
  `etat` int(11) DEFAULT NULL,
  `authRoleId` int(11) DEFAULT NULL,
  `authModulePermissionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_role_module_permissions`
--

INSERT INTO `auth_role_module_permissions` (`id`, `etat`, `authRoleId`, `authModulePermissionId`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 1, 3),
(4, 1, 1, 4),
(5, 1, 1, 5),
(12, 1, 1, 12),
(13, 1, 1, 13),
(14, 1, 1, 14),
(15, 1, 1, 15),
(16, 1, 1, 16),
(17, 1, 1, 17),
(18, 1, 1, 18),
(19, 1, 1, 19),
(20, 1, 1, 20),
(21, 1, 1, 21),
(22, 1, 1, 22),
(23, 1, 1, 23),
(24, 1, 1, 24),
(45, 1, 1, 45),
(46, 1, 1, 46),
(47, 1, 1, 47),
(48, 1, 1, 48),
(49, 1, 1, 49),
(61, 1, 1, 61),
(62, 1, 1, 62),
(63, 1, 1, 63),
(64, 1, 1, 64),
(65, 1, 1, 65),
(66, 1, 1, 66),
(117, 0, 2, 1),
(118, 0, 2, 2),
(119, 0, 2, 3),
(120, 0, 2, 4),
(121, 0, 2, 5),
(128, 0, 2, 12),
(129, 0, 2, 13),
(130, 0, 2, 14),
(131, 0, 2, 15),
(132, 0, 2, 17),
(133, 0, 2, 19),
(134, 0, 2, 18),
(135, 0, 2, 20),
(136, 0, 2, 16),
(137, 0, 2, 21),
(138, 0, 2, 22),
(139, 0, 2, 23),
(143, 0, 2, 24),
(159, 0, 2, 45),
(162, 0, 2, 46),
(163, 0, 2, 47),
(164, 0, 2, 48),
(165, 0, 2, 49),
(175, 0, 2, 61),
(176, 0, 2, 62),
(177, 0, 2, 63),
(178, 0, 2, 64),
(179, 0, 2, 65),
(180, 0, 2, 66),
(233, 1, 3, 1),
(234, 1, 3, 2),
(235, 1, 3, 3),
(236, 1, 3, 4),
(237, 1, 3, 5),
(244, 1, 3, 12),
(245, 1, 3, 13),
(246, 1, 3, 14),
(247, 1, 3, 15),
(248, 1, 3, 16),
(249, 1, 3, 17),
(250, 1, 3, 18),
(251, 1, 3, 19),
(252, 1, 3, 20),
(253, 1, 3, 21),
(254, 1, 3, 22),
(255, 1, 3, 23),
(256, 1, 3, 24),
(277, 1, 3, 45),
(278, 1, 3, 46),
(279, 1, 3, 47),
(280, 1, 3, 48),
(281, 1, 3, 49),
(293, 1, 3, 61),
(294, 1, 3, 62),
(295, 1, 3, 63),
(296, 1, 3, 64),
(297, 1, 3, 65),
(298, 1, 3, 66),
(349, 1, 4, 1),
(350, 1, 4, 2),
(351, 1, 4, 3),
(352, 1, 4, 4),
(353, 1, 4, 5),
(360, 1, 4, 12),
(361, 1, 4, 13),
(362, 1, 4, 14),
(363, 1, 4, 15),
(364, 1, 4, 16),
(365, 1, 4, 17),
(366, 1, 4, 18),
(367, 1, 4, 19),
(368, 1, 4, 20),
(369, 1, 4, 21),
(370, 1, 4, 22),
(371, 1, 4, 23),
(372, 1, 4, 24),
(393, 1, 4, 45),
(394, 1, 4, 46),
(395, 1, 4, 47),
(396, 1, 4, 48),
(397, 1, 4, 49),
(409, 1, 4, 61),
(410, 1, 4, 62),
(411, 1, 4, 63),
(412, 1, 4, 64),
(413, 1, 4, 65),
(414, 1, 4, 66),
(465, 1, 5, 1),
(466, 1, 5, 2),
(467, 1, 5, 3),
(468, 1, 5, 4),
(469, 1, 5, 5),
(476, 1, 5, 12),
(477, 1, 5, 13),
(478, 1, 5, 14),
(479, 1, 5, 15),
(480, 1, 5, 16),
(481, 1, 5, 17),
(482, 1, 5, 18),
(483, 1, 5, 19),
(484, 1, 5, 20),
(485, 1, 5, 21),
(486, 1, 5, 22),
(487, 1, 5, 23),
(488, 1, 5, 24),
(509, 1, 5, 45),
(510, 1, 5, 46),
(511, 1, 5, 47),
(512, 1, 5, 48),
(513, 1, 5, 49),
(525, 1, 5, 61),
(526, 1, 5, 62),
(527, 1, 5, 63),
(528, 1, 5, 64),
(529, 1, 5, 65),
(530, 1, 5, 66),
(581, 1, 6, 1),
(582, 1, 6, 2),
(583, 1, 6, 3),
(584, 1, 6, 4),
(585, 1, 6, 5),
(592, 1, 6, 12),
(593, 1, 6, 13),
(594, 1, 6, 14),
(595, 1, 6, 15),
(596, 1, 6, 16),
(597, 1, 6, 17),
(598, 1, 6, 18),
(599, 1, 6, 19),
(600, 1, 6, 20),
(601, 1, 6, 21),
(602, 1, 6, 22),
(603, 1, 6, 23),
(604, 1, 6, 24),
(625, 1, 6, 45),
(626, 1, 6, 46),
(627, 1, 6, 47),
(628, 1, 6, 48),
(629, 1, 6, 49),
(641, 1, 6, 61),
(642, 1, 6, 62),
(643, 1, 6, 63),
(644, 1, 6, 64),
(645, 1, 6, 65),
(646, 1, 6, 66),
(697, 1, 7, 1),
(698, 1, 7, 2),
(699, 1, 7, 3),
(700, 1, 7, 4),
(701, 1, 7, 5),
(708, 1, 7, 12),
(709, 1, 7, 13),
(710, 1, 7, 14),
(711, 1, 7, 15),
(712, 1, 7, 16),
(713, 1, 7, 17),
(714, 1, 7, 18),
(715, 1, 7, 19),
(716, 1, 7, 20),
(717, 1, 7, 21),
(718, 1, 7, 22),
(719, 1, 7, 23),
(720, 1, 7, 24),
(741, 1, 7, 45),
(742, 1, 7, 46),
(743, 1, 7, 47),
(744, 1, 7, 48),
(745, 1, 7, 49),
(757, 1, 7, 61),
(758, 1, 7, 62),
(759, 1, 7, 63),
(760, 1, 7, 64),
(761, 1, 7, 65),
(762, 1, 7, 66),
(900, 0, 8, 1),
(901, 0, 8, 2),
(902, 0, 8, 3),
(903, 0, 8, 4),
(904, 0, 8, 5),
(905, 0, 8, 12),
(906, 0, 8, 13),
(907, 0, 8, 14),
(908, 0, 8, 15),
(909, 0, 8, 16),
(910, 0, 8, 17),
(911, 0, 8, 18),
(912, 0, 8, 19),
(913, 1, 8, 20),
(914, 1, 8, 21),
(915, 1, 8, 22),
(916, 1, 8, 23),
(917, 1, 8, 24),
(918, 1, 8, 45),
(919, 0, 8, 46),
(920, 0, 8, 47),
(921, 1, 8, 48),
(922, 1, 8, 49),
(923, 1, 8, 61),
(924, 0, 8, 62),
(925, 0, 8, 63),
(926, 1, 8, 64),
(927, 1, 8, 65),
(928, 1, 8, 66),
(958, 0, 9, 1),
(959, 0, 9, 2),
(960, 0, 9, 3),
(961, 0, 9, 4),
(962, 0, 9, 5),
(963, 0, 9, 12),
(964, 0, 9, 13),
(965, 0, 9, 14),
(966, 0, 9, 15),
(967, 0, 9, 16),
(968, 0, 9, 17),
(969, 0, 9, 18),
(970, 0, 9, 19),
(971, 1, 9, 20),
(972, 1, 9, 21),
(973, 1, 9, 22),
(974, 1, 9, 23),
(975, 1, 9, 24),
(976, 1, 9, 45),
(977, 1, 9, 46),
(978, 1, 9, 47),
(979, 1, 9, 48),
(980, 1, 9, 49),
(981, 1, 9, 61),
(982, 1, 9, 62),
(983, 1, 9, 63),
(984, 1, 9, 64),
(985, 1, 9, 65),
(986, 1, 9, 66);

-- --------------------------------------------------------

--
-- Structure de la table `auth_users`
--

CREATE TABLE `auth_users` (
  `id` int(11) NOT NULL,
  `etat` int(11) DEFAULT NULL,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `num_adresse` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `code_phone` varchar(255) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `authRoleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_users`
--

INSERT INTO `auth_users` (`id`, `etat`, `nom_prenom`, `email`, `password`, `adresse`, `num_adresse`, `code_phone`, `telephone`, `type`, `createdAt`, `updatedAt`, `authRoleId`) VALUES
(59, 1, 'SuperAdmin', 'admin@appcompta.com', '$2b$10$uNo2aOGAEmBkV.chUI.jtuP7.V8qWukqfT4Bb4VL/BPUHcEQab2tK', NULL, NULL, '+352', '124578', 0, '2023-03-23 08:17:39', '2023-03-23 08:17:39', 1),
(65, 1, 'COVACI Daniel', 'info@daniel-lux.lu', '$2b$10$WO3gujU26NwCeS/F5Xoj6ucIySuU2iQBOF2BSOkdxA4gKFMRI5.zW', 'Rue de la Tour F-57390 Rédange', '1', '+352', '661 800 801', 2, '2023-03-24 22:29:47', '2023-03-24 22:29:47', NULL),
(66, 1, 'LABIDI Mondher', 'mondher@labidi.lu', '$2b$10$YPzl7CQCXJMqc5GLfudoB.k3wyaZVb2.IZ8vyRpU753jXXHQQpCCa', 'Route d\'Esch L-4450 Belvaux', '18', '+352', '691543276', 2, '2023-03-27 00:59:14', '2023-03-27 00:59:14', NULL),
(67, 1, 'Mirza BECIRBASIC', 'contact@mbe-etancheite.lu', '$2b$10$krJmvg8H0OuHYme1fLAAe.9Eq6VMe/.ScEdXTC6q6fGZKvBXIVIe.', 'Rue d\'Europe L-4390 PONTPIERRE', '77', '+352', '691584426', 2, '2023-04-02 13:09:47', '2023-10-23 20:24:48', NULL),
(68, 1, 'ADMIN', 'info@appcompta.com', '$2b$10$Ad5lEdlKPwvDwxMzAo9Bcet0jeul/31wwZxsy/mGbtF4Y2l8CaC3a', '', NULL, '+352', '691543276', 0, '2023-04-02 14:06:01', '2023-10-24 12:19:58', NULL),
(69, 1, 'RAMDEDOVIC Dejvid ', 'info@itd.lu', '$2b$10$1/3zZCYWwdkgxhjIJ1HjA.JxFlUpQGtkvaP7Nx9ksGyVsb1T5m.Qy', 'Rue de Luxembourg L-4220 Esch sur Alzette', '44', '+352', '691717806', 1, '2023-04-02 14:09:34', '2023-04-02 14:09:34', NULL),
(70, 1, 'Ali', 'compta@itd.lu', '$2b$10$eTmjT5A7Xdo4SJFnyH3fxOWHfcU8gThtY/4Stj1.WAglYYBeHclLa', NULL, NULL, '+352', '691211525', 2, '2023-10-24 16:43:36', '2023-10-24 16:43:36', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_entreprises`
--

CREATE TABLE `auth_user_entreprises` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `authUserId` int(11) DEFAULT NULL,
  `entrepriseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_user_entreprises`
--

INSERT INTO `auth_user_entreprises` (`id`, `type`, `createdAt`, `updatedAt`, `authUserId`, `entrepriseId`) VALUES
(11, 1, '2023-02-19 22:01:25', '2023-02-19 22:01:25', 44, 10),
(12, 2, '2023-02-19 22:01:45', '2023-02-19 22:01:45', 54, 10),
(13, 1, '2023-02-19 22:01:53', '2023-02-19 22:01:53', 44, 9),
(14, 2, '2023-02-19 22:02:00', '2023-02-19 22:02:00', 53, 9),
(15, 1, '2023-02-19 22:02:05', '2023-02-19 22:02:05', 44, 8),
(16, 2, '2023-02-19 22:02:12', '2023-02-19 22:02:12', 52, 8),
(17, 1, '2023-02-19 22:02:17', '2023-02-19 22:02:17', 44, 7),
(18, 2, '2023-02-19 22:02:26', '2023-02-19 22:02:26', 51, 7),
(19, 1, '2023-02-19 22:02:34', '2023-02-19 22:02:34', 44, 6),
(21, 1, '2023-02-19 22:02:55', '2023-02-19 22:02:55', 43, 5),
(22, 2, '2023-02-19 22:03:02', '2023-02-19 22:03:02', 49, 5),
(31, 2, '2023-02-20 20:51:54', '2023-02-20 20:51:54', 50, 6),
(32, 2, '2023-02-20 20:51:54', '2023-02-20 20:51:54', 55, 6),
(39, 1, '2023-03-23 14:53:42', '2023-03-23 14:53:42', 63, 2),
(41, 2, '2023-03-24 22:30:00', '2023-03-24 22:30:00', 65, 1),
(42, 2, '2023-03-27 00:59:54', '2023-03-27 00:59:54', 66, 2),
(43, 2, '2023-04-02 13:10:04', '2023-04-02 13:10:04', 67, 3),
(44, 1, '2023-04-02 14:09:51', '2023-04-02 14:09:51', 69, 3),
(45, 1, '2023-04-02 14:10:00', '2023-04-02 14:10:00', 69, 1),
(46, 1, '2023-10-24 16:42:01', '2023-10-24 16:42:01', 69, 4),
(47, 2, '2023-10-24 16:57:31', '2023-10-24 16:57:31', 70, 4);

-- --------------------------------------------------------

--
-- Structure de la table `bon_commandes`
--

CREATE TABLE `bon_commandes` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `r_status` tinyint(1) NOT NULL DEFAULT '0',
  `p_status` tinyint(1) NOT NULL DEFAULT '0',
  `montant_total` varchar(255) DEFAULT NULL,
  `total_ttc` float DEFAULT NULL,
  `total_ht` float DEFAULT NULL,
  `remise_global` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `fodec` float DEFAULT NULL,
  `totalTimbreFiscal` float DEFAULT NULL,
  `devise` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bon_commande_ventes`
--

CREATE TABLE `bon_commande_ventes` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `p_status` tinyint(1) NOT NULL DEFAULT '0',
  `l_status` tinyint(1) NOT NULL DEFAULT '0',
  `montant_total` varchar(255) DEFAULT NULL,
  `total_ttc` float DEFAULT NULL,
  `total_ht` float DEFAULT NULL,
  `remise_global` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `fodec` float DEFAULT NULL,
  `totalTimbreFiscal` float DEFAULT NULL,
  `devisId` int(11) DEFAULT NULL,
  `devise` varchar(255) DEFAULT NULL,
  `acompte_pourcentage` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `projetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bon_commande_vente_produits`
--

CREATE TABLE `bon_commande_vente_produits` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `qtotal` int(11) DEFAULT NULL,
  `unite` float DEFAULT NULL,
  `prixTTC` float DEFAULT NULL,
  `prixHT` float DEFAULT NULL,
  `total_prix_TTC` float DEFAULT NULL,
  `total_prix_HT` float DEFAULT NULL,
  `remise` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `bonCommandeVenteId` int(11) DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bon_livraison_ventes`
--

CREATE TABLE `bon_livraison_ventes` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `montant_total` varchar(255) DEFAULT NULL,
  `total_ttc` float DEFAULT NULL,
  `total_ht` float DEFAULT NULL,
  `remise_global` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `fodec` float DEFAULT NULL,
  `totalTimbreFiscal` float DEFAULT NULL,
  `devisId` int(11) DEFAULT NULL,
  `devise` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bon_receptions`
--

CREATE TABLE `bon_receptions` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `montant_total` varchar(255) DEFAULT NULL,
  `total_ttc` float DEFAULT NULL,
  `total_ht` float DEFAULT NULL,
  `remise_global` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `fodec` float DEFAULT NULL,
  `totalTimbreFiscal` float DEFAULT NULL,
  `bonCommandeId` int(11) DEFAULT NULL,
  `devise` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bon_reception_produits`
--

CREATE TABLE `bon_reception_produits` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `qtotal` int(11) DEFAULT NULL,
  `unite` float DEFAULT NULL,
  `prixTTC` float DEFAULT NULL,
  `prixHT` float DEFAULT NULL,
  `total_prix_TTC` float DEFAULT NULL,
  `total_prix_HT` float DEFAULT NULL,
  `remise` float DEFAULT NULL,
  `bonCommandeId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `bonReceptionId` int(11) DEFAULT NULL,
  `fournisseurId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bon_retours`
--

CREATE TABLE `bon_retours` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `bntransfertId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `storeId` int(11) DEFAULT NULL,
  `from_store_id` int(11) DEFAULT NULL,
  `to_store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bon_transferts`
--

CREATE TABLE `bon_transferts` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `storeId` int(11) DEFAULT NULL,
  `from_store_id` int(11) DEFAULT NULL,
  `to_store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `raison_sociale` varchar(255) DEFAULT NULL,
  `matricule_fiscal` varchar(255) DEFAULT NULL,
  `registre_commerce` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `num_adresse` varchar(255) DEFAULT NULL,
  `code_phone_pro` varchar(255) DEFAULT NULL,
  `telephone_pro` varchar(255) DEFAULT NULL,
  `code_postale` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `authUserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `type`, `raison_sociale`, `matricule_fiscal`, `registre_commerce`, `nom`, `prenom`, `email`, `site`, `pays`, `ville`, `adresse`, `num_adresse`, `code_phone_pro`, `telephone_pro`, `code_postale`, `createdAt`, `updatedAt`, `authUserId`) VALUES
(1, 1, 'RENOV AVENUE', 'LU29436946', NULL, 'RENOV', 'AVENUE', 'info@renov-avenue.lu', NULL, 'Luxembourg', 'Rédange sur Attert', 'Grand Rue', NULL, '+352', '661808519', '8510', '2023-03-25 00:52:30', '2023-03-25 00:52:30', 65),
(2, 1, 'DANIEL-LUX', 'LU34664983', NULL, 'DANIEL', 'LUX', 'info@daniel-lux.lu', 'www.daniel-lux.lu', 'Luxembourg', 'Perlé', 'rue de Holtz ', '37', '+352', '661 800 801', '8826', '2023-03-27 01:42:21', '2023-03-27 01:56:07', 66),
(3, 1, 'NETARTIS.ONLINE', '', NULL, 'NETARTIS', 'ONLINE', 'michele.lovece@netartis.online', NULL, 'Luxembourg', 'Luxembourg', 'Rue Antoine Jans', '17', '+352', '26201471', 'L-1820', '2023-03-27 17:28:50', '2023-03-27 17:57:40', 65),
(4, 0, NULL, NULL, NULL, 'Jolly', 'Bieses', 'Office@netaris.online', NULL, 'Luxembourg', 'Bertrange', 'Cite Riedgen', '4', '+352', '26201471', 'L-8071', '2023-03-27 23:10:04', '2023-03-27 23:10:04', 65),
(5, 0, NULL, NULL, NULL, 'Hoffmann', 'Christian', 'Office@netaris.online', NULL, 'Luxembourg', 'Bertrange', 'Rue de Luxemborg', '7a', '+352', '26201471', 'L-8077', '2023-03-28 00:46:01', '2023-03-28 01:14:33', 65),
(6, 1, 'Karilux Sarls', 'LU33758609', NULL, 'Enseigne commerciale', 'Karilux', 'Krluxvm@outlook.com', NULL, 'Luxembourg', 'Hobscheid', 'Rue Tresch', '2', '+352', '691160760', 'L-8373', '2023-03-29 20:28:26', '2023-03-29 20:28:26', 65),
(7, 0, NULL, NULL, NULL, 'Mirza', 'Becirbasic', 'contact@mbe-etancheite.lu', NULL, 'Luxembourg', 'Pontpierre', 'rue de l\'europe', '77', '+352', '691584426', '4390', '2023-04-02 13:17:49', '2023-04-02 13:17:49', 66),
(8, 1, '   INSIDE   GROUP SA', 'LU19025562', NULL, 'INSIDE', 'GROUP SA', 'info@insidegroup.lu', 'www.insidegroup.lu', 'Luxembourg', 'Luxembourg', 'cote d\'Eich', '16', '+352', '26188036', 'L-1450', '2023-04-07 19:34:43', '2023-04-07 19:34:43', 65),
(9, 1, 'Domus Construction s.ar.l.', 'LU31684909', NULL, 'Ricardo', 'Da Silva', 'rdasilva@domusc.lu', 'www.domusc.lu', 'Luxembourg', 'Windhof', 'Rue d\'Arlon ', '19', '+352', '621303945', 'L-8399', '2023-04-19 19:09:02', '2023-04-19 19:09:02', 65),
(10, 0, NULL, NULL, NULL, 'Nicolas', 'Dawans', 'nicolas.dawans@gmail.com', NULL, 'Luxembourg', 'Larochette', 'rue de Mersch', '59', '+352', '691217870', 'L-7620', '2023-05-08 18:53:14', '2023-05-08 18:53:14', 65),
(11, 0, NULL, NULL, NULL, 'Antonio', 'Ribeiro Coelho', 'pbfernandes@autlook.pt', NULL, 'Luxembourg', 'Larochette', 'rue Michel rodange', '39', '+352', '621281080', 'L-7624', '2023-05-08 19:38:13', '2023-05-08 19:58:37', 65),
(12, 1, 'Nordclean SARL', 'LU30620343', NULL, 'BILL', 'TO', 'Cleaningviolette@gmail.com', 'www.nordclean.eu', 'Luxembourg', 'Mertzig', 'Zone Industriel', '2', '+352', '691166920', 'L-9166', '2023-05-09 22:07:16', '2023-05-10 15:48:22', 65),
(13, 0, NULL, NULL, NULL, 'Marcelo', 'Lopes', 'carla92silva@hotmai.com', NULL, 'Luxembourg', 'Diekirch', 'rue du Gymnase', '24', '+352', '691920621', 'L-9238', '2023-05-10 11:30:59', '2023-05-10 15:35:13', 65),
(14, 0, NULL, NULL, NULL, 'Tim', 'Smulders', 'Cleaningviolette@gmail.com', NULL, 'Luxembourg', 'Weiler-la-tour', 'rue des Violettes ', '10', '+352', '661289759', 'L-1744', '2023-05-10 21:28:13', '2023-05-10 21:28:13', 65),
(15, 0, NULL, NULL, NULL, 'Simon', 'Martine', 'info@hdlv.lu', NULL, 'Luxembourg', 'Heffingen/Soup', 'Millewee', '8', '+352', '879393', 'L-7653', '2023-05-14 11:10:57', '2023-05-14 11:10:57', 65),
(16, 0, NULL, NULL, NULL, 'Eglise ueo', 'Apostolique de belgique', 'r.wagner@nak-west.de', NULL, 'Belgique', ' Bruxelles', 'Avenue Frauz Guillaume ', '80', '+33', '632109623', 'B-81140 ', '2023-05-31 17:49:45', '2023-07-05 05:38:51', 65),
(17, 0, NULL, NULL, NULL, 'Tchaha', 'Claude', 'rodriguempapa@yahoo.fr', NULL, 'Luxembourg', 'Arlon', 'Avenue de Longwy', '215', '+32', '487129680', 'Belgique', '2023-05-31 20:20:44', '2023-05-31 20:20:44', 65),
(18, 0, NULL, NULL, NULL, 'Besch cocard', 'francoise', 'Marghitacirpaci1988@gmail.com', NULL, 'Luxembourg', 'Luxembourg', 'AvenueGaston  diderich', '239', '+352', '446187', 'L-1420', '2023-06-04 21:18:42', '2023-06-04 21:18:42', 65),
(19, 1, ' DD CONSTRUCTIONS S.A.', ' LU25296123', NULL, 'REICHLING', 'Jonathan', 'compta@ddconstruction.lu', NULL, 'Luxembourg', 'Pétange', ' place du marché ', '15', '+352', '2884441', 'L-4756', '2023-06-05 22:18:52', '2023-06-05 22:18:52', 65),
(20, 0, NULL, NULL, NULL, 'LABIDI', 'Mondher', 'mondher@labidi.lu', 'www.labidi.lu', 'Luxembourg', 'belvaux', 'route d\'esch', '18', '+352', '691543276', '4450', '2023-06-06 20:24:47', '2023-06-06 20:25:19', 67),
(21, 0, NULL, NULL, NULL, 'COVACI', 'IOSIF', 'iosifcovaci85@gmail.com', NULL, 'Luxembourg', 'Rodange', 'Rue Marie Adelaide', '27', '+352', '661775831', 'L-4837', '2023-06-08 19:57:03', '2023-06-08 19:57:03', 65),
(22, 0, NULL, NULL, NULL, 'Ganser', 'Ganser', 'Office@netaris.online', NULL, 'Luxembourg', 'Luxembourg', 'Rue  Montee de Willy Goergen', '36', '+352', '621370949', 'L-7322', '2023-06-28 19:03:06', '2023-06-28 19:03:06', 65),
(23, 0, NULL, NULL, NULL, 'Hoffmann', 'Marc', 'mhc@pt.lu', NULL, 'Luxembourg', 'Gonderange', 'G-D charlotte', '2', '+352', '621484468', 'L-6190', '2023-07-06 17:32:21', '2023-07-06 17:32:21', 65),
(24, 0, NULL, NULL, NULL, 'Isabelle', 'Freitas Barroso', 'isabelle.barroso@ell.lu', NULL, 'Luxembourg', ' Haaptstrooss', 'Administration communale Ell', '27', '+352', '621 69 20 77', 'L-8530 ELL', '2023-07-10 22:15:57', '2023-07-10 22:15:57', 65),
(25, 1, 'CBL  S.A.', 'LU21441615', NULL, 'CBL', 'CBL', 'info@cbl-sa.lu', NULL, 'Luxembourg', 'Niederkorn', 'Rue Hahneboesch', '1', '+352', '2857681', 'L-4578', '2023-07-16 11:17:58', '2023-07-16 11:17:58', 65),
(26, 0, NULL, NULL, NULL, 'Elvis', 'Licina', 'enes.licina92@pt.lu', NULL, 'Luxembourg', 'Mersch', 'Rue Nicolas Welter', '115', '+352', '+352 691 558 777', '7570', '2023-07-19 09:09:14', '2023-07-19 09:09:14', 67),
(27, 1, 'ROLFBAU GMBH', 'LU 20581345', NULL, NULL, NULL, 'rolfbau@pt.lu', NULL, 'Luxembourg', 'Erpeldange (Wiltz)', 'Rue Nic Schildermans', '4a', '+352', '+352 691 431 650', 'L-9648', '2023-07-19 09:16:48', '2023-07-19 09:16:48', 67),
(28, 0, NULL, NULL, NULL, 'Mendes', 'Furtado alcidas', 'c.batiloc@free.fr', NULL, 'Luxembourg', 'Pétange', 'rue Aloyse Kayser', '45', '+33', '672713311', 'L-4793', '2023-07-30 20:17:43', '2023-07-30 20:17:43', 65),
(29, 0, NULL, NULL, NULL, 'Drion', 'Christian', 'c.batiloc@free.fr', NULL, 'Luxembourg', 'Pétange', 'rue Aloyse Kayser', '47', '+33', '672713311', 'L-4793', '2023-07-30 20:21:54', '2023-07-30 20:21:54', 65),
(30, 0, NULL, NULL, NULL, 'Julia', 'Andrade Lopess', '1973juliaandrade@gimaiel.com', NULL, 'Luxembourg', 'esch-sur-alzette', 'rue st vicent', '3', '+352', '691521277', 'L-4344', '2023-08-03 16:46:05', '2023-08-03 16:46:05', 65),
(31, 0, NULL, NULL, NULL, 'STOLL', 'ROXANE', 'stoll.roxane@hotmail.fr', NULL, 'Belgique', 'Rossignol', 'Rue de Neufchâteau', '116', '+32', '494766966', 'B-6730', '2023-09-14 19:59:06', '2023-09-14 19:59:06', 65),
(32, 1, 'DEMELUX SARL', 'LU18865059', NULL, 'WEBER', 'FANNY', 'fanny.weber@serges-finance.lu', NULL, 'Luxembourg', 'Bertrange', 'rue du Chemin de fer', '13', '+352', '26120151', 'L-8057', '2023-09-27 07:38:23', '2023-09-27 07:38:23', 65),
(33, 1, 'VRC Sarl', 'LU21368787', NULL, 'Victor', 'Vrc', 'info@vrc.lu', NULL, 'Luxembourg', 'Reckange/Mess', 'route  des 3 cantons', '220', '+352', '621225461', 'L-4980', '2023-10-02 16:37:32', '2023-10-02 16:37:32', 65),
(34, 0, NULL, NULL, NULL, 'SANTOS', 'PEDROSA AQUILINO', 'aquilino.santosp@gmail.com', NULL, 'Luxembourg', 'la rochette', 'Rue Michel de rodange', '4', '+352', '621709524', 'L-7624', '2023-10-12 12:46:50', '2023-10-12 12:48:52', 65),
(35, 1, 'DECOART-LUX', NULL, NULL, 'COVACI', 'Iosif', 'info@decoart-lux.lu', 'www.decoart-lux.lu', 'Luxembourg', 'Bertrange', 'rue de l\'industrie', '19', '+352', '661775831', '8069', '2023-10-12 22:10:08', '2023-10-12 22:10:08', 66),
(36, 0, NULL, NULL, NULL, 'Kiko', 'Steinmetzer', 'steinmetzer.kiko@gmail.com', NULL, 'Luxembourg', 'Oetrange', 'Rue de Sandweiler', '17', '+352', '691615346', '5362', '2023-10-15 17:12:28', '2023-10-15 17:12:28', 65),
(37, 0, NULL, NULL, NULL, 'Salvati', 'Massimo', 'massimo65@pt.lu', NULL, 'Luxembourg', 'Luxembourg', 'Rue D\'Eich', '1-3', '+352', '691482087', 'L-1461', '2023-10-22 11:25:40', '2023-10-22 11:25:40', 65),
(38, 0, NULL, NULL, NULL, 'Ferreira', 'Ricardo', 'ricardoferreiraaf@gmail.com', NULL, 'Luxembourg', 'Wiltz', 'rue des rochers', '16', '+352', '621381652', 'L-9570', '2023-10-22 12:57:12', '2023-10-22 12:57:12', 65),
(39, 1, 'AS ENTREPRISE SARL', NULL, NULL, 'MECO', 'RAMZO', 'info@ase.lu', NULL, 'Luxembourg', 'Esch-sur-alzette', 'Grand Rue', '7', '+352', '621 211 557  - 691 771 491', 'L-4132', '2023-10-26 08:52:25', '2023-10-26 08:52:25', 67),
(40, 0, NULL, NULL, NULL, 'Elvis', 'Dragulovcanin', 'dr.elvis88@yahoo.de', NULL, 'Luxembourg', 'Wiltz', ' rte de noertrange', '64b', '+352', NULL, 'L-9543', '2023-11-03 09:19:19', '2023-11-03 09:19:19', 67);

-- --------------------------------------------------------

--
-- Structure de la table `composition_produits`
--

CREATE TABLE `composition_produits` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `qte` int(11) DEFAULT NULL,
  `tva` int(11) DEFAULT NULL,
  `prixUnitaireHT` varchar(255) DEFAULT NULL,
  `prixTotalHT` varchar(255) DEFAULT NULL,
  `prixTotalTTC` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `composed_product` int(11) DEFAULT NULL,
  `composed_from` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `compte_bancaires`
--

CREATE TABLE `compte_bancaires` (
  `id` int(11) NOT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `bic` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `rib` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `entrepriseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `compte_bancaires`
--

INSERT INTO `compte_bancaires` (`id`, `iban`, `bic`, `nom`, `rib`, `createdAt`, `updatedAt`, `entrepriseId`) VALUES
(1, 'LU31 0250 0465 6113 1000', 'BMECLULLXXX', 'DANIEL-LUX', NULL, '2023-03-24 22:26:09', '2023-06-09 22:26:21', 1),
(2, 'LU19 0141 3710 9400 0000', 'CELLLULLXXX', 'MMS-LETZMART', NULL, '2023-03-27 00:58:12', '2023-05-24 08:48:41', 2),
(3, 'LU09 0030 2392 6702 0000', 'BGLLLULL', 'MBE ETANCHEITE', NULL, '2023-04-02 13:02:20', '2023-04-02 13:02:20', 3),
(4, 'LU63 0250 0465 6111 5001', 'BMECLULLXXX', 'DANIEL-LUX', NULL, '2023-06-09 22:26:21', '2023-06-09 22:26:21', 1);

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

CREATE TABLE `devis` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `montant_total` varchar(255) DEFAULT NULL,
  `total_ttc` float DEFAULT NULL,
  `total_ht` float DEFAULT NULL,
  `remise_global` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `fodec` float DEFAULT NULL,
  `totalTimbreFiscal` float DEFAULT NULL,
  `devise` varchar(255) DEFAULT NULL,
  `bn_status` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clientId` int(11) DEFAULT NULL,
  `entrepriseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `devis`
--

INSERT INTO `devis` (`id`, `date`, `reference`, `note`, `etat`, `montant_total`, `total_ttc`, `total_ht`, `remise_global`, `tva`, `fodec`, `totalTimbreFiscal`, `devise`, `bn_status`, `createdAt`, `updatedAt`, `clientId`, `entrepriseId`) VALUES
(1, '2023-03-27 01:42:26', 'D20230001', NULL, 1, '632.20', 632.2, 545, 0, 87.2, NULL, NULL, 'EUR', 0, '2023-03-27 01:55:15', '2023-03-30 21:22:45', 2, 2),
(2, '2023-03-27 17:29:50', 'D20230001', 'carrelage pose o 2m 42€', 1, '48.72', 48.72, 42, 0, 6.72, NULL, NULL, 'EUR', 0, '2023-03-27 17:40:53', '2023-03-30 19:49:01', 3, 1),
(3, '2023-03-27 23:11:15', 'D20230002', 'Terrasse a  rénover ', 0, '15886.20', 15886.2, 13695, 0, 2191.2, NULL, NULL, 'EUR', 0, '2023-03-28 00:39:15', '2023-03-29 19:45:20', 4, 1),
(4, '2023-03-28 01:14:44', 'D20230003', 'Travaux de terrasse', 1, '11136.00', 11136, 9600, 0, 1536, NULL, NULL, 'EUR', 0, '2023-03-28 01:50:13', '2023-06-12 19:38:42', 5, 1),
(5, '2023-04-02 13:18:07', 'D20230002', NULL, 1, '633.71', 633.708, 546.3, 10, 87.408, NULL, NULL, 'EUR', 1, '2023-04-02 13:20:09', '2023-04-02 13:30:15', 7, 2),
(6, '2023-04-07 19:36:21', 'D20230004', 'Travaux de doublages de mur 100 m2', 1, '9442.40', 9442.4, 8140, 0, 1302.4, NULL, NULL, 'EUR', 0, '2023-04-07 20:01:28', '2023-04-14 20:00:07', 8, 1),
(7, '2023-04-19 19:10:52', 'D20230005', 'Travaux de prestations de travail ', 1, '6953.04', 6953.04, 5994, 0, 959.04, NULL, NULL, 'EUR', 0, '2023-04-19 19:21:22', '2023-05-16 16:59:49', 9, 1),
(8, '2023-04-20 18:53:13', 'D20230006', 'Rénovation dune cuisine    a Dudelange', 0, '2906.50', 2906.5, 2505.6, 10, 400.896, NULL, NULL, 'EUR', 0, '2023-04-20 19:23:27', '2023-04-25 11:03:54', 1, 1),
(9, '2023-04-20 19:32:08', 'D20230007', 'Pose de parquets a colle ', 0, '6391.60', 6391.6, 5510, 0, 881.6, NULL, NULL, 'EUR', 0, '2023-04-20 20:01:55', '2023-04-20 20:01:55', 1, 1),
(10, '2023-04-20 20:12:57', 'D20230008', 'Rénovation de un maison Belgique', -1, '55807.60', 55807.6, 48110, 0, 7697.6, NULL, NULL, 'EUR', 0, '2023-04-20 22:02:32', '2023-04-22 10:13:37', 1, 1),
(11, '2023-04-22 10:19:16', 'D20230009', 'Rénovations novation d\'un méson a Belgique  ( nr 1)', -1, '13920.00', 13920, 12000, 0, 1920, NULL, NULL, 'EUR', 0, '2023-04-22 10:44:25', '2023-04-22 21:48:47', 1, 1),
(12, '2023-04-22 21:49:13', 'D20230010', 'Rénovation de un méson a Belgique n 1', -1, '13920.00', 13920, 12000, 0, 1920, NULL, NULL, 'EUR', 0, '2023-04-22 22:07:10', '2023-04-23 22:07:16', 1, 1),
(13, '2023-04-23 22:08:34', 'D20230011', 'Rénovation de un maison en Belgique  1 ', -1, '9860.00', 9860, 8500, 0, 1360, NULL, NULL, 'EUR', 0, '2023-04-23 22:19:30', '2023-04-24 19:26:35', 1, 1),
(14, '2023-04-24 19:12:37', 'D20230012', 'Rénovation d\'une maison en Belgique n1', 1, '9860.00', 9860, 8500, 0, 1360, NULL, NULL, 'EUR', 0, '2023-04-24 19:22:59', '2023-07-04 20:43:11', 1, 1),
(15, '2023-04-25 07:56:08', 'D20230013', 'Rénovation d\'un maison a Belgique n2 ', 1, '2900.00', 2900, 2500, 0, 400, NULL, NULL, 'EUR', 0, '2023-04-25 08:24:03', '2023-07-04 20:43:55', 1, 1),
(16, '2023-04-25 08:28:09', 'D20230014', 'Rénovation d\'un maison a Belgique n3', 1, '4060.00', 4060, 3500, 0, 560, NULL, NULL, 'EUR', 0, '2023-04-25 08:39:33', '2023-07-03 10:35:04', 1, 1),
(17, '2023-04-25 08:47:03', 'D20230015', 'Rénovation d\'un maison a Belgique n 4', 1, '15745.84', 15745.8, 13574, 0, 2171.84, NULL, NULL, 'EUR', 0, '2023-04-25 09:32:56', '2023-07-04 20:44:43', 1, 1),
(18, '2023-04-25 09:33:23', 'D20230016', 'Rénovation d\'un maison a Belgique n5', -1, '928.00', 928, 800, 0, 128, NULL, NULL, 'EUR', 0, '2023-04-25 09:44:51', '2023-07-03 10:16:47', 1, 1),
(19, '2023-04-25 09:46:18', 'D20230017', 'Rénovation d\'une maison a Belgique n 6', 1, '1995.20', 1995.2, 1720, 0, 275.2, NULL, NULL, 'EUR', 0, '2023-04-25 09:58:37', '2023-07-04 20:44:18', 1, 1),
(20, '2023-05-04 18:20:32', 'D20230018', 'Rénovation de un maison a Belgique n6', 0, '2349.00', 2349, 2025, 0, 324, NULL, NULL, 'EUR', 0, '2023-05-04 18:46:59', '2023-07-04 20:47:30', 1, 1),
(21, '2023-05-08 18:56:24', 'D20230019', 'Rénovation de un sal de bain', 0, '4872.00', 4872, 4200, 0, 672, NULL, NULL, 'EUR', 0, '2023-05-08 19:22:56', '2023-05-08 19:22:56', 10, 1),
(22, '2023-05-08 19:40:23', 'D20230020', 'Rénovation de un sal de bain', 0, '3364.00', 3364, 2900, 0, 464, NULL, NULL, 'EUR', 0, '2023-05-08 19:50:27', '2023-05-08 19:59:32', 11, 1),
(23, '2023-05-09 22:10:13', 'D20230021', 'Prestation services de nettoyage', 1, '5800.00', 5800, 5000, 0, 800, NULL, NULL, 'EUR', 0, '2023-05-09 22:13:34', '2023-05-19 06:43:51', 12, 1),
(24, '2023-05-10 11:31:07', 'D20230022', 'Rénovation de un appartement', 1, '9280.00', 9280, 8000, 0, 1280, NULL, NULL, 'EUR', 0, '2023-05-10 11:50:53', '2023-05-19 06:44:06', 13, 1),
(25, '2023-05-10 21:28:55', 'D20230023', 'Travaux D\'un  terrasse en Dalle', -1, '6960.00', 6960, 6000, 0, 960, NULL, NULL, 'EUR', 0, '2023-05-10 21:55:40', '2023-06-28 18:36:13', 14, 1),
(26, '2023-05-14 11:12:12', 'D20230024', 'Remise en Peinture façade', 0, '41546.56', 41546.6, 35816, 0, 5730.56, NULL, NULL, 'EUR', 0, '2023-05-14 13:33:51', '2023-05-14 14:14:55', 15, 1),
(27, '2023-05-24 22:41:42', 'D20230025', 'Rénovation d\'un pièces cousine a Dudelange', 0, '6148.00', 6148, 5300, 0, 848, NULL, NULL, 'EUR', 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 1, 1),
(28, '2023-05-31 18:07:58', 'D20230026', 'Travaux à réaliser .a la adresse  26 Avenue de la Libération\n6791-Athus (Belgique)', 1, '1740.00', 1740, 1500, 0, 240, NULL, NULL, 'EUR', 0, '2023-05-31 18:48:43', '2023-08-03 16:37:50', 16, 1),
(29, '2023-05-31 20:20:56', 'D20230027', 'Rénovation complète d\'une maison', 0, '63706.90', 63706.9, 59270, 0, 4436.9, NULL, NULL, 'EUR', 0, '2023-05-31 22:34:32', '2023-07-25 16:30:11', 17, 1),
(30, '2023-06-04 21:28:44', 'D20230028', 'Isolation intérieur', 0, '7412.40', 7412.4, 6390, 0, 1022.4, NULL, NULL, 'EUR', 0, '2023-06-04 22:01:11', '2023-06-04 22:01:11', 1, 1),
(31, '2023-06-05 22:19:11', 'D20230029', 'Réalisation de pose de peinture ', 0, '34800.00', 34800, 30000, 0, 4800, NULL, NULL, 'EUR', 0, '2023-06-05 22:38:22', '2023-06-05 22:38:22', 19, 1),
(32, '2023-06-06 20:26:11', 'D20230001', '', 1, '26680.00', 26680, 23000, 0, 3680, NULL, NULL, 'EUR', 0, '2023-06-06 20:29:05', '2023-06-06 21:05:23', 20, 3),
(33, '2023-06-08 19:57:25', 'D20230030', 'Rénovation d\'un maison a Rodange', 1, '25119.80', 25119.8, 21655, 0, 3464.8, NULL, NULL, 'EUR', 0, '2023-06-08 21:36:04', '2023-08-09 18:10:49', 21, 1),
(34, '2023-06-09 22:27:51', 'D20230031', 'Réalisation de peinture Esch-Alzette', 1, '2296.80', 2296.8, 1980, 0, 316.8, NULL, NULL, 'EUR', 0, '2023-06-09 22:28:41', '2023-06-28 18:33:56', 1, 1),
(35, '2023-06-28 22:43:08', 'D20230032', 'Réalisation de peinture chantier   Hachurage', 0, '7099.20', 7099.2, 6120, 0, 979.2, NULL, NULL, 'EUR', 0, '2023-06-28 22:56:15', '2023-06-28 22:56:15', 1, 1),
(36, '2023-07-04 21:01:50', 'D20230033', 'Travaux de colature    chantier  bissen', 1, '3828.00', 3828, 3300, 0, 528, NULL, NULL, 'EUR', 0, '2023-07-04 21:24:48', '2023-10-01 20:55:37', 1, 1),
(37, '2023-07-06 17:32:34', 'D20230034', 'Prestation de  service  Nettoyage', 1, '3821.04', 3821.04, 3294, 0, 527.04, NULL, NULL, 'EUR', 0, '2023-07-06 17:53:58', '2023-07-20 20:41:39', 23, 1),
(38, '2023-07-10 22:16:12', 'D20230035', 'Devis pour administration Communale.\n', 0, '32.48', 32.48, 28, 0, 4.48, NULL, NULL, 'EUR', 0, '2023-07-10 22:29:30', '2023-07-10 22:33:16', 24, 1),
(39, '2023-07-19 18:06:59', 'D20230002', NULL, -1, '5689.22', 5689.22, 4904.5, 15, 784.72, NULL, NULL, 'EUR', 0, '2023-07-19 18:57:52', '2023-10-26 07:28:11', 26, 3),
(40, '2023-07-20 20:44:56', 'D20230036', 'Travaux a chantier strassee ', 0, '2654.08', 2654.08, 2288, 0, 366.08, NULL, NULL, 'EUR', 0, '2023-07-20 21:10:42', '2023-07-20 21:10:42', 1, 1),
(41, '2023-07-30 20:24:19', 'D20230037', 'Réalisation d\'une couturé  a Pétange', 0, '1856.00', 1856, 1600, 0, 256, NULL, NULL, 'EUR', 0, '2023-07-30 20:39:32', '2023-07-30 20:39:32', 28, 1),
(42, '2023-07-30 20:41:35', 'D20230038', 'Réalisation de parking pour le voiture Pétange', 0, '15660.00', 15660, 13500, 0, 2160, NULL, NULL, 'EUR', 0, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 28, 1),
(43, '2023-07-30 21:20:20', 'D20230039', 'Réalisation de travaux   ', 0, '3572.80', 3572.8, 3080, 0, 492.8, NULL, NULL, 'EUR', 0, '2023-07-30 21:45:27', '2023-07-30 21:45:27', 29, 1),
(44, '2023-07-30 21:46:48', 'D20230040', 'Réalisation de une clôture ', 0, '5800.00', 5800, 5000, 0, 800, NULL, NULL, 'EUR', 0, '2023-07-30 22:01:20', '2023-07-30 22:01:20', 29, 1),
(45, '2023-08-03 16:46:21', 'D20230041', 'Transformation d\'une cuisine  en carrelage', 0, '5046.00', 5046, 4350, 0, 696, NULL, NULL, 'EUR', 0, '2023-08-03 17:21:35', '2023-08-03 17:23:42', 30, 1),
(46, '2023-09-10 10:32:27', 'D20230042', 'Chantier Hosingen  Réalisation d\'e peinture', 0, '9813.60', 9813.6, 8460, 0, 1353.6, NULL, NULL, 'EUR', 0, '2023-09-10 10:47:42', '2023-09-10 10:47:42', 1, 1),
(47, '2023-09-14 19:59:17', 'D20230043', 'Réalisation de une chape  rossignol', -1, '14337.60', 14337.6, 12360, 20, 1977.6, NULL, NULL, 'EUR', 0, '2023-09-14 20:43:56', '2023-09-27 20:59:27', 31, 1),
(48, '2023-09-27 07:38:46', 'D20230044', 'Prestation  de service Nettoyage', 0, '38.00', 38.0016, 32.76, 0, 5.2416, NULL, NULL, 'EUR', 0, '2023-09-27 07:52:24', '2023-09-27 07:52:24', 32, 1),
(49, '2023-09-27 20:45:58', 'D20230045', 'Rénovation d\'un maison a Belgique\n\nDEVIS supplément', 0, '3271.20', 3271.2, 2820, 0, 451.2, NULL, NULL, 'EUR', 0, '2023-09-27 20:53:51', '2023-09-27 20:53:51', 1, 1),
(50, '2023-10-10 12:54:07', 'D20230046', 'Rénovation d\'un  maison a Belgique DEVIS  supplément', 0, '1740.00', 1740, 1500, 0, 240, NULL, NULL, 'EUR', 0, '2023-10-10 13:25:15', '2023-10-10 13:25:15', 1, 1),
(51, '2023-10-12 12:48:59', 'D20230047', 'Réalisation de pose de parquet   ', 1, '4640.00', 4640, 4000, 0, 640, NULL, NULL, 'EUR', 0, '2023-10-12 13:04:11', '2023-10-27 06:54:49', 34, 1),
(52, '2023-10-12 17:41:09', 'D20230003', NULL, 0, '0.00', 0, 0, 0, 0, NULL, NULL, 'EUR', 0, '2023-10-12 17:43:18', '2023-10-12 22:04:33', 2, 2),
(53, '2023-10-12 22:10:42', 'D20230004', NULL, 1, '667.00', 667, 575, 0, 92, NULL, NULL, 'EUR', 0, '2023-10-12 22:34:00', '2023-10-18 05:26:10', 35, 2),
(54, '2023-10-15 19:12:26', 'D20230048', 'Rénovation d\'un maison', 0, '38612.92', 38612.9, 33287, 0, 5325.92, NULL, NULL, 'EUR', 0, '2023-10-15 19:38:55', '2023-10-15 21:03:15', 36, 1),
(55, '2023-10-15 21:03:52', 'D20230049', 'Rénovation d\'un maison', 0, '22620.00', 22620, 19500, 0, 3120, NULL, NULL, 'EUR', 0, '2023-10-15 21:15:57', '2023-10-15 21:17:25', 36, 1),
(56, '2023-10-22 11:26:13', 'D20230050', 'Réalisation de  carrelage chantier Résidents Aline  ', 0, '17678.40', 17678.4, 15240, 0, 2438.4, NULL, NULL, 'EUR', 0, '2023-10-22 12:31:46', '2023-10-22 12:31:46', 37, 1),
(57, '2023-10-22 12:57:22', 'D20230051', 'Réalisation de travaux Wiltz', 0, '20178.20', 20178.2, 17395, 0, 2783.2, NULL, NULL, 'EUR', 0, '2023-10-22 13:56:22', '2023-10-22 14:26:02', 38, 1),
(58, '2023-10-23 20:25:23', 'D20230003', 'test', -1, '835.20', 835.2, 720, 0, 115.2, NULL, NULL, 'EUR', 0, '2023-10-23 20:26:27', '2023-10-26 07:28:09', 20, 3),
(59, '2023-10-23 20:31:10', 'D20230004', NULL, -1, '1299.20', 1299.2, 1120, 0, 179.2, NULL, NULL, 'EUR', 0, '2023-10-23 20:31:58', '2023-10-26 07:28:04', 20, 3),
(60, '2023-10-23 20:45:58', 'D20230005', 'test', -1, '0.00', 0, 0, 0, 0, NULL, NULL, 'EUR', 0, '2023-10-23 20:46:49', '2023-10-26 07:27:59', 20, 3),
(61, '2023-10-26 08:52:46', 'D20230006', NULL, 0, '3074.00', 3074, 2650, 0, 424, NULL, NULL, 'EUR', 0, '2023-10-26 09:21:38', '2023-10-26 09:23:40', 39, 3),
(62, '2023-11-02 16:55:52', 'D20230052', 'Rénovation d\'une salle de bain chantier Differdange ', 0, '7354.40', 7354.4, 6340, 0, 1014.4, NULL, NULL, 'EUR', 0, '2023-11-02 17:41:11', '2023-11-02 17:45:02', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `echance_devis`
--

CREATE TABLE `echance_devis` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `objet` varchar(255) DEFAULT NULL,
  `pourcentage` float DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `datePaiement` datetime DEFAULT NULL,
  `num_facture` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deviId` int(11) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `echance_devis`
--

INSERT INTO `echance_devis` (`id`, `date`, `objet`, `pourcentage`, `montant`, `datePaiement`, `num_facture`, `createdAt`, `updatedAt`, `deviId`, `etat`) VALUES
(1, '2023-03-27 01:55:15', 'Avance à la commande', 40, 252.88, '2023-03-30 21:23:16', 'F20230001', '2023-03-27 01:55:15', '2023-06-12 06:37:18', 1, 1),
(2, '2023-03-27 01:55:15', '1 mois après la 1ere facture', 40, 252.88, '2023-05-24 08:50:32', 'F20230004', '2023-03-27 01:55:15', '2023-06-12 06:37:18', 1, 1),
(3, '2023-03-27 01:55:15', '1 mois après la 2eme facture', 20, 126.44, '2023-06-12 06:37:18', 'F20230005', '2023-03-27 01:55:15', '2023-06-12 06:37:18', 1, 1),
(4, NULL, 'D\'acompte de marandais ', 40, 6354.48, NULL, NULL, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3, 0),
(5, NULL, 'D\'acompte de finir terrasse  jardiné', 40, 6354.48, NULL, NULL, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3, 0),
(6, NULL, 'D\'acompte de finir travail', 20, 3177.24, NULL, NULL, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3, 0),
(7, NULL, 'D\'acompte sur la commande ', 40, 4454.4, NULL, NULL, '2023-03-28 01:50:13', '2023-03-28 01:50:13', 4, 0),
(8, NULL, 'Lorsque le balcon et escalier  sont carrelés', 30, 3340.8, NULL, NULL, '2023-03-28 01:50:13', '2023-03-28 01:50:13', 4, 0),
(9, NULL, 'La troisième partie a la fin des travaux ', 30, 3340.8, NULL, NULL, '2023-03-28 01:50:13', '2023-03-28 01:50:13', 4, 0),
(10, '2023-04-02 13:23:20', 'acompte', 70, 443.6, '2023-04-02 13:25:25', 'F20230002', '2023-04-02 13:23:20', '2023-04-02 13:28:27', 5, 1),
(11, '2023-04-02 13:23:20', 'final', 30, 190.113, '2023-04-02 13:28:26', 'F20230003', '2023-04-02 13:23:20', '2023-04-02 13:28:27', 5, 1),
(12, NULL, NULL, 60, 5665.44, NULL, NULL, '2023-04-07 20:01:28', '2023-04-07 20:01:28', 6, 0),
(13, NULL, NULL, 40, 3776.96, NULL, NULL, '2023-04-07 20:01:28', '2023-04-07 20:01:28', 6, 0),
(16, NULL, 'd acompte  de  la pose de parquets', 50, 3195.8, NULL, NULL, '2023-04-20 20:01:55', '2023-04-20 20:01:55', 9, 0),
(17, NULL, 'd acompte  de  la  fin de travail', 50, 3195.8, NULL, NULL, '2023-04-20 20:01:55', '2023-04-20 20:01:55', 9, 0),
(22, NULL, NULL, 50, 1450, NULL, NULL, '2023-04-25 08:27:34', '2023-04-25 08:27:34', 15, 0),
(23, NULL, NULL, 50, 1450, NULL, NULL, '2023-04-25 08:27:34', '2023-04-25 08:27:34', 15, 0),
(28, NULL, 'Acompte du matériel', 60, 1197.12, NULL, NULL, '2023-04-25 09:58:37', '2023-04-25 09:58:37', 19, 0),
(29, NULL, 'Fin de installation ', 40, 798.08, NULL, NULL, '2023-04-25 09:58:37', '2023-04-25 09:58:37', 19, 0),
(30, NULL, 'Acompte  pour  début des travaux ', 60, 1743.9, NULL, NULL, '2023-04-25 11:03:54', '2023-04-25 11:03:54', 8, 0),
(31, NULL, 'Fin de travaux', 40, 1162.6, NULL, NULL, '2023-04-25 11:03:54', '2023-04-25 11:03:54', 8, 0),
(36, NULL, 'Acompte de matériel', 60, 2923.2, NULL, NULL, '2023-05-08 19:22:56', '2023-05-08 19:22:56', 21, 0),
(37, NULL, 'Acompte fin de travaux', 40, 1948.8, NULL, NULL, '2023-05-08 19:22:56', '2023-05-08 19:22:56', 21, 0),
(38, NULL, 'Acompte pur le Materials et travux', 70, 1624, NULL, NULL, '2023-05-08 19:50:27', '2023-05-08 19:50:27', 22, 0),
(39, NULL, 'Acropète fin de travaux', 30, 696, NULL, NULL, '2023-05-08 19:50:27', '2023-05-08 19:50:27', 22, 0),
(40, NULL, 'Acompte pour le Materials', 60, 5568, NULL, NULL, '2023-05-10 11:50:53', '2023-05-10 11:50:53', 24, 0),
(41, NULL, 'Acompte  fin de travaux', 40, 3712, NULL, NULL, '2023-05-10 11:50:53', '2023-05-10 11:50:53', 24, 0),
(42, NULL, 'Acompte pour le Matériel ', 60, 4176, NULL, NULL, '2023-05-10 21:55:41', '2023-05-10 21:55:41', 25, 0),
(43, NULL, 'Acompte fin de travaux ', 40, 2784, NULL, NULL, '2023-05-10 21:55:41', '2023-05-10 21:55:41', 25, 0),
(44, NULL, 'D\'compte a la commande de matériel', 40, 16794, NULL, NULL, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26, 0),
(45, NULL, 'D\'compte a la finir de peinture façade avant ', 40, 16794, NULL, NULL, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26, 0),
(46, NULL, 'D\'compte a la finir de travaux de chantier ', 20, 8397.01, NULL, NULL, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26, 0),
(49, NULL, 'Acompte pour\nmatériel', 33.33, 5248.61, NULL, NULL, '2023-05-19 06:52:46', '2023-05-19 06:52:46', 17, 0),
(50, NULL, 'Acompte  sur avons mont de travaux', 33.33, 5248.61, NULL, NULL, '2023-05-19 06:52:46', '2023-05-19 06:52:46', 17, 0),
(51, NULL, 'Acompte  sur avons mont de travaux', 33.33, 5248.61, NULL, NULL, '2023-05-19 06:52:46', '2023-05-19 06:52:46', 17, 0),
(52, NULL, 'Acompte  sur avons mont de travaux', 33.33, 3286.67, NULL, NULL, '2023-05-19 06:56:16', '2023-05-19 06:56:16', 14, 0),
(53, NULL, 'Acompte  sur avons mont de travaux', 33.33, 3286.67, NULL, NULL, '2023-05-19 06:56:16', '2023-05-19 06:56:16', 14, 0),
(54, NULL, 'Acompte  sur avons mont de travaux', 33.33, 3286.67, NULL, NULL, '2023-05-19 06:56:16', '2023-05-19 06:56:16', 14, 0),
(55, NULL, 'D\'acropète a la  commande de Materials  ', 33.33, 2049.33, NULL, NULL, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27, 0),
(56, NULL, 'D\'acropète a la  avons mont de travail', 33.33, 2049.33, NULL, NULL, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27, 0),
(57, NULL, 'D\'acropète a la  fin de travaux', 33.33, 2049.33, NULL, NULL, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27, 0),
(58, NULL, 'Acompte sur la commande  ', 40, 696, NULL, NULL, '2023-05-31 18:48:43', '2023-05-31 18:48:43', 28, 0),
(59, NULL, 'Acompte fin de travaux', 60, 1044, NULL, NULL, '2023-05-31 18:48:43', '2023-05-31 18:48:43', 28, 0),
(64, NULL, 'Avance a la commande', 40, 13920, NULL, NULL, '2023-06-05 22:38:22', '2023-06-05 22:38:22', 31, 0),
(65, NULL, 'Avance a la commande du travaux', 30, 10440, NULL, NULL, '2023-06-05 22:38:22', '2023-06-05 22:38:22', 31, 0),
(66, NULL, 'Avance a la commande du travaux', 15, 5220, NULL, NULL, '2023-06-05 22:38:22', '2023-06-05 22:38:22', 31, 0),
(67, NULL, 'Acompte fin de travaux', 15, 5220, NULL, NULL, '2023-06-05 22:38:22', '2023-06-05 22:38:22', 31, 0),
(68, '2023-06-06 20:33:18', 'Avant travaux', 50, 13340, '2023-06-06 21:07:06', 'F20230001', '2023-06-06 20:33:18', '2023-06-06 21:21:13', 32, 1),
(69, '2023-06-06 20:33:18', 'Apres construction toit ', 25, 6670, '2023-06-06 21:09:29', 'F20230002', '2023-06-06 20:33:18', '2023-06-06 21:21:13', 32, 1),
(70, '2023-06-06 20:33:18', 'Fin de travail', 25, 6670, '2023-06-06 21:21:13', 'F20230003', '2023-06-06 20:33:18', '2023-06-06 21:23:32', 32, 0),
(71, NULL, 'Acompte sur la commande ', 50, 1148.4, NULL, NULL, '2023-06-12 22:38:48', '2023-06-12 22:38:48', 34, 0),
(72, NULL, 'Acompte sur fin de travaux', 50, 1148.4, NULL, NULL, '2023-06-12 22:38:48', '2023-06-12 22:38:48', 34, 0),
(73, NULL, 'Acompte sur la commande ', 25, 15854.7, NULL, NULL, '2023-06-15 20:56:38', '2023-06-15 20:56:38', 29, 0),
(74, NULL, 'Acompte sur la avancer de travaux', 25, 15854.7, NULL, NULL, '2023-06-15 20:56:38', '2023-06-15 20:56:38', 29, 0),
(75, NULL, 'Acompte sur la avancer de travaux', 25, 15854.7, NULL, NULL, '2023-06-15 20:56:38', '2023-06-15 20:56:38', 29, 0),
(76, NULL, 'Acompte sur la fin  de travaux', 25, 15854.7, NULL, NULL, '2023-06-15 20:56:38', '2023-06-15 20:56:38', 29, 0),
(77, NULL, 'Acompte sur la commande', 33.33, 2366.4, NULL, NULL, '2023-06-28 22:56:15', '2023-06-28 22:56:15', 35, 0),
(78, NULL, 'Acompte sur le avons mon de travaux', 33.33, 2366.4, NULL, NULL, '2023-06-28 22:56:15', '2023-06-28 22:56:15', 35, 0),
(79, NULL, 'Acompte  sur fin de travaux', 33.33, 2366.4, NULL, NULL, '2023-06-28 22:56:15', '2023-06-28 22:56:15', 35, 0),
(80, NULL, NULL, 50, 1174.5, NULL, NULL, '2023-07-04 20:47:30', '2023-07-04 20:47:30', 20, 0),
(81, NULL, NULL, 50, 1174.5, NULL, NULL, '2023-07-04 20:47:30', '2023-07-04 20:47:30', 20, 0),
(82, NULL, 'Acompte pour matériel', 50, 1914, NULL, NULL, '2023-07-04 21:24:48', '2023-07-04 21:24:48', 36, 0),
(83, NULL, 'Acompte fin de travauxB ', 50, 1914, NULL, NULL, '2023-07-04 21:24:48', '2023-07-04 21:24:48', 36, 0),
(84, NULL, 'Acompte sur la commande', 50, 1327.04, NULL, NULL, '2023-07-20 21:10:42', '2023-07-20 21:10:42', 40, 0),
(85, NULL, 'Acompte fin de travaux', 50, 1327.04, NULL, NULL, '2023-07-20 21:10:42', '2023-07-20 21:10:42', 40, 0),
(86, NULL, 'Acompte sur le commande', 50, 904.8, NULL, NULL, '2023-07-30 20:39:32', '2023-07-30 20:39:32', 41, 0),
(87, NULL, 'Acompte sur la fin de travaux', 50, 904.8, NULL, NULL, '2023-07-30 20:39:32', '2023-07-30 20:39:32', 41, 0),
(88, NULL, 'Acompte sur la commande  ', 40, 6264, NULL, NULL, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 42, 0),
(89, NULL, 'Acompte sure le avas mont du travaux', 40, 6264, NULL, NULL, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 42, 0),
(90, NULL, 'Acompte fin de travaux ', 20, 3132, NULL, NULL, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 42, 0),
(91, NULL, 'Acompte sur la commande ', 50, 1786.4, NULL, NULL, '2023-07-30 21:45:27', '2023-07-30 21:45:27', 43, 0),
(92, NULL, 'Acompte sur fin de travaux', 50, 1786.4, NULL, NULL, '2023-07-30 21:45:27', '2023-07-30 21:45:27', 43, 0),
(93, NULL, 'Acompte sur la commande  ', 50, 2900, NULL, NULL, '2023-07-30 22:01:20', '2023-07-30 22:01:20', 44, 0),
(94, NULL, 'Acompte sur le fin de travaux', 50, 2900, NULL, NULL, '2023-07-30 22:01:20', '2023-07-30 22:01:20', 44, 0),
(95, NULL, 'Acompte sur la commande', 40, 2018.4, NULL, NULL, '2023-08-03 17:21:35', '2023-08-03 17:21:35', 45, 0),
(96, NULL, 'Acompte sur la livraison de matériel et démontage de cuisine  et décapage carrelage', 40, 2018.4, NULL, NULL, '2023-08-03 17:21:35', '2023-08-03 17:21:35', 45, 0),
(97, NULL, 'Acompte sur fin de travaux', 20, 1009.2, NULL, NULL, '2023-08-03 17:21:35', '2023-08-03 17:21:35', 45, 0),
(98, NULL, 'Acompte sur la commande', 40, 3925.44, NULL, NULL, '2023-09-10 10:47:42', '2023-09-10 10:47:42', 46, 0),
(99, NULL, 'Acompte sur le avons mont de travaux', 40, 3925.44, NULL, NULL, '2023-09-10 10:47:42', '2023-09-10 10:47:42', 46, 0),
(100, NULL, 'Acompte fin de travaux', 20, 1962.72, NULL, NULL, '2023-09-10 10:47:42', '2023-09-10 10:47:42', 46, 0),
(101, NULL, 'Acompte sur la commande  ', 40, 7168.8, NULL, NULL, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47, 0),
(102, NULL, 'Acompte sur le avancement de travaux ', 40, 7168.8, NULL, NULL, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47, 0),
(103, NULL, 'Acompte fini de travaux ', 20, 3584.4, NULL, NULL, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47, 0),
(104, NULL, NULL, 20, 0, NULL, NULL, '2023-10-12 17:43:18', '2023-10-12 17:43:18', 52, 0),
(105, NULL, NULL, 50, 0, NULL, NULL, '2023-10-12 17:43:18', '2023-10-12 17:43:18', 52, 0),
(106, NULL, NULL, 30, 0, NULL, NULL, '2023-10-12 17:43:18', '2023-10-12 17:43:18', 52, 0),
(107, '2023-10-12 22:34:00', 'Avance à la commande', 20, 133.4, '2023-10-18 05:26:42', 'F20230006', '2023-10-12 22:34:00', '2023-10-18 05:26:43', 53, 1),
(108, NULL, 'Livraison de la 1ere version du site internet', 40, 266.8, NULL, NULL, '2023-10-12 22:34:00', '2023-10-18 05:26:43', 53, 0),
(109, NULL, 'Livraison de la version finale du site internet ainsi que les cartes visites', 40, 266.8, NULL, NULL, '2023-10-12 22:34:00', '2023-10-18 05:26:43', 53, 0),
(114, NULL, 'Acompte sur la commande', 40.33, 15572.6, NULL, NULL, '2023-10-15 21:03:15', '2023-10-15 21:03:15', 54, 0),
(115, NULL, 'Acompte avancement chaque  post Rez-chausséé ', 40, 15445.2, NULL, NULL, '2023-10-15 21:03:15', '2023-10-15 21:03:15', 54, 0),
(116, NULL, 'Acompte avancement chaque  post', 20, 7722.58, NULL, NULL, '2023-10-15 21:03:15', '2023-10-15 21:03:15', 54, 0),
(117, NULL, 'Acompte sur la commande', 40, 9048, NULL, NULL, '2023-10-15 21:15:57', '2023-10-15 21:15:57', 55, 0),
(118, NULL, 'Acompte sur la dépose de matériel', 40, 9048, NULL, NULL, '2023-10-15 21:15:57', '2023-10-15 21:15:57', 55, 0),
(119, NULL, 'Acompte sur fin de travaux', 20, 4524, NULL, NULL, '2023-10-15 21:15:57', '2023-10-15 21:15:57', 55, 0),
(120, NULL, 'Acompte sur la commande', 40, 7071.36, NULL, NULL, '2023-10-22 12:31:46', '2023-10-22 12:31:46', 56, 0),
(121, NULL, 'Acompte sur la avance des travaux ', 40, 7071.36, NULL, NULL, '2023-10-22 12:31:46', '2023-10-22 12:31:46', 56, 0),
(122, NULL, 'Acompte fin de réception', 20, 3535.68, NULL, NULL, '2023-10-22 12:31:46', '2023-10-22 12:31:46', 56, 0),
(123, NULL, 'Acompte sur la commande', 40, 7340.48, NULL, NULL, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57, 0),
(124, NULL, 'Acompte  sur avance de travaux ', 40, 7340.48, NULL, NULL, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57, 0),
(125, NULL, 'Acompte fin de réception', 20, 3670.24, NULL, NULL, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57, 0),
(126, NULL, 'Acompte sur la commande', 40, 1856, NULL, NULL, '2023-10-23 14:49:08', '2023-10-23 14:49:08', 51, 0),
(127, NULL, 'acompte  sur avancement de travaux', 40, 1856, NULL, NULL, '2023-10-23 14:49:08', '2023-10-23 14:49:08', 51, 0),
(128, NULL, 'Acompte sur réception', 20, 928, NULL, NULL, '2023-10-23 14:49:08', '2023-10-23 14:49:08', 51, 0),
(129, NULL, NULL, 30, 250.56, NULL, NULL, '2023-10-23 20:26:27', '2023-10-23 20:26:27', 58, 0),
(130, NULL, NULL, 70, 584.64, NULL, NULL, '2023-10-23 20:26:27', '2023-10-23 20:26:27', 58, 0),
(131, NULL, 'test', 30, 389.76, NULL, NULL, '2023-10-23 20:31:58', '2023-10-23 20:31:58', 59, 0),
(132, NULL, 'test', 70, 909.44, NULL, NULL, '2023-10-23 20:31:58', '2023-10-23 20:31:58', 59, 0),
(133, NULL, NULL, 50, 232, NULL, NULL, '2023-10-23 20:46:49', '2023-10-23 20:46:49', 60, 0),
(134, NULL, NULL, 50, 232, NULL, NULL, '2023-10-23 20:46:49', '2023-10-23 20:46:49', 60, 0),
(135, NULL, 'Acompte sur la commande ', 40, 2941.76, NULL, NULL, '2023-11-02 17:41:11', '2023-11-02 17:41:11', 62, 0),
(136, NULL, ' Acompte sur avancement de travaux ', 40, 2941.76, NULL, NULL, '2023-11-02 17:41:11', '2023-11-02 17:41:11', 62, 0),
(137, NULL, 'Acompte réception fini de travaux ', 20, 1470.88, NULL, NULL, '2023-11-02 17:41:11', '2023-11-02 17:41:11', 62, 0);

-- --------------------------------------------------------

--
-- Structure de la table `echance_factures`
--

CREATE TABLE `echance_factures` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `pourcentage` int(11) DEFAULT NULL,
  `montant` int(11) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `DatePaiement` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `factureVenteId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

CREATE TABLE `employes` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `entreprises`
--

CREATE TABLE `entreprises` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `societe_tva` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `num_adresse` varchar(255) DEFAULT NULL,
  `devise` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `num_autoriation_etablissement` varchar(255) DEFAULT NULL,
  `matricule_societe` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `entreprises`
--

INSERT INTO `entreprises` (`id`, `nom`, `code`, `telephone`, `fax`, `societe_tva`, `adresse`, `num_adresse`, `devise`, `email`, `site`, `image`, `num_autoriation_etablissement`, `matricule_societe`, `createdAt`, `updatedAt`) VALUES
(1, 'DANIEL-LUX', '+352', '661 800 801', NULL, 'LU34664983', 'Rue de Holtz', '37', 'EUR', 'info@daniel-lux.lu', 'www.daniel-lux.lu', 'Logo daniel lux.jpg', '10147731/0 - 10147731/1', '2023 2401 339', '2023-03-24 22:26:09', '2023-06-09 22:26:21'),
(2, 'MMS - LETZMART ', '+352', '28991148', NULL, 'LU31960001', 'Rue de l\'Alzette L-4011 Esch sur Alzette', '103', 'EUR', 'info@letzmart.lu', 'www.letzmart.lu', 'logo-MMS.jpg', '10111310/0', '2020 2410 961', '2023-03-27 00:58:12', '2023-05-24 08:48:41'),
(3, 'MBE ETANCHEITE', '+352', '691 58 44 26', NULL, 'LU33417064', 'bd Prince Henri  L - 4280 Esch-sur-Alzette', '17', 'EUR', 'contact@mbe-etancheite.lu', 'www.mbe-etancheite.lu', 'MBE Carré.png', '10132008/11', '2021 24 69 174', '2023-04-02 13:02:20', '2023-10-23 20:45:48'),
(4, 'ITD S.à r.l.', '+352', '691717826', NULL, 'ITD S.à r.l.', 'Rue de Luxembourg L-4220 Esch sur Alzette', '44', 'EUR', 'info@itd.lu', 'www.itd.lu', 'ITD-LOGO Carré.png', NULL, '2019 2413 827', '2023-10-24 16:41:18', '2023-10-24 16:41:41');

-- --------------------------------------------------------

--
-- Structure de la table `facture_achats`
--

CREATE TABLE `facture_achats` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `montant_total` varchar(255) DEFAULT NULL,
  `total_ttc` float DEFAULT NULL,
  `total_ht` float DEFAULT NULL,
  `remise_global` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `fodec` float DEFAULT NULL,
  `totalTimbreFiscal` float DEFAULT NULL,
  `bonCommandeId` int(11) DEFAULT NULL,
  `paiement_status` int(11) DEFAULT NULL,
  `devise` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `facture_achat_produits`
--

CREATE TABLE `facture_achat_produits` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `qtotal` int(11) DEFAULT NULL,
  `unite` float DEFAULT NULL,
  `prixTTC` float DEFAULT NULL,
  `prixHT` float DEFAULT NULL,
  `total_prix_TTC` float DEFAULT NULL,
  `total_prix_HT` float DEFAULT NULL,
  `remise` float DEFAULT NULL,
  `bonCommandeId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `factureAchatId` int(11) DEFAULT NULL,
  `fournisseurId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `facture_ventes`
--

CREATE TABLE `facture_ventes` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `montant_total` varchar(255) DEFAULT NULL,
  `total_ttc` float DEFAULT NULL,
  `total_ht` float DEFAULT NULL,
  `remise_global` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `fodec` float DEFAULT NULL,
  `totalTimbreFiscal` float DEFAULT NULL,
  `bonCommandeId` int(11) DEFAULT NULL,
  `paiement_status` int(11) DEFAULT NULL,
  `devise` varchar(255) DEFAULT NULL,
  `acompte_pourcentage` int(11) DEFAULT NULL,
  `acompte_montant` float DEFAULT NULL,
  `typeFacture` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clientId` int(11) DEFAULT NULL,
  `entrepriseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture_ventes`
--

INSERT INTO `facture_ventes` (`id`, `date`, `reference`, `note`, `etat`, `montant_total`, `total_ttc`, `total_ht`, `remise_global`, `tva`, `fodec`, `totalTimbreFiscal`, `bonCommandeId`, `paiement_status`, `devise`, `acompte_pourcentage`, `acompte_montant`, `typeFacture`, `createdAt`, `updatedAt`, `clientId`, `entrepriseId`) VALUES
(1, '2023-03-27 17:41:20', 'F20230001', 'facture d\'acompte de commande de Materials', -1, '2000.00', 2000, 2000, NULL, 0, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-03-27 17:51:14', '2023-03-27 17:54:01', 3, 1),
(2, '2023-03-27 18:14:56', 'F20230002', 'carrelage pose de  mur m2 42€', 1, '2320.00', 2320, 2000, NULL, 320, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-03-27 18:20:20', '2023-03-30 19:48:23', 3, 1),
(3, '2023-03-29 20:30:32', 'F20230003', 'prestation de service', -1, '0.00', 0, 0, NULL, 0, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-03-29 20:55:39', '2023-03-30 18:50:07', 6, 1),
(4, '2023-03-30 18:50:38', 'F20230004', 'Prestation de service ', 1, '377.00', 377, 325, NULL, 52, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-03-30 18:59:01', '2023-04-07 18:41:12', 6, 1),
(5, '2023-03-30 21:22:54', 'F20230001', NULL, 1, '252.88', 252.88, 218, 0, 34.88, 0, NULL, 1, 1, 'EUR', NULL, NULL, 2, '2023-03-30 21:23:16', '2023-05-24 08:49:31', 2, 2),
(6, '2023-04-02 13:24:50', 'F20230002', NULL, 1, '399.24', 399.236, 344.169, 10, 55.067, 0, NULL, 5, 1, 'EUR', NULL, NULL, 2, '2023-04-02 13:25:25', '2023-04-02 13:30:15', 7, 2),
(7, '2023-04-02 13:28:14', 'F20230003', NULL, 0, '171.10', 171.101, 147.501, 10, 23.6002, 0, NULL, 5, NULL, 'EUR', NULL, NULL, 2, '2023-04-02 13:28:27', '2023-04-02 13:28:27', 7, 2),
(8, '2023-04-07 18:50:45', 'F20230005', 'Carrelage pose 2m 40€', 1, '2900.00', 2900, 2500, NULL, 400, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-04-07 19:01:50', '2023-04-14 20:01:55', 3, 1),
(9, '2023-04-07 20:06:47', 'F20230006', 'Travaux de doublages de mur  ', 1, '5665.44', 5665.44, 4884, NULL, 781.44, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-04-07 20:21:55', '2023-04-14 20:01:49', 8, 1),
(10, '2023-04-19 19:22:20', 'F20230007', 'Travaux de prestations de travail ', 1, '6953.04', 6953.04, 5994, NULL, 959.04, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-04-19 19:31:10', '2023-05-25 17:00:02', 9, 1),
(11, '2023-04-24 17:47:00', 'F20230008', 'Travaux de doublages de mur', -1, '4380.16', 4380.16, 3776, NULL, 604.16, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-04-24 18:15:33', '2023-05-02 20:18:25', 8, 1),
(12, '2023-05-02 20:18:59', 'F20230009', ' travaux de doublages du mur et piliers', 1, '3776.96', 3776.96, 3256, NULL, 520.96, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-05-02 20:36:34', '2023-06-05 17:32:21', 8, 1),
(13, '2023-05-04 19:01:43', 'F20230010', 'Travaux de prestations de travail effectue a L\'heure n 2 facture ', 1, '5279.16', 5279.16, 4551, NULL, 728.16, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-05-04 19:09:31', '2023-07-10 22:02:31', 9, 1),
(14, '2023-05-09 22:13:46', 'F20230011', 'Prestation services de nettoyage', -1, '5800.00', 5800, 5000, NULL, 800, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-05-09 22:15:57', '2023-05-10 15:51:52', 12, 1),
(15, '2023-05-10 15:52:02', 'F20230012', 'Prestation services de nettoyage', 1, '5800.00', 5800, 5000, NULL, 800, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-05-10 15:55:16', '2023-07-27 21:10:50', 12, 1),
(16, '2023-05-12 21:38:30', 'F20230013', 'Rénovation d`un appartement', 1, '9280.00', 9280, 8000, NULL, 1280, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-05-12 21:48:22', '2023-06-03 22:38:12', 13, 1),
(17, '2023-05-15 20:37:52', 'F20230014', 'Facture pose de carrelage', 1, '1666.92', 1666.92, 1437, NULL, 229.92, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-05-15 20:43:23', '2023-06-08 15:57:42', 3, 1),
(18, '2023-05-24 08:49:40', 'F20230004', NULL, 0, '252.88', 252.88, 218, 0, 34.88, 0, NULL, 1, NULL, 'EUR', NULL, NULL, 2, '2023-05-24 08:50:33', '2023-05-24 08:50:33', 2, 2),
(19, '2023-05-30 21:48:55', 'F20230015', 'Réalisation d\'un terrasse', -1, '5162.00', 5162, 4450, NULL, 712, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-05-30 22:14:05', '2023-05-31 16:06:39', 3, 1),
(20, '2023-05-31 16:15:50', 'F20230016', 'Réalisation d\'un terrasse ', 1, '3480.00', 3480, 3000, NULL, 480, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-05-31 16:21:57', '2023-06-12 19:42:40', 3, 1),
(21, '2023-06-04 21:19:14', 'F20230017', 'Nettoyage résidence', 1, '626.40', 626.4, 540, NULL, 86.4, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-04 21:23:41', '2023-06-14 16:55:02', 18, 1),
(22, '2023-06-05 22:41:10', 'F20230018', 'Réalisation de travaux de enduisages', 1, '2900.00', 2900, 2500, NULL, 400, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-05 22:50:44', '2023-07-27 20:53:11', 3, 1),
(23, '2023-06-06 21:06:03', 'F20230001', '', 1, '13340.00', 13340, 11500, 0, 1840, 0, NULL, 32, 1, 'EUR', NULL, NULL, 2, '2023-06-06 21:07:06', '2023-06-06 21:07:19', 20, 3),
(24, '2023-06-06 21:08:43', 'F20230002', '', 1, '6670.00', 6670, 5750, 0, 920, 0, NULL, 32, 1, 'EUR', NULL, NULL, 2, '2023-06-06 21:09:29', '2023-06-06 21:13:17', 20, 3),
(25, '2023-06-06 21:21:10', 'F20230003', '', -1, '6670.00', 6670, 5750, 0, 920, 0, NULL, 32, -1, 'EUR', NULL, NULL, 2, '2023-06-06 21:21:13', '2023-06-06 21:23:32', 20, 3),
(26, '2023-06-12 06:36:06', 'F20230005', NULL, 0, '126.44', 126.44, 109, 0, 17.44, 0, NULL, 1, NULL, 'EUR', NULL, NULL, 2, '2023-06-12 06:37:18', '2023-06-12 06:37:18', 2, 2),
(27, '2023-06-19 21:46:20', 'F20230019', 'Réalisation de travaux la poste', 1, '1955.76', 1955.76, 1686, NULL, 269.76, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-19 22:04:36', '2023-08-08 17:45:14', 3, 1),
(28, '2023-06-21 21:20:37', 'F20230020', 'Pose de carrelage ', 1, '1226.12', 1226.12, 1057, NULL, 169.12, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-21 21:24:57', '2023-07-13 17:43:06', 8, 1),
(29, '2023-06-21 21:43:02', 'F20230021', 'Réalisation d\'une peinture ', 1, '1148.40', 1148.4, 990, NULL, 158.4, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-21 22:01:31', '2023-06-28 18:28:14', 1, 1),
(30, '2023-06-21 22:22:51', 'F20230022', 'Rénovation d\'un méson', 1, '3286.28', 3286.28, 2833, NULL, 453.28, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-21 22:38:03', '2023-07-04 20:39:20', 1, 1),
(31, '2023-06-21 22:41:49', 'F20230023', 'Rénovation d\'un maison', 1, '1450.00', 1450, 1250, NULL, 200, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-21 22:50:15', '2023-07-04 20:39:31', 1, 1),
(32, '2023-06-21 22:53:58', 'F20230024', 'Rénovation d\'un maison', 1, '5247.84', 5247.84, 4524, NULL, 723.84, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-21 23:03:39', '2023-07-04 20:39:39', 1, 1),
(33, '2023-06-21 23:06:16', 'F20230025', 'Rénovation d\'un meison', -1, '928.00', 928, 800, NULL, 128, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-06-21 23:12:53', '2023-07-03 10:17:46', 1, 1),
(34, '2023-06-21 23:16:31', 'F20230026', 'Rénovation d\'un maison', 1, '1197.12', 1197.12, 1032, NULL, 165.12, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-21 23:27:03', '2023-07-04 20:39:08', 1, 1),
(35, '2023-06-21 23:29:10', 'F20230027', 'Rénovation d\'un maison', 1, '2627.40', 2627.4, 2265, NULL, 362.4, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-21 23:35:37', '2023-09-21 21:09:54', 1, 1),
(36, '2023-06-28 19:03:45', 'F20230028', 'Porte Interior', 1, '3201.60', 3201.6, 2760, NULL, 441.6, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-28 19:07:20', '2023-09-27 21:06:33', 22, 1),
(37, '2023-06-28 20:15:46', 'F20230029', 'Fenêtre pose', 1, '8515.56', 8515.56, 7341, NULL, 1174.56, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-28 20:22:46', '2023-07-24 17:15:54', 22, 1),
(38, '2023-06-29 19:48:29', 'F20230030', 'Réalisation d\'une peinture ', 1, '2308.40', 2308.4, 1990, NULL, 318.4, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-06-29 20:02:04', '2023-07-18 17:36:04', 1, 1),
(39, '2023-07-06 17:57:08', 'F20230031', 'Prestation  service de  Nettoyage', 1, '3821.04', 3821.04, 3294, NULL, 527.04, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-07-06 18:02:48', '2023-08-08 17:44:36', 23, 1),
(40, '2023-07-18 17:36:58', 'F20230032', 'Réalisation de colature a Bissen', -1, '1914.00', 1914, 1650, NULL, 264, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-07-18 17:44:59', '2023-09-13 20:07:17', 1, 1),
(41, '2023-07-18 18:20:24', 'F20230033', 'Réalisation  de travaux  ', 1, '1410.56', 1410.56, 1216, NULL, 194.56, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-07-18 18:28:37', '2023-08-08 17:45:29', 3, 1),
(42, '2023-07-18 18:50:24', 'F20230034', 'Pose de carrelage mur, et sol', 1, '1352.56', 1352.56, 1166, NULL, 186.56, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-07-18 19:28:35', '2023-08-16 16:43:53', 25, 1),
(43, '2023-07-19 19:08:05', 'F20230004', NULL, -1, '5220.00', 5220, 4500, NULL, 720, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-07-19 19:15:07', '2023-10-23 21:10:36', 27, 3),
(44, '2023-07-26 18:52:01', 'F20230035', 'Nettoyage de une résidence', 1, '696.00', 696, 600, NULL, 96, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-07-26 18:58:39', '2023-08-09 18:09:30', 18, 1),
(45, '2023-08-09 18:15:02', 'F20230036', 'Rénovation d\'un maison a Rodange', 1, '11600.00', 11600, 10000, NULL, 1600, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-08-09 18:26:13', '2023-08-16 16:43:47', 21, 1),
(46, '2023-08-12 11:46:13', 'F20230037', 'Prestation service de nettoyage', 1, '563.76', 563.76, 486, NULL, 77.76, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-08-12 11:52:07', '2023-08-24 16:35:40', 23, 1),
(47, '2023-09-13 20:10:07', 'F20230038', 'Réalisation de colature', 1, '1914.00', 1914, 1650, NULL, 264, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-09-13 20:16:35', '2023-09-21 21:12:57', 1, 1),
(48, '2023-09-13 20:30:31', 'F20230039', 'Travaux de supplément ', 1, '6960.00', 6960, 6000, NULL, 960, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-09-13 20:37:50', '2023-09-21 21:13:06', 1, 1),
(49, '2023-09-13 21:03:11', 'F20230040', 'Réalisation de carrelage', 1, '4570.40', 4570.4, 3940, NULL, 630.4, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-09-13 21:39:44', '2023-10-17 10:35:33', 25, 1),
(50, '2023-09-27 07:08:18', 'F20230041', 'Prestation de   service', 0, '783.00', 783, 675, NULL, 108, 0, NULL, NULL, NULL, 'EUR', NULL, NULL, 0, '2023-09-27 07:12:53', '2023-09-27 07:12:53', 23, 1),
(51, '2023-09-27 07:23:03', 'F20230042', 'Travaux de parking', -1, '1740.00', 1740, 1500, NULL, 240, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-09-27 07:26:57', '2023-09-27 19:54:40', 16, 1),
(52, '2023-09-27 07:52:42', 'F20230043', 'Prestation du service de Nettoyage ', 1, '874.04', 874.037, 753.48, NULL, 120.557, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-09-27 08:11:57', '2023-10-13 12:03:03', 32, 1),
(53, '2023-09-27 19:59:58', 'F20230044', 'Réalisation de travaux de parking ', 1, '1044.00', 1044, 900, NULL, 144, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-09-27 20:11:07', '2023-10-09 19:59:38', 16, 1),
(54, '2023-09-27 20:20:58', 'F20230045', 'Rénovation d\'un maison ', 1, '5247.84', 5247.84, 4524, NULL, 723.84, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-09-27 20:30:50', '2023-10-11 20:13:33', 1, 1),
(55, '2023-09-27 20:32:59', 'F20230046', 'Rénovation d\'un maison', 1, '6572.56', 6572.56, 5666, NULL, 906.56, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-09-27 20:41:27', '2023-10-04 18:16:48', 1, 1),
(56, '2023-10-01 20:57:00', 'F20230047', 'Réalisation de pose de clôture', 1, '1914.00', 1914, 1650, NULL, 264, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-10-01 21:05:43', '2023-10-04 18:15:31', 1, 1),
(57, '2023-10-02 16:38:05', 'F20230048', 'Réalisation des carrelage', 1, '986.00', 986, 850, NULL, 136, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-10-02 16:45:35', '2023-10-10 12:53:31', 33, 1),
(58, '2023-10-17 10:35:57', 'F20230049', 'Rénovation  d\' un maison', -1, '0.00', 0, 0, NULL, 0, 0, NULL, NULL, -1, 'EUR', NULL, NULL, 0, '2023-10-17 10:47:11', '2023-10-17 10:47:42', 1, 1),
(59, '2023-10-17 10:48:12', 'F20230050', 'Rénovation d\'un méson ', 0, '3271.20', 3271.2, 2820, NULL, 451.2, 0, NULL, NULL, NULL, 'EUR', NULL, NULL, 0, '2023-10-17 10:56:01', '2023-10-17 10:56:01', 1, 1),
(60, '2023-10-18 05:26:21', 'F20230006', NULL, 0, '133.40', 133.4, 115, 0, 18.4, 0, NULL, 53, NULL, 'EUR', NULL, NULL, 2, '2023-10-18 05:26:43', '2023-10-18 05:26:43', 35, 2),
(61, '2023-10-18 17:03:38', 'F20230051', 'Rénovation d\'un maison', 1, '8352.00', 8352, 7200, NULL, 1152, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-10-18 17:14:12', '2023-11-02 11:27:24', 36, 1),
(62, '2023-10-18 18:01:21', 'F20230052', 'Rénovation d\'un maison', 1, '13519.80', 13519.8, 11655, NULL, 1864.8, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-10-18 18:13:01', '2023-10-21 14:42:12', 21, 1),
(63, '2023-11-02 11:32:29', 'F20230053', 'Rénovation de un maison', 0, '8120.00', 8120, 7000, NULL, 1120, 0, NULL, NULL, NULL, 'EUR', NULL, NULL, 0, '2023-11-02 11:39:39', '2023-11-02 11:39:39', 36, 1),
(64, '2023-11-03 09:21:58', 'F20230005', NULL, 1, '23200.00', 23200, 20000, NULL, 3200, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-11-03 09:26:06', '2023-11-03 09:32:40', 40, 3),
(65, '2023-11-03 09:27:41', 'F20230006', NULL, 1, '11600.00', 11600, 10000, NULL, 1600, 0, NULL, NULL, 1, 'EUR', NULL, NULL, 0, '2023-11-03 09:31:53', '2023-11-03 09:32:37', 40, 3);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `id` int(11) NOT NULL,
  `raison_sociale` varchar(255) DEFAULT NULL,
  `matricule_fiscal` varchar(255) DEFAULT NULL,
  `registre_commerce` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `code_phone_pro` varchar(255) DEFAULT NULL,
  `telephone_pro` varchar(255) DEFAULT NULL,
  `code_phone_per` varchar(255) DEFAULT NULL,
  `telephone_personnel` varchar(255) DEFAULT NULL,
  `code_fax` varchar(255) DEFAULT NULL,
  `telephone_fax` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `inventaires`
--

CREATE TABLE `inventaires` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `storeId` int(11) DEFAULT NULL,
  `employeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `marques`
--

CREATE TABLE `marques` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `note_credits`
--

CREATE TABLE `note_credits` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `factureVenteId` int(11) DEFAULT NULL,
  `entrepriseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `note_credits`
--

INSERT INTO `note_credits` (`id`, `date`, `reference`, `createdAt`, `updatedAt`, `factureVenteId`, `entrepriseId`) VALUES
(1, '2023-03-27 17:54:01', 'N20230001', '2023-03-27 17:54:01', '2023-03-27 17:54:01', 1, 1),
(2, '2023-03-30 18:50:07', 'N20230002', '2023-03-30 18:50:07', '2023-03-30 18:50:07', 3, 1),
(3, '2023-05-02 20:18:25', 'N20230003', '2023-05-02 20:18:25', '2023-05-02 20:18:25', 11, 1),
(4, '2023-05-10 15:51:52', 'N20230004', '2023-05-10 15:51:52', '2023-05-10 15:51:52', 14, 1),
(5, '2023-05-31 16:06:39', 'N20230005', '2023-05-31 16:06:39', '2023-05-31 16:06:39', 19, 1),
(6, '2023-06-06 21:23:32', 'N20230001', '2023-06-06 21:23:32', '2023-06-06 21:23:32', 25, 3),
(7, '2023-07-03 10:17:46', 'N20230006', '2023-07-03 10:17:46', '2023-07-03 10:17:46', 33, 1),
(8, '2023-09-13 20:06:58', 'N20230007', '2023-09-13 20:06:58', '2023-09-13 20:06:58', 40, 1),
(9, '2023-09-13 20:07:17', 'N20230008', '2023-09-13 20:07:17', '2023-09-13 20:07:17', 40, 1),
(10, '2023-09-27 19:54:40', 'N20230009', '2023-09-27 19:54:40', '2023-09-27 19:54:40', 51, 1),
(11, '2023-10-17 10:47:42', 'N20230010', '2023-10-17 10:47:42', '2023-10-17 10:47:42', 58, 1),
(12, '2023-10-23 21:10:36', 'N20230002', '2023-10-23 21:10:36', '2023-10-23 21:10:36', 43, 3);

-- --------------------------------------------------------

--
-- Structure de la table `paiement_achats`
--

CREATE TABLE `paiement_achats` (
  `id` int(11) NOT NULL,
  `moyen_paiement` varchar(255) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `date_encaissement` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `factureAchatId` int(11) DEFAULT NULL,
  `compteBancaireId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `paiement_ventes`
--

CREATE TABLE `paiement_ventes` (
  `id` int(11) NOT NULL,
  `moyen_paiement` varchar(255) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `date_encaissement` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `bonCommandeVenteId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `factureVenteId` int(11) DEFAULT NULL,
  `compteBancaireId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `reference_interne` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `reference_constructeur` varchar(255) DEFAULT NULL,
  `proprietere` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categorieId` int(11) DEFAULT NULL,
  `marqueId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produits_devis`
--

CREATE TABLE `produits_devis` (
  `id` int(11) NOT NULL,
  `libelle` varchar(1000) DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `qtotal` int(11) DEFAULT NULL,
  `unite` float DEFAULT NULL,
  `prixTTC` float DEFAULT NULL,
  `prixHT` float DEFAULT NULL,
  `total_prix_TTC` float DEFAULT NULL,
  `total_prix_HT` float DEFAULT NULL,
  `remise` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deviId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produits_devis`
--

INSERT INTO `produits_devis` (`id`, `libelle`, `tva`, `quantite`, `qtotal`, `unite`, `prixTTC`, `prixHT`, `total_prix_TTC`, `total_prix_HT`, `remise`, `createdAt`, `updatedAt`, `deviId`) VALUES
(1, 'Set logos couleurs', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-03-27 01:55:15', '2023-03-27 01:55:15', 1),
(2, 'Cartes visites 350g couché de mi-mat . surface 45.90 cm2. 500 exemplaires', 16, 1, NULL, NULL, 0, 45, 52.2, 45, 0, '2023-03-27 01:55:15', '2023-03-27 01:55:15', 1),
(3, 'Site internet OnePage, Installation de l\'hébergement web Pro 1an, Noms de domaine .lu 1an,  ', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-03-27 01:55:15', '2023-03-27 01:55:15', 1),
(4, 'réalisation de carrelage  et pose 42  M2 €\nfourniture de colle et baguette et joue  ', 16, 1, NULL, NULL, 0, 42, 48.72, 42, 0, '2023-03-27 17:40:53', '2023-03-27 17:40:53', 2),
(5, 'Démontage des dalles de pave  et fer un nouvel sape de béton  et évacue  36 m2  fourniture  de Materials béton', 16, 1, NULL, NULL, 0, 2500, 2900, 2500, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(6, 'fourniture de colle pour pose de dalles nouvel  et pose le dalles   (90-30]  36 m2     \n', 16, 36, NULL, NULL, 0, 195, 8143.2, 7020, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(7, 'Toute les joints enlevées et refaits de nouvel coloré gris cément  et fourniture de joints et Silicon    terrassé palier   ', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(8, 'Fourniture de couvre mur  10 L ( dimension  60-30 )\ner pose ', 16, 10, NULL, NULL, 0, 60, 696, 600, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(9, 'réfère le joints de vont la escaler de entre   et fourniture joignants', 16, 2, NULL, NULL, 0, 80, 185.6, 160, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(10, 'Démontage de Pier et évacué   escaler du devant du maison  20 m2 ', 16, 1, NULL, NULL, 0, 1000, 1160, 1000, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(11, 'Fourniture  colle et  dalles et pose  (90-30 )    20 m2', 16, 1, NULL, NULL, 0, 195, 226.2, 195, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(12, 'Peindre  mur façade 3 m2 et fourniture peinture ', 16, 1, NULL, NULL, 0, 120, 139.2, 120, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(13, 'Fourniture de peinture et  peindre des paves', 16, 2, NULL, NULL, 0, 80, 185.6, 160, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(14, 'Fourniture de caniveau  3 m2 L et démonter  évacuer et refait nouvel', 16, 3, NULL, NULL, 0, 480, 1670.4, 1440, 0, '2023-03-28 00:39:15', '2023-03-28 00:39:15', 3),
(15, 'Démontage  de terrasse  carrelage  et balustrade de boa et enlevé débarrasse     ', 16, 1, NULL, NULL, 0, 1300, 1508, 1300, 0, '2023-03-28 01:50:13', '2023-03-28 01:50:13', 4),
(16, 'Terrasse balcon escaler 2 mur cimentage hydro fouge ', 16, 1, NULL, NULL, 0, 1000, 1160, 1000, 0, '2023-03-28 01:50:13', '2023-03-28 01:50:13', 4),
(17, 'Fourniture de carrelage et colle et Silicon et pose 20 m2\n( option  carrelage dépond de model)', 16, 1, NULL, NULL, 0, 2500, 2900, 2500, 0, '2023-03-28 01:50:13', '2023-03-28 01:50:13', 4),
(18, 'Fourniture de balustrades inox  et pose ', 16, 1, NULL, NULL, 0, 2300, 2668, 2300, 0, '2023-03-28 01:50:13', '2023-03-28 01:50:13', 4),
(19, 'Fourniture de carrelage et un siphon pour évacue le Léau  partie basse sous le balcon  ( option  carrelage dépond de model)', 16, 1, NULL, NULL, 0, 1500, 1740, 1500, 0, '2023-03-28 01:50:13', '2023-03-28 01:50:13', 4),
(20, 'La partie basse sous le balcon enlèvent les carrelage ancien  et évacué ', 16, 1, NULL, NULL, 0, 1000, 1160, 1000, 0, '2023-03-28 01:50:13', '2023-03-28 01:50:13', 4),
(21, 'toiture jsdbvésndvéasjbv.kasdvnasdv.asdnvéasndévansédlvknaésdvnéasldkvéas', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-04-02 13:20:09', '2023-04-02 13:20:09', 5),
(22, 'sfkhgbladrkgb. akrjg.kadfbv.jkadf.bkjadf.gbjkqeérw.etbw', 16, 1, NULL, NULL, 0, 100, 113.68, 98, 2, '2023-04-02 13:20:09', '2023-04-02 13:20:09', 5),
(23, 'sadvasgvalsjedvblkasd.vkabse.kvb.asdkbv.askjdbv.kajsbd.vkjabs.dkvjba.skdjv.asd', 16, 1, NULL, NULL, 0, 9, 10.44, 9, 0, '2023-04-02 13:20:09', '2023-04-02 13:20:09', 5),
(24, 'Travaux de doublages de mur 100 m2 a 40€\nfinition pré a prient\nfournitures  vis  et Materials de finition\n\n  ', 16, 100, NULL, NULL, 0, 40, 4640, 4000, 0, '2023-04-07 20:01:28', '2023-04-07 20:01:28', 6),
(25, 'Pour piliers en béton collage de plaques finitions pré a prient     ( piliers PIECES  14 a 230€\nFournitures colle et cornières', 16, 18, NULL, NULL, 0, 230, 4802.4, 4140, 0, '2023-04-07 20:01:28', '2023-04-07 20:01:28', 6),
(26, 'Travaux de prestations de travail  effectue a l\'heure a 37 € du l\'heure ', 16, 162, NULL, NULL, 0, 37, 6953.04, 5994, 0, '2023-04-19 19:21:22', '2023-04-19 19:21:22', 7),
(27, 'Chantier rue de Longwy  219   ', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-04-19 19:21:22', '2023-04-19 19:21:22', 7),
(28, 'Rénovation dune cuisine sale a mange et salon \nDécapage du sol en vinyle et plinthe en bois avec mise en recyclage   33 m2', 16, 1, NULL, NULL, 0, 1000, 1160, 1000, 0, '2023-04-20 19:23:27', '2023-04-20 19:23:27', 8),
(29, 'Pose de carrelage en 60x60x1 cm 33m2   pose 48 €\n\n', 16, 33, NULL, NULL, 0, 48, 1837.44, 1584, 0, '2023-04-20 19:23:27', '2023-04-20 19:23:27', 8),
(32, 'Pose de plinthe idem carrelage en 60x7x1cm ', 16, 25, NULL, NULL, 0, 8, 232, 200, 0, '2023-04-20 19:23:27', '2023-04-20 19:23:27', 8),
(33, 'Pose de parquets a colle de 15 chambre un total de 206 m2 ', 16, 206, NULL, NULL, 0, 25, 5974, 5150, 0, '2023-04-20 20:01:55', '2023-04-20 20:01:55', 9),
(34, 'Pose de plinthe en bois a peindre bois mdr hydrofuge prêtes a peindre \nFixation par collage a angle droit raccorde entre plinthes  a 45 dimension ht  30mm', 16, 30, NULL, NULL, 0, 12, 417.6, 360, 0, '2023-04-20 20:01:55', '2023-04-20 20:01:55', 9),
(60, 'Démolition  des murs non porteur de 12CM  29,63 m2\nDémolition  des murs non porteur de 60CM 10,01 m2\nDémolition dalle en béton  17,24 m2\nDécapage des sol carrelage et chape avec mise recyclage 68,48 m2\nDécapage des plafonds avec mise en recyclage16,00 m2', 16, 1, NULL, NULL, 0, 8500, 9860, 8500, 0, '2023-04-24 19:22:59', '2023-04-24 19:22:59', 14),
(61, 'Sanitaire\nInstallation sanitaire   cuisine ,WC   ', 16, 1, NULL, NULL, 0, 2500, 2900, 2500, 0, '2023-04-25 08:24:03', '2023-04-25 08:24:03', 15),
(62, 'Confection d\'un murs de séparations du garage avec isolation autistique ', 16, 11, NULL, NULL, 0, 50, 638, 550, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(63, 'Fourniture et pose d\'un poutre IPN 24m 4,32 ml\nFourniture et pose d\'un poutre IPN 24m x2 4,5m   3 pièce   9,00 ml', 16, 1, NULL, NULL, 0, 1000, 1160, 1000, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(64, 'Mise en œuvre d\'un cimentage du mur de garage ', 16, 11, NULL, NULL, 0, 40, 510.4, 440, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(65, 'Confection d\'une dalle en béton armée', 16, 17, NULL, NULL, 0, 60, 1183.2, 1020, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(66, 'Fourniture et poses d\'un faux  plafond suspendu avec ossature métallique et plaques en ba 13 ', 16, 33, NULL, NULL, 0, 60, 2296.8, 1980, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(67, 'Enduisage murs en finition Q2 prêt a peindre', 16, 96, NULL, NULL, 0, 20, 2227.2, 1920, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(68, 'Fourniture et pose plafonds finition Q2 a peindre ', 16, 33, NULL, NULL, 0, 18, 689.04, 594, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(70, 'Fourniture et pose d\'une chape ciment avec treillis a galvaniser épaisseur  5m ', 16, 68, NULL, NULL, 0, 25, 1972, 1700, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(72, 'Fourniture et pose de vlise et peinture au mur', 16, 96, NULL, NULL, 0, 35, 3897.6, 3360, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(73, 'Fourniture et pose de finition a l\'acrylique avant  peinture', 16, 1, NULL, NULL, 0, 350, 406, 350, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(74, 'Fourniture et pose d\'une peinture au plafond', 16, 33, NULL, NULL, 0, 20, 765.6, 660, 0, '2023-04-25 09:32:56', '2023-04-25 09:32:56', 17),
(75, 'Porte\nFourniture et pose d\'une porte  isolante (passage a la  garage a la pièce de vie)', 16, 1, NULL, NULL, 0, 800, 928, 800, 0, '2023-04-25 09:44:51', '2023-04-25 09:44:51', 18),
(78, 'Electricité\nFourniture et pose  prise 38ov 16A  direct pour plaque de cuisons\n', 16, 1, NULL, NULL, 0, 50, 58, 50, 0, '2023-04-25 09:58:37', '2023-04-25 09:58:37', 19),
(79, 'Fourniture et pose prise 230v avec  câblage encastre salon a mange', 16, 16, NULL, NULL, 0, 40, 742.4, 640, 0, '2023-04-25 09:58:37', '2023-04-25 09:58:37', 19),
(80, 'Fourniture et pose prise 230v avec  câblage encastre  \'salon plans d\'installation fournis  par le client)', 16, 12, NULL, NULL, 0, 60, 835.2, 720, 0, '2023-04-25 09:58:37', '2023-04-25 09:58:37', 19),
(81, 'Fourniture et pose de point lumineux ( a définir )', 16, 5, NULL, NULL, 0, 50, 290, 250, 0, '2023-04-25 09:58:37', '2023-04-25 09:58:37', 19),
(82, 'Fourniture et pose prise TV ', 16, 1, NULL, NULL, 0, 60, 69.6, 60, 0, '2023-04-25 09:58:37', '2023-04-25 09:58:37', 19),
(83, 'Décapage de la chape dans garage et fourniture et pose de nouvelle chape 21m2', 16, 1, NULL, NULL, 0, 1000, 1160, 1000, 0, '2023-05-04 18:46:59', '2023-05-04 18:46:59', 20),
(84, 'ouverture de murs pour porte fenêtre dans nouvelle cuisine avec linteaux', 16, 1, NULL, NULL, 0, 350, 406, 350, 0, '2023-05-04 18:46:59', '2023-05-04 18:46:59', 20),
(86, '+spot blanc dans faux plafond nouvelle cuisine 6 x spot ', 16, 6, NULL, NULL, 0, 45, 313.2, 270, 0, '2023-05-04 18:46:59', '2023-05-04 18:46:59', 20),
(87, '+spot blanc dans faux plafond nouvelle sale a mangé \n9x spot', 16, 9, NULL, NULL, 0, 45, 469.8, 405, 0, '2023-05-04 18:46:59', '2023-05-04 18:46:59', 20),
(88, 'Rénovation de un sal de bain\nDécapage carrelage +bac de duché+ cabiné de douche et évacuer tu le crase ', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-05-08 19:22:56', '2023-05-08 19:22:56', 21),
(89, 'Fourniture  isolation étanchéité    et répare mur pré a carrèle   + pose bac de duché +pose carrelage + pose vitre duché  ( option hauteur carrelage 50 €  )\nfourniture carrelage +bac de duché + vitre  ', 16, 1, NULL, NULL, 0, 3700, 4292, 3700, 0, '2023-05-08 19:22:56', '2023-05-08 19:22:56', 21),
(90, 'Rénovation de un sa de bain\nDécapage  carrelage +bac de duché +cabine \nFourniture bac de duché et pose et cabine  pose de carrelage\ncarrelage fournir par le client \nréparation de plafond 1m2  fournir Materials et peinture', 16, 1, NULL, NULL, 0, 2900, 3364, 2900, 0, '2023-05-08 19:50:27', '2023-05-08 19:50:27', 22),
(91, 'Prestation services de nettoyage dans différentes chantier  ', 16, 1, NULL, NULL, 0, 5000, 5800, 5000, 0, '2023-05-09 22:13:34', '2023-05-09 22:13:34', 23),
(92, 'Nous proposons des travaux de rénovation de votre appartement, y compris la fourniture et la pose de matériaux nécessaires pour les travaux d\'enduisage des murs et plafonds, avec une qualité de finition Q2 prête à peindre. Nous assurons également la fourniture et la pose de peinture de qualité Q2 pour les murs et les plafonds.\"\n\n ', 16, 1, NULL, NULL, 0, 8000, 9280, 8000, 0, '2023-05-10 11:50:53', '2023-05-10 11:50:53', 24),
(93, 'Installation de chantier.\n', 16, 1, NULL, NULL, 0, 400, 464, 400, 0, '2023-05-10 21:55:40', '2023-05-10 21:55:40', 25),
(94, 'Nettoyages de chantier fin de travaux', 16, 1, NULL, NULL, 0, 400, 464, 400, 0, '2023-05-10 21:55:40', '2023-05-10 21:55:40', 25),
(95, 'Fourniture et pose d\'une Dalle de terrasse en grés cérame  Lime Wood  robe 59x59,2x2 cm R11C +\nFourniture et pose d\'une Plot terrasse pour Dalle réglable 80/140 mm\n', 16, 1, NULL, NULL, 0, 5200, 6032, 5200, 0, '2023-05-10 21:55:40', '2023-05-10 21:55:40', 25),
(96, 'Installation de chantier, y compris frais de transport', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(97, 'Façade Avant \nEchafaudage ,montage + démontage  160 m2', 16, 160, NULL, NULL, 0, 14, 2598.4, 2240, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(98, 'Façade Avant  \nLavage haute pression  160 m2 +60m2 (Pignon droit) ', 16, 220, NULL, NULL, 0, 3, 765.6, 660, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(99, 'Façade Avant  \nBanc de fenêtre ,ponçage  partiel+ application de 2 couches d\'hydrofuge  18 pièce', 16, 18, NULL, NULL, 0, 35, 730.8, 630, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(100, 'Façade Avant  \nPeinture corniche mise en œuvre d\'un primaire +2 couche de peinture silicone   20 ml', 16, 20, NULL, NULL, 0, 35, 812, 700, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(101, 'Façade Avant  \nMise en œuvre d\'un primaire +2 couches de peinture \npeinture silicone 160 m2 +60m2 (Pignon droit) +3 pièce fenêtre  peinture de bois 2 couches \n', 16, 220, NULL, NULL, 0, 35, 8932, 7700, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(102, 'Façade gauche\nEchafaudage ,montage + démontage  100 m2\n', 16, 100, NULL, NULL, 0, 14, 1624, 1400, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(103, 'Façade gauche \nLavage haute pression  127 m2 ', 16, 127, NULL, NULL, 0, 3, 441.96, 381, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(104, 'Façade gauche  \nMise en œuvre d\'un primaire +2 couches de peinture \npeinture silicone 127m2  ', 16, 127, NULL, NULL, 0, 35, 5156.2, 4445, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(105, 'Façade  gauche\nPeinture corniche mise en œuvre d\'un primaire +2 couche de peinture silicone   9 ml', 16, 9, NULL, NULL, 0, 35, 365.4, 315, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(106, 'Façade gauche \nBanc de fenêtre ,ponçage  partiel+ application de 2 couches d\'hydrofuge  8 pièce', 16, 8, NULL, NULL, 0, 35, 324.8, 280, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(107, 'Façade droit\nEchafaudage ,montage + démontage  100 m2', 16, 100, NULL, NULL, 0, 14, 1624, 1400, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(108, 'Façade droit  \nLavage haute pression  100 m2 ', 16, 100, NULL, NULL, 0, 3, 348, 300, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(109, 'Façade droit\nMise en œuvre d\'un primaire +2 couches de peinture \npeinture silicone 100 m2 ', 16, 100, NULL, NULL, 0, 35, 4060, 3500, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(110, 'Façade droit\nBanc de fenêtre ,ponçage  partiel+ application de 2 couches d\'hydrofuge  6 pièce', 16, 6, NULL, NULL, 0, 35, 243.6, 210, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(111, 'Façade  droit\nPeinture corniche mise en œuvre d\'un primaire +2 couche de peinture silicone   15ml', 16, 15, NULL, NULL, 0, 35, 609, 525, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(112, 'Façade arrière\nEchafaudage ,montage + démontage  80m2', 16, 80, NULL, NULL, 0, 14, 1299.2, 1120, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(113, 'Façade arrière\nLavage haute pression  140m2  ', 16, 140, NULL, NULL, 0, 3, 487.2, 420, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(114, 'Façade arrière\nMise en œuvre d\'un primaire +2 couches de peinture \npeinture silicone 140 m2 ', 16, 140, NULL, NULL, 0, 35, 5684, 4900, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(115, 'Façade arrière\nBanc de fenêtre ,ponçage  partiel+ application de 2 couches d\'hydrofuge  14 pièce', 16, 14, NULL, NULL, 0, 35, 568.4, 490, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(116, 'Peinture stores de fenêtre ponçage  partiel+ application de 2 couches  d\'peinture 32 pièce + 2 lampe +porte d\'entrée ', 16, 32, NULL, NULL, 0, 100, 3712, 3200, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(117, 'Nettoyage de chantier  fin de chantier  ', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-05-14 13:33:51', '2023-05-14 13:33:51', 26),
(118, 'Rénovation d\'un pièces cousine a Dudelange\ninstallation de chantier ,y compris  transports de matériel +nettoyage fin de chantier ', 16, 1, NULL, NULL, 0, 185, 214.6, 185, 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27),
(119, 'Enlèvement du papier existant (type Raufaser )de tous les murs.', 16, 1, NULL, NULL, 0, 800, 928, 800, 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27),
(120, 'Fourniture et mise en œuvre d\'un primer d\'accroche sur les murs  ', 16, 1, NULL, NULL, 0, 250, 290, 250, 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27),
(121, 'Fourniture et pose d\'un nouveau papier (viles)', 16, 60, NULL, NULL, 0, 9.5, 661.2, 570, 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27),
(122, 'Fourniture et pose de deux couches de peinture satinée sur deux murs de 2440mm+1mur de 3560mm (coloris Ral au choix du client et a définir)', 16, 60, NULL, NULL, 0, 25, 1740, 1500, 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27),
(123, 'Pose d\'un papier Photo sur le mur avec porte accès salon de 3560mm (Fourniture par Rénov  Avenue )', 16, 35, NULL, NULL, 0, 10, 406, 350, 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27),
(124, 'Fourniture et pose de deux couches peinture satinée blanche au plafond', 16, 1, NULL, NULL, 0, 1200, 1392, 1200, 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27),
(125, 'Fourniture et pose de baguettes de finition tout autour au plafond en styropor  (modelé au choix du client et a définir ) ', 16, 70, NULL, NULL, 0, 4.5, 365.4, 315, 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27),
(126, 'Joints acyle de finitions ', 16, 1, NULL, NULL, 0, 130, 150.8, 130, 0, '2023-05-24 23:59:54', '2023-05-24 23:59:54', 27),
(127, 'Travaux à réaliser .établissement de la limite de propriété conformément au plan d\'partage transmis par le propriétaire \nFourniture et pose de bordure   ', 16, 1, NULL, NULL, 0, 1500, 1740, 1500, 0, '2023-05-31 18:48:43', '2023-05-31 18:48:43', 28),
(128, 'Travaux de maçonnerie:\nDémolition d\'un mur porteur et mise en place d\'une poutrelle\nOuverture a réaliser sur un autre mur : (L\'H) 160x2.10m\nFermeture d\'une ancienne porte\nModification de certains réseaux enterrés', 16, 1, NULL, NULL, 0, 3200, 3712, 3200, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(129, 'Travaux d\'isolation de murs façade avons par l\'intérieur : 34 m2\nFourniture et pose Isolation 20cm contre mur ,structure ,pare vapeur, OSB,plaque BA 13 GIPROC + Enduisage  3Q', 7, 34, NULL, NULL, 0, 65, 2364.7, 2210, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(130, 'Toiture chaude :Cuisine et SDB\nFourniture et pose Gitage +OSB+Pare-vapeur+isolant PIR 10cm -Etanchéité (Rufling) Mise en place de la gouttière.\nSurface de la toiture cuisine: 18 m2 ,et 7 m2 pour la salle bain.', 7, 25, NULL, NULL, 0, 280, 7490, 7000, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(131, 'Travaux toiture principale en ardoises\nValeur minimum lamda isolant  a utiliser ,0.040w mk\nFourniture et pose FUX PLAFONDS suspendu Isolation intérieur , toiture principale : 64 m2  \nIsolant de 6 cm ,entre bois +isolation 18 cm en continue de préférence ;(interruption uniquement par les fermes )pare vapeur et plaque de plat BE13  +finition pré a peinent enduisage 3  Q\n', 7, 64, NULL, NULL, 0, 65, 4451.2, 4160, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(132, 'Isolation par l\'extérieur  de la façade arriéré :51 m2 \nInstallation  de échafaudage montage + démontage 51 m2   14 € m2\nfourniture et  pose  d\'un isolation 14 cm +collage +cimentage 2 Q+ acrosor +crépi  silicone', 7, 51, NULL, NULL, 0, 120, 6548.4, 6120, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(133, 'Travaux de chape légère  min 120 kg m3\nfourniture et pose de Chape légère en bille de polystyrène (5a7 cm) \nChape légère au  RDC = 64 m2 +38 m2 a l\'étage+1 +2  ', 7, 130, NULL, NULL, 0, 30, 4173, 3900, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(134, 'Travaux de carrelage \nfourniture et pose de carrelage  RDC ; 60x60 a hauteur de 45 € + poses  30€ m2 ', 7, 68, NULL, NULL, 0, 75, 5457, 5100, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(135, 'Travaux de  faïencées\nfourniture et pose de  faïencées  30x30 a hauteur de 45 € + poses 35€', 7, 38, NULL, NULL, 0, 80, 3252.8, 3040, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(136, 'Fourniture et pose d\'un faux  plafond  suspendu avec ossature métallique et plaque de plat ba 13 + enduisage 3 Q  pré a prient', 7, 151, NULL, NULL, 0, 50, 8078.5, 7550, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(137, 'Fourniture et pose d\'un doublage contra Crozon en ossature métallique ,plaque  de plat ba 13 +enduisage 3 Q pré  a prient ', 7, 322, NULL, NULL, 0, 45, 15504.3, 14490, 0, '2023-05-31 22:34:32', '2023-05-31 22:34:32', 29),
(138, 'Réalisation d\'un Isolation intérieur (pour éviter les ponts thermiques)n d\'une chambre, d\'un salon et d\'une cuisine. Appartement 60m2 max Merci \n\n', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-06-04 22:01:11', '2023-06-04 22:01:11', 30),
(139, 'Fourniture et pose d\'une isolation de 6m avec plaque  de plat (pour éviter les ponts thermiques) 60 m2', 16, 60, NULL, NULL, 0, 26, 1809.6, 1560, 0, '2023-06-04 22:01:11', '2023-06-04 22:01:11', 30),
(140, 'Fourniture et pose de enduisage Q 2  prêt a peindre  60m2', 16, 60, NULL, NULL, 0, 16, 1113.6, 960, 0, '2023-06-04 22:01:11', '2023-06-04 22:01:11', 30),
(141, 'Fourniture et pose de finition a l\'acrylique avant peinture ', 16, 1, NULL, NULL, 0, 350, 406, 350, 0, '2023-06-04 22:01:11', '2023-06-04 22:01:11', 30),
(142, 'Fourniture et pose d\'une  peinture au plafond ', 16, 60, NULL, NULL, 0, 20, 1392, 1200, 0, '2023-06-04 22:01:11', '2023-06-04 22:01:11', 30),
(143, 'Fourniture et pose de valise et  peinture Q 2  60 m 2', 16, 60, NULL, NULL, 0, 35, 2436, 2100, 0, '2023-06-04 22:01:11', '2023-06-04 22:01:11', 30),
(144, 'Installation de chantier  et nettoyage fin de travaux', 16, 1, NULL, NULL, 0, 220, 255.2, 220, 0, '2023-06-04 22:01:11', '2023-06-04 22:01:11', 30),
(145, 'Réalisation de pose de peinture \nfourniture et pose de  Papier type Variovlies avec 2 couches de blanc mur et plafond   \n Le chantier : 5, rue Trengen Knapp à Oetrange.\n\n            Maison n° 5 et 5A\n\n ', 16, 1, NULL, NULL, 0, 30000, 34800, 30000, 0, '2023-06-05 22:38:22', '2023-06-05 22:38:22', 31),
(146, 'Construction toit', 16, 1, NULL, NULL, 0, 5000, 5800, 5000, 0, '2023-06-06 20:29:05', '2023-06-06 20:29:05', 32),
(147, 'TERASSE 40M2', 16, 2, NULL, NULL, 0, 10000, 20880, 18000, 10, '2023-06-06 20:29:05', '2023-06-06 20:29:05', 32),
(148, 'Nous proposons des travaux de rénovation de votre maison y compris la fourniture et la pose de matériaux nécessaires pour les   travaux ', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-06-08 21:36:04', '2023-06-08 21:36:04', 33),
(149, 'Installation de chantier et copris transport et nettoyage fin de chantier ', 16, 1, NULL, NULL, 0, 480, 556.8, 480, 0, '2023-06-08 21:36:04', '2023-06-08 21:36:04', 33),
(153, 'Rezé de chaussée  et étage 1\nFourniture et pose d\'un  carrelage au sol    (carrelage al hauteur de 50 €  ) 75 m2', 16, 75, NULL, NULL, 0, 95, 8265, 7125, 0, '2023-06-08 21:36:04', '2023-06-08 21:36:04', 33),
(154, 'Etage 1 et étage 2 \nFourniture et pose d\'un( Parchet de 12mm (hauteur \'de 50€ ) 80 m2', 16, 80, NULL, NULL, 0, 90, 8352, 7200, 0, '2023-06-08 21:36:04', '2023-06-08 21:36:04', 33),
(155, 'Etage 1 et étage 2 \nfourniture et pose d\'une  portée   5 pièce', 16, 5, NULL, NULL, 0, 630, 3654, 3150, 0, '2023-06-08 21:36:04', '2023-06-08 21:36:04', 33),
(156, 'Façade Avant\néchafaudage ,montage +démontage  50 m2', 16, 50, NULL, NULL, 0, 14, 812, 700, 0, '2023-06-08 21:36:04', '2023-06-08 21:36:04', 33),
(157, 'Façade Avant\nFourniture et pose d\'une primaire +couches de peinture silicone   ', 16, 50, NULL, NULL, 0, 40, 2320, 2000, 0, '2023-06-08 21:36:04', '2023-06-08 21:36:04', 33),
(158, 'Fourniture et pose de plainte carrelage  40 li   ( al hauteur de 25€  )', 16, 40, NULL, NULL, 0, 25, 1160, 1000, 0, '2023-06-08 21:36:04', '2023-06-08 21:36:04', 33),
(159, 'Réalisation d\'e peinture \nFourniture et pose d\'une finitions des la penture a joint acrylique =32,8 ml\nmise en peinture des murs avec deux couche de peinture  blanche satinée =+-120m2 avec retouche d\'enduit de finitions ', 16, 120, NULL, NULL, 0, 16.5, 2296.8, 1980, 0, '2023-06-09 22:28:41', '2023-06-09 22:28:41', 34),
(160, '\n\nTravaux maçonnerie : Fourniture et pose d\'une réseaux enterrés et raccordement des eaux pluviales et WC à l\'égout et mise en place d\'une chambre de visite.\nIsolation cage d\'escalier vers la cave,  : En panneau PUR / PIR de 10 cm ,lamda 0.022. (9m²).\n\n', 7, 1, NULL, NULL, 0, 2500, 2675, 2500, 0, '2023-06-15 20:56:38', '2023-06-15 20:56:38', 29),
(171, 'Installation saintier\nfourniture et pose d’une isolations (carrelage, Fenêtre, Porte…)', 16, 120, NULL, NULL, 0, 7, 974.4, 840, 0, '2023-06-28 22:56:15', '2023-06-28 22:56:15', 35),
(172, 'fourniture et pose d’un primaire d’accroche murs et plafond 352m2\nfourniture et pose de finitions d’acrylique \nfourniture et pose de peinture blanc semi-satiné au murs lavable 232m2\nfourniture et pose de peinture blanc matte au plafond 120m2', 16, 352, NULL, NULL, 0, 15, 6124.8, 5280, 0, '2023-06-28 22:56:15', '2023-06-28 22:56:15', 35),
(173, 'Fourniture et pose d\' une   clôture rigide   28ml  hauteur1,50  ', 16, 1, NULL, NULL, 0, 3300, 3828, 3300, 0, '2023-07-04 21:24:48', '2023-07-04 21:24:48', 36),
(174, 'Prestation  service de  Nettoyage   Par  Hor  122 H', 16, 122, NULL, NULL, 0, 27, 3821.04, 3294, 0, '2023-07-06 17:53:58', '2023-07-06 17:53:58', 37),
(175, 'Devis  Préposée du service Nettoyage   pour la administration Communale.   a réalise al  HOR 28€  \n', 16, 1, NULL, NULL, 0, 28, 32.48, 28, 0, '2023-07-10 22:29:30', '2023-07-10 22:29:30', 38),
(176, 'Etanchéité et l\'isolation de la toiture Garage TRAVAUK SUR SURFACE HORIZONTALE - Couche d\'accrouchage - Pare vapeur Sopraglas TF V3 – Isolation thermique ep. 100mm - Membrane d\'étanchéité bi couches Soprastick Venti FF et Sopragum techno TF4', 16, 26, NULL, NULL, 0, 100, 3016, 2600, 0, '2023-07-19 18:57:52', '2023-07-19 18:57:52', 39),
(177, 'Etanchéité et l\'isolation de la toiture terrasse TRAVAUK SUR SURFACE HORIZONTALE - Couche d\'accrouchage - Pare vapeur Sopraglas TF V3 – lsolation thermique  ep. 100mm - Membrane d\'étanchéité bi couches Soprastick Venti FF et Sopragum techno TF4', 16, 3, NULL, NULL, 0, 100, 301.6, 260, 0, '2023-07-19 18:57:52', '2023-07-19 18:57:52', 39),
(178, 'TRAVAUX SUR SURFACE VERTICAL- Couche d\'accrouchage - Pare vapeur Sopraglas TFV3 - autour de la maison et de la terrasse au rez-de-chaussée', 16, 47, NULL, NULL, 0, 30, 1635.6, 1410, 0, '2023-07-19 18:57:52', '2023-07-19 18:57:52', 39),
(179, 'TRAVAUX SUR SURFACE VERTICAL- Couche d\'accrouchage - Pare vapeur Sopraglas TFV3 - lsolation thermique  ep. 80mm - Membrane d\'étanchéité bi couches Soprastick Venti FF et Sopragum techno TF4', 16, 25, NULL, NULL, 0, 60, 1740, 1500, 0, '2023-07-19 18:57:52', '2023-07-19 18:57:52', 39),
(180, 'Installation chantier', 16, 1, NULL, NULL, 0, 140, 162.4, 140, 0, '2023-07-20 21:10:42', '2023-07-20 21:10:42', 40),
(181, 'DECAPAGE \nDécapage des  sol et plinthe avec mise en recyclage 13m2', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-07-20 21:10:42', '2023-07-20 21:10:42', 40),
(182, 'Fourniture et pose de lame pvc au sol a hauteur de 45€ +pose   25€ m2', 16, 13, NULL, NULL, 0, 70, 1055.6, 910, 0, '2023-07-20 21:10:42', '2023-07-20 21:10:42', 40),
(183, 'Fourniture et pose de plinthe  assortie au lame pvc au prix de 12 €/ml  + pose 5€ ml', 16, 14, NULL, NULL, 0, 17, 276.08, 238, 0, '2023-07-20 21:10:42', '2023-07-20 21:10:42', 40),
(184, 'LAME PVC\nFourniture et pose d\'une isolation phonique    12m2', 16, 1, NULL, NULL, 0, 300, 348, 300, 0, '2023-07-20 21:10:42', '2023-07-20 21:10:42', 40),
(185, 'Nettoyage de fin chantier  ', 16, 1, NULL, NULL, 0, 200, 232, 200, 0, '2023-07-20 21:10:42', '2023-07-20 21:10:42', 40),
(186, 'Installation de chantier et nettoyage fin de chantier et évacuer le décher', 16, 1, NULL, NULL, 0, 300, 348, 300, 0, '2023-07-30 20:39:32', '2023-07-30 20:39:32', 41),
(187, 'Réalisation d\'une couturé  Le mur séparatif en bois, retirer les lames de bois et remplacer par les panneaux plastiques quelle dispose. En suivant la pente existante ?  (faisant un couvre mur en zinc sur le haut et la descente, rebordant de chaque côté sur environ 6 cm.  ) \nfourniture  et pose   le zinc  ', 16, 1, NULL, NULL, 0, 1300, 1508, 1300, 0, '2023-07-30 20:39:32', '2023-07-30 20:39:32', 41),
(188, 'préparation de chantier  enlevé tous le paves  existants  et évacué le paves pour préparation du terrain ', 16, 1, NULL, NULL, 0, 1500, 1740, 1500, 0, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 42),
(189, 'Installation de chantier et nettoyage du chantier ', 16, 1, NULL, NULL, 0, 300, 348, 300, 0, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 42),
(190, 'Fourniture et pose de granit façade 6 m2  (HAUTOR prix de granit 125€)\n+le marche de escaler du entre 4 m2', 16, 10, NULL, NULL, 0, 200, 2320, 2000, 0, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 42),
(191, 'Fourniture et pose de pave choisis  par le client  (HAUTOR prix de pave 80€   ) ', 16, 32, NULL, NULL, 0, 200, 7424, 6400, 0, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 42),
(192, 'Fourniture et pose de stabilisant  pour prépare le terrain et de bordure   8 ml', 16, 1, NULL, NULL, 0, 2000, 2320, 2000, 0, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 42),
(193, 'Fourniture et pose de bloc béton +couvre mur   +cimentage   pour construire un mur de 4 ml', 16, 1, NULL, NULL, 0, 1300, 1508, 1300, 0, '2023-07-30 21:18:20', '2023-07-30 21:18:20', 42),
(194, 'Installation de chantier et nettoyage  ', 16, 1, NULL, NULL, 0, 180, 208.8, 180, 0, '2023-07-30 21:45:27', '2023-07-30 21:45:27', 43),
(195, 'Fourniture et  pose de peinture sur un cabane de jardin coloré gris     peinture de extérieur  2Q', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-07-30 21:45:27', '2023-07-30 21:45:27', 43),
(196, 'Fourniture et pose de joints  époxy  pour  tous les couvres murs ceux de la descente de garage et jardin ainsi que le tour de clôture sur côté, arrière et avant', 16, 1, NULL, NULL, 0, 1500, 1740, 1500, 0, '2023-07-30 21:45:27', '2023-07-30 21:45:27', 43),
(197, 'Fourniture et pose de  4 plaques de granit gris clair\n30x30 .65x30.    pour change  sur poteau entrée gauche', 16, 1, NULL, NULL, 0, 600, 696, 600, 0, '2023-07-30 21:45:27', '2023-07-30 21:45:27', 43),
(198, 'Fourniture et pose de peinture  mur voisin au fond en blanc cassé     2 Q', 16, 1, NULL, NULL, 0, 300, 348, 300, 0, '2023-07-30 21:45:27', '2023-07-30 21:45:27', 43),
(199, 'Installation  de chantier et démontage de  mur existant et évacué le  crase  ', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-07-30 22:01:20', '2023-07-30 22:01:20', 44),
(200, 'Fourniture  et pose de   bois exotique comme on a vu sur tes photos voir le chêne bois     pour le extérieur +application de 2Q  de peinture laque', 16, 1, NULL, NULL, 0, 4500, 5220, 4500, 0, '2023-07-30 22:01:20', '2023-07-30 22:01:20', 44),
(201, 'Installation et préparation de chantier et nettoyage fin du chantier', 16, 1, NULL, NULL, 0, 140, 162.4, 140, 0, '2023-08-03 17:21:35', '2023-08-03 17:21:35', 45),
(202, 'Fourniture de carrelage sol  60x60  hauteur  de 50€ 2m \n  ', 16, 6, NULL, NULL, 0, 50, 348, 300, 0, '2023-08-03 17:21:35', '2023-08-03 17:21:35', 45),
(203, 'Démontage de cuisine Ancien   et décapage de ancien carrelage  et nettoyage', 16, 1, NULL, NULL, 0, 800, 928, 800, 0, '2023-08-03 17:21:35', '2023-08-03 17:21:35', 45),
(204, 'Fourniture de carrelage mur 30x60    hauteur de 50€ 2m ', 16, 25, NULL, NULL, 0, 50, 1450, 1250, 0, '2023-08-03 17:21:35', '2023-08-03 17:21:35', 45),
(205, 'Fourniture de colle Flex +, joint culer para port de carrelage  et silicone +  pose  de carrelage  sol et mur   31    2m  ', 16, 31, NULL, NULL, 0, 60, 2157.6, 1860, 0, '2023-08-03 17:21:35', '2023-08-03 17:21:35', 45),
(206, 'Installation chantier ', 16, 1, NULL, NULL, 0, 280, 324.8, 280, 0, '2023-09-10 10:47:42', '2023-09-10 10:47:42', 46),
(207, 'Fourniture et pose de vlise et mis en peinture des murs avec deux couche de peinture blanche  ', 16, 255, NULL, NULL, 0, 25, 7395, 6375, 0, '2023-09-10 10:47:42', '2023-09-10 10:47:42', 46),
(208, 'Nettoyage de fin chantier ', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-09-10 10:47:42', '2023-09-10 10:47:42', 46),
(209, 'Mise en peinture des plafonds avec deux couche de peinture ', 16, 87, NULL, NULL, 0, 15, 1513.8, 1305, 0, '2023-09-10 10:47:42', '2023-09-10 10:47:42', 46),
(210, 'Décapage des  sol profondeur de 20 cm de  chape 30 m2  avec mis en recyclage + évacuer + 2 container  ', 16, 1, NULL, NULL, 0, 7500, 8700, 7500, 0, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47),
(211, 'Installation de chantier   et nettoyage fin de chantier', 16, 1, NULL, NULL, 0, 250, 290, 250, 0, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47),
(212, 'Confections d\'une dalle en béton armée  de 12cm x 30m2', 16, 1, NULL, NULL, 0, 4800, 5568, 4800, 0, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47),
(213, 'Fourniture de carrelage  60x60   autour de 50€ m2   ', 16, 20, NULL, NULL, 0, 50, 1160, 1000, 0, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47),
(214, 'Pose de carrelage  +colle +silicone +remontage    fourniture 20m2     ', 16, 20, NULL, NULL, 0, 50, 1160, 1000, 0, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47),
(215, 'Fourniture et pose de une trap visité de 40x40 ', 16, 1, NULL, NULL, 0, 300, 348, 300, 0, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47),
(216, 'Fourniture de plainte    +pose  30ml   autour  20 €', 16, 30, NULL, NULL, 0, 20, 696, 600, 0, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47),
(217, 'Pour tous  les travaux en supplément il est paye a l\'heure de 60`€   du heure  ', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-09-14 20:43:56', '2023-09-14 20:43:56', 47),
(218, 'Prestation  de service Nettoyage  par heure  38€ de  leur   avec  TTC  Et tout le matériel  fourni  ', 16, 1, NULL, NULL, 0, 32.76, 38, 32.76, 0, '2023-09-27 07:52:24', '2023-09-27 07:52:24', 48),
(219, 'Tous les produits de Nettoyage +papier toilette  et essuie-mains elle lave main    ', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-09-27 07:52:24', '2023-09-27 07:52:24', 48),
(220, 'Fourniture et posse d\'un faux plafond suspendu avec ossature métallique et plaques en Ba 13 ', 16, 47, NULL, NULL, 0, 60, 3271.2, 2820, 0, '2023-09-27 20:53:51', '2023-09-27 20:53:51', 49),
(221, 'Rénovation d\'un  maison a Belgique DEVIS  supplément \n  Réception  du électricité par entrepris  Vincotte ', 16, 1, NULL, NULL, 0, 1500, 1740, 1500, 0, '2023-10-10 13:25:15', '2023-10-10 13:25:15', 50),
(222, 'Installation chantier et nettoyage fin de chantier', 16, 1, NULL, NULL, 0, 180, 208.8, 180, 0, '2023-10-12 13:04:11', '2023-10-12 13:04:11', 51),
(223, 'Fourniture de parquet stratifie  et isolation   55   m2\nparquet autor de 20`€   m2 ', 16, 55, NULL, NULL, 0, 20, 1276, 1100, 0, '2023-10-12 13:04:11', '2023-10-12 13:04:11', 51),
(224, 'Fourniture de plinthe  60  2m linier   al hauteur de 12   ', 16, 60, NULL, NULL, 0, 12, 835.2, 720, 0, '2023-10-12 13:04:11', '2023-10-12 13:04:11', 51),
(225, 'pose de parquet et plinthe  55 m2   +  60 m2 linier de plinthe +isolation ', 16, 1, NULL, NULL, 0, 2000, 2320, 2000, 0, '2023-10-12 13:04:11', '2023-10-12 13:04:11', 51),
(228, 'Set logos couleurs', 16, 1, NULL, NULL, 0, 25, 29, 25, 0, '2023-10-12 22:34:00', '2023-10-12 22:34:00', 53),
(229, 'carte visites 35g couché de mi-mat. surface 45.90 cm2. 500 pièces', 16, 1, NULL, NULL, 0, 50, 58, 50, 0, '2023-10-12 22:34:00', '2023-10-12 22:34:00', 53),
(230, 'Site internet OnePage, Installation de l\'hébergement WebPro 1an, Noms de domaine .lu 1an', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-10-12 22:34:00', '2023-10-12 22:34:00', 53),
(231, 'Pos. 1 Travaux préparatoires\n 1 pauschal Installation de chantier 1.250,00 € .\n\nL&#39;installation du chantier, comprend déplacements les\naménagements ainsi que l&#39;installation et le repliement de\ntoutes les machines, matériaux, équipements, protections des\nintervenants, dont l&#39;entreprise aura besoin pour la bonne\ngestion des travaux.\nMise en place de protections de sol des passages et éléments\nadjacents. Enlèvement et mise à la décharge vers conteneur\nde recyclage mis à disposition par client', 16, 1, NULL, NULL, 0, 1250, 1450, 1250, 0, '2023-10-15 19:38:55', '2023-10-15 19:38:55', 54),
(232, 'Pos. 2 Rez-de-chaussée\n1 pauschal Travaux de plâtre 3.900,00 € .\n\nRéparations des murs non conformes.\nPréparation des supports, comprenant :- ragréage des murs -\nrebouchage des saignées de sol (après passage des\ntechniques) et au droit des ouvertures\nLivraison et pose de bétoncontact et plâtre, ponçage, finition\nmurs prêts à peindre', 16, 1, NULL, NULL, 0, 3900, 4524, 3900, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(233, 'Pos. 2 Rez-de-chaussée\n2 65 m² Faux plafond 65,00 € 4.225,00 €\n\nLivraison et pose d`un faux-plafond en plaques Ba13 coupe-\nfeu, vissés sur ossature métallique, y compris\njointement (finition prête à peindre)\nIsolation mise à disposion par client', 16, 65, NULL, NULL, 0, 65, 4901, 4225, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(234, 'Pos. 2 Rez-de-chaussée\n3 65 m² Revêtement de sol en carrelage 55,00 € 3.575,00 €\nFourniture et pose collée de carrelage de sol type\n60x60.Y compris plinthes et silicone sous plinthes', 16, 65, NULL, NULL, 0, 55, 4147, 3575, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(235, 'Pos. 3 2 ème Etage et combles\n 1 pauschal Travaux de dépose 1er étage et combles\n\nDépose de l&#39;ensemble des toiles murales du 1er étage à\ncombles Evacuation vers conteneur de recyclage mis à\ndisposition par client\n\n800,00 € .', 16, 1, NULL, NULL, 0, 800, 928, 800, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(236, 'Pos. 3 2 ème Etage et combles\n2 1 pauschal Travaux de démolition 1er et combles Démolition de\nplusieurs murs, travaux de picage mural,dépose\nd`éléments sanitaires, transport des matériaux à\nl`éxterieur vers benne de recyclage mise à disposition par\nclient\n\n2.400,00 €.\n', 16, 1, NULL, NULL, 0, 2400, 2784, 2400, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(237, 'Pos. 3 2 ème Etage et combles\n3 21 m² Cloison double\n\nLivraison et pose de cloisons double en plaques Ba13 , vissés\nsur ossature métallique, y compris isolation et jointement\n(finition prête à peindre)\n\n73,00 € ', 16, 21, NULL, NULL, 0, 73, 1778.28, 1533, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(238, 'Pos. 3 2 ème Etage et combles\n4 95 m² Isolation toiture\n\nLivraison et pose d`une isolation toiture avec panneaux\nisolants\nUTHERM4U épaisseur 10 cm\n\n28,00 € 2.660,00 €', 16, 95, NULL, NULL, 0, 28, 3085.6, 2660, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(239, 'Pos. 3 2 ème Etage et combles\n5 62 m² Faux plafond combles\n\nLivraison et pose d`un faux-plafond en plaques Ba13 coupe-\nfeu, vissés sur ossature métallique, y compris\njointement (finition prête à peindre)\n\n62,00 € 3.844,00 €', 16, 62, NULL, NULL, 0, 62, 4459.04, 3844, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(240, 'Pos. 3 2 ème Etage et combles\n6 65 m² Revetement sol 1 er étage\n\nFourniture et pose d&#39;un parquet semi-massif contrecollé en\nbois massif, y compris plinthes assorties et colle résine\n\n85,00 € 5.525,00 €', 16, 65, NULL, NULL, 0, 85, 6409, 5525, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(241, 'Pos. 3 2 ème Etage et combles\n7 65 m² Revetement de sol carrelage dans combles\nFourniture et pose collée de carrelage de sol type\n60x60.Y compris plinthes et silicone sous plinthes\n\n55,00 € 3.575,00 €', 16, 65, NULL, NULL, 0, 55, 4147, 3575, 0, '2023-10-15 20:55:31', '2023-10-15 20:55:31', 54),
(246, 'Pos. 4 TRAVAUX DE MENUISERIES EXTERIEURES\n1 1 pauschal Fenêtres\n\nDépose soignées de l&#39;ensemble des menuiseiries existante,\net caisson de volets.Y compris la protection des façades\nextérieures a ne pas endommager. Evacuation des\nmenuiseries vers conteneur de\nrecyclage mis à disposition par client\n\nFourniture et pose de menuiseries extérieures (marque à\ndéfinir) à l&#39;identique.Couleur en aluminium anodisé et\nouvertures à l&#39;identique. Double vitrage. Caissons et volets\nroulants électriques.\n10 Fenêtres comprises dans ce forfait', 16, 1, NULL, NULL, 0, 9850, 11426, 9850, 0, '2023-10-15 21:15:57', '2023-10-15 21:15:57', 55),
(247, 'Pos. 5 TRAVAUX DE MENUISERIES Intérieur\n\n6.500,00 € \n1 1 pauschal Portes intérieur\n\nFourniture et pose de portes intérieures, comprenant feuille,\nchambranle, contre-chambranles et serrureries. couleur bois\nNombre de portes incluses dans ce forfait 10', 16, 10, NULL, NULL, 0, 650, 7540, 6500, 0, '2023-10-15 21:15:57', '2023-10-15 21:15:57', 55),
(248, 'Pos. 5 TRAVAUX DE MENUISERIES Intérieur\n2 1 pauschal Portes d`entrée 3.150,00 € \n\nFourniture et pose d&#39;une porte d&#39;entrée en pvc renforcé et\nisolé, avec 5 points de fermetures. Y compris quincailleries,\noeilletons et ouverture à gache électrique\n', 16, 1, NULL, NULL, 0, 3150, 3654, 3150, 0, '2023-10-15 21:15:57', '2023-10-15 21:15:57', 55),
(249, 'Pos. 1 Travaux préparatoires 1.250,00 €\nPos. 2 Rez-de-chaussée 11.700,00 €\nPos. 3 2 ème Etage et combles 20.337,00 €\nPos. 4 TRAVAUX DE MENUISERIES EXTERIEURES 9.850,00 €\nPos. 5 TRAVAUX DE MENUISERIES Intérieur 9.650,00 €\nNettobetrag 52.787,00 €\nzzgl. 16% MwSt 8.445,92 €\nGesamtsumme 61.232,92 €\nLes prix mentionnés ci-dessus sont valables jusqu&#39;à 4 semaines après l&#39;établissement de l&#39;offre.\nJ&#39;espère que notre offre vous convient et je serais ravi de recevoir votre commande.\nJe reste à votre disposition pour toute question supplémentaire.\nDélais de règlement : Par virment à réception de la facture.\nConditions de règlement : 40% d`acompte à la commande , le solde échelonné suivant avancement des\ntravaux', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-10-15 21:15:57', '2023-10-15 21:15:57', 55),
(250, ' 1 pauschal  Installation de chantier  	\nL\'installation du chantier, comprend déplacements les aménagements ainsi que l\'installation et le repliement de toutes les machines, matériaux, équipements, protections des intervenants, dont l\'entreprise aura besoin pour la bonne gestion des travaux. \nnettoyage fin de travaux\n\n', 16, 1, NULL, NULL, 0, 380, 440.8, 380, 0, '2023-10-22 12:31:46', '2023-10-22 12:31:46', 56),
(251, 'Fourniture et pose de carrelage 30x30 et plinthe  et colle, et silicone,   joints, tu compris le travaux     carrelage sol Local poubelles   20m2 + plinthes 20 ml\ncarrelage sol  couloire   40m2+   plinthes 60 ml\ncarrelage  sol  cave  128m2 +plinthes 13ml\n', 16, 188, NULL, NULL, 0, 65, 14175.2, 12220, 0, '2023-10-22 12:31:46', '2023-10-22 12:31:46', 56),
(252, '1 pauschal Travaux de Décapage  de sol carrelage et plinthes   et préparation de   chape   mise en recyclage  ', 16, 1, NULL, NULL, 0, 2640, 3062.4, 2640, 0, '2023-10-22 12:31:46', '2023-10-22 12:31:46', 56),
(253, 'Je reste à votre disposition pour toute question supplémentaire.\nDélais de règlement : Par virment à réception de la facture.\nConditions de règlement : 40% d`acompte à la commande , le solde échelonné suivant avancement des travaux\n', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-10-22 12:31:46', '2023-10-22 12:31:46', 56),
(254, '1 pauschal Installation de chantier  	\nL\'installation du chantier, comprend déplacements les aménagements ainsi que l\'installation et le repliement de toutes les machines, matériaux, équipements, protections des intervenants, dont l\'entreprise aura besoin pour la bonne gestion des travaux. \nnettoyage fin de travaux\n', 16, 1, NULL, NULL, 0, 780, 904.8, 780, 0, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57),
(255, 'Décapage de carrelage sol  et recycle et prépare sol  +évacue le    ', 16, 1, NULL, NULL, 0, 1500, 1740, 1500, 0, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57),
(256, 'Fourniture carrelage al autour de 50€ m2  carrelage 60x60   ', 16, 35, NULL, NULL, 0, 50, 2030, 1750, 0, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57),
(257, 'Fourniture de plinthe  al autour de 8 ml    ', 16, 30, NULL, NULL, 0, 8, 278.4, 240, 0, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57),
(258, 'Pose de carrelage  +plinthe +colle +Silicone   +jonchas  ', 16, 35, NULL, NULL, 0, 45, 1827, 1575, 0, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57),
(259, 'Façade avant , Façade arrière , + pignon gauche  \nEchafaudage ,montage +démontage      110 m2\nLavage haute pression  ', 16, 110, NULL, NULL, 0, 20, 2552, 2200, 0, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57),
(260, 'Façade avant , Façade arrière , + pignon gauche  \nFourniture et pose de isolation  de 8 m +colle +trier +acrochorde +crépi  colore de crépi    choisir  par le client   110m2', 16, 110, NULL, NULL, 0, 65, 8294, 7150, 0, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57),
(261, 'Fourniture et pose de Tablet fenêtre  7 pesé et gouttière de l\'eau', 16, 1, NULL, NULL, 0, 2200, 2552, 2200, 0, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57),
(262, 'Je reste à votre disposition pour toute question supplémentaire.\nDélais de règlement : Par virment à réception de la facture.\nConditions de règlement : 40% d`acompte à la commande , le solde échelonné suivant avancement des travaux\n', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-10-22 13:56:22', '2023-10-22 13:56:22', 57),
(263, 'ce si est un test pour savoir comment ca va', 16, 1, NULL, NULL, 0, 500, 580, 500, 0, '2023-10-23 20:26:27', '2023-10-23 20:26:27', 58),
(264, 'ca aussi c\'est la même chose', 16, 1, NULL, NULL, 0, 220, 255.2, 220, 0, '2023-10-23 20:26:27', '2023-10-23 20:26:27', 58),
(265, 'test test', 16, 1, NULL, NULL, 0, 1000, 1160, 1000, 0, '2023-10-23 20:31:58', '2023-10-23 20:31:58', 59),
(266, 'ce si c\'est un autre test', 16, 1, NULL, NULL, 0, 120, 139.2, 120, 0, '2023-10-23 20:31:58', '2023-10-23 20:31:58', 59),
(269, 'Remplacement du Velux , \n\nFenêtre d\'accès au toit plat VELUX CXP 0473Q 120x120 cm ...  \n\nRetirer l\'ancien, installer le nouveau et tout ce qui est nécessaire pour le terminer', 16, 1, NULL, NULL, 0, 2650, 3074, 2650, 0, '2023-10-26 09:21:38', '2023-10-26 09:21:38', 61),
(270, 'Installation de chantier  	\nL\'installation du chantier, comprend déplacements les aménagements ainsi que l\'installation et le repliement de toutes les machines, matériaux, équipements, protections des intervenants, dont l\'entreprise aura besoin pour la bonne gestion des travaux. \n', 16, 1, NULL, NULL, 0, 240, 278.4, 240, 0, '2023-11-02 17:41:11', '2023-11-02 17:41:11', 62),
(271, 'Travaux de décapage  de carrelage +bac duché+ cabine duché + WC + lavabo complet +sanitaire +radiateur   +évacué    ', 16, 1, NULL, NULL, 0, 800, 928, 800, 0, '2023-11-02 17:41:11', '2023-11-02 17:41:11', 62),
(272, 'Fourniture et pose de carrelage 10m2   +isolation  +colle +Silicone    ', 16, 1, NULL, NULL, 0, 800, 928, 800, 0, '2023-11-02 17:41:11', '2023-11-02 17:41:11', 62),
(273, 'Fourniture et pose  d\'une bac de douche  80x80\nFourniture et pose d\'une  cabine de douche +Robinet douche couleur noir   2 pièce\nFourniture et pose d\'un  WC noir  complet\nFourniture   et pose d\'une tablette granit \nFourniture et pose d\'une lavabo complet  +robinet  noir\nFourniture et pose d\'un Radiateur séchoir    \nFourniture et pose peinture plafond  + 6 spot électricité   + ventilation', 16, 1, NULL, NULL, 0, 4500, 5220, 4500, 0, '2023-11-02 17:41:11', '2023-11-02 17:41:11', 62),
(274, 'Je reste à votre disposition pour toute question supplémentaire.\nDélais de règlement : Par virment à réception de la facture.\nConditions de règlement : 40% d`acompte à la commande , le solde échelonné suivant avancement des travaux\n', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-11-02 17:43:59', '2023-11-02 17:43:59', 62);

-- --------------------------------------------------------

--
-- Structure de la table `produits_ticket_caisses`
--

CREATE TABLE `produits_ticket_caisses` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `qtotal` int(11) DEFAULT NULL,
  `unite` float DEFAULT NULL,
  `prixTTC` float DEFAULT NULL,
  `prixHT` float DEFAULT NULL,
  `total_prix_TTC` float DEFAULT NULL,
  `total_prix_HT` float DEFAULT NULL,
  `remise` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `ticketCaisseId` int(11) DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit_achats`
--

CREATE TABLE `produit_achats` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `unite` float DEFAULT NULL,
  `prixTTC` float DEFAULT NULL,
  `prixHT` float DEFAULT NULL,
  `total_prix_TTC` float DEFAULT NULL,
  `total_prix_HT` float DEFAULT NULL,
  `remise` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `bonCommandeId` int(11) DEFAULT NULL,
  `fournisseurId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit_bon_livraisons`
--

CREATE TABLE `produit_bon_livraisons` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `qtotal` int(11) DEFAULT NULL,
  `unite` float DEFAULT NULL,
  `prixTTC` float DEFAULT NULL,
  `prixHT` float DEFAULT NULL,
  `total_prix_TTC` float DEFAULT NULL,
  `total_prix_HT` float DEFAULT NULL,
  `remise` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `bonLivraisonVenteId` int(11) DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit_bon_retours`
--

CREATE TABLE `produit_bon_retours` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `bonRetourId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit_bon_transferts`
--

CREATE TABLE `produit_bon_transferts` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `bonTransfertId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit_facture_ventes`
--

CREATE TABLE `produit_facture_ventes` (
  `id` int(11) NOT NULL,
  `libelle` varchar(1000) DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `qtotal` int(11) DEFAULT NULL,
  `unite` float DEFAULT NULL,
  `prixTTC` float DEFAULT NULL,
  `prixHT` float DEFAULT NULL,
  `total_prix_TTC` float DEFAULT NULL,
  `total_prix_HT` float DEFAULT NULL,
  `remise` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `factureVenteId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit_facture_ventes`
--

INSERT INTO `produit_facture_ventes` (`id`, `libelle`, `tva`, `quantite`, `qtotal`, `unite`, `prixTTC`, `prixHT`, `total_prix_TTC`, `total_prix_HT`, `remise`, `createdAt`, `updatedAt`, `factureVenteId`) VALUES
(1, 'facture d\'acompte de commande de Materials  sur le chantier belle Etoile Rte d Arlon , 8050  Bertrange   ', 0, 1, NULL, NULL, 0, 2000, 2000, 2000, 0, '2023-03-27 17:51:14', '2023-03-27 17:51:14', 1),
(2, 'facture d\'acompte de  fournitures de matériel chantier\nBelle Etoile Rte d Arlon ,8050 Bretagne  ', 16, 1, NULL, NULL, 0, 2000, 2320, 2000, 0, '2023-03-27 18:20:20', '2023-03-27 18:20:20', 2),
(3, 'Prestation de service a réaliser a h 25€', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-03-29 20:55:39', '2023-03-29 20:55:39', 3),
(4, 'L\'argent qui est paye es pris sous forme liquide  ', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-03-29 20:55:39', '2023-03-29 20:55:39', 3),
(5, 'Réalisation de travail si vont  ...................', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-03-29 20:55:39', '2023-03-29 20:55:39', 3),
(6, 'Prestation de  service   Nettoyage  a  25€ de heure', 16, 13, NULL, NULL, 0, 25, 377, 325, 0, '2023-03-30 18:59:01', '2023-03-30 18:59:01', 4),
(7, 'Avance à la commande', 16, 1, 0, NULL, NULL, 218, 252.88, 218, 0, '2023-03-30 21:23:16', '2023-03-30 21:23:16', 5),
(8, 'acompte', 16, 1, 0, NULL, NULL, 382.41, 443.6, 382.41, 0, '2023-04-02 13:25:25', '2023-04-02 13:25:25', 6),
(9, 'final', 16, 1, 0, NULL, NULL, 163.89, 190.113, 163.89, 0, '2023-04-02 13:28:27', '2023-04-02 13:28:27', 7),
(10, 'Fournitures d\'acompte de matérielle chantier Belle Etoile Rre d Arlon 8050 Bretagne ( 2 me facture d avance)', 16, 1, NULL, NULL, 0, 2500, 2900, 2500, 0, '2023-04-07 19:01:50', '2023-04-07 19:01:50', 8),
(11, 'Facture d acropète pour le travaux de doublages de mur et piliers    60 %', 16, 1, NULL, NULL, 0, 4884, 5665.44, 4884, 0, '2023-04-07 20:21:55', '2023-04-07 20:21:55', 9),
(12, 'Travaux de prestations de travail   effectue a l\'heure  37 € h', 16, 162, NULL, NULL, 0, 37, 6953.04, 5994, 0, '2023-04-19 19:31:10', '2023-04-19 19:31:10', 10),
(13, 'Chantier rue de Longwy  n 219', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-04-19 19:31:10', '2023-04-19 19:31:10', 10),
(14, 'Facture D\'acropète pour le travaux de doublage de mur et pilaires 40%   facture final  de travaux', 16, 1, NULL, NULL, 0, 3776, 4380.16, 3776, 0, '2023-04-24 18:15:33', '2023-04-24 18:15:33', 11),
(15, 'Facture   d acompte pur le travaux de doublages du plaque de mur et piliers 40 % fin de travx', 16, 1, NULL, NULL, 0, 3256, 3776.96, 3256, 0, '2023-05-02 20:36:34', '2023-05-02 20:36:34', 12),
(16, 'Travaux de prestations de travail effectue a L\'heure 37 € a h\nChantier rue de Longwy n 219', 16, 123, NULL, NULL, 0, 37, 5279.16, 4551, 0, '2023-05-04 19:09:31', '2023-05-04 19:09:31', 13),
(17, 'Prestation services de nettoyage dans différentes chantier ', 16, 1, NULL, NULL, 0, 5000, 5800, 5000, 0, '2023-05-09 22:15:57', '2023-05-09 22:15:57', 14),
(18, 'Prestation services de nettoyage dans différentes chantier', 16, 1, NULL, NULL, 0, 5000, 5800, 5000, 0, '2023-05-10 15:55:16', '2023-05-10 15:55:16', 15),
(19, 'Nous proposons des travaux de rénovation de votre appartement, y compris la fourniture et la pose de matériaux nécessaires pour les travaux d\'enduisage des murs et plafonds, avec une qualité de finition Q2 prête à peindre. Nous assurons également la fourniture et la pose de peinture de qualité Q2 pour les murs et les plafonds.\"', 16, 1, NULL, NULL, 0, 8000, 9280, 8000, 0, '2023-05-12 21:48:22', '2023-05-12 21:48:22', 16),
(20, 'J\'ai reçu de l\'argent en main 1700€ cash', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-05-12 21:48:22', '2023-05-12 21:48:22', 16),
(21, 'Facture pose de carrelage \nchantier  Diekirch', 16, 1, NULL, NULL, 0, 1437, 1666.92, 1437, 0, '2023-05-15 20:43:23', '2023-05-15 20:43:23', 17),
(22, '1 mois après la 1ere facture', 16, 1, 0, NULL, NULL, 218, 252.88, 218, 0, '2023-05-24 08:50:33', '2023-05-24 08:50:33', 18),
(23, 'Réalisation d\'un terrasse  pose de carrelage\nchantier  Rue de Luxemburg L-8077 Luxemburg', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-05-30 22:14:05', '2023-05-30 22:14:05', 19),
(24, 'Acompte sur la commande de matériel', 16, 1, NULL, NULL, 0, 4450, 5162, 4450, 0, '2023-05-30 22:14:05', '2023-05-30 22:14:05', 19),
(25, 'Réalisation d\'un terrasse pose de carrelage chantier  Rue de Luxemburg L-8077 Luxemburg\nAcompte sur la commande de matériel ', 16, 1, NULL, NULL, 0, 3000, 3480, 3000, 0, '2023-05-31 16:21:57', '2023-05-31 16:21:57', 20),
(26, 'Nettoyage résidence\nPrestation services Nettoyage  pour la sommé   540€', 16, 1, NULL, NULL, 0, 540, 626.4, 540, 0, '2023-06-04 21:23:41', '2023-06-04 21:23:41', 21),
(27, 'Réalisation de travaux de enduisages   et peinture sur le chantier Post Technologies C/o Diederich Luc   rue Emile Bian     ( Avance a la commande 50% )', 16, 1, NULL, NULL, 0, 2500, 2900, 2500, 0, '2023-06-05 22:50:44', '2023-06-05 22:50:44', 22),
(28, 'Avant travaux', 16, 1, 0, NULL, NULL, 11500, 13340, 11500, 0, '2023-06-06 21:07:06', '2023-06-06 21:07:06', 23),
(29, 'Apres construction toit ', 16, 1, 0, NULL, NULL, 5750, 6670, 5750, 0, '2023-06-06 21:09:29', '2023-06-06 21:09:29', 24),
(30, 'Fin de travail', 16, 1, 0, NULL, NULL, 5750, 6670, 5750, 0, '2023-06-06 21:21:13', '2023-06-06 21:21:13', 25),
(31, 'Fin des travaux sur le site internet \"daniel-lux.lu\"', 16, 1, 0, NULL, NULL, 109, 126.44, 109, 0, '2023-06-12 06:37:18', '2023-06-12 06:37:18', 26),
(32, 'Réalisation de travaux de enduisages et peinture sur le chantier post Technologies C/o Diederich Luc rue Emile Bian (chantier  fini 30%)  ', 16, 1, NULL, NULL, 0, 1686, 1955.76, 1686, 0, '2023-06-19 22:04:36', '2023-06-19 22:04:36', 27),
(33, 'Réalisation d\'une pose de carrelage sur le cuisines   chantier Carne', 16, 1, NULL, NULL, 0, 1057, 1226.12, 1057, 0, '2023-06-21 21:24:57', '2023-06-21 21:24:57', 28),
(34, 'Réalisation d\'une peinture \nRéférente Devis  D20230031     50%', 16, 1, NULL, NULL, 0, 990, 1148.4, 990, 0, '2023-06-21 22:01:31', '2023-06-21 22:01:31', 29),
(35, 'Rénovation d\'un méson\nfacture  Acompte pour le commencement des travaux de démolition     Reference DEVIS D20230012   33.33%', 16, 1, NULL, NULL, 0, 2833, 3286.28, 2833, 0, '2023-06-21 22:38:03', '2023-06-21 22:38:03', 30),
(36, 'Rénovation d\'un maison  Acompte sur la commande de travaux de sanitaire installation   Reference DEVIS   D20230013   50%  \n', 16, 1, NULL, NULL, 0, 1250, 1450, 1250, 0, '2023-06-21 22:50:15', '2023-06-21 22:50:15', 31),
(37, 'Rénovation d\'un maison  Facture  Acompte pour matériel   Reference DEVIS D20230015      33.33%', 16, 1, NULL, NULL, 0, 4524, 5247.84, 4524, 0, '2023-06-21 23:03:39', '2023-06-21 23:03:39', 32),
(38, 'Rénovation d\'un maison   Acompte pour matérielle  Reference DEVIS  D20230016  50%', 16, 1, NULL, NULL, 0, 800, 928, 800, 0, '2023-06-21 23:12:53', '2023-06-21 23:12:53', 33),
(39, 'Rénovation d\'un maison  Acompte pour le materiae   électricité   Reference DEVIS D20230017  60%', 16, 1, NULL, NULL, 0, 1032, 1197.12, 1032, 0, '2023-06-21 23:27:03', '2023-06-21 23:27:03', 34),
(40, 'Rénovation d\'un maison   Acompte matériel  Reference DEVIS D20230018   60% ', 16, 1, NULL, NULL, 0, 2265, 2627.4, 2265, 0, '2023-06-21 23:35:37', '2023-06-21 23:35:37', 35),
(41, 'Porte Interior\'s poser      Reference DEVIS  D20230004', 16, 6, NULL, NULL, 0, 460, 3201.6, 2760, 0, '2023-06-28 19:07:20', '2023-06-28 19:07:20', 36),
(42, 'Fourniture  et pose de fenêtre Reference DEVIS  D20230320 ', 16, 1, NULL, NULL, 0, 7341, 8515.56, 7341, 0, '2023-06-28 20:22:46', '2023-06-28 20:22:46', 37),
(43, 'Réalisation d\'une peinture   facture 2em  50%  facture final  +supplément 1.000€ DEVIS référence   D20230031  ', 16, 1, NULL, NULL, 0, 1990, 2308.4, 1990, 0, '2023-06-29 20:02:04', '2023-06-29 20:02:04', 38),
(44, 'Prestation  service de  Nettoyage   Par  Hor  122 H', 16, 122, NULL, NULL, 0, 27, 3821.04, 3294, 0, '2023-07-06 18:02:48', '2023-07-06 18:02:48', 39),
(45, 'Réalisation de colature    \nRéférence     DEVIS D20230023\n1 er avance 50 %', 16, 1, NULL, NULL, 0, 1650, 1914, 1650, 0, '2023-07-18 17:44:59', '2023-07-18 17:44:59', 40),
(46, 'Réalisation  de travaux  de penture , placo plâtre \nReference  devis  D-2023-0015   ', 16, 1, NULL, NULL, 0, 1216, 1410.56, 1216, 0, '2023-07-18 18:28:37', '2023-07-18 18:28:37', 41),
(47, 'Pose de carrelage mur,  douche Apart 1  4,32 m2 ', 16, 4, NULL, NULL, 0, 34, 157.76, 136, 0, '2023-07-18 19:28:35', '2023-07-18 19:28:35', 42),
(48, 'Pose de carrelage mur,  douche Apart 3  4,32 m2 ', 16, 4, NULL, NULL, 0, 34, 157.76, 136, 0, '2023-07-18 19:28:35', '2023-07-18 19:28:35', 42),
(49, 'Pose de carrelage sol,  ch.  5,44 m2   +WC 1,80 m2  Apart 2  7,24 m2 ', 16, 7, NULL, NULL, 0, 27, 219.24, 189, 0, '2023-07-18 19:28:35', '2023-07-18 19:28:35', 42),
(50, 'Pose de carrelage mur,  douche Apart 4  4,32 m2 ', 16, 4, NULL, NULL, 0, 34, 157.76, 136, 0, '2023-07-18 19:28:35', '2023-07-18 19:28:35', 42),
(51, 'Pose de carrelage mur,  douche Apart 5  4,32 m2 ', 16, 4, NULL, NULL, 0, 34, 157.76, 136, 0, '2023-07-18 19:28:35', '2023-07-18 19:28:35', 42),
(52, 'Pose de carrelage   2m étage  le couloirs   11,05 m2', 16, 11, NULL, NULL, 0, 27, 344.52, 297, 0, '2023-07-18 19:28:35', '2023-07-18 19:28:35', 42),
(53, 'Pose de carrelage mur,  douche Apart 6  4,32 m2 ', 16, 4, NULL, NULL, 0, 34, 157.76, 136, 0, '2023-07-18 19:28:35', '2023-07-18 19:28:35', 42),
(54, 'Etanchéité et l\'isolation de la toiture plate TRAVAUX SUR SURFACE HORIZONTALE -  Membrane d\'étanchéité bi couches Soprastick Venti FF et Membrane Optima 4mm', 16, 1, NULL, NULL, 0, 4500, 5220, 4500, 0, '2023-07-19 19:15:07', '2023-07-19 19:15:07', 43),
(55, 'Nettoyage de une résidence Prestation service de nettoyage pour la somme     696€', 16, 30, NULL, NULL, 0, 20, 696, 600, 0, '2023-07-26 18:58:39', '2023-07-26 18:58:39', 44),
(56, 'Rénovation d\'un maison a Rédange    \nRéférence DEVIS D20230030     Acompte sur le Avancement du facture ', 16, 1, NULL, NULL, 0, 10000, 11600, 10000, 0, '2023-08-09 18:26:13', '2023-08-09 18:26:13', 45),
(57, 'Prestation service de nettoyage par Hor  18', 16, 18, NULL, NULL, 0, 27, 563.76, 486, 0, '2023-08-12 11:52:07', '2023-08-12 11:52:07', 46),
(58, 'Réalisation de colature Reference DEVIS D20230033  1 er avance 50%', 16, 1, NULL, NULL, 0, 1650, 1914, 1650, 0, '2023-09-13 20:16:35', '2023-09-13 20:16:35', 47),
(59, 'Travaux de supplément  chantier  rossignols  \nRéalisation  dalle de béton   ', 16, 1, NULL, NULL, 0, 6000, 6960, 6000, 0, '2023-09-13 20:37:50', '2023-09-13 20:37:50', 48),
(60, 'Posse de carrelage  sol  3e étage 100 m2  2 ch  +4 débarra +couloir + débarra sanitaire + couloir   ', 16, 100, NULL, NULL, 0, 27, 3132, 2700, 0, '2023-09-13 21:39:44', '2023-09-13 21:39:44', 49),
(61, 'pose de carrelage plinthe 3e étage + couloir 2e étage +1e étage 68 ml ', 16, 68, NULL, NULL, 0, 6.5, 512.72, 442, 0, '2023-09-13 21:39:44', '2023-09-13 21:39:44', 49),
(62, 'pose de carrelage  mur  douche   3e étage  6,48 m2', 16, 6, NULL, NULL, 0, 34, 236.64, 204, 0, '2023-09-13 21:39:44', '2023-09-13 21:39:44', 49),
(63, 'pose de carrelage  sol  couloir 1e entage +2e entage  22 m2   ', 16, 22, NULL, NULL, 0, 27, 689.04, 594, 0, '2023-09-13 21:39:44', '2023-09-13 21:39:44', 49),
(64, 'Prestation de service Nettoyage pour hora 27 ', 16, 25, NULL, NULL, 0, 27, 783, 675, 0, '2023-09-27 07:12:53', '2023-09-27 07:12:53', 50),
(65, 'Réalisation de travaux de parking\nRéférence D20230026  ', 16, 1, NULL, NULL, 0, 1500, 1740, 1500, 0, '2023-09-27 07:26:57', '2023-09-27 07:26:57', 51),
(66, 'Prestation du service de Nettoyage  \nle 15/10/23    de   13H00  A   19H00  Total 6 Hor  X 2 =12 Hor', 16, 12, NULL, NULL, 0, 32.76, 456, 393.12, 0, '2023-09-27 08:11:57', '2023-09-27 08:11:57', 52),
(67, 'Prestation du service de Nettoyage  \n le 22/10/23  de 13H00  A 18H30  H   Total 5H30 X2 =11 Hor', 16, 11, NULL, NULL, 0, 32.76, 418, 360.36, 0, '2023-09-27 08:11:57', '2023-09-27 08:11:57', 52),
(68, 'Réalisation de travaux de parking Référence  Devis  D20230026  60% ', 16, 1, NULL, NULL, 0, 900, 1044, 900, 0, '2023-09-27 20:11:07', '2023-09-27 20:11:07', 53),
(69, 'Rénovation d\'un maison  Facture  Acompte pour avancement de travail \nReference DEVIS D20230015  2em  33.33%', 16, 1, NULL, NULL, 0, 4524, 5247.84, 4524, 0, '2023-09-27 20:30:50', '2023-09-27 20:30:50', 54),
(70, 'Rénovation d\'un maison  Facture final pour le travaux réalise  de démolition Reference DEVIS   D20230012  66,66% ', 16, 1, NULL, NULL, 0, 5666, 6572.56, 5666, 0, '2023-09-27 20:41:27', '2023-09-27 20:41:27', 55),
(71, 'Réalisation de pose de clôture finis\nRéférente Devis  D20230033   facture fini', 16, 1, NULL, NULL, 0, 1650, 1914, 1650, 0, '2023-10-01 21:05:43', '2023-10-01 21:05:43', 56),
(72, 'Réalisation de pose de carrelage    \nchantier  rue de Mondorff  Remich n 7 \nLot apt n 4\ntotal pose de carrelages  34  m2', 16, 34, NULL, NULL, 0, 25, 986, 850, 0, '2023-10-02 16:45:35', '2023-10-02 16:45:35', 57),
(73, 'Rénovation  d\' un maison  facture  final Fux plafond Reference Devis D20230045', 16, 1, NULL, NULL, 0, 0, 0, 0, 0, '2023-10-17 10:47:11', '2023-10-17 10:47:11', 58),
(74, 'Rénovation d\'un méson  facture final  faux plafond  \nReference Devis  D20230045', 16, 1, NULL, NULL, 0, 2820, 3271.2, 2820, 0, '2023-10-17 10:56:01', '2023-10-17 10:56:01', 59),
(75, 'Avance à la commande', 16, 1, 0, NULL, NULL, 115, 133.4, 115, 0, '2023-10-18 05:26:43', '2023-10-18 05:26:43', 60),
(76, 'Rénovation d\'un maison  facture de avancement de travail   Rez-de-chaussée  \nRéparations des murs non conformes.\nFaux plafond  .  Référence  Devis  D20230048', 16, 1, NULL, NULL, 0, 7200, 8352, 7200, 0, '2023-10-18 17:14:12', '2023-10-18 17:14:12', 61),
(77, 'Rénovation d\'un maison  a Rédange Reference Devis \n  D20230030   facture final', 16, 1, NULL, NULL, 0, 11655, 13519.8, 11655, 0, '2023-10-18 18:13:01', '2023-10-18 18:13:01', 62),
(78, 'Rénovation d\'un maison  facture de avancement de travail de préparation au premier étagé   Reference  Devis D20230048  ', 16, 1, NULL, NULL, 0, 7000, 8120, 7000, 0, '2023-11-02 11:39:39', '2023-11-02 11:39:39', 63),
(79, 'Debut du travaux...\nTravaux Etancheite\n\nChantier :68-70 rte de Noertrange Wiltz', 16, 1, NULL, NULL, 0, 20000, 23200, 20000, 0, '2023-11-03 09:26:06', '2023-11-03 09:26:06', 64),
(80, 'Travaux Etancheite Toiture et Terrasse   -   Chantier :  17B  rue Michel Thilges Wiltz', 16, 1, NULL, NULL, 0, 10000, 11600, 10000, 0, '2023-11-03 09:31:53', '2023-11-03 09:31:53', 65);

-- --------------------------------------------------------

--
-- Structure de la table `produit_inventaires`
--

CREATE TABLE `produit_inventaires` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `inventaireId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit_ventes`
--

CREATE TABLE `produit_ventes` (
  `id` int(11) NOT NULL,
  `tva` int(11) DEFAULT NULL,
  `quantite` varchar(255) DEFAULT NULL,
  `unite` varchar(255) DEFAULT NULL,
  `prixTTC` varchar(255) DEFAULT NULL,
  `prixHT` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `date_debut` varchar(255) DEFAULT NULL,
  `date_fin` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `projet_employes`
--

CREATE TABLE `projet_employes` (
  `id` int(11) NOT NULL,
  `etat` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `projetId` int(11) DEFAULT NULL,
  `employeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `quantite` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `produitId` int(11) DEFAULT NULL,
  `storeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `taches`
--

CREATE TABLE `taches` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `date_debut` varchar(255) DEFAULT NULL,
  `date_fin` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `projetId` int(11) DEFAULT NULL,
  `employeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `valeur` float DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `taxes`
--

INSERT INTO `taxes` (`id`, `titre`, `description`, `valeur`, `type`, `etat`, `createdAt`, `updatedAt`) VALUES
(1, 'Normal ', 'Baissé de 17 % à 16 %', 16, 1, 1, '2023-03-24 09:49:56', '2023-03-27 00:45:52'),
(2, 'Intermédiaire ', 'Baisse de 14 % à 13 %', 13, 1, 1, '2023-03-24 09:50:05', '2023-03-27 00:46:40'),
(3, 'Réduit ', 'Baisse de 8 % à 7 %', 7, 1, 1, '2023-03-27 00:47:31', '2023-03-27 00:47:31'),
(4, 'Super-réduit', '3%', 3, 1, 1, '2023-03-27 00:48:23', '2023-03-27 00:48:23');

-- --------------------------------------------------------

--
-- Structure de la table `ticket_caisses`
--

CREATE TABLE `ticket_caisses` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `montant_total` varchar(255) DEFAULT NULL,
  `total_ttc` float DEFAULT NULL,
  `total_ht` float DEFAULT NULL,
  `remise_global` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `fodec` float DEFAULT NULL,
  `totalTimbreFiscal` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse_clients`
--
ALTER TABLE `adresse_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientId` (`clientId`);

--
-- Index pour la table `adresse_fournisseurs`
--
ALTER TABLE `adresse_fournisseurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fournisseurId` (`fournisseurId`);

--
-- Index pour la table `auth_modules`
--
ALTER TABLE `auth_modules`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auth_module_permissions`
--
ALTER TABLE `auth_module_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authModuleId` (`authModuleId`),
  ADD KEY `authPermissionId` (`authPermissionId`);

--
-- Index pour la table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auth_roles`
--
ALTER TABLE `auth_roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auth_role_module_permissions`
--
ALTER TABLE `auth_role_module_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authRoleId` (`authRoleId`),
  ADD KEY `authModulePermissionId` (`authModulePermissionId`);

--
-- Index pour la table `auth_users`
--
ALTER TABLE `auth_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authRoleId` (`authRoleId`);

--
-- Index pour la table `auth_user_entreprises`
--
ALTER TABLE `auth_user_entreprises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authUserId` (`authUserId`),
  ADD KEY `entrepriseId` (`entrepriseId`);

--
-- Index pour la table `bon_commandes`
--
ALTER TABLE `bon_commandes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bon_commande_ventes`
--
ALTER TABLE `bon_commande_ventes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projetId` (`projetId`);

--
-- Index pour la table `bon_commande_vente_produits`
--
ALTER TABLE `bon_commande_vente_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `bonCommandeVenteId` (`bonCommandeVenteId`),
  ADD KEY `clientId` (`clientId`);

--
-- Index pour la table `bon_livraison_ventes`
--
ALTER TABLE `bon_livraison_ventes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bon_receptions`
--
ALTER TABLE `bon_receptions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bon_reception_produits`
--
ALTER TABLE `bon_reception_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `bonReceptionId` (`bonReceptionId`),
  ADD KEY `fournisseurId` (`fournisseurId`);

--
-- Index pour la table `bon_retours`
--
ALTER TABLE `bon_retours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `storeId` (`storeId`),
  ADD KEY `from_store_id` (`from_store_id`),
  ADD KEY `to_store_id` (`to_store_id`);

--
-- Index pour la table `bon_transferts`
--
ALTER TABLE `bon_transferts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `storeId` (`storeId`),
  ADD KEY `from_store_id` (`from_store_id`),
  ADD KEY `to_store_id` (`to_store_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authUserId` (`authUserId`);

--
-- Index pour la table `composition_produits`
--
ALTER TABLE `composition_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `composed_product` (`composed_product`),
  ADD KEY `composed_from` (`composed_from`);

--
-- Index pour la table `compte_bancaires`
--
ALTER TABLE `compte_bancaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrepriseId` (`entrepriseId`);

--
-- Index pour la table `devis`
--
ALTER TABLE `devis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `entrepriseId` (`entrepriseId`);

--
-- Index pour la table `echance_devis`
--
ALTER TABLE `echance_devis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deviId` (`deviId`);

--
-- Index pour la table `echance_factures`
--
ALTER TABLE `echance_factures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factureVenteId` (`factureVenteId`);

--
-- Index pour la table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `entreprises`
--
ALTER TABLE `entreprises`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facture_achats`
--
ALTER TABLE `facture_achats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facture_achat_produits`
--
ALTER TABLE `facture_achat_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `factureAchatId` (`factureAchatId`),
  ADD KEY `fournisseurId` (`fournisseurId`);

--
-- Index pour la table `facture_ventes`
--
ALTER TABLE `facture_ventes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `entrepriseId` (`entrepriseId`);

--
-- Index pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inventaires`
--
ALTER TABLE `inventaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `storeId` (`storeId`),
  ADD KEY `employeId` (`employeId`);

--
-- Index pour la table `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `note_credits`
--
ALTER TABLE `note_credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factureVenteId` (`factureVenteId`),
  ADD KEY `entrepriseId` (`entrepriseId`);

--
-- Index pour la table `paiement_achats`
--
ALTER TABLE `paiement_achats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factureAchatId` (`factureAchatId`),
  ADD KEY `compteBancaireId` (`compteBancaireId`);

--
-- Index pour la table `paiement_ventes`
--
ALTER TABLE `paiement_ventes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factureVenteId` (`factureVenteId`),
  ADD KEY `compteBancaireId` (`compteBancaireId`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorieId` (`categorieId`),
  ADD KEY `marqueId` (`marqueId`);

--
-- Index pour la table `produits_devis`
--
ALTER TABLE `produits_devis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deviId` (`deviId`);

--
-- Index pour la table `produits_ticket_caisses`
--
ALTER TABLE `produits_ticket_caisses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `ticketCaisseId` (`ticketCaisseId`),
  ADD KEY `clientId` (`clientId`);

--
-- Index pour la table `produit_achats`
--
ALTER TABLE `produit_achats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `bonCommandeId` (`bonCommandeId`),
  ADD KEY `fournisseurId` (`fournisseurId`);

--
-- Index pour la table `produit_bon_livraisons`
--
ALTER TABLE `produit_bon_livraisons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `bonLivraisonVenteId` (`bonLivraisonVenteId`),
  ADD KEY `clientId` (`clientId`);

--
-- Index pour la table `produit_bon_retours`
--
ALTER TABLE `produit_bon_retours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `bonRetourId` (`bonRetourId`);

--
-- Index pour la table `produit_bon_transferts`
--
ALTER TABLE `produit_bon_transferts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `bonTransfertId` (`bonTransfertId`);

--
-- Index pour la table `produit_facture_ventes`
--
ALTER TABLE `produit_facture_ventes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factureVenteId` (`factureVenteId`);

--
-- Index pour la table `produit_inventaires`
--
ALTER TABLE `produit_inventaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `inventaireId` (`inventaireId`);

--
-- Index pour la table `produit_ventes`
--
ALTER TABLE `produit_ventes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `clientId` (`clientId`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `projet_employes`
--
ALTER TABLE `projet_employes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projetId` (`projetId`),
  ADD KEY `employeId` (`employeId`);

--
-- Index pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitId` (`produitId`),
  ADD KEY `storeId` (`storeId`);

--
-- Index pour la table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `taches`
--
ALTER TABLE `taches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projetId` (`projetId`),
  ADD KEY `employeId` (`employeId`);

--
-- Index pour la table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ticket_caisses`
--
ALTER TABLE `ticket_caisses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse_clients`
--
ALTER TABLE `adresse_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `adresse_fournisseurs`
--
ALTER TABLE `adresse_fournisseurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_modules`
--
ALTER TABLE `auth_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `auth_module_permissions`
--
ALTER TABLE `auth_module_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `auth_roles`
--
ALTER TABLE `auth_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `auth_role_module_permissions`
--
ALTER TABLE `auth_role_module_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=987;

--
-- AUTO_INCREMENT pour la table `auth_users`
--
ALTER TABLE `auth_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `auth_user_entreprises`
--
ALTER TABLE `auth_user_entreprises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `bon_commandes`
--
ALTER TABLE `bon_commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bon_commande_ventes`
--
ALTER TABLE `bon_commande_ventes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bon_commande_vente_produits`
--
ALTER TABLE `bon_commande_vente_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bon_livraison_ventes`
--
ALTER TABLE `bon_livraison_ventes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bon_receptions`
--
ALTER TABLE `bon_receptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bon_reception_produits`
--
ALTER TABLE `bon_reception_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bon_retours`
--
ALTER TABLE `bon_retours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bon_transferts`
--
ALTER TABLE `bon_transferts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `composition_produits`
--
ALTER TABLE `composition_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte_bancaires`
--
ALTER TABLE `compte_bancaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `devis`
--
ALTER TABLE `devis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `echance_devis`
--
ALTER TABLE `echance_devis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT pour la table `echance_factures`
--
ALTER TABLE `echance_factures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `employes`
--
ALTER TABLE `employes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entreprises`
--
ALTER TABLE `entreprises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `facture_achats`
--
ALTER TABLE `facture_achats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `facture_achat_produits`
--
ALTER TABLE `facture_achat_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `facture_ventes`
--
ALTER TABLE `facture_ventes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `inventaires`
--
ALTER TABLE `inventaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `marques`
--
ALTER TABLE `marques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `note_credits`
--
ALTER TABLE `note_credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `paiement_achats`
--
ALTER TABLE `paiement_achats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paiement_ventes`
--
ALTER TABLE `paiement_ventes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produits_devis`
--
ALTER TABLE `produits_devis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;

--
-- AUTO_INCREMENT pour la table `produits_ticket_caisses`
--
ALTER TABLE `produits_ticket_caisses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_achats`
--
ALTER TABLE `produit_achats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_bon_livraisons`
--
ALTER TABLE `produit_bon_livraisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_bon_retours`
--
ALTER TABLE `produit_bon_retours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_bon_transferts`
--
ALTER TABLE `produit_bon_transferts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_facture_ventes`
--
ALTER TABLE `produit_facture_ventes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `produit_inventaires`
--
ALTER TABLE `produit_inventaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_ventes`
--
ALTER TABLE `produit_ventes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projets`
--
ALTER TABLE `projets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projet_employes`
--
ALTER TABLE `projet_employes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `taches`
--
ALTER TABLE `taches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `ticket_caisses`
--
ALTER TABLE `ticket_caisses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
