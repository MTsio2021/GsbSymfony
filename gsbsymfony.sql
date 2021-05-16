-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : Dim 16 mai 2021 à 17:36
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsbsymfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `delegue`
--

CREATE TABLE `delegue` (
  `id` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `delegue`
--

INSERT INTO `delegue` (`id`, `password`, `username`) VALUES
(2, '$2y$13$P30XsBSbIX1D91IYToY6t.2Qu.lu9UbP3R.LpsOrP8j6U8gMcnXOG', 'mtillier'),
(3, '$2y$13$W7l1zcHGuUO8N46wnV3A6.13QSRyKbr705EYsKP6qa8WHf5smn7xq', 'dele1'),
(4, '$2y$13$c5OXI4rqUIylVj4yOZzYjOevUAbh0MRaObJZm4DrRIID5SSpZyELy', 'dele2');

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

CREATE TABLE `praticien` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coef_notoriete` double NOT NULL,
  `coef_confiance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`id`, `type_id`, `nom`, `prenom`, `adresse`, `cp`, `ville`, `coef_notoriete`, `coef_confiance`) VALUES
(21, 11, 'Lemoine', 'Victoire', '3, avenue Leblanc\n86449 Gerard-les-Bains', '55860', 'Rousseau', 3, 3),
(22, 12, 'Parent', 'Marthe', '80, avenue Audrey Olivier\n17372 Gosselin', '62327', 'Chevalier-sur-Lelievre', 3, 3),
(23, 13, 'Girard', 'Adrienne', '97, chemin Patrick Gay\n18 768 MorenoVille', '59 088', 'Roux', 2, 2),
(24, 14, 'Thierry', 'Patricia', '6, boulevard Mendes\n22 781 Devaux', '30330', 'Morvan', 2, 3),
(25, 15, 'Barthelemy', 'Pierre', 'rue Carpentier\n13 581 Lemoine', '93061', 'Camus-sur-Leclerc', 1, 1),
(26, 16, 'Mahe', 'Benoît', 'place Christine Huet\n21698 Giraudnec', '95663', 'Loiseau-les-Bains', 3, 1),
(27, 17, 'Laporte', 'Suzanne', '58, boulevard Zacharie Briand\n96 560 Ferrand', '49 465', 'Legendre', 1, 1),
(28, 18, 'Perret', 'Yves', '90, avenue Cohen\n21994 Loiseau', '90 469', 'Ruiz', 1, 3),
(29, 19, 'Raymond', 'Céline', '16, place de Pons\n34689 Hamel', '28442', 'Guillou', 1, 3),
(30, 20, 'Guilbert', 'Philippe', '22, impasse David Gilbert\n56 327 Jean', '18 860', 'Kleindan', 2, 1),
(31, 11, 'Mathieu', 'Théophile', '102, chemin Franck Gay\n45 863 JacquotVille', '51032', 'Gosselindan', 2, 1),
(32, 12, 'Renaud', 'Stéphane', '47, chemin Yves Baudry\n96903 Merlenec', '18708', 'Michaud', 1, 1),
(33, 13, 'Schmitt', 'Martine', '203, chemin Dominique Mary\n59 458 Joseph-sur-Mer', '61957', 'Lelievreboeuf', 3, 3),
(34, 14, 'Chauvet', 'Joseph', '4, boulevard de Millet\n42567 Barbe', '75619', 'Brunet-sur-Monnier', 3, 3),
(35, 15, 'Gonzalez', 'Agnès', '82, boulevard Benoît Leblanc\n59 830 GayVille', '96766', 'Pereira-sur-Albert', 3, 2),
(36, 16, 'Blanchard', 'Zacharie', '6, rue de Duval\n35 622 Legerboeuf', '90 268', 'Millet', 3, 1),
(37, 17, 'Baron', 'Denis', '890, boulevard André Albert\n73417 Valentin', '22 389', 'Guillot', 2, 3),
(38, 18, 'Perrin', 'Maggie', '29, rue Audrey Faivre\n96625 Allard-sur-Couturier', '22 029', 'Gonzalez', 3, 1),
(39, 19, 'Noel', 'Timothée', '8, rue Hardy\n96988 Munoz-les-Bains', '58 154', 'BrunelVille', 1, 1),
(40, 20, 'Joubert', 'Noël', '46, rue Louis\n68 590 Marchal', '17014', 'Marin', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `rapport_visite`
--

CREATE TABLE `rapport_visite` (
  `id` int(11) NOT NULL,
  `visiteur_id` int(11) NOT NULL,
  `bilan` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_visite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_rapport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rapport_visite`
--

INSERT INTO `rapport_visite` (`id`, `visiteur_id`, `bilan`, `date_visite`, `date_rapport`, `etat`) VALUES
(101, 41, 'Nisi doloremque sit dolore reiciendis. Id et aut porro eligendi labore. Modi voluptatem aut porro alias dolorem quia non. Vitae fugit ut id nulla.', '1981-01-27', '1994-12-13', 1),
(102, 42, 'Amet est necessitatibus quia nam quisquam iste suscipit. Ullam commodi sunt doloremque molestiae. Beatae consectetur in sed inventore dolores suscipit non. Molestiae debitis ipsam voluptatibus placeat optio enim.', '2014-05-16', '1989-03-25', 0),
(103, 43, 'Eius labore tenetur doloribus expedita. Sint quasi ut minus nam placeat reprehenderit.', '1972-03-21', '2015-06-05', 1),
(104, 44, 'Debitis dolores laborum velit sit culpa voluptas illo. Aut non necessitatibus et autem provident harum et.', '2003-07-01', '2012-11-16', 0),
(105, 45, 'Dolorem dolore similique consequatur quae animi consequuntur magni asperiores. Nemo expedita et ea consequatur. Repudiandae aliquam temporibus blanditiis. Officiis quia ut vel quia perferendis quaerat quisquam.', '1984-04-26', '2018-11-26', 0),
(106, 46, 'Distinctio libero illo repudiandae non. Ipsam non nostrum commodi perferendis. Voluptas cupiditate reprehenderit eum eligendi eaque exercitationem fugit.', '1997-02-03', '2014-11-04', 0),
(107, 47, 'Earum excepturi in alias dolores qui non. Corrupti deserunt doloribus beatae autem ad voluptatum dolore voluptatem.', '1996-03-18', '2007-04-10', 0),
(108, 48, 'Ipsa sapiente ullam sequi assumenda. Praesentium veritatis cupiditate asperiores explicabo tempore eum harum. Labore cupiditate quia a ipsum.', '1983-08-25', '1984-04-02', 1),
(109, 49, 'Qui natus qui ea voluptates aut laborum. Amet omnis sit tempora non quia nam laboriosam ipsa.', '1996-06-21', '2003-06-29', 0),
(110, 50, 'Modi voluptatem deserunt vel nostrum laudantium nihil. Error est voluptatibus ut est velit laudantium sint magnam.', '1987-06-06', '2015-09-07', 1),
(111, 51, 'Et cumque dolorem ab in nobis aut voluptate. Est dolorem nemo sint at deleniti unde.', '1995-01-28', '1982-03-15', 0),
(112, 52, 'Rem omnis quo dolorem et. Magni nihil recusandae id culpa itaque nihil. Rerum consequatur qui nisi quia non modi voluptatem consequatur. Deserunt recusandae maiores dolore voluptate libero ab.', '2019-12-12', '2020-01-09', 0),
(113, 53, 'Nulla enim debitis illo modi animi non. Omnis dolore corporis dicta non nam. Ab cupiditate dignissimos alias sequi doloribus a optio.', '1976-08-05', '2009-01-28', 1),
(114, 54, 'Laborum vel ut et provident voluptas eos. Quod dolores ullam sint et. Quas eaque sit dolores quia perspiciatis in. Et distinctio ut aut repudiandae. Natus voluptate quis deleniti.', '2015-04-15', '2019-10-31', 1),
(115, 55, 'Laudantium aspernatur eos ea dolor aut labore sed non. Id quis magni eos quaerat. Non libero doloremque esse omnis explicabo eaque magnam.', '1988-06-17', '1971-01-16', 0),
(116, 56, 'Impedit et quidem est numquam. Aliquid asperiores provident atque nam numquam sit. Ut totam qui nulla voluptates. Consequuntur quibusdam inventore ut earum eligendi quia temporibus.', '2018-01-05', '1996-09-09', 0),
(117, 57, 'Aliquid ut aut neque in. Dolores harum doloribus dolores atque aut deserunt. Dolores odio rerum vitae cum sapiente esse.', '2007-11-22', '1995-05-20', 1),
(118, 58, 'Quos fugiat sequi ratione ea delectus minima. Eveniet velit dolorum iure sint qui iure. Est sapiente pariatur molestias non totam atque. Omnis repudiandae non minus corrupti.', '1970-10-28', '1985-11-19', 0),
(119, 59, 'Aut sunt pariatur aut quidem enim sed velit rerum. Sit officiis tempora ratione vero sed provident. Quae quia excepturi unde ullam est odio eos. Ipsam dicta vero reprehenderit officia quia.', '1998-02-27', '1997-10-30', 0),
(120, 60, 'Quia porro vero error odit quod sint qui. Culpa qui autem consequuntur voluptatem illo.', '1983-05-06', '2004-05-19', 0),
(121, 61, 'Sint maiores maxime voluptatibus non incidunt. Veritatis eos ad placeat omnis voluptatem dolore ducimus.', '1994-03-25', '1983-03-24', 1),
(122, 62, 'Consectetur quidem harum quasi voluptatem eius sapiente dolores libero. Sunt reprehenderit consequuntur iste aliquam amet ut rem.', '2004-11-07', '1986-11-14', 1),
(123, 63, 'Dolorem sit sed dolor expedita qui blanditiis. Amet sed omnis enim qui vel reprehenderit. Omnis quidem eveniet quidem. Saepe ab asperiores iusto omnis debitis voluptas.', '2014-01-18', '2011-09-14', 0),
(124, 64, 'Doloribus debitis a velit ratione voluptatum. Dolor quaerat vel aut illum dolorem. Quia aut quia mollitia et sit officia. Facilis repellendus eveniet ea ipsam illum vel.', '1976-11-25', '2012-02-22', 1),
(125, 65, 'Repellendus ut ipsam ducimus qui rem rem et. Nihil exercitationem consequuntur quia officiis vitae sed. Consectetur alias eum in ut dolorum quo fugit.', '1990-04-10', '2010-02-02', 0),
(126, 66, 'Voluptatem pariatur odit praesentium illo iusto quis. Mollitia cupiditate qui mollitia. Optio et inventore corporis ea necessitatibus vel. Accusantium dolorum et et sit expedita omnis nemo.', '1987-10-11', '1976-06-28', 0),
(127, 67, 'Omnis fugit magni eligendi rerum voluptatem dolores temporibus eos. Corrupti consequatur sint sed quia quae. Velit exercitationem voluptatem vel animi nobis tenetur unde.', '1975-08-15', '2015-12-09', 0),
(128, 68, 'Labore quod numquam repudiandae voluptatibus vel dolores omnis. Est itaque tempore soluta quo quisquam voluptas incidunt.', '1991-11-23', '2015-10-20', 1),
(129, 69, 'Quia reiciendis ratione est laborum et. Nihil sint nam non occaecati quaerat. Provident et explicabo aperiam natus.', '1984-03-12', '2010-07-31', 1),
(130, 70, 'Ea sed eos aperiam autem sunt nemo consequuntur doloribus. Nobis omnis et reiciendis quasi perspiciatis. Reprehenderit cupiditate dicta tempore sint inventore sunt.', '2016-03-01', '1980-12-09', 0),
(131, 71, 'Ad veritatis voluptatem deserunt corrupti voluptas consectetur quia. Odit quia at id dolor perferendis quia quis. Non qui nihil aliquam amet est cum.', '2003-10-12', '1971-08-06', 1),
(132, 72, 'Molestiae iusto consequuntur autem qui aut rem dolorum. Nobis hic ullam quasi maiores. Sit in sunt praesentium dolorem consequatur. Nesciunt ab possimus laudantium quia.', '2020-03-19', '1983-07-21', 1),
(133, 73, 'Ea suscipit autem minus facilis est perspiciatis porro optio. Sit veniam ducimus consectetur et earum ut quia. Accusantium aspernatur officiis voluptas molestias.', '1984-08-27', '2013-06-01', 0),
(134, 74, 'Repellendus voluptas consequatur non praesentium odit consequuntur. Eum veritatis labore cum nostrum aut sed quia. Fugit id error quo et autem.', '1987-11-10', '1975-10-24', 1),
(135, 75, 'Et officiis non corrupti eos. Commodi aut dicta voluptatum voluptas qui et. Nihil ut et non. Iusto consequatur voluptatibus cum dolorem voluptatem sequi aut.', '2000-11-17', '2000-11-03', 0),
(136, 76, 'Itaque adipisci odit ut quae vero odio tenetur. Cupiditate veritatis sunt unde quia et eaque ut. Saepe quae natus exercitationem quasi. Voluptatem sed omnis quas nulla ab.', '1992-11-17', '1987-06-15', 1),
(137, 77, 'Distinctio beatae illum animi a et omnis libero aut. Non velit nemo eaque temporibus optio officiis. Laudantium a veniam et.', '2000-05-02', '1975-10-08', 0),
(138, 78, 'Necessitatibus quisquam iusto voluptas quis. Excepturi aut iusto delectus atque sequi sunt. Hic alias temporibus amet vero.', '1974-04-24', '1998-04-16', 0),
(139, 79, 'Similique autem vero non et eius velit eum quia. Temporibus quasi repudiandae inventore eius maiores architecto. Ut laborum repellendus voluptas excepturi. Labore enim ut veniam quod iusto rerum corrupti. Vitae quo voluptatum eaque enim id ut tenetur eos.', '1975-02-05', '2017-11-16', 0),
(140, 80, 'Nemo vero porro autem iste perspiciatis quis sint. Deleniti eligendi eos exercitationem quia. Repellendus laborum et cupiditate illo ex amet.', '1990-06-04', '2006-06-03', 0),
(141, 41, 'Et ut ducimus saepe necessitatibus qui ratione laborum beatae. Atque voluptatem hic omnis hic voluptatum. Nisi a quam quo sequi ipsam.', '1981-05-16', '2014-09-05', 1),
(142, 42, 'Iusto quasi dolorem voluptas commodi incidunt dolor. Illum et omnis quia aut sit soluta itaque.', '1981-01-12', '2015-09-27', 1),
(143, 43, 'Quo voluptatem doloribus eos amet voluptatem voluptatem. Assumenda sit voluptas dolores nam quibusdam. Et est rerum voluptatibus consequatur laudantium. Corporis incidunt voluptas tenetur. Maiores similique nesciunt quia ut.', '2010-01-11', '2018-12-18', 1),
(144, 44, 'Ut illum est eos rem ipsum. In et quam sed perferendis aspernatur ab autem et. Veritatis et ut sed aut vero.', '1977-01-16', '2001-07-11', 0),
(145, 45, 'Enim nesciunt illum et eum quas aut. Rerum fuga debitis consectetur quas deleniti perspiciatis molestiae quia. Voluptas et natus id fuga expedita sint. Dolor saepe sint qui iure iusto dolorem.', '2011-12-17', '1999-03-02', 0),
(146, 46, 'Aut voluptas eum voluptatem tenetur. Labore tenetur aperiam dolorum et nihil totam vero. Sit alias deleniti blanditiis vel repellat. Culpa veritatis officiis occaecati mollitia quis aperiam rem.', '1987-05-31', '1972-09-26', 0),
(147, 47, 'Nisi iste modi nam. Deleniti dignissimos consequatur laboriosam aliquid. Fugiat quae qui est quaerat et.', '2005-04-05', '2013-08-20', 1),
(148, 48, 'Quia quo sed impedit asperiores. Magni ea necessitatibus fugiat ut ipsa voluptas. Placeat omnis sit repellat qui adipisci officiis. Est quibusdam voluptates distinctio minus ut quo quia. Et et nulla ut quas occaecati quia.', '1983-05-31', '1981-05-27', 1),
(149, 49, 'At consequuntur ab mollitia est dolorem quibusdam labore aperiam. Quas facilis et saepe error assumenda quod quisquam sit. Maxime velit quae ut tenetur aliquam.', '2019-03-05', '1979-11-07', 1),
(150, 50, 'Rerum et eos possimus et ea vel. Sit vitae est repellendus enim voluptates quos sint. Laboriosam in ut nam non itaque molestiae vel. Ea ut tempora quia culpa labore.', '1982-02-28', '1979-07-31', 1),
(151, 51, 'Perspiciatis ab eos rem modi quod. Quis tempore est mollitia quod. Occaecati ducimus minus aperiam voluptas ducimus sit quos.', '2017-02-04', '1995-02-26', 0),
(152, 52, 'Cupiditate enim pariatur ut eos tenetur quia. Laboriosam mollitia voluptatem voluptas ut. Vel ut iste consequatur. Beatae doloribus aut quo omnis quibusdam sunt. Et vel aut et est.', '2020-09-02', '1992-10-30', 1),
(153, 53, 'Qui reprehenderit itaque voluptatem inventore. Enim error ea est adipisci. Optio voluptatum est magnam eos saepe. Repellendus neque odit cum deserunt.', '1993-03-19', '2003-01-05', 1),
(154, 54, 'Tempore occaecati et fuga fuga iste consectetur repellendus. Cumque molestias labore quod adipisci. Dolor placeat saepe quidem sed assumenda voluptatibus iste commodi.', '1980-10-29', '1981-09-01', 1),
(155, 55, 'Laboriosam vel minima ad voluptatem sed voluptatem natus. Est incidunt placeat quae. Consectetur ducimus sed error ut et itaque. Minus et est tempora sunt.', '1988-07-22', '1997-11-08', 0),
(156, 56, 'Earum excepturi veritatis quod nostrum rem cupiditate iusto quia. At illo labore id cum. Dolores omnis doloremque nam expedita voluptatum doloribus esse. Rerum qui voluptatem perferendis quisquam ab.', '1982-01-22', '2007-07-24', 1),
(157, 57, 'Vero quia quam excepturi doloribus nihil molestiae laborum voluptas. Eius fuga necessitatibus ut accusamus. Ab enim quia iure sunt doloribus dolorem sunt.', '2010-03-26', '2016-08-23', 1),
(158, 58, 'Eum odit veritatis voluptatem quia voluptatibus vel omnis rerum. Ipsam corrupti incidunt libero. Eos magnam quasi ut omnis.', '2011-05-25', '2018-10-15', 1),
(159, 59, 'Labore commodi ut ipsum eveniet libero ea quos. Consequatur quis a dolores. Sit ullam vitae debitis illo magnam quam accusamus quis.', '1970-09-24', '1980-10-19', 1),
(160, 60, 'Vel ut voluptatem mollitia ducimus. Commodi et nihil corporis non inventore temporibus. Alias assumenda officiis non modi.', '1980-10-09', '1997-01-21', 0),
(161, 61, 'Alias distinctio dolores tempore sunt eum harum. Voluptatem iusto omnis et quae quibusdam. Sunt quasi quia in. Quis hic nihil blanditiis.', '2015-06-27', '1979-11-21', 1),
(162, 62, 'Maiores rerum ex vel fugiat quae. Id temporibus dolores dicta vel laboriosam. Aut ad voluptas voluptas alias repellat neque. Laborum dolor rerum rem.', '1982-02-20', '1971-11-19', 1),
(163, 63, 'Maiores dolorem ut officiis odio in tenetur. Sint quidem tenetur impedit temporibus culpa ea totam. Nulla sapiente vero aperiam. Odio est doloremque corrupti id quidem perferendis.', '2001-10-12', '2003-11-30', 1),
(164, 64, 'Quia consequatur aspernatur autem. Rerum iure praesentium quae totam. Voluptate voluptatem labore quia cupiditate aut.', '1974-05-01', '1991-01-19', 1),
(165, 65, 'Quia eos aut culpa non. Quasi illo voluptates quo cumque et natus distinctio. Quasi corporis pariatur et recusandae eum laudantium ut qui.', '2015-02-21', '1976-12-03', 0),
(166, 66, 'Consequuntur voluptas maiores perferendis minus. Aliquam incidunt nostrum totam. Laborum ut deserunt qui magni. Sed maxime dolorem laudantium beatae. Id quae voluptatum odit voluptatem et.', '2003-10-07', '1981-03-20', 1),
(167, 67, 'Quia dicta omnis dolore dignissimos impedit veniam magni. Ad quo temporibus corrupti sed quidem sequi voluptatem. Delectus nam qui distinctio.', '2011-09-18', '1979-03-04', 0),
(168, 68, 'Assumenda nostrum dolore id quibusdam harum. Eligendi sed nam numquam voluptates totam quo. Omnis commodi modi omnis. Impedit natus quas vitae earum omnis.', '1981-08-28', '1984-02-25', 1),
(169, 69, 'Facilis libero rerum quisquam porro voluptatem fugiat. Voluptates itaque at dolor ut excepturi corporis labore ut. Placeat aspernatur ipsum est itaque incidunt. Tenetur quidem quos perferendis ea.', '1990-05-07', '2012-05-22', 1),
(170, 70, 'Unde sint consectetur nobis qui. Minima neque iure doloremque est.', '1974-07-20', '1981-04-11', 0),
(171, 71, 'Rerum fugiat officiis odio numquam. Necessitatibus minus distinctio beatae et enim. Voluptatibus aspernatur doloribus quaerat. Itaque dolorem quis repellendus et et at.', '1999-10-05', '2021-02-28', 0),
(172, 72, 'Quis voluptatum dicta voluptas aut et sunt nesciunt. Architecto dignissimos dolorem voluptatem eligendi eveniet sit dolorum. Consequatur odit numquam dignissimos eveniet rem voluptatem provident.', '2015-10-07', '1984-08-08', 1),
(173, 73, 'Officia ad accusantium accusantium esse nam amet labore similique. Omnis sed sint optio voluptatibus blanditiis quo ut. Ea a dolorem officiis quis fugiat. Voluptatem quos sit ab perferendis.', '2009-04-27', '1986-10-19', 1),
(174, 74, 'Omnis maiores omnis quis neque nihil. Velit facere veniam voluptatum nihil qui quos. Sunt magnam dolor nisi quia.', '2003-02-27', '1998-03-17', 1),
(175, 75, 'Eveniet voluptatem harum inventore culpa occaecati. Sequi ipsa porro ut veniam quas veniam. Et perferendis beatae earum deserunt error dolores minus ut. Eum delectus ratione nulla pariatur omnis voluptas.', '1985-10-30', '1973-07-10', 1),
(176, 76, 'Non voluptatem accusantium et possimus deleniti. Quas itaque nostrum sed et suscipit minima ea. Voluptatem nihil suscipit recusandae reprehenderit cum fuga distinctio. Modi nam impedit voluptatum ea unde doloribus mollitia labore.', '1986-09-24', '1983-05-08', 0),
(177, 77, 'Voluptatem ut nulla qui aut amet. Velit nihil sunt natus sapiente in vero. Inventore dolores ut aut similique explicabo id eum alias. Quod odit sint qui ducimus velit quasi. Minus nihil aspernatur voluptatem adipisci est necessitatibus.', '1990-08-07', '1994-02-05', 0),
(178, 78, 'Aliquid inventore est et ducimus rem reprehenderit consectetur ut. Voluptatibus adipisci ut consequatur autem aspernatur facilis. Eveniet amet sunt quia quia eius saepe voluptatem fugit. Neque dolorum quas voluptatem distinctio vel qui corrupti.', '1999-05-04', '2016-11-10', 1),
(179, 79, 'Commodi suscipit et laborum. Doloribus nemo aut sed error nemo eligendi odio. Nihil quia non doloremque totam.', '2003-05-11', '1975-11-30', 0),
(180, 80, 'Est eum optio voluptatem quo est eveniet odio. Enim rem unde animi id impedit accusantium. Sint possimus quia dolores qui eum exercitationem.', '1997-11-29', '2013-08-15', 1),
(181, 41, 'Tempora perspiciatis aspernatur architecto voluptatem alias numquam hic omnis. Eum veniam sint dolor tenetur et debitis soluta. Aspernatur minus iste blanditiis tenetur. Aut odio blanditiis non dolor.', '2014-10-24', '1998-04-28', 0),
(182, 42, 'Voluptatem consectetur aliquam rerum et at porro. Ad ex accusantium molestias id. Omnis et dicta rem commodi perspiciatis quidem unde consectetur.', '2012-02-19', '1973-11-27', 0),
(183, 43, 'Ut dignissimos earum veritatis voluptates recusandae error. Facere reiciendis sunt fugiat sit culpa. Eius et sed veniam veniam sed ut voluptas. Et commodi qui qui nulla adipisci et dignissimos.', '1986-04-17', '2003-05-16', 1),
(184, 44, 'Esse suscipit voluptate ut. Et impedit esse sunt quam quis et. Reprehenderit ea quo est amet id sed.', '1986-08-19', '1990-08-24', 0),
(185, 45, 'Fugit harum sit voluptas qui necessitatibus iusto. Ex rerum rerum maxime et. Repellendus atque sit aspernatur dolorum qui animi ipsam. Est voluptas in labore omnis ea qui.', '2017-05-26', '2019-04-04', 0),
(186, 46, 'Ratione ut veniam nihil modi aut. Dolorem ea molestiae ex ut recusandae consequuntur iure. Perferendis non ex eum aut consequatur neque. Eligendi suscipit adipisci aut.', '1993-04-20', '2013-04-16', 0),
(187, 47, 'Nihil quasi qui tempora mollitia. Eos temporibus et mollitia quod. Dolor nisi nesciunt sunt accusamus libero autem quaerat.', '1971-02-09', '1982-06-08', 1),
(188, 48, 'Quo dignissimos pariatur nesciunt optio magnam quas ab. Necessitatibus deleniti qui ab sint. Sit non rerum quas nesciunt.', '2019-05-15', '1970-12-08', 0),
(189, 49, 'Et explicabo eos impedit natus a. Expedita est qui voluptatum sint magnam quo. Aliquam qui cum facilis aperiam voluptatem.', '1971-11-20', '2016-01-15', 0),
(190, 50, 'Dolore architecto debitis rerum et laborum consequuntur numquam. Ipsum commodi occaecati quos nemo repellat voluptatem. Voluptatem voluptatem commodi eligendi error quisquam doloribus quis.', '1987-08-12', '1970-09-23', 1),
(191, 51, 'Quis natus fugit et tempore ut unde cumque porro. Laudantium explicabo omnis magni consequatur veniam. Et rem molestiae quos ut.', '1993-05-02', '1979-04-17', 1),
(192, 52, 'Similique ipsam nobis odit necessitatibus est. Quos corrupti molestias ut temporibus dolores. Quo expedita reiciendis expedita ipsum doloremque est enim aut.', '1997-04-21', '1990-07-04', 0),
(193, 53, 'Ut sunt eos sunt autem suscipit iusto. Perferendis et velit earum illum voluptatibus aut repudiandae tempora. Eos adipisci hic iure dolore debitis mollitia. Architecto ea occaecati debitis molestiae ipsam eligendi.', '1984-03-05', '2021-01-21', 0),
(194, 54, 'Non expedita est vitae doloremque est perspiciatis. Perferendis debitis nostrum aut dolores tempore recusandae reprehenderit. Quisquam sit earum cupiditate officiis quam voluptatum.', '2010-04-19', '1987-03-24', 0),
(195, 55, 'Nemo ut dolores odit dolor nulla asperiores omnis. At vero impedit ut. Tempora perferendis architecto deleniti id.', '1995-05-20', '1992-03-31', 1),
(196, 56, 'Maiores est mollitia non debitis. Illum consequuntur labore quo fugiat.', '1982-10-22', '2007-03-18', 1),
(197, 57, 'Voluptatibus perspiciatis temporibus ab corporis ipsa. Rerum dolorum dicta fugit odio. Nam quaerat autem et et.', '2015-09-15', '1972-01-10', 1),
(198, 58, 'Ex iste nisi sunt quia aperiam harum. Deleniti qui et sit et officia. Quo atque ipsum nulla eum cupiditate.', '2014-11-10', '1978-07-03', 0),
(199, 59, 'Rem quibusdam voluptatum nemo totam amet accusantium. Qui explicabo consequatur quo quis non possimus blanditiis. Possimus sit eaque nesciunt et. Ducimus et dolorem aut aut repudiandae laboriosam.', '2002-10-07', '1989-12-25', 0),
(200, 60, 'Est sapiente et necessitatibus provident. Magni mollitia et quia et cupiditate perspiciatis aut.', '2004-06-08', '2007-06-14', 1);

-- --------------------------------------------------------

--
-- Structure de la table `type_praticien`
--

CREATE TABLE `type_praticien` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_praticien`
--

INSERT INTO `type_praticien` (`id`, `libelle`, `lieu`) VALUES
(11, 'hic', 'Launay-sur-Mer'),
(12, 'cum', 'Pasquier'),
(13, 'dolores', 'Deschamps'),
(14, 'voluptas', 'Gonzalez'),
(15, 'quo', 'Faivre'),
(16, 'exercitationem', 'Pinto-sur-Mer'),
(17, 'nemo', 'Lebondan'),
(18, 'reprehenderit', 'Breton'),
(19, 'odio', 'Perrot-sur-Mer'),
(20, 'saepe', 'Rodrigues');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` int(11) NOT NULL,
  `praticien_id` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mdp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `praticien_id`, `nom`, `prenom`, `adresse`, `cp`, `ville`, `login`, `mdp`) VALUES
(41, 21, 'Brunet', 'Zoé', '42, rue Faivre\n97 061 Turpin-sur-Mer', '88261', 'Klein-les-Bains', 'neque', 'Rkru]X'),
(42, 22, 'Baron', 'Océane', '966, place Michèle Bazin\n10673 PerretBourg', '88488', 'Alves-sur-Mer', 'aliquid', '*s*sR%BI._bo'),
(43, 23, 'Boucher', 'Alexandria', '811, place de Gerard\n33368 Lebonboeuf', '80777', 'Bonnet', 'voluptatibus', 'YU{IF^`4E'),
(44, 24, 'Martin', 'Claire', 'boulevard de Caron\n19387 Nicolasboeuf', '57874', 'Augerdan', 'veniam', 'E~\'7_I[[K'),
(45, 25, 'Jacob', 'Eugène', 'impasse de Becker\n82790 Chretien-sur-Duval', '09 162', 'Thierry', 'ex', 'wcX_!w'),
(46, 26, 'Dupont', 'Thibaut', 'rue Bodin\n29 538 Briand', '52905', 'VoisinBourg', 'iste', 'LxqfP6Elvf'),
(47, 27, 'Leleu', 'Paulette', '12, avenue Sébastien Coulon\n14295 Berthelotdan', '74320', 'Perrier', 'inventore', '{uvJYf;0&('),
(48, 28, 'Boulay', 'Aurore', '9, chemin de Bouchet\n59766 Leger', '77944', 'MauryBourg', 'beatae', '3.6=FjyQ'),
(49, 29, 'Lebon', 'Philippe', '98, place Dupuy\n14 687 Roux-les-Bains', '87128', 'Brunet', 'corporis', 'J$,<jNbz\\tB+\"62#u\"'),
(50, 30, 'Toussaint', 'Guillaume', '97, rue de Lebreton\n40184 Maillet-les-Bains', '31672', 'Tessier', 'molestias', 'W0#HmnCz'),
(51, 31, 'Fernandez', 'Gérard', 'place de Pascal\n85639 Boyer', '86877', 'Perretdan', 'quas', '`z=#;@px0RCRx'),
(52, 32, 'Maillard', 'Noémi', '37, chemin Costa\n68199 Masse-sur-Valette', '66 076', 'Costa-la-Forêt', 'enim', '0arDqjGj'),
(53, 33, 'Masse', 'Théodore', '30, rue de Arnaud\n90086 Jacob', '94 141', 'Fabre', 'vel', 'J4E8I35|bs6d:#875D|'),
(54, 34, 'Royer', 'Constance', '19, chemin Texier\n21 428 Bodin', '61056', 'Giraud-sur-Guerin', 'ipsum', 'ts}Ea8@@Y$Y6A.6`D'),
(55, 35, 'Duhamel', 'Augustin', 'avenue Barbier\n74 787 Thibault', '66609', 'Jacques', 'molestias', '-]D-z]be\\xMPHHAhq'),
(56, 36, 'Charpentier', 'Chantal', 'rue Lelievre\n86 250 Jacquot', '69111', 'BoyerBourg', 'velit', 'd\\jP~sy/('),
(57, 37, 'Meunier', 'Gilbert', '39, rue de Valette\n06 901 Maillot-les-Bains', '39968', 'Guillon', 'odio', 'I,$_$>fJ\"1=8z#7\\Z'),
(58, 38, 'Lopez', 'Matthieu', '562, rue Jacob\n26 568 Vallet', '81051', 'CordierBourg', 'magni', '!<~PTu!#A3**XUp36xG'),
(59, 39, 'Didier', 'Xavier', '79, impasse de Louis\n78164 Dufour', '79 002', 'Royer', 'dolorum', '+*;=M}:Nl&1oG[Gt/3;N'),
(60, 40, 'Perrin', 'Jacqueline', '40, rue Joseph\n45 444 Bonnet-la-Forêt', '51178', 'Rousset', 'occaecati', '/.]{A47>2J|31O'),
(61, 21, 'Regnier', 'Paul', '26, boulevard Chevalier\n64 997 Toussaintdan', '50536', 'Laine-la-Forêt', 'unde', 'f%bB#&~KMdgdSKok2'),
(62, 22, 'Gimenez', 'Monique', '14, impasse Lacombe\n24 279 PagesBourg', '71 437', 'Da CostaVille', 'et', ')BAT)u26>EkS6O/jr!/'),
(63, 23, 'Thibault', 'Sébastien', '91, rue de Guyot\n89 054 Maillard-sur-Dupre', '04 424', 'Lemonnier-sur-Peltier', 'porro', 'fDMELVjL9B'),
(64, 24, 'Bigot', 'Marc', '29, chemin Bonnin\n33809 Hamel-les-Bains', '29 536', 'MarquesBourg', 'laboriosam', '98(nS32c=.9o.\"d(?'),
(65, 25, 'Lamy', 'Claude', 'avenue de Faure\n00 161 Picard', '92006', 'Voisin', 'nostrum', 'V(@~4=WEB\\9K5N/85*Sn'),
(66, 26, 'Guillot', 'Roger', '52, avenue Courtois\n74 100 Le Gall', '71331', 'ChauveauBourg', 'voluptatem', '&vn|pB{W5,2%!Fb?f}-g'),
(67, 27, 'Bourdon', 'Théodore', '7, avenue de Garnier\n46435 Roger', '62 646', 'Gerard-sur-Dias', 'ex', 'A2U*#nh6fCf`@'),
(68, 28, 'Lopes', 'André', '82, chemin de Perrin\n10 432 Dupuisboeuf', '28 272', 'Fischer', 'dolor', '%K@iy9U`\\'),
(69, 29, 'Mary', 'Adrien', '5, place de Mercier\n77 116 Benard', '15 253', 'Lacombe-sur-Mer', 'tenetur', 'CL?coh'),
(70, 30, 'Guibert', 'Julie', 'rue de Bodin\n47275 Le Roux', '08472', 'Diaz-la-Forêt', 'qui', '.SH|Gr)*w'),
(71, 31, 'Roussel', 'Laurence', '10, impasse de Tessier\n05552 Perrot', '01522', 'Guilbert-sur-Lefort', 'neque', '6(4h)cI[B3OeV)@Lh'),
(72, 32, 'Legrand', 'Guillaume', 'place Paulette Olivier\n19 234 Gilles-sur-Mer', '40208', 'ThierryBourg', 'quam', 'O2)&x9L<TbNH;@^YVe'),
(73, 33, 'Cousin', 'Inès', 'place de Leclerc\n43329 Lefebvre-la-Forêt', '70415', 'Charpentier', 'accusamus', 'xUqd]Dkp1p+/)D,s,hV'),
(74, 34, 'Bouvier', 'Clémence', '3, boulevard de Samson\n88157 Meyer', '05 851', 'Martineau-les-Bains', 'illo', '%DfNnjxn'),
(75, 35, 'Picard', 'Paulette', 'place Germain\n74 801 De Sousa-sur-Delaunay', '24730', 'Blanchard', 'nihil', '9e\'4tqz2:nq#V^c#qp;B'),
(76, 36, 'Maury', 'Arnaude', '79, boulevard Clerc\n10354 Blondel', '44755', 'Gosselin', 'et', 'C#\'6os3jucy1OL.}'),
(77, 37, 'Rousseau', 'Pierre', '41, avenue Perrier\n79 595 Laine-les-Bains', '79679', 'Devaux', 'et', 'mVWM`hMdtVw'),
(78, 38, 'Gilbert', 'Nicole', '360, avenue Céline Richard\n77121 Bertin', '43 384', 'Pichon', 'molestiae', '3DNvxBw\\v\"k6&kl'),
(79, 39, 'Laurent', 'Lorraine', '16, place de Blanchet\n95 028 Martins', '36672', 'Munoz', 'nostrum', 'NHo_S=;'),
(80, 40, 'Hamon', 'Éléonore', '32, avenue de Bousquet\n89217 Blanchard-la-Forêt', '38631', 'Vaillantdan', 'occaecati', '`>O0-6Cb+6d[B5)$(,l');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `delegue`
--
ALTER TABLE `delegue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D9A27D3C54C8C93` (`type_id`);

--
-- Index pour la table `rapport_visite`
--
ALTER TABLE `rapport_visite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D1D741717F72333D` (`visiteur_id`);

--
-- Index pour la table `type_praticien`
--
ALTER TABLE `type_praticien`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4EA587B82391866B` (`praticien_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `delegue`
--
ALTER TABLE `delegue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `praticien`
--
ALTER TABLE `praticien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `rapport_visite`
--
ALTER TABLE `rapport_visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT pour la table `type_praticien`
--
ALTER TABLE `type_praticien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `visiteur`
--
ALTER TABLE `visiteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `FK_D9A27D3C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type_praticien` (`id`);

--
-- Contraintes pour la table `rapport_visite`
--
ALTER TABLE `rapport_visite`
  ADD CONSTRAINT `FK_D1D741717F72333D` FOREIGN KEY (`visiteur_id`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `FK_4EA587B82391866B` FOREIGN KEY (`praticien_id`) REFERENCES `praticien` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
