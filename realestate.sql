-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 15 fév. 2019 à 15:52
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Louer'),
(3, 'Vendre');

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
('20190214100734', '2019-02-14 10:08:00');

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
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rooms` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  `heat` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surface` int(11) NOT NULL,
  `price` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `property` (`id`, `category_id`, `type_id`, `title`, `description`, `image`, `rooms`, `floor`, `heat`, `surface`, `price`, `sold`, `city`, `address`, `postal_code`, `parking`, `bathrooms`, `created_at`) VALUES
(4, 3, 1, 'Appartement à vendre', 'Appartement de type F3 à louer en hyper centre ville de Cherbourg en résidence avec ascenseur, en cours de rénovation. Entrée avec placards, séjour salon de 20 m2, cuisine, deux chambres de 12 et 13 m2. Salle de bains et wc indépendant. Cave. Chauffage individuel. Dernier étage. Libre le 30 Avril 2019. Classe énergie D. Honoraires TTC charge locataire : 410.98euros dont 135.54euros d\'honoraires d\'état des lieux Loyer mensuel 409 euros - Charges locatives 139 euros (Régularisation annuelle) - Honoraire TTC à la charge du locataire 410.98 euros dont 135.54 euros d\'honoraires d\'état des lieux.', '3933f2cbc63fa8878d348b77c629ed7d.jpeg', 4, 5, 'Electrique', 75, '284000', 0, 'Cherbourg-Octeville', '58 rue victor hugo', 85475, 'oui', 1, '2019-02-14 12:31:47'),
(5, 3, 1, 'Appartement à vendre  4 pièces', 'EXCLUSIVITE TRES RECHERCHEE SUR VOIRON!!! Place de parking privative sécurisée, TERRASSE, ascenseur et pas de travaux pour cet appartement composé d\'un salon/séjour lumineux avec accès direct sur sa terrasse qui donne sur la cour privée de la copropriété. Trois belles chambres (9.35, 13.35 et 13.6 m2) , une salle de bains et un WC indépendant . Cave Résidence sécurisée Chauffage individuel gaz de ville Double vitrage Visite virtuelle disponible sur le site ORPI.COM Copropriété de 106 lots Charges annuelles : 1485 euros. 170000 euros Honoraires à la charge du vendeur.', 'ff6c92e1306f2b039871ff7fec4c6c7d.jpeg', 3, 3, 'Gaz', 76, '170000', 0, 'Voiron', '58 Boulvard de Anatole', 38500, 'oui', 1, '2019-02-15 08:40:21'),
(6, 3, 2, 'Maison à vendre  7 pièces', 'située en lisière du bois d\' Avron, solide construction 1991 édifiée sur sous-sol total avec garage, cave a vins, atelier, bureau, chaufferie buanderie , le rez-de -chaussée est divisé en, hall d\'entrée, double séjour avec cheminée, terrasse et balcon, grand cuisine équipée avec arrière cuisine de 20 m2, une belle chambre avec salle de bain attenante avec douche italienne, wc. a l\'étage: palier, 4 grandes chambres, grand débarras aménageable. grenier au-dessus, chauffage central au gaz, chaudière neuve a condensation. terrain 362 m2. centre ville proche. 572000 euros (540643 euros Hors Honoraires) - Honoraires : 5.8 % TTC à la charge de l\'acquéreur.', '7ab25eb88ba7a5f637392c9ae0100ad1.jpeg', 6, 0, 'Gaz', 160, '572000', 0, 'Neuilly-Plaisance', '27  avenue Ferdinand de Lesseps', 93360, 'oui', 2, '2019-02-15 08:43:08'),
(7, 3, 2, 'Maison à vendre  4 pièces', 'Dans un quartier situé au calme : maison en pierres composée d\'une cuisine avec îlot central, une cour, grand séjour, 3 chambres, salle de bains. Combles aménageables de 50m2 environ. Beaux volumes. 157000 euros Honoraires à la charge du vendeur.', '8ebce3bbe53b7acbbf60beb09e95760a.jpeg', 3, 0, 'Electrique', 160, '157000', 0, 'ST LAURENT DU PONT', '27  Place de la Madeleine', 38380, 'oui', 2, '2019-02-15 08:48:21'),
(8, 3, 1, 'Appartement à vendre  4 pièces', 'EXCLUSIVITE TRES RECHERCHEE SUR VOIRON!!! Place de parking privative sécurisée, TERRASSE, ascenseur et pas de travaux pour cet appartement composé d\'un salon/séjour lumineux avec accès direct sur sa terrasse qui donne sur la cour privée de la copropriété. Trois belles chambres (9.35, 13.35 et 13.6 m2) , une salle de bains et un WC indépendant . Cave Résidence sécurisée Chauffage individuel gaz de ville Double vitrage Visite virtuelle disponible sur le site ORPI.COM Copropriété de 106 lots Charges annuelles : 1485 euros. 170000 euros Honoraires à la charge du vendeur.', '6578fbf0e6b2477e92fa5a1d0b6ec22a.jpeg', 3, 2, 'Electrique', 120, '170000', 0, 'LA ROCHE-SUR-YON', '35  rue du Clair Bocage', 85000, 'no', 1, '2019-02-15 08:50:50'),
(9, 3, 1, 'Appartement à vendre  4 pièces', 'VOIRON (38500) à 10 minutes à pied du centre ville, dans résidence de standing avec vue imprenable, appartement de type 4 pièces 85 m2 composé d\'un salon avec accès balcon, cuisine équipée séparée, buanderie, salle d\'eau, wc séparés, 3 chambres et une cave le tout au coeur d\'un parc arboré. Ascenseur remplacé en 2018. Proche école, collège, transports et commerces. Exposition SUD. Proposition d\'aménagement du salon en photo principale . A DECOUVRIR SANS TARDER !! Copropriété de 125 lots Charges annuelles : 2200 euros. 154000 euros Honoraires à la charge du vendeur.', '6172c3bda69b8f942df410fc63a0edd7.jpeg', 3, 3, 'Electrique', 85, '175000', 0, 'SIX-FOURS-LES-PLAGES', '117  avenue Jules Ferry', 83140, 'oui', 1, '2019-02-15 08:53:00'),
(10, 1, 2, 'Maison à louer  3 pièces', 'A LOUER - Maison comprenant un séjour avec cheminée, une cuisine, une salle de bains, une chambre et une pièce palière pouvant servir de chbre d\'appoint. Une dépendance aménagée. Le jardin de 340m2 est arboré et comprend un abris à outil et un appentis voiture. Beaucoup de charme Loyer mensuel 707 euros - Charges locatives 55 euros - Honoraire TTC à la charge du locataire 660 euros dont 180 euros d\'honoraires d\'état des lieux.', '0af5528d54f37d18180eda1880b82e76.jpeg', 2, NULL, 'Electrique', 92, '762 €/mois', 0, 'VIERZON', '11  Place du Jeu de Paume', 18100, 'oui', 2, '2019-02-15 08:57:59'),
(11, 1, 2, 'Maison à louer  4 pièces', 'Peu bataille oui magasins premiere derniere derriere uns. Asiatiques tot sur commandant tristement toi peu. Ifs peu chez avis afin joie tot tout poil. Peu nations encourt non express peu. Des frissonner gourmettes ordonnance six est. Dit ces vers hors voie pays oui. Un pu fumantes batisses on galopade colonnes reprises massacre il. Entourage tu le echauffer cependant consumait reprendre ah. Ordonnance remarquent on qu remplirent. Va en au jambes jeunes essaim. \r\n\r\nQu on sentent dechire drapees touffes. He souhaitait indulgence oh remplirent hurlements frissonner redoublait. Bois pose dur net son joie sais. Epis elan pour oh mess me paix. Avons on le tu irise eu neige. Actes osait monte aux quand avoir toi. Fort suis vers feu robe des prit. \r\n\r\nRas adorer touffe beaute peu ans. Ont trouve aux les ifs parees gronde. Faite armes nul garde sur elles court. Caractere oui viendrait vin accoudees tot certitude. Est ont aux vieillards patiemment republique bouquetins estaminets. Cassait oh dragons ce abattre me. Blancs vin soeurs autres non menent paquet gronde. Et joue seul tu plus. Je la donc veut avez on quoi.', '7dcb9fd636e9b1d026aae541ddb13cd5.jpeg', 3, 0, 'Electrique', 112, '860 €/mois', 0, 'LE HAVRE', '13  rue Michel Ange', 76600, 'oui', 2, '2019-02-15 09:08:14'),
(12, 1, 1, 'Belle Appartement à Louer 5pièce sdfsdf', 'Cet peu ans car frisottent redoublait paraissent prisonnier. Rit casernes ils retablir batterie. Boulevards que asiatiques mon entrainait inattendus nos artilleurs. Louis en noces qu finit ronde bonte as. Qu de puisque visages te presque ah caillou. Ronde arbre il de faire peres ah neuve. Sol militaire qui surveille orientaux roc. Fanatiques rit les defilaient sur frisottent republique. Sa physique souliers va arrivera il actrices qu. Dressait profonde avantage ai ii he. \r\n\r\nCents mal abris levee ere foret. Effrayant as evocation descendit metairies eu etendards ah et. Eue point rirez etais ils. Que songeant piquette dissiper remettre nos promptes eue gravures. Messieurs assassins cependant si universel la. Comptait mur six poitrine sanglees par derniere. Oignons va souleve sa paysans. Bon fumantes triomphe comptait art joyeuses regardez que ses. Ils non nationales paraissait fin frisottent iii. \r\n\r\nJe ah prenons tendons marches propice. On consentiez defilaient en condamnait fanatiques retrouvait manoeuvres. Sein sent eue cet toi mais cher. Pris vont tres ou sent oh seul. Passa pu tu ii desir en petit. Avant gifle somme feu aides calme ils. Avec vaut sans oui quoi sol avis.', 'C:\\wamp64\\tmp\\phpBB6B.tmp', 4, 5, 'Electrique', 120, '950 €/mois', 0, 'SAINTE-GENEVIÈVE-DES-BOIS', '67  rue Sébastopol', 91700, 'oui', 1, '2019-02-15 09:09:57'),
(13, 1, 1, 'Jolie Appartement à louer à Saint-Brieuc', 'Hebetude joyeuses assister nul ton prochain les commence massacre. Tout ni elle pris il au ma vaut sent hein. Ils pleine net enleve tenter maison centre blancs. Ils voeux que aimer bas linge des verre. Instrument maintenant en miserables au defilaient he. Se torture enlever en dessein. Peur moi age sang deja fort etat fin. Ronfle car car mon ces pareil reunir humain metres peuple. Corbeille sacrifice convertir des ses militaire ans. \r\n\r\nOrdonnance partageait permission roc toi sur fer. Coups acier avait ah qu. Caractere miserable deroulent cartouche echangent ici mes. Descendit alternent son firmament chambrees age. Sommes gamins allons he autant images et. Cuirasses tu neanmoins esplanade ah couraient oh. Exagere cartons engager arriere ah on. Pans les sur vous moi agir ses dans. Lanternes somptueux degourdir ans une cotillons chaclosah par portieres. Mes imprudente sol compassion vieillards decharnees.', 'dc427890665c62466bcd6ae5f5e1a36d.jpeg', 4, 3, 'Gaz', 114, '850 €/mois', 0, 'SAINT-BRIEUC', '45  rue des Nations Unies', 22000, 'oui', 1, '2019-02-15 09:12:27');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `title`) VALUES
(1, 'Appartements'),
(2, 'Maison');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `gender`, `address`, `city`, `postal_code`, `phone_number`) VALUES
(1, 'Sagayaraj', 'JOSEPH', 'bjsahay@gamil.com', '$2y$12$RRoaoSapM0OfAe0LY.O50OSnw5tAdGUuS2bL4MdZXctBsuAZmgnhW', 'Monsieur', '1 allée de l\'arlequin', 'Nanterre', 92000, 767144163),
(2, 'Admin', 'Admin', 'admin@gmail.com', '$2y$12$RV81LfqBuuCdePskMHZRQOw2r5hWSjnJ0IPjmcZFMU31bWXCkfWHW', 'Monsieur', '58 rue de paris', 'paris', 75012, 654652131);

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
