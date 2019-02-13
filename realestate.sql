-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 13 fév. 2019 à 15:57
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
  `rent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `rent`, `sale`) VALUES
(25, 'dolorum', 'cum'),
(26, 'voluptas', 'voluptatem'),
(27, 'magnam', 'quod'),
(28, 'nihil', 'impedit'),
(29, 'optio', 'repellendus'),
(30, 'blanditiis', 'enim');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5F9E962AA76ED395` (`user_id`),
  KEY `IDX_5F9E962A549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `author`, `content`, `created_at`, `user_id`, `property_id`) VALUES
(58, 'Paulette', 'Soluta aut incidunt facere distinctio deleniti sequi et aut. Qui excepturi sunt ducimus. Ut accusamus sed ut cupiditate excepturi nihil laboriosam.', '2018-10-23 15:13:11', 100, 582),
(59, 'Eugène', 'Vero animi inventore rerum eum veritatis voluptatum facilis. Dicta ut velit sit culpa eum eveniet.', '2018-10-14 02:46:58', 100, 582),
(60, 'Margaret', 'Fuga vel in nam. Est aspernatur libero mollitia aut. Culpa cum quia odio et error asperiores blanditiis.', '2019-01-13 18:05:47', 100, 582),
(61, 'Zoé', 'Minus et harum officia sed. Et voluptatem amet eos aut dolores doloremque. Dolores impedit magni repudiandae quo tempore labore et. Ut a quia autem quam amet dolorem.', '2018-08-16 18:34:15', 100, 582),
(62, 'Paulette', 'Ut illum adipisci reprehenderit incidunt. Et debitis est dolorum labore voluptatem. Illo nihil necessitatibus debitis ut.', '2018-09-02 02:07:43', 100, 582),
(63, 'Margaux', 'Ea consequuntur vitae doloribus hic. Perferendis qui et omnis qui aut dolor. Quis aut et aperiam animi ipsa nihil. Et excepturi voluptatem dignissimos soluta enim.', '2018-10-09 12:14:29', 101, 582),
(64, 'Gabriel', 'Ducimus repellat quia voluptas sint accusantium voluptatem. Et accusantium non error. Officiis reprehenderit molestias laborum commodi earum. Itaque quidem reprehenderit deleniti quam.', '2018-11-12 11:48:14', 101, 582),
(65, 'André', 'Perferendis vel dignissimos sint ut qui ad doloremque velit. Impedit enim ut maxime eum corrupti quas. Quos quisquam qui itaque quia blanditiis omnis consequatur qui. Quia eligendi recusandae reiciendis sed voluptatem voluptatem ullam.', '2018-11-18 05:12:25', 101, 582),
(66, 'Frédérique', 'Repellat non recusandae voluptas aperiam. Exercitationem earum ex ducimus. Corrupti necessitatibus voluptates excepturi laboriosam omnis corrupti quaerat. Vel ipsum aperiam omnis recusandae minima debitis. Atque distinctio quasi rerum.', '2018-08-31 10:15:11', 101, 582),
(67, 'Maryse', 'Adipisci atque ipsam eaque nulla consectetur recusandae autem. Et natus deserunt commodi minus magni mollitia. Amet cupiditate dolor est at maiores iure cum. Et blanditiis id et molestias mollitia.', '2018-10-26 06:35:54', 101, 582),
(68, 'Guy', 'Quasi dolore delectus assumenda enim soluta. Qui facilis quibusdam illo laboriosam consequatur. At iste fugit animi iusto.', '2018-12-11 16:59:59', 101, 582),
(69, 'Richard', 'Saepe veniam cumque repellendus. Dolor quia consectetur et est. In deserunt sunt temporibus molestiae voluptatem enim. Consequatur consequuntur dolore dolorem at commodi.', '2018-12-07 10:14:56', 102, 582),
(70, 'Georges', 'Ducimus et sapiente quaerat dignissimos. Incidunt sint consequatur asperiores qui et. Autem dolores a et velit illum adipisci. Et id et atque et.', '2019-01-07 23:39:02', 102, 582),
(71, 'Thibault', 'Rerum deleniti aut doloremque iure sapiente quo fugiat. Velit mollitia qui quidem qui eaque quia molestiae. Ut eveniet omnis voluptates autem vitae expedita enim. Temporibus natus incidunt molestiae repellat rerum corrupti atque totam.', '2018-08-17 08:11:54', 102, 582),
(72, 'Adèle', 'Delectus tempora doloribus impedit sed molestias est. Aliquid deleniti deleniti ad totam aperiam mollitia voluptas doloremque. Est voluptas nisi voluptates et rerum et. Vel illo nam eius eum cupiditate quia.', '2018-12-23 16:33:50', 102, 582),
(73, 'Charlotte', 'Minima deleniti eligendi velit dolorem pariatur quas et consequatur. Deserunt fuga voluptas doloremque voluptatibus ipsa deserunt. Est voluptate vel aliquam eum consequuntur odit. Recusandae sequi eos provident. Qui eos nihil et dignissimos molestiae odio.', '2018-09-21 01:44:42', 102, 582),
(74, 'Adélaïde', 'Et quasi officiis tenetur ea ea. Dolores vel laborum dolorem et voluptates. Fugit assumenda aut provident voluptas fugit suscipit est. Sed earum ratione ut omnis qui.', '2018-09-04 17:08:38', 102, 582),
(75, 'Victor', 'Reprehenderit est qui fugiat. Blanditiis et aut odit sit sequi. Ipsa est porro assumenda sed dolor.', '2018-09-17 01:42:26', 103, 582),
(76, 'Adélaïde', 'Molestias enim libero corrupti repellendus minus minus. Sequi accusantium unde asperiores. Sequi et debitis nostrum eligendi deserunt cumque. Consequatur deleniti illo doloremque molestiae.', '2019-02-06 02:51:25', 103, 582),
(77, 'Noémi', 'Odit est doloribus voluptas quidem. Ipsam quos cumque velit labore dolorem nisi. Tempora ad corrupti atque explicabo quia voluptatem aut. Voluptates quia rerum eum.', '2018-08-16 16:18:48', 103, 582),
(78, 'Anne', 'Asperiores aut nostrum eaque alias maxime. Aspernatur quae rerum et perspiciatis soluta voluptatem autem. Velit explicabo minus atque laborum. At rerum repudiandae quisquam officia.', '2018-12-02 21:16:32', 103, 582),
(79, 'Amélie', 'Ad ut nihil dolorem. Accusamus nisi quidem numquam numquam est nihil quod. Iste numquam officia consequatur illo totam quos est. Quod est voluptas sed numquam molestias enim ut.', '2019-01-09 02:28:10', 103, 582),
(80, 'Julie', 'Minima consequuntur fuga aliquam unde voluptatem. Animi quaerat recusandae maiores. Provident dignissimos omnis non ut voluptatem. Nobis est fugit aliquid sit iste.', '2018-12-12 09:33:41', 103, 582),
(81, 'Lucy', 'Nemo voluptas facilis eos perspiciatis. Provident voluptate iste dolores ipsa. Omnis nobis nisi minima. Sunt vero tempora fugiat hic sit.', '2018-08-22 07:29:24', 103, 582),
(82, 'Charlotte', 'Iusto quidem enim velit voluptatem. Dolorem corrupti aut ad vero omnis hic.', '2018-09-05 06:33:57', 104, 582),
(83, 'Joséphine', 'Unde sint nisi quos sit est aspernatur ad. Aut incidunt est adipisci laboriosam delectus distinctio. Ex qui veritatis necessitatibus repellat odio nemo.', '2018-09-17 05:32:36', 104, 582),
(84, 'Gabriel', 'Odio laudantium ea dignissimos rem dolor. Tempora dolorem unde minus eligendi pariatur molestiae est.', '2018-10-08 04:53:01', 104, 582),
(85, 'Alexandria', 'Fugiat est rerum expedita cupiditate praesentium eum est. Architecto deserunt a consectetur modi. Ab non consequatur sunt excepturi quo magnam impedit. Officia adipisci qui quis iure et quam et.', '2018-10-20 10:30:14', 104, 582),
(86, 'Laure', 'Rerum atque iure est modi omnis omnis. Cum omnis animi laborum magni enim commodi. Maxime voluptatum saepe dicta hic.', '2018-09-16 22:03:47', 104, 582),
(87, 'Théophile', 'Nam fugit quos ut deleniti. Dolore suscipit et temporibus ut. Illo amet autem fugiat cum odit nesciunt omnis. Ullam enim quia omnis illo.', '2018-10-12 12:18:14', 104, 582),
(88, 'Monique', 'Nihil quos fugiat aut. Voluptatum temporibus sit repellat ut eum velit. Unde consequuntur in dolor accusamus ut alias. Doloribus quo et laudantium. Et molestiae doloremque rerum aspernatur.', '2018-10-01 23:40:55', 104, 582),
(89, 'Jacques', 'Aspernatur sit perspiciatis perspiciatis velit. Autem dolorem inventore sunt ut. Deserunt molestias cumque quas ut voluptatem.', '2018-11-01 10:54:57', 105, 582),
(90, 'Édith', 'Sequi reprehenderit itaque eum rerum. Dolorem eum sapiente laboriosam sed perferendis eligendi. Eum quae recusandae porro et perspiciatis nemo.', '2018-11-22 23:25:46', 105, 582),
(91, 'Pauline', 'Placeat et quasi temporibus nostrum ut quae aut. Facere nulla fugit quaerat laboriosam totam. Aut cumque consequatur sapiente ea voluptatum ut mollitia et.', '2018-08-22 20:43:46', 105, 582),
(92, 'Robert', 'Ab error sapiente cupiditate quae eveniet. Placeat animi sequi cupiditate. Quam excepturi voluptas repellat perspiciatis.', '2018-11-12 06:59:49', 105, 582),
(93, 'Jean', 'Ut occaecati quis nobis magnam est. Dignissimos blanditiis eaque veritatis qui non praesentium necessitatibus. Aliquid quo ut ullam natus. Nemo corporis numquam reprehenderit enim.', '2018-12-14 08:15:11', 105, 582),
(94, 'Frédéric', 'Porro vero occaecati debitis maxime blanditiis. Corrupti ipsa rerum aut aut odio possimus qui nemo. Laboriosam illum et aspernatur.', '2018-12-27 23:23:52', 106, 582),
(95, 'Claudine', 'Suscipit earum pariatur sed unde. Error qui deleniti sint non. Autem totam numquam et et.', '2018-08-27 13:31:59', 106, 582),
(96, 'Diane', 'Laborum porro sequi quo. Magnam ad molestias voluptas similique sequi voluptate. Sed minus nihil exercitationem quo. Iste blanditiis modi dolores qui autem.', '2018-12-02 03:03:02', 106, 582),
(97, 'Émilie', 'Rerum provident quasi dolores. Porro animi occaecati quia facilis natus quas. Ea deleniti fugiat dolor sint consequatur id officia.', '2018-12-30 04:27:27', 106, 582),
(98, 'Agathe', 'Et ullam rem cum. Rem nesciunt nesciunt officia sit fuga. Ratione repellendus autem perspiciatis voluptas.', '2019-02-05 19:32:25', 106, 582),
(99, 'Thomas', 'Labore vero architecto similique illum reiciendis. Maxime eum ut omnis ipsam aut impedit fuga.', '2019-01-07 13:04:33', 106, 582),
(100, 'Georges', 'Sed dolor voluptas nam quis omnis amet. Ipsum atque unde quisquam nostrum in quas voluptates libero. At eius aut eligendi qui.', '2018-09-05 01:28:42', 107, 582),
(101, 'Thierry', 'Sit quaerat sit velit a nostrum commodi suscipit. Hic quam recusandae iure quo est. Totam animi et numquam omnis.', '2018-09-22 16:53:17', 107, 582),
(102, 'Lucie', 'Aspernatur cumque molestiae aperiam quasi sint. Porro est qui quis modi id. Fugiat excepturi eaque modi in quo unde. Quam nemo dolor doloremque rerum ab et temporibus molestias.', '2018-10-11 06:25:19', 107, 582),
(103, 'Bernard', 'Nihil voluptatum omnis consectetur. Quaerat inventore molestiae animi rem ipsam pariatur. In blanditiis magnam aut et eaque et mollitia reiciendis. Sapiente dignissimos id nemo voluptatem debitis.', '2018-10-10 03:25:51', 107, 582),
(104, 'Susanne', 'Reiciendis nihil et sit quaerat velit. Odio eos eaque provident eos sint. Consectetur distinctio expedita aliquid non omnis consequuntur dolor.', '2018-12-21 14:26:54', 107, 582),
(105, 'Gilles', 'Et ipsa asperiores quasi laudantium veritatis tempore quasi. Non nisi est nesciunt et aut fuga et. Et nemo velit deleniti et deserunt ut qui.', '2019-01-06 08:31:30', 107, 582),
(106, 'Gilles', 'Totam doloremque quisquam non ullam molestiae tenetur. Voluptas unde ut debitis repellendus qui et quae. Magnam voluptates nulla omnis delectus.', '2019-01-08 10:26:50', 108, 582),
(107, 'William', 'Est libero aut et. Culpa et fugiat sed qui unde maiores. Voluptatem perspiciatis sint aut magni ea odit libero.', '2019-01-22 22:32:28', 108, 582),
(108, 'Élisabeth', 'Explicabo fugit enim fugiat ea. Est officia autem voluptatem tempore inventore quam exercitationem. Vel quia animi nihil. Magnam sed rem natus quidem.', '2018-11-05 21:37:44', 108, 582),
(109, 'Jacqueline', 'Perspiciatis deleniti quia rerum. Natus et quos quis dignissimos ducimus. Eveniet quia voluptatem et et. Et et quasi nesciunt ipsum mollitia et qui et.', '2018-09-25 11:17:19', 108, 582),
(110, 'Margaux', 'Maxime cum sint impedit quos. Alias tempora ducimus dolorem ratione. Ea aliquid vel quia quod et.', '2018-10-26 13:49:05', 108, 582);

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
('20190213090109', '2019-02-13 09:01:26'),
('20190213092237', '2019-02-13 09:27:36'),
('20190213095218', '2019-02-13 09:52:27'),
('20190213095713', '2019-02-13 09:58:03'),
('20190213100526', '2019-02-13 10:06:30'),
('20190213102133', '2019-02-13 10:22:26'),
('20190213103442', '2019-02-13 10:35:21'),
('20190213124854', '2019-02-13 12:49:11');

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rooms` int(11) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  `heat` int(11) NOT NULL,
  `surface` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `sold` tinyint(1) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` int(11) NOT NULL,
  `parking` int(11) DEFAULT NULL,
  `bathrooms` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8BF21CDE12469DE2` (`category_id`),
  KEY `IDX_8BF21CDEC54C8C93` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=583 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `title`, `description`, `image`, `rooms`, `bedrooms`, `floor`, `heat`, `surface`, `price`, `created_at`, `sold`, `city`, `address`, `postal_code`, `parking`, `bathrooms`, `category_id`, `type_id`) VALUES
