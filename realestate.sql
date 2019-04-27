-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 27 avr. 2019 à 06:40
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `realestate`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Louer'),
(8, 'Vendre');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5F9E962AA76ED395` (`user_id`),
  KEY `IDX_5F9E962A549213EC` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190421222253', '2019-04-21 22:23:04'),
('20190426093007', '2019-04-26 09:31:06');

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `rooms` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  `heat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surface` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold` tinyint(1) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` int(11) NOT NULL,
  `parking` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bathrooms` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8BF21CDE12469DE2` (`category_id`),
  KEY `IDX_8BF21CDEC54C8C93` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `category_id`, `type_id`, `title`, `description`, `filename`, `updated_at`, `rooms`, `floor`, `heat`, `surface`, `price`, `sold`, `city`, `address`, `postal_code`, `parking`, `bathrooms`, `created_at`) VALUES
(4, 1, 1, 'sdfsdf', 'sdfsdf', '5cbd8f504b61c763182689.jpg', '2019-04-22 09:54:24', 2, 1, 'Electrique', 54, '25487', 0, 'sdfs', 'sdfsdf', 95, 'oui', 1, '2019-04-22 09:34:47'),
(5, 1, 1, 'Appartement à louer', 'Compiègne, à proximité de l\'UTC et du centre ville, grand studio de 34.29m2 comprenant une entrée avec placard, une pièce de vie , une cuisine séparée, une salle de bains et WC. Une cave privative. Eau chaude - eau froide - chauffage collectif Disponible mi juillet Loyer mensuel 403 euros - Charges locatives 100 euros (Régularisation annuelle) - Honoraire TTC à la charge du locataire 374 euros dont 102 euros d\'honoraires d\'état des lieux.', '5cbd8bc27684e846590445.jpg', '2019-04-22 09:39:13', 3, 3, 'Electrique', 34, '503', 0, 'Compiègne', 'sdfsdfsdf', 85974, 'oui', 1, '2019-04-22 09:39:13'),
(6, 1, 1, 'Appartement à louer - Alençon', 'Alençon, proche centre ville - gare, dans résidence sécurisée avec parking, espaces verts, piscine : T2 comprenant pièce de vie ouverte sur cuisine aménagée / équipée, salle de bains, chambre avec placards. Nombreux rangements. Balcon, place de parking LIBRE MI MAI Exclusivité ORPI Foch Immobilier : 02.33.32.70.80 Loyer mensuel 380 euros - Charges locatives 40 euros - Honoraire TTC à la charge du locataire 312.8 euros dont 103.8 euros d\'honoraires d\'état des lieux.', '5cbd8c2b8e651371728998.jpg', '2019-04-22 09:40:59', 1, 1, 'Gaz', 34, '460', 0, 'Alençon', 'sdfsd', 95200, 'oui', 1, '2019-04-22 09:40:59'),
(7, 1, 1, 'Appartement à louer - Ozoir-la-Ferrière', 'Ozoir centre ville, au calme, au 2 ème et dernier étage avec ascenseur d\'une petite résidence de standing BBC de 2013 ( basse consommation), adorable 2 pièces en duplex de 39m2 habitables ( 50 m2 au sol), comprenant, beau séjour, coin cuisine aménagé, grande chambre avec placard, salle de bains, wc. Garage fermé. Chauffage au sol par pompe à chaleur. Très belles prestations. Loyer 750 euros chauffage et eaux compris. LIBRE LE 18 MAI 2019 Loyer mensuel 600 euros - Charges locatives 150 euros - Honoraire TTC à la charge du locataire 507 euros dont 117 euros d\'honoraires d\'état des lieux.', '5cbd8c6344b40300552103.jpg', '2019-04-22 09:41:55', 3, 5, 'Gaz', 87, '750', 0, 'Ozoir-la-Ferrière', 'sdfsdf', 25487, 'no', 1, '2019-04-22 09:41:55'),
(8, 1, 1, 'Appartement à louer - Châtillon', 'CHATILLON- Dans un quartier pavillonnaire au calme et à 5mn du métro Ligne 13 au pied du tram T6 Dans une résidence récente de standing, magnifique 2/3 pièces de 45m2 comprenant : Entrée, cuisine aménagée et équipée, séjour, 1 chambres, dressing, salle d\'eau avec wc et cave Chauffage et eau chaude collectifs Disponible début mai Loyer mensuel 930 euros - Charges locatives 130 euros - Honoraire TTC à la charge du locataire 669 euros dont 133.8 euros d\'honoraires d\'état des lieux.', '5cbd8c931f3c1494765934.jpg', '2019-04-22 09:42:42', 3, 8, 'Electrique', 68, '1060', 0, 'Châtillon', 'sdfsd', 57984, 'oui', 1, '2019-04-22 09:42:42'),
(9, 1, 1, 'Appartement à louer - Fontainebleau', 'Résidence LE JAGUAR - Idéalement située à proximité des grands axes, de la foret et des écoles ; à 800 mètres de l\'hyper centre et à 500 mètres du complexe sportif. Nous vous proposons un appartement neuf livré en 2016 dans cette petite copropriété de 13 appartements avec ascenseur, parking en sous-sol, vidéophone. Quarante quatre mètres carrés organisés en une très belle pièce à vivre équipée d\'une magnifique cuisine aménagée (hotte, plaque, four, micro ondes), belle entrée avec dressing, spacieuse salle d\'eau contemporaine carrelée du sol au plafond éclairée par une grande porte fenêtre. Wc séparés. Parking en sous-sol. Disponible à compter du 21.07.2019. Loyer : 677 euros + provisions pour charges : 50 euros - Dépôt de garantie : 677 euros - Honoraires : 484 euros. Loyer mensuel 677 euros - Charges locatives 50 euros - Honoraire TTC à la charge du locataire 484 euros dont 132 euros d\'honoraires d\'état des lieux.', '5cbd8cd15380d692270381.jpg', '2019-04-22 09:43:45', 3, 3, 'Electrique', 58, '727', 0, 'Fontainebleau', 'sdfsdf', 78954, 'oui', 1, '2019-04-22 09:43:45'),
(10, 1, 1, 'Appartement à louer -  Compiègne', 'COMPIEGNE Centre Ville, à deux pas de l\'UTC Studio entièrement refait de 19m2 se composant d\'une pièce de vie principale, un coin kitchenette, une salle de bains avec WC. Petite mono-propriété calme et très bien placée ! Idéal étudiant !! Disponible mi juillet Loyer mensuel 350 euros - Charges locatives 25 euros (Régularisation annuelle) - Honoraire TTC à la charge du locataire 209 euros dont 57 euros d\'honoraires d\'état des lieux.', '5cbd8d006b311145823682.jpg', '2019-04-22 09:44:32', 2, 4, 'Electrique', 19, '375', 0, 'Compiègne', 'sdfsdf', 95487, 'no', 1, '2019-04-22 09:44:32'),
(11, 8, 16, 'Maison à vendre - Les Mathes', 'LA PALMYRE, dans une résidence boisée avec piscine, à 400 m du Centre Ville. VILLA comprenant : Séjour avec coin cuisine équipée, Chambre, Salle d\'eau et wc séparé. A l\'étage : une Mezzanine. Grande TERRASSE et PARKING privé. Classe Energie : D Copropriété de 477 lots Charges annuelles : 840 euros. 138450 euros (130000 euros Hors Honoraires) - Honoraires : 6.5 % TTC à la charge de l\'acquéreur.', '5cbd976c582f2311014836.jpg', '2019-04-22 10:28:59', 3, NULL, 'Gaz', 45, '138450', 0, 'Les Mathes', 'sdfsdf', 56874, 'oui', 2, '2019-04-22 10:28:56'),
(12, 8, 16, 'Maison à vendre - La Crau', 'LES MATHES, au calme, à proximité du Centre Ville. Belle MAISON dans une petite résidence avec peu de charges et comprenant : Séjour avec belle Cuisine ouverte équipée, 2 Chambres avec placard, Mezzanine, Salle d\'eau et wc séparé. COUR en façade et une belle TERRASSE avec store électrique et JARDINET sur l\'arrière. PARKING privé et LOCAL à vélos. Classe Energie : D Copropriété de 40 lots Charges annuelles : 252 euros. 220495 euros (209000 euros Hors Honoraires) - Honoraires : 5.5 % TTC à la charge de l\'acquéreur.', '5cbd97ba275ef732094179.jpg', '2019-04-22 10:30:18', 3, 0, 'Gaz', 62, '220495', 0, 'La Crau', 'sdfsd', 65874, 'oui', 2, '2019-04-22 10:30:17'),
(13, 8, 16, 'Maison à vendre - Saint-Palais-sur-Mer', 'SAINT PALAIS SUR MER, à environ 1,4 km Plage et 800 m Commerces. MAISON à rafraîchir comprenant de plain-pied : Entrée et dégagement avec placards, Séjour en L avec cheminée ouvrant sur une autre pièce avec cheminée, Cuisine, 3 Chambres (dont 2 avec placard), Salle d\'eau et wc séparé avec lave-mains. Grand GARAGE de 63 m2 en sous-sol et ABRI voiture de 30 m2 attenant à la maison. Superbe TERRAIN clos de 2168 m2 avec Abris de jardin. 365750 euros (350000 euros Hors Honoraires) - Honoraires : 4.5 % TTC à la charge de l\'acquéreur.', '5cbd980ac250f358226158.jpg', '2019-04-22 10:31:38', 4, 0, 'Electrique', 134, '365750', 0, 'Saint-Palais-sur-Mer', 'sdfsdf', 68747, 'oui', 2, '2019-04-22 10:31:38');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `title`) VALUES
(1, 'Appartement'),
(16, 'Maison');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` int(11) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `gender`, `address`, `city`, `postal_code`, `phone_number`, `status`, `is_active`, `roles`) VALUES
(1, 'Sagayaraj', 'Joseph', 'bjsahay@gmail.com', '$2y$12$aCIfc/F5j4UXIlHRWrUOted3LT8Cy4Inw8ob0WDvUdK1bNj5triZO', 'Monsieur', '11 allée de l\'arlequin', 'nanterre', 92000, 767144163, 'admin', 1, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),
(2, 'sylvie', 'joseph', 'sylvie@gmail.com', '$2y$12$zku8xY92lvNKmRPNT31Pd.D3DHX8OV3L56a4/oRy6f2g4iVxIpQ1i', 'Madame', '147 hello', 'pari', 75012, 21356487, 'user', 1, 'a:1:{i:0;s:9:\"ROLE_USER\";}');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962A549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  ADD CONSTRAINT `FK_5F9E962AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_8BF21CDEC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