(498, 'Est sunt unde quis tempore.', 'In sit quasi architecto molestiae tempora. Omnis maiores asperiores cupiditate incidunt nemo laboriosam.', 'https://lorempixel.com/640/480/?84458', 5, 0, 7, 4, 4, 200000, '2018-12-11 15:55:04', 1, 'Guillou', '63, impasse de Faivre', 1, 5, 4, 25, 87),
(499, 'Omnis omnis architecto vel vel distinctio.', 'Ut assumenda tempore animi omnis eum laudantium. Quia tempore ex eos dolor ea.', 'https://lorempixel.com/640/480/?98168', 3, 1, 6, 6, 6, 200000, '2018-08-31 15:47:33', 1, 'Chevalier-les-Bains', '20, avenue Nath Vallet', 0, 2, 3, 25, 87),
(500, 'Sapiente voluptatem sint nihil officiis incidunt.', 'Libero et debitis et. Illum eius quo tempora incidunt ut quia. Laudantium repellendus beatae ullam fugit aut id.', 'https://lorempixel.com/640/480/?52482', 7, 6, 4, 7, 5, 200000, '2018-12-30 08:08:14', 1, 'Caron', '62, impasse de Hamel', 8, 2, 5, 25, 87),
(501, 'Dolore est et consequuntur quasi reiciendis facere voluptatem.', 'Consectetur non qui qui perspiciatis veritatis. Ex illo pariatur in modi sequi aut vitae. In deserunt qui impedit magnam recusandae.', 'https://lorempixel.com/640/480/?18411', 2, 3, 4, 8, 5, 200000, '2018-09-08 06:46:59', 1, 'Lemoine', '51, rue de Goncalves', 5, 6, 7, 25, 87),
(502, 'Sunt sed ratione sequi esse fuga possimus.', 'Suscipit tempora numquam molestiae aut in. Dolorem et in provident porro consequatur. Aut fugiat architecto enim cumque perferendis.', 'https://lorempixel.com/640/480/?23093', 4, 5, 2, 4, 5, 200000, '2018-12-08 04:52:55', 1, 'Lemonnier-la-Forêt', '46, avenue Étienne Delattre', 8, 3, 9, 25, 87),
(503, 'Asperiores dolore sequi accusantium quia.', 'Repellendus et fugiat tempore et voluptas non. Dolor voluptatem praesentium perspiciatis.', 'https://lorempixel.com/640/480/?27762', 5, 2, 2, 3, 0, 200000, '2018-10-05 01:41:56', 1, 'Hamon-sur-Mer', '66, chemin de Charles', 2, 0, 1, 25, 87),
(504, 'Est tempora quae et.', 'Blanditiis vitae nesciunt similique voluptate perspiciatis. Eius harum ut ipsum dolorem consequuntur vitae amet. Molestiae velit est et odit saepe.', 'https://lorempixel.com/640/480/?78604', 7, 5, 0, 2, 4, 200000, '2018-12-07 16:43:48', 1, 'Richarddan', '23, impasse de Gimenez', 8, 8, 2, 25, 88),
(505, 'Est sed excepturi aspernatur distinctio quia.', 'Molestiae quia modi sequi qui quia sunt nemo. Aliquam ut ut ipsam atque sapiente qui non sit. Repudiandae illum necessitatibus ut minima minus suscipit repellat.', 'https://lorempixel.com/640/480/?50555', 4, 2, 0, 9, 5, 200000, '2018-10-27 02:38:22', 1, 'Normand', '425, rue de Poulain', 7, 4, 7, 25, 88),
(506, 'Aut ab non odit dignissimos.', 'Consequatur inventore assumenda ab sapiente similique sint aut. Optio quae officiis dolorem voluptate est fugiat ut. Incidunt labore placeat dignissimos velit aut.', 'https://lorempixel.com/640/480/?82575', 8, 5, 1, 9, 7, 200000, '2019-02-06 05:07:37', 1, 'Berthelot-la-Forêt', '93, chemin Patrick Diaz', 7, 2, 2, 25, 88),
(507, 'Harum molestiae laudantium molestias sed.', 'Natus natus eius est voluptates nulla ullam. Quam et quos harum sapiente quas. Tenetur sed quo et molestiae sint quod possimus.', 'https://lorempixel.com/640/480/?21848', 3, 9, 2, 3, 8, 200000, '2018-10-30 22:13:55', 1, 'MalletBourg', '283, place Olivier Vallee', 4, 3, 7, 25, 88),
(508, 'Accusantium omnis repellendus aliquam illo.', 'Et odio porro et aut in odit delectus neque. Vero sapiente consequatur ut doloremque id.', 'https://lorempixel.com/640/480/?64072', 4, 1, 9, 2, 4, 200000, '2019-02-10 15:42:03', 1, 'Bruneau-sur-Mer', '83, place Mary', 6, 5, 9, 25, 89),
(509, 'Et non excepturi excepturi aliquam illum vel amet.', 'Et officiis quis necessitatibus. Sed autem quis perferendis cumque autem consectetur repellat. Facere sit nihil alias similique et eos.', 'https://lorempixel.com/640/480/?59841', 4, 1, 3, 0, 2, 200000, '2018-08-20 02:53:01', 1, 'Girard', '80, rue de Bodin', 0, 7, 3, 25, 89),
(510, 'Iste reiciendis non ipsa nemo minus.', 'Iusto minus dolor dolorem odio. Blanditiis et non modi similique.', 'https://lorempixel.com/640/480/?85358', 1, 2, 2, 0, 2, 200000, '2019-01-24 16:20:04', 1, 'Ledoux', '87, place de Mace', 8, 2, 7, 25, 89),
(511, 'Voluptates est aut sint consequatur et exercitationem sint.', 'Iusto quia numquam vitae delectus. Dolores dolorem quidem quisquam harum.', 'https://lorempixel.com/640/480/?61990', 0, 7, 8, 1, 2, 200000, '2018-11-28 08:48:31', 1, 'Carredan', '63, boulevard Weiss', 6, 5, 9, 26, 90),
(512, 'Quia quas aut aut accusamus et.', 'Ut quas corporis qui tenetur quibusdam et aut. Maxime non autem doloremque nihil voluptatem corrupti nam. Consectetur natus dolores quod tempore quia et.', 'https://lorempixel.com/640/480/?58053', 2, 0, 9, 2, 7, 200000, '2019-02-10 02:30:46', 1, 'Peltier', '6, place de Renard', 9, 8, 9, 26, 90),
(513, 'Quidem eum ut ratione consectetur dolores nesciunt.', 'Nihil sit accusantium neque. Voluptatem dolor libero natus distinctio explicabo qui ut.', 'https://lorempixel.com/640/480/?48664', 3, 7, 6, 3, 0, 200000, '2019-01-30 23:35:05', 1, 'Lecomte-sur-Coste', '84, boulevard de Martel', 6, 1, 3, 26, 90),
(514, 'Quis incidunt inventore quos mollitia omnis cupiditate.', 'Sed a quia facere facilis porro sunt quasi. Nihil rerum vero maiores dolor omnis commodi. Rerum iusto amet ea commodi hic.', 'https://lorempixel.com/640/480/?18059', 0, 2, 3, 0, 3, 200000, '2018-08-20 18:07:57', 1, 'Chauvet', 'avenue de Lelievre', 0, 3, 1, 26, 91),
(515, 'Excepturi molestiae exercitationem eum.', 'A perferendis odit praesentium voluptatem voluptatem rerum aut. Quis praesentium dolor ducimus suscipit inventore aliquid. Necessitatibus necessitatibus quae tempore libero eligendi sed.', 'https://lorempixel.com/640/480/?59869', 5, 9, 9, 4, 5, 200000, '2018-10-28 00:54:01', 1, 'Jacques-sur-Leveque', '71, boulevard Goncalves', 1, 7, 2, 26, 91),
(516, 'Incidunt neque voluptatem ut itaque quam excepturi quas.', 'Eaque enim maiores sit reprehenderit in aut reiciendis sunt. Omnis dolores eaque est architecto. Recusandae id est perspiciatis.', 'https://lorempixel.com/640/480/?71782', 5, 6, 2, 9, 5, 200000, '2019-01-16 23:42:58', 1, 'Buisson', '429, avenue Odette Renard', 3, 0, 3, 26, 91),
(517, 'Illo assumenda odit sit qui aut beatae non.', 'Molestias dolore veniam blanditiis sint architecto. Nostrum reprehenderit tenetur minima amet quo accusantium veniam. Ducimus unde impedit quo molestias eaque rerum.', 'https://lorempixel.com/640/480/?73756', 1, 5, 5, 9, 0, 200000, '2018-10-27 21:07:44', 1, 'Marty', 'rue Jacquot', 2, 7, 0, 26, 91),
(518, 'Et rerum repudiandae saepe consequatur necessitatibus atque.', 'Assumenda dolorem repellendus hic molestias. Consequuntur provident dolores sed dolore voluptates officia rerum iure.', 'https://lorempixel.com/640/480/?39986', 2, 6, 8, 1, 3, 200000, '2018-09-02 22:37:38', 1, 'Turpin', '72, rue Blot', 5, 9, 8, 26, 91),
(519, 'Odit sed expedita ullam deserunt velit et quos.', 'Recusandae repellat incidunt dignissimos architecto aut et. Vero fugit aut possimus perferendis aliquam nihil est et. Sunt debitis laboriosam nesciunt pariatur sed sit nihil.', 'https://lorempixel.com/640/480/?55757', 9, 2, 6, 6, 2, 200000, '2018-09-25 14:44:02', 1, 'Begue', '59, chemin de Baudry', 5, 5, 1, 26, 92),
(520, 'Quam natus itaque repellendus deleniti.', 'Nisi blanditiis incidunt hic pariatur iste. Rem fugiat non molestiae perspiciatis aliquid. Enim dolorem consequuntur aut dolores quis veniam.', 'https://lorempixel.com/640/480/?79046', 1, 9, 9, 8, 4, 200000, '2019-01-18 12:59:11', 1, 'Deschamps', 'rue Morel', 5, 0, 5, 26, 92),
(521, 'Deleniti quis aliquid molestiae laborum velit dolorem et.', 'Vero quae cupiditate omnis repellendus sint. Voluptatem et minima et est soluta eum.', 'https://lorempixel.com/640/480/?46156', 2, 5, 4, 8, 4, 200000, '2019-01-17 00:34:17', 1, 'Pierreboeuf', '83, impasse Luce Valette', 9, 0, 6, 26, 92),
(522, 'Velit doloribus veniam molestias quo ad consequatur totam.', 'Omnis non libero minima possimus officia sint. Est amet est dolorem.', 'https://lorempixel.com/640/480/?59290', 8, 7, 8, 4, 4, 200000, '2018-12-15 08:12:36', 1, 'Picardboeuf', '993, place Perrier', 6, 0, 8, 26, 92),
(523, 'Voluptatibus atque laudantium molestiae eligendi facilis.', 'Tempora quos corrupti voluptate ea labore nemo sit. Voluptatem eum placeat in laborum et. Quia aut aut est id et quaerat voluptas nostrum.', 'https://lorempixel.com/640/480/?59560', 2, 8, 3, 7, 4, 200000, '2018-08-28 23:08:20', 1, 'Daniel', '53, boulevard de Courtois', 6, 3, 1, 26, 92),
(524, 'Aspernatur nisi perferendis iste cumque ex debitis saepe inventore.', 'Necessitatibus aliquam possimus cupiditate sit velit voluptatum ipsa. Eos iusto enim officia neque.', 'https://lorempixel.com/640/480/?28398', 6, 9, 3, 6, 0, 200000, '2018-09-22 19:25:11', 1, 'CarlierVille', '465, place de Weiss', 5, 5, 8, 26, 92),
(525, 'Doloribus est ipsum cupiditate at et dicta.', 'Nemo facere qui magnam perspiciatis impedit aspernatur voluptatem. Unde quidem fugiat accusantium ut error dolorum ut. Nisi eum aliquam optio voluptatem recusandae rerum aut.', 'https://lorempixel.com/640/480/?56856', 7, 8, 5, 6, 9, 200000, '2018-12-07 13:09:50', 1, 'Aubry-sur-Caron', 'boulevard De Sousa', 3, 2, 7, 26, 92),
(526, 'Fugit labore ipsa est et.', 'Ratione id quasi nihil molestiae. Fuga et beatae unde animi.', 'https://lorempixel.com/640/480/?10648', 9, 8, 3, 1, 4, 200000, '2018-11-18 03:53:59', 1, 'Leleu', 'impasse Descamps', 1, 6, 5, 26, 92),
(527, 'Provident magni et saepe.', 'Dolores et saepe explicabo ex. Sed expedita voluptas earum aut incidunt nostrum iusto. Quisquam ipsa voluptatem quam aut debitis blanditiis.', 'https://lorempixel.com/640/480/?56485', 1, 0, 1, 0, 9, 200000, '2018-09-05 14:36:37', 1, 'Torres', '775, impasse Mathieu', 5, 8, 2, 27, 93),
(528, 'Nihil quam et commodi nobis.', 'Labore qui voluptates et. Nesciunt itaque est rerum.', 'https://lorempixel.com/640/480/?11437', 3, 2, 7, 2, 3, 200000, '2018-11-17 04:27:36', 1, 'Schneider-la-Forêt', '38, chemin de Leconte', 9, 7, 1, 27, 93),
(529, 'Ut qui est quisquam dignissimos.', 'Est reprehenderit quaerat illum. Aspernatur mollitia eos ipsam fugiat.', 'https://lorempixel.com/640/480/?58441', 3, 7, 3, 1, 8, 200000, '2019-01-06 19:23:03', 1, 'Guillou-la-Forêt', '40, chemin Fernandes', 2, 1, 6, 27, 93),
(530, 'Doloremque accusantium commodi voluptas quia id.', 'Qui voluptatum sequi molestias itaque nihil necessitatibus quasi. Sapiente repudiandae nobis quos ut. Praesentium qui nesciunt blanditiis veritatis doloribus.', 'https://lorempixel.com/640/480/?54734', 2, 9, 9, 8, 4, 200000, '2018-11-08 01:17:34', 1, 'FaureVille', '93, avenue Teixeira', 9, 0, 0, 27, 93),
(531, 'Quos et omnis totam asperiores repellat.', 'Laudantium non dignissimos ut. Porro sit sint eos voluptate quaerat. Quibusdam et sit sint sunt adipisci modi aut.', 'https://lorempixel.com/640/480/?55817', 2, 4, 0, 5, 9, 200000, '2018-11-22 14:26:17', 1, 'Gay', '26, place Bouchet', 0, 7, 7, 27, 93),
(532, 'Id aperiam animi dicta sint repellat.', 'Aliquam quas illo sint beatae accusantium illum voluptatum. Quos veniam eaque accusantium nihil sint est assumenda.', 'https://lorempixel.com/640/480/?75608', 1, 6, 6, 2, 8, 200000, '2019-02-06 21:33:10', 1, 'Lemonnierboeuf', '515, chemin Gilbert Legrand', 5, 6, 6, 27, 93),
(533, 'Ad veniam eum at quo repellendus vel consequatur.', 'Eos velit labore quidem voluptatem eos quos sunt. Voluptatem et officia ipsum possimus fuga inventore.', 'https://lorempixel.com/640/480/?27104', 3, 7, 6, 7, 7, 200000, '2018-12-10 22:16:00', 1, 'Jacquot-les-Bains', '7, chemin Nathalie Gaillard', 6, 3, 9, 27, 93),
(534, 'Eius id sit molestiae culpa amet delectus itaque.', 'Ullam nostrum omnis quia quibusdam qui nostrum ipsum. Itaque impedit qui aut sed velit ut est. Iure ab laboriosam doloribus sint aperiam qui.', 'https://lorempixel.com/640/480/?89409', 4, 8, 3, 4, 3, 200000, '2019-01-16 18:17:23', 1, 'Dupontdan', '93, boulevard Roussel', 2, 0, 8, 27, 94),
(535, 'Qui consequatur ut quaerat voluptatem aut porro animi.', 'Sunt mollitia similique dolores architecto ullam dolorum ad perspiciatis. Quo dolores consequatur minus velit possimus qui ipsum.', 'https://lorempixel.com/640/480/?98747', 7, 3, 7, 2, 7, 200000, '2019-02-06 12:48:06', 1, 'Rey', 'avenue de Le Goff', 6, 2, 1, 27, 94),
(536, 'Sapiente sunt quia unde architecto.', 'Optio non numquam corrupti ut doloremque. Vel non non nam enim culpa consequatur. Aut beatae quod esse eveniet quae.', 'https://lorempixel.com/640/480/?60273', 9, 5, 4, 7, 3, 200000, '2018-09-05 01:16:06', 1, 'Hebert-les-Bains', '68, avenue de Bonnet', 4, 9, 4, 27, 94),
(537, 'Excepturi dolorem mollitia sapiente.', 'In consequatur occaecati est et natus accusantium totam possimus. Voluptas provident facere accusamus id.', 'https://lorempixel.com/640/480/?51325', 3, 7, 6, 3, 7, 200000, '2018-12-15 11:51:09', 1, 'Dumont', '48, avenue Robert', 8, 6, 7, 27, 94),
(538, 'Et qui mollitia voluptatibus rerum.', 'Quibusdam hic rerum necessitatibus eaque. Labore eum nobis tempore. Sed aperiam molestias enim quam est velit voluptas.', 'https://lorempixel.com/640/480/?38596', 4, 9, 0, 7, 3, 200000, '2018-11-18 02:19:10', 1, 'Robert', '77, rue Lucas Becker', 3, 2, 1, 27, 94),
(539, 'Velit quis et sint dolore dignissimos qui ut.', 'Libero inventore illum pariatur laborum voluptatem. Est distinctio est illo veniam quibusdam cumque quas sequi. Nisi non quidem et molestiae.', 'https://lorempixel.com/640/480/?78617', 9, 4, 4, 1, 8, 200000, '2018-09-09 19:39:33', 1, 'Blanchard', 'avenue de Hubert', 2, 5, 4, 28, 95),
(540, 'Est a ea fugiat voluptate iure ratione qui.', 'Odit eos ut aut sint. Molestiae dicta dolor ut numquam asperiores eum. Rerum laboriosam quia adipisci quo.', 'https://lorempixel.com/640/480/?73717', 7, 3, 7, 8, 9, 200000, '2019-01-18 12:09:00', 1, 'Hoareau-sur-Loiseau', '410, boulevard de Dumas', 3, 1, 8, 28, 95),
(541, 'Sed tempora maxime rerum eos ipsum repellendus debitis totam.', 'Repudiandae illum atque placeat sint aut possimus distinctio. Ea est aliquid corporis ducimus molestiae hic.', 'https://lorempixel.com/640/480/?92733', 1, 2, 9, 9, 1, 200000, '2018-08-17 13:06:32', 1, 'Bigot', '66, place Gregoire', 2, 4, 5, 28, 95),
(542, 'Quam consequatur excepturi asperiores exercitationem.', 'Rerum pariatur sequi ipsam ea eveniet sed magni. Voluptas magni explicabo nobis et tempore.', 'https://lorempixel.com/640/480/?32815', 2, 0, 8, 9, 3, 200000, '2018-10-08 13:22:56', 1, 'Guillet', '18, boulevard Pruvost', 2, 0, 0, 28, 95),
(543, 'Modi dolor praesentium porro pariatur ut exercitationem culpa.', 'Est consequatur molestiae est iusto. Vel nisi repellat dolore et nesciunt ipsum.', 'https://lorempixel.com/640/480/?95935', 0, 8, 6, 6, 8, 200000, '2018-12-22 06:46:36', 1, 'Weiss', 'boulevard Gilbert Gaillard', 2, 8, 4, 28, 95),
(544, 'Sed architecto odio non eius.', 'Ea velit quo consequatur quaerat quis et hic. Aut et cum exercitationem consequatur consequatur.', 'https://lorempixel.com/640/480/?32397', 9, 1, 1, 8, 3, 200000, '2018-09-06 04:00:53', 1, 'Rodriguez', '8, place de Collet', 1, 1, 2, 28, 96),
(545, 'Error nobis et quia et quasi rerum voluptatem.', 'Eos sint consequatur eius quia. Sit et fugit ipsa quidem voluptates aut sint.', 'https://lorempixel.com/640/480/?90932', 8, 9, 6, 3, 5, 200000, '2019-02-13 02:24:53', 1, 'Chartier', '28, rue Corinne Benoit', 1, 8, 9, 28, 96),
(546, 'Minus architecto voluptatum quo ad.', 'Totam quasi molestiae voluptatem minus illo nihil fugit. Molestiae quis ipsum cumque minus. Nostrum id iusto corrupti ut et.', 'https://lorempixel.com/640/480/?60736', 8, 4, 0, 8, 6, 200000, '2018-09-20 15:09:08', 1, 'Ruizdan', '2, boulevard de Dubois', 1, 6, 1, 28, 96),
(547, 'Ducimus occaecati quidem quia ad quo et.', 'Tenetur dolores ut iure et omnis. Veritatis fuga atque totam omnis.', 'https://lorempixel.com/640/480/?59036', 9, 1, 5, 9, 3, 200000, '2018-11-11 07:44:35', 1, 'Milletboeuf', 'avenue Robert Mary', 2, 9, 8, 28, 96),
(548, 'Fugit ut ratione quidem accusantium corporis facere hic.', 'Consequatur assumenda quis qui atque. Iure aliquam iste perspiciatis et inventore. Quidem iusto quia aspernatur quis minima id adipisci.', 'https://lorempixel.com/640/480/?11143', 4, 1, 1, 6, 2, 200000, '2018-11-30 21:58:44', 1, 'Duhamel', 'place de Besson', 1, 3, 0, 28, 96),
(549, 'Beatae autem hic officia.', 'Aut magnam saepe eius qui vero. Suscipit maxime et omnis neque eveniet molestiae corporis.', 'https://lorempixel.com/640/480/?26702', 9, 8, 0, 7, 3, 200000, '2018-12-30 18:43:20', 1, 'Gosselin', '49, boulevard Laine', 7, 9, 5, 28, 97),
(550, 'Est hic facilis ut animi alias molestiae.', 'Sit sed at expedita qui corporis dolorem. Dolores unde neque dicta dolores error.', 'https://lorempixel.com/640/480/?61714', 9, 9, 0, 8, 6, 200000, '2019-01-22 12:26:12', 1, 'Normand', '90, chemin Baron', 8, 0, 7, 28, 97),
(551, 'Excepturi facere possimus dolorem et dolor voluptatum quaerat cupiditate.', 'Ea quos natus vitae laudantium. Fugit occaecati fugit blanditiis.', 'https://lorempixel.com/640/480/?20057', 4, 3, 2, 3, 4, 200000, '2018-11-02 06:50:20', 1, 'Pascal', 'impasse de Baron', 7, 8, 8, 28, 97),
(552, 'Doloremque quam esse non quisquam quia repellat neque.', 'Qui consequatur iste sed est aspernatur ex. Commodi consequatur error necessitatibus atque ut et cumque. In quis repudiandae commodi aspernatur error similique molestias.', 'https://lorempixel.com/640/480/?16046', 3, 4, 1, 6, 9, 200000, '2019-01-25 16:57:58', 1, 'Tanguy', '28, rue de Martinez', 9, 8, 4, 28, 97),
(553, 'Facere pariatur quae et rem iure.', 'Et alias sapiente quis. Asperiores non et autem rem eius eum hic.', 'https://lorempixel.com/640/480/?75015', 2, 7, 6, 8, 6, 200000, '2018-09-07 02:18:04', 1, 'Olivier-sur-Mer', '63, rue de Peron', 2, 4, 7, 29, 98),
(554, 'Consectetur non non voluptatem temporibus.', 'Ut illo non necessitatibus voluptate molestias. Est eos quisquam autem sequi fugiat neque rerum natus.', 'https://lorempixel.com/640/480/?26536', 1, 2, 0, 4, 0, 200000, '2018-09-22 08:42:22', 1, 'Girard-sur-Allard', '72, avenue Marc De Sousa', 0, 6, 8, 29, 98),
(555, 'Voluptatum doloremque tenetur illo qui earum praesentium sit.', 'Unde magnam incidunt quidem qui nesciunt nobis nesciunt. Laboriosam at dolorem voluptas corrupti blanditiis animi. Iste et illo ipsa nihil magni molestias.', 'https://lorempixel.com/640/480/?98924', 6, 0, 8, 1, 1, 200000, '2018-08-14 12:27:13', 1, 'Pereira-sur-Mer', '8, impasse Michel Huet', 8, 6, 2, 29, 98),
(556, 'Sint voluptate libero qui culpa nobis ut.', 'Quia dolor consequatur qui dolores accusamus et. Placeat velit recusandae ipsam dolores laudantium at. Deserunt in beatae rerum culpa ut.', 'https://lorempixel.com/640/480/?78236', 2, 6, 6, 9, 8, 200000, '2018-12-30 05:07:59', 1, 'Pires', 'rue de Gomes', 0, 3, 9, 29, 98),
(557, 'Laudantium minus sunt nulla adipisci consequatur iure rerum.', 'Occaecati dolor magni architecto ab quidem. Autem eos quibusdam rerum sunt aspernatur mollitia.', 'https://lorempixel.com/640/480/?62681', 1, 6, 7, 0, 5, 200000, '2018-11-25 01:48:16', 1, 'Ramos-sur-Barbier', '48, impasse Christelle Mary', 3, 5, 9, 29, 99),
(558, 'Itaque aperiam qui eveniet voluptatem tenetur rerum sunt.', 'Et deserunt rerum veritatis tenetur dolore. Quam ea est minima fugiat dolore iste cupiditate impedit. Veritatis ipsam in quae odio enim laboriosam.', 'https://lorempixel.com/640/480/?62210', 5, 8, 6, 7, 6, 200000, '2019-01-18 23:06:48', 1, 'Martel', '72, place de Le Goff', 4, 8, 1, 29, 99),
(559, 'Ea sapiente distinctio quo placeat enim eius adipisci.', 'Voluptatem et doloribus impedit quam dolore maxime. Illum molestias voluptates voluptas libero.', 'https://lorempixel.com/640/480/?38005', 5, 5, 1, 1, 5, 200000, '2018-10-31 16:22:23', 1, 'Allainnec', '86, rue Blin', 0, 3, 6, 29, 99),
(560, 'Qui qui est optio accusantium architecto laborum.', 'Placeat nam impedit velit quae consequatur vero magnam illum. Occaecati iure quod reiciendis veritatis quo quas et.', 'https://lorempixel.com/640/480/?45583', 2, 3, 2, 1, 5, 200000, '2018-10-03 10:02:16', 1, 'Levy', '272, place Thierry Buisson', 8, 0, 3, 29, 99),
(561, 'Quo est unde sint et eaque.', 'Hic officia recusandae impedit qui voluptates rerum mollitia autem. Consequatur ut nam officia ipsum. Voluptatem quas maiores et autem quod.', 'https://lorempixel.com/640/480/?78762', 1, 8, 6, 8, 4, 200000, '2018-08-14 05:32:59', 1, 'Perrier', 'chemin de Gillet', 3, 1, 5, 29, 99),
(562, 'Nesciunt maiores autem et in commodi eos aspernatur.', 'Eum eveniet porro ipsa quia iure atque eveniet. Illo odit repellat quibusdam repellat.', 'https://lorempixel.com/640/480/?97174', 5, 6, 1, 7, 1, 200000, '2018-12-26 21:46:44', 1, 'Letellier', '94, chemin de Lucas', 8, 0, 2, 29, 100),
(563, 'Enim atque ullam placeat pariatur voluptatem consequuntur.', 'Cum labore eveniet aspernatur nulla nisi nemo. Fugiat libero facere enim eos.', 'https://lorempixel.com/640/480/?75649', 1, 0, 7, 8, 5, 200000, '2018-10-07 04:12:47', 1, 'Colletboeuf', '902, impasse de Chretien', 7, 4, 7, 29, 100),
(564, 'Accusantium ut libero quos fugit.', 'Debitis praesentium officiis hic eos aut atque. Ea sint laborum aut mollitia sint excepturi laboriosam aspernatur.', 'https://lorempixel.com/640/480/?44611', 4, 6, 3, 1, 0, 200000, '2019-01-16 10:52:10', 1, 'Lesagedan', '19, avenue de Faure', 1, 1, 6, 29, 100),
(565, 'Dolorum aut id quo est.', 'Nihil incidunt iste saepe cupiditate maxime fugit dolores. Quasi ipsa dignissimos laborum aut assumenda sit. In accusantium quibusdam debitis quam.', 'https://lorempixel.com/640/480/?43483', 2, 7, 7, 2, 5, 200000, '2019-02-08 02:15:05', 1, 'Legendre-sur-Moulin', '507, boulevard Denis', 8, 6, 0, 29, 100),
(566, 'Iste soluta neque quis itaque eum optio maiores.', 'Et odit nam necessitatibus maxime. Est blanditiis culpa nam eius commodi molestiae ipsum.', 'https://lorempixel.com/640/480/?13385', 3, 0, 0, 6, 9, 200000, '2018-11-25 15:33:55', 1, 'MartelVille', '83, rue Léon Peltier', 0, 4, 8, 29, 100),
(567, 'Et omnis omnis accusantium sit minus quidem vitae.', 'Rerum perspiciatis natus aut et. Quia quia nihil mollitia dolorum ullam. Alias aperiam et et dicta tempora sequi quidem.', 'https://lorempixel.com/640/480/?66055', 6, 8, 9, 6, 9, 200000, '2018-10-09 13:31:46', 1, 'Gilles-la-Forêt', '68, avenue Robert', 9, 4, 9, 29, 100),
(568, 'Velit sed voluptas voluptate iure omnis.', 'Quam et placeat tenetur nihil impedit dolor accusantium. Id quia necessitatibus suscipit qui est sit autem. Autem qui reiciendis accusantium doloribus.', 'https://lorempixel.com/640/480/?88076', 1, 0, 2, 0, 4, 200000, '2019-02-02 11:56:11', 1, 'Martel', '93, avenue de Fernandes', 3, 7, 3, 29, 100),
(569, 'Aut quis fugiat necessitatibus qui soluta earum voluptatem.', 'Est consequatur praesentium expedita qui est ut quia. Nihil non et dolore numquam dolorum ducimus.', 'https://lorempixel.com/640/480/?16583', 5, 3, 2, 4, 7, 200000, '2019-02-07 11:01:31', 1, 'Imbert-la-Forêt', 'rue Delorme', 6, 5, 7, 30, 101),
(570, 'Incidunt rerum consequatur aliquid quas maxime voluptates.', 'Id fuga qui accusantium quia quia. Eius neque eum nobis repellendus corrupti consectetur. Quas atque dolorum in amet dolores occaecati temporibus.', 'https://lorempixel.com/640/480/?60397', 7, 9, 0, 3, 5, 200000, '2018-10-04 02:06:51', 1, 'Lombard', '61, avenue André Loiseau', 3, 4, 0, 30, 101),
(571, 'Laboriosam autem est rerum iusto maxime nam.', 'Eaque omnis et velit alias voluptates et. Aspernatur vel porro culpa dolor minima perferendis voluptate.', 'https://lorempixel.com/640/480/?52014', 8, 6, 3, 9, 8, 200000, '2018-12-23 14:53:08', 1, 'Marion', '92, chemin de Thomas', 9, 1, 4, 30, 101),
(572, 'Omnis aut quia aperiam deleniti fugiat nulla.', 'Provident aut sit itaque et modi recusandae similique est. Sit a voluptatem eum velit nihil sunt perspiciatis. Deserunt sit consequatur rerum saepe.', 'https://lorempixel.com/640/480/?28834', 7, 1, 9, 7, 7, 200000, '2018-10-03 21:58:24', 1, 'Picard', '927, place de Carre', 1, 0, 4, 30, 101),
(573, 'Architecto dolorem error atque dolores hic qui deleniti.', 'In distinctio iste eum delectus esse possimus voluptatem. Rerum sunt est nisi et voluptas deserunt error. Sit architecto eos odit explicabo tempora.', 'https://lorempixel.com/640/480/?33384', 7, 8, 9, 3, 4, 200000, '2018-11-26 05:43:29', 1, 'Millet', '13, chemin de David', 4, 5, 9, 30, 102),
(574, 'Libero quis sequi incidunt error.', 'Fuga delectus sequi eligendi odit veritatis tenetur pariatur. Harum dolor est sit optio iusto nostrum unde. Eaque autem temporibus aut eum vel impedit.', 'https://lorempixel.com/640/480/?54426', 1, 9, 9, 2, 7, 200000, '2018-11-02 02:53:42', 1, 'Courtois', '4, rue de Millet', 7, 1, 7, 30, 102),
(575, 'Excepturi debitis optio facilis enim placeat.', 'Facilis voluptas aut dolor delectus commodi magni. Facilis autem sit culpa. Odio non sit corporis iusto quis id porro consectetur.', 'https://lorempixel.com/640/480/?20470', 8, 4, 3, 1, 1, 200000, '2019-01-22 21:13:19', 1, 'Fouquet', '9, avenue Guillou', 6, 2, 7, 30, 102),
(576, 'Nostrum rem praesentium laborum sint voluptatum.', 'Natus ut nostrum voluptatem hic fugit error. Voluptatum perspiciatis asperiores repudiandae. Non dolores repudiandae non alias.', 'https://lorempixel.com/640/480/?45301', 7, 2, 6, 6, 6, 200000, '2018-09-11 18:05:07', 1, 'Bazindan', '823, rue Valentine Gilles', 4, 0, 3, 30, 102),
(577, 'Blanditiis expedita similique qui velit libero id totam.', 'Doloremque pariatur unde et ipsa odio. Omnis illum voluptatem corrupti nihil eius. Voluptates aut dignissimos praesentium eligendi pariatur.', 'https://lorempixel.com/640/480/?35346', 2, 4, 2, 2, 2, 200000, '2019-01-17 19:31:48', 1, 'Lefevre', '5, rue Jean', 7, 7, 4, 30, 103),
(578, 'Qui consequatur consectetur aut.', 'Esse nostrum aliquid quae consequatur. Iure debitis ut aliquid qui. Libero accusantium dignissimos sequi quod.', 'https://lorempixel.com/640/480/?49074', 4, 0, 0, 8, 2, 200000, '2018-11-09 08:25:44', 1, 'Labbeboeuf', '90, boulevard Vallet', 1, 5, 1, 30, 103),
(579, 'Molestias atque architecto quo dolore vero.', 'Dignissimos itaque totam natus quis quibusdam voluptates omnis. Explicabo necessitatibus corporis velit non laborum assumenda. Rerum fugiat perferendis temporibus quibusdam.', 'https://lorempixel.com/640/480/?61987', 4, 0, 5, 4, 4, 200000, '2019-01-24 02:24:13', 1, 'Vincentnec', '130, chemin de Carpentier', 0, 5, 0, 30, 103),
(580, 'Velit facilis repudiandae rerum dolores.', 'Commodi nihil aut accusantium quod assumenda dolor. Nobis voluptatem dolor perspiciatis at doloribus magni.', 'https://lorempixel.com/640/480/?47588', 5, 7, 7, 5, 9, 200000, '2018-11-11 15:06:19', 1, 'Grondin', '66, avenue Pichon', 2, 1, 8, 30, 103),
(581, 'Quidem autem doloremque velit veniam.', 'Rerum rerum tempore voluptatem. Excepturi eos quam adipisci.', 'https://lorempixel.com/640/480/?46366', 6, 3, 5, 2, 3, 200000, '2018-10-29 06:52:46', 1, 'CollinBourg', '96, boulevard Devaux', 3, 9, 6, 30, 103),
(582, 'Quia est totam odio atque minima ea aut.', 'Consequatur voluptatem aperiam assumenda qui aut ea dolor. Vel quasi tenetur explicabo rerum vel est non.', 'https://lorempixel.com/640/480/?85598', 4, 9, 9, 3, 4, 200000, '2018-09-27 21:25:26', 1, 'Thibault', '1, rue de Neveu', 8, 8, 6, 30, 103);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appartments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `appartments`, `house`) VALUES
(87, 'eos', 'sunt'),
(88, 'impedit', 'sit'),
(89, 'dolorem', 'recusandae'),
(90, 'fugit', 'voluptate'),
(91, 'officiis', 'est'),
(92, 'est', 'architecto'),
(93, 'nostrum', 'rem'),
(94, 'vel', 'sed'),
(95, 'at', 'eos'),
(96, 'consequuntur', 'magni'),
(97, 'quo', 'non'),
(98, 'atque', 'dolorum'),
(99, 'quo', 'quidem'),
(100, 'dolorem', 'dolore'),
(101, 'commodi', 'doloremque'),
(102, 'velit', 'voluptatum'),
(103, 'porro', 'consequatur');

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
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` int(11) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `address`, `city`, `postal_code`, `phone_number`, `gender`) VALUES
(100, 'Thierry', 'Boutin', 'laetitia43@lebon.fr', 'password', '271, place de Martel', 'Giraud', 75845, 5, ''),
(101, 'Victoire', 'Mahe', 'zrossi@martel.net', 'password', '382, boulevard Marine Riou', 'Perrierdan', 35412, 2, ''),
(102, 'Margaud', 'Normand', 'frederique.bonneau@perrot.com', 'password', '47, place Clémence Descamps', 'Ferreira', 75012, 2, ''),
(103, 'François', 'Perrin', 'augustin21@ifrance.com', 'password', '5, avenue Aimée Charpentier', 'Fernandes-sur-Joly', 78930, 5, ''),
(104, 'Marcelle', 'Vallee', 'becker.remy@wanadoo.fr', 'password', '92, place Michaud', 'Aubert', 59129, 6, ''),
(105, 'François', 'Diallo', 'odette.charpentier@yahoo.fr', 'password', '7, impasse de Rodriguez', 'Guyonnec', 78490, 3, ''),
(106, 'Olivier', 'Humbert', 'leconte.frederique@laposte.net', 'password', 'boulevard Amélie Durand', 'Payet', 33550, 5, ''),
(107, 'Hugues', 'Lemoine', 'auguste.parent@noos.fr', 'password', 'rue de Riou', 'Guillon-les-Bains', 25110, 1, ''),
(108, 'Françoise', 'Gilbert', 'kgrondin@laroche.com', 'password', '33, impasse de Benoit', 'Vallet-sur-Leroux', 44330, 0, ''),
(109, 'sagayaraj', 'JOSEPH', 'bjsahay@gamil.com', '$2y$12$EMRoO0Y0I3alcS5DaqXATOHoAQmEmUad7i2Fc/qJ2tznsu78vsSOS', '11 allée de l\'arlequin', 'nanterre', 92000, 667144163, 'male');

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
