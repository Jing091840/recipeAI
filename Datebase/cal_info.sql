-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-04-02 04:44:58
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `cal`
--

-- --------------------------------------------------------

--
-- 資料表結構 `cal_info`
--

CREATE TABLE `cal_info` (
  `c_id` int(11) NOT NULL,
  `c_name` text NOT NULL,
  `c_unit` text DEFAULT NULL,
  `c_weight` float DEFAULT NULL,
  `c_calorie` float DEFAULT NULL,
  `c_category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `cal_info`
--

INSERT INTO `cal_info` (`c_id`, `c_name`, `c_unit`, `c_weight`, `c_calorie`, `c_category`) VALUES
(1, '玉米', '1碗', 100, 346, 'grains'),
(2, '燕麥', '1碗', 100, 389, 'grains'),
(3, '白飯', '1碗', 205, 225, 'grains'),
(4, '麵包', '1片', 25, 75, 'grains'),
(5, '小餐包', '2個', 0, 180, 'grains'),
(6, '花生醬', '1湯匙', 16, 95, 'grains'),
(7, '速食麵', '1包', 100, 470, 'grains'),
(8, '奶酥麵包', '1個', 0, 45, 'grains'),
(9, '波羅麵包', '-', 100, 334, 'grains'),
(10, '全麥麵包', '1片', 25, 65, 'grains'),
(11, '波羅麵包', '-', 100, 334, 'grains'),
(12, '蔥花鹹麵包', '1個', 0, 180, 'grains'),
(13, '三合一麥片', '-', 100, 128, 'grains'),
(14, '桂格芝麻糊', '1包', 40, 165, 'grains'),
(15, '桂格麥片', '1包', 50, 170, 'grains'),
(16, '葡萄乾土司', '4片', 0, 275, 'grains'),
(17, '起司三明治', '1個', 0, 200, 'grains'),
(18, '蔥花鹹麵包', '1個', 0, 180, 'grains'),
(19, '家樂氏玉米片', '1份', 50, 188, 'grains'),
(20, '喜瑞爾玉米', '1杯', 245, 125, 'grains'),
(21, '燕麥', '1杯', 240, 130, 'grains'),
(22, '喜瑞爾全麥', '1杯', 245, 110, 'grains'),
(23, '玉米片', '1杯', 25, 95, 'grains'),
(24, '喜瑞爾燕麥片', '1杯', 25, 100, 'grains'),
(25, '巧克力蛋糕', '1片', 0, 320, 'grains'),
(26, '蘆筍', '1杯', 145, 30, 'vegetable'),
(27, '芥藍', '1棵', 180, 45, 'vegetable'),
(28, '花菜', '1杯', 125, 30, 'vegetable'),
(29, '芹菜', '1條', 40, 5, 'vegetable'),
(30, '玉米', '1穗', 140, 70, 'vegetable'),
(31, '黃瓜', '6片', 28, 5, 'vegetable'),
(32, '香菇', '1杯', 70, 20, 'vegetable'),
(33, '洋蔥', '1杯', 210, 60, 'vegetable'),
(34, '青豆', '1杯', 170, 150, 'vegetable'),
(35, '芥菜', '1杯', 140, 30, 'vegetable'),
(36, '菠菜', '1杯', 180, 40, 'vegetable'),
(37, '青椒', '1個', 74, 15, 'vegetable'),
(38, '蕃薯', '1個', 114, 160, 'vegetable'),
(39, '蕃茄', '1個', 135, 25, 'vegetable'),
(40, '雪菜', '-', 100, 60, 'vegetable'),
(41, '竹筍', '-', 100, 40, 'vegetable'),
(42, 'A 菜', '-', 100, 40, 'vegetable'),
(43, '菜心', '-', 100, 40, 'vegetable'),
(44, '白菜', '-', 100, 40, 'vegetable'),
(45, '豆苗', '-', 100, 40, 'vegetable'),
(46, '絲瓜', '-', 100, 40, 'vegetable'),
(47, '大蒜', '-', 100, 40, 'vegetable'),
(48, '生菜', '-', 100, 40, 'vegetable'),
(49, '南瓜', '-', 100, 40, 'vegetable'),
(50, '莧菜', '-', 100, 40, 'vegetable'),
(51, '冬瓜', '-', 100, 40, 'vegetable'),
(52, '馬鈴薯', '1個', 156, 145, 'vegetable'),
(53, '豆芽菜', '1杯', 125, 35, 'vegetable'),
(54, '包心菜', '1杯', 145, 30, 'vegetable'),
(55, '胡蘿蔔', '1條', 72, 30, 'vegetable'),
(56, '包心菜', '1杯', 155, 55, 'vegetable'),
(57, '蚵仔', '-', 130, 100, 'seafood'),
(58, '魚翅', '-', 8, 73, 'seafood'),
(59, '干貝', '-', 10, 73, 'seafood'),
(60, '蟹肉', '-', 50, 73, 'seafood'),
(61, '龍蝦', '-', 50, 73, 'seafood'),
(62, '蝦仁', '-', 30, 73, 'seafood'),
(63, '蛤蠣', '-', 50, 73, 'seafood'),
(64, '明蝦', '-', 50, 73, 'seafood'),
(65, '蚵干', '-', 15, 73, 'seafood'),
(66, '河鰻', '-', 30, 73, 'seafood'),
(67, '螃蟹', '-', 215, 65, 'seafood'),
(68, '魷魚', '-', 200, 130, 'seafood'),
(69, '草蝦', '-', 30, 55, 'seafood'),
(70, '花枝', '-', 40, 55, 'seafood'),
(71, '章魚', '-', 55, 55, 'seafood'),
(72, '魚丸', '-', 60, 55, 'seafood'),
(73, '鱈魚', '-', 50, 75, 'seafood'),
(74, '牡蠣', '-', 65, 55, 'seafood'),
(75, '烏賊', '-', 35, 75, 'seafood'),
(76, '肉鯽', '-', 35, 75, 'seafood'),
(77, '文蛤', '-', 60, 55, 'seafood'),
(78, '海蔘', '-', 100, 55, 'seafood'),
(79, '蝦米', '-', 10, 55, 'seafood'),
(80, '墨魚', '-', 40, 73, 'seafood'),
(81, '田雞', '-', 40, 73, 'seafood'),
(82, '小管', '-', 40, 73, 'seafood'),
(83, '小卷', '-', 35, 55, 'seafood'),
(84, '魚鬆', '-', 25, 75, 'seafood'),
(85, '鮭魚', '-', 40, 73, 'seafood'),
(86, '鮪魚', '-', 40, 73, 'seafood'),
(87, '虱目魚', '-', 35, 75, 'seafood'),
(88, '小魚乾', '-', 10, 55, 'seafood'),
(89, '牡蠣乾', '-', 20, 55, 'seafood'),
(90, '小蝦米', '-', 20, 55, 'seafood'),
(91, '金釣蝦', '-', 10, 73, 'seafood'),
(92, '鯊魚皮', '-', 40, 73, 'seafood'),
(93, '柳葉魚', '-', 50, 80, 'seafood'),
(94, '金線魚', '-', 210, 240, 'seafood'),
(95, '生鮭魚', '-', 125, 195, 'seafood'),
(96, '雪螺肉', '-', 140, 155, 'seafood'),
(97, '秋刀魚', '-', 50, 75, 'seafood'),
(98, '日式靖魚', '-', 90, 255, 'seafood'),
(99, '一般魚類', '-', 35, 55, 'seafood'),
(100, '虱目魚丸', '-', 50, 75, 'seafood'),
(101, '培根', '1片', 10, 45, 'pork'),
(102, '牛腱', '-', 35, 55, 'beef'),
(103, '肉鬆', '-', 15, 73, 'pork'),
(104, '豬肉', '-', 30, 73, 'pork'),
(105, '羊肉', '-', 30, 73, 'mutton'),
(106, '火腿', '-', 45, 55, 'pork'),
(107, '羊肉', '-', 35, 75, 'mutton'),
(108, '豬腳', '-', 35, 75, 'pork'),
(109, '臘肉', '-', 25, 120, 'pork'),
(110, '牛肉', '-', 30, 73, 'beef'),
(111, '五花肉', '-', 100, 388, 'pork'),
(112, '豬肉乾', '-', 25, 55, 'pork'),
(113, '牛肉乾', '-', 20, 55, 'beef'),
(114, '豬肉鬆', '-', 20, 75, 'pork'),
(115, '洋火腿', '-', 30, 73, 'pork'),
(116, '牛肉絲', '-', 100, 300, 'beef'),
(117, '豬肋排', '-', 226, 480, 'pork'),
(118, '豬小排', '-', 35, 75, 'pork'),
(119, '豬大排', '-', 35, 75, 'pork'),
(120, '豬肉鬆', '-', 25, 120, 'pork'),
(121, '豬大里肌', '-', 35, 55, 'pork'),
(122, '豬後腿肉', '-', 35, 120, 'pork'),
(123, '牛里肌肉', '-', 30, 73, 'beef'),
(124, '豬里肌肉', '-', 30, 73, 'pork'),
(125, '牛小排', '-', 105, 360, 'beef'),
(126, '雞翅', '-', 35, 75, 'poultry'),
(127, '雞排', '-', 35, 75, 'poultry'),
(128, '雞爪', '-', 30, 75, 'poultry'),
(129, '鴨賞', '-', 20, 75, 'poultry'),
(130, '肉脯', '-', 15, 73, 'pork'),
(131, '雞心', '-', 50, 120, 'poultry'),
(132, '鴨肉', '-', 30, 73, 'poultry'),
(133, '鵝肉', '-', 30, 73, 'poultry'),
(134, '雞塊', '-', 120, 200, 'poultry'),
(135, '雞胸肉', '-', 35, 55, 'poultry'),
(136, '雞里肌', '-', 30, 55, 'poultry'),
(137, '雞腿上部', '-', 30, 73, 'poultry'),
(138, '雞腿下部', '-', 30, 73, 'poultry'),
(139, '豬肝', '-', 40, 55, 'pork'),
(140, '雞肝', '-', 40, 55, 'poultry'),
(141, '雞胗', '-', 40, 55, 'poultry'),
(142, '鴨膽', '-', 25, 55, 'poultry'),
(143, '豬腎', '-', 60, 53, 'pork'),
(144, '豬血', '-', 220, 55, 'pork'),
(145, '脆腸', '-', 75, 95, 'poultry'),
(146, '豬舌', '-', 40, 75, 'pork'),
(147, '豬肚', '-', 50, 75, 'pork'),
(148, '豬腦', '-', 60, 75, 'pork'),
(149, '牛肚', '-', 40, 55, 'beef'),
(150, '豬心', '-', 40, 55, 'pork'),
(151, '豬小腸', '-', 55, 75, 'pork'),
(152, '全蛋', '1個', 50, 80, 'egg'),
(153, '皮蛋', '1個', 60, 73, 'egg'),
(154, '鹹蛋', '1個', 60, 73, 'egg'),
(155, '油煎', '1個', 46, 85, 'egg'),
(156, '水煮', '1個', 50, 80, 'egg'),
(157, '炒蛋', '1個', 64, 95, 'egg'),
(158, '荷包蛋', '1個', 50, 80, 'egg'),
(159, '鵪鶉蛋', '5粒', 55, 73, 'egg'),
(160, '蛋黃', '1個', 17, 65, 'egg'),
(161, '蛋白', '1個', 33, 15, 'egg'),
(162, '雞蛋', '1個', 50, 80, 'egg'),
(163, '蛋', '1個', 50, 80, 'egg'),
(164, '花生', '-', 100, 583, 'bean'),
(165, '杏仁', '-', 100, 596, 'bean'),
(166, '腰果', '-', 100, 533, 'bean'),
(167, '黑豆', '-', 100, 367, 'bean'),
(168, '青豆', '-', 100, 118, 'bean'),
(169, '黃豆', '-', 100, 325, 'bean'),
(170, '紅豆', '-', 100, 310, 'bean'),
(171, '綠豆', '-', 100, 320, 'bean'),
(172, '巴西豆', '-', 100, 660, 'bean'),
(173, '胡桃仁', '-', 100, 686, 'bean'),
(174, '松子仁', '-', 100, 583, 'bean'),
(175, '向日葵仁', '-', 100, 558, 'bean'),
(176, '胡桃種仁', '-', 100, 650, 'bean'),
(177, '豆皮', '1張半', 15, 73, 'bean'),
(178, '濕豆皮', '1張半', 50, 73, 'bean'),
(179, '豆包', '-', 25, 55, 'bean'),
(180, '豆枝', '-', 20, 75, 'bean'),
(181, '麵腸', '-', 40, 55, 'bean'),
(182, '百頁豆腐', '-', 25, 75, 'bean'),
(183, '豆鼓', '-', 35, 75, 'bean'),
(184, '麵丸', '-', 40, 55, 'bean'),
(185, '烤麩', '-', 40, 55, 'bean'),
(186, '豆簽', '-', 50, 146, 'bean'),
(187, '毛豆', '-', 50, 73, 'bean'),
(188, '麵糙', '-', 20, 73, 'bean'),
(189, '豆漿', '1杯', 240, 73, 'bean'),
(190, '素雞', '3/4條', 50, 73, 'bean'),
(191, '干絲', '8條', 25, 75, 'bean'),
(192, '豆腐', '1塊', 100, 75, 'bean'),
(193, '麵筋泡', '16粒', 20, 120, 'bean'),
(194, '百頁結', '-', 25, 75, 'bean'),
(195, '黃豆腐', '半塊', 70, 73, 'bean'),
(196, '豆腐孔', '1塊半', 45, 73, 'bean'),
(197, '生黃豆', '1匙半', 20, 73, 'bean'),
(198, '熟黃豆', '半杯', 100, 146, 'bean'),
(199, '油煎豆腐', '3個半', 85, 73, 'bean'),
(200, '蒸臭豆腐', '1塊', 60, 73, 'bean'),
(201, '五香豆干', '2張半', 45, 73, 'bean'),
(202, '奶油', '15ml', 14, 100, 'oil'),
(203, '牛油', '1茶匙', 5, 45, 'oil'),
(204, '豬油', '15ml', 13, 115, 'oil'),
(205, '麻油', '1茶匙', 0, 45, 'oil'),
(206, '黃油', '1茶匙', 0, 45, 'oil'),
(207, '雞油', '1茶匙', 0, 45, 'oil'),
(208, '蠔油', '1茶匙', 0, 45, 'oil'),
(209, '蝦油', '1茶匙', 0, 4, 'oil'),
(210, '橄欖油', '15ml', 14, 120, 'oil'),
(211, '花生油', '15ml', 14, 120, 'oil'),
(212, '大豆油', '15ml', 14, 120, 'oil'),
(213, '葵花油', '15ml', 14, 120, 'oil'),
(214, '玉米油', '15ml', 14, 120, 'oil'),
(215, '瑪琪琳', '1茶匙', 5, 45, 'oil'),
(216, '棉子油', '1茶匙', 5, 45, 'oil'),
(217, '鮮奶油', '1湯匙', 15, 45, 'oil'),
(218, '椰子油', '1茶匙', 5, 45, 'oil'),
(219, '蛋黃醬', '1茶匙', 5, 45, 'oil'),
(220, '植物油', '1茶匙', 0, 45, 'oil'),
(221, '沙拉醬', '2茶匙', 10, 45, 'oil'),
(222, '人造奶油', '15ml', 14, 100, 'oil'),
(223, '黑白芝麻', '2茶匙', 8, 45, 'oil'),
(224, '紅花子油', '1茶匙', 5, 45, 'oil'),
(225, '奶油乳酪', '2茶匙', 12, 45, 'oil'),
(226, '開胃酒', '一杯', 60, 65, 'wine'),
(227, '龜鹿藥酒', '1罐', 500, 958, 'wine'),
(228, '威士忌', '1罐', 500, 1190, 'wine'),
(229, '烏梅酒', '1罐', 600, 1150, 'wine'),
(230, '參茸酒', '1罐', 300, 575, 'wine'),
(231, '黃酒', '1罐', 600, 600, 'wine'),
(232, '保力達B', '1瓶', 0, 300, 'wine'),
(233, '紹興酒', '1罐', 600, 600, 'wine'),
(234, '台灣啤酒', '1罐', 355, 90, 'wine'),
(235, '高梁酒', '1罐', 300, 810, 'wine'),
(236, '黑啤酒', '1罐', 360, 150, 'wine'),
(237, '玫瑰紅酒', '1罐', 600, 425, 'wine'),
(238, '白葡萄酒', '1罐', 600, 425, 'wine'),
(239, '瓜子', '50粒', 0, 45, 'bean'),
(240, '腰果', '5粒', 0, 45, 'bean'),
(241, '開心果', '10粒', 0, 45, 'bean'),
(242, '核桃仁', '2粒', 0, 45, 'bean'),
(243, '爆米花', '100g', 0, 459, 'bean'),
(244, '杏仁果', '5粒', 0, 45, 'bean'),
(245, '花生米', '10粒', 0, 45, 'bean'),
(246, '芭樂乾', '1包', 0, 88, 'fruit'),
(247, '南瓜子', '30粒', 0, 45, 'bean'),
(248, '珍珍魷魚絲', '1包', 80, 231, 'seafood'),
(249, '珍珍魷魚片', '1包', 80, 259, 'seafood'),
(250, '珍珍魷魚頭', '1包', 80, 216, 'seafood'),
(251, '埔島海苔', '1包', 20, 30, 'seafood'),
(252, '高崗屋海苔', '1包', 30, 60, 'seafood'),
(253, '夏威夷果仁', '-', 80, 600, 'bean'),
(254, '北海鱈魚香絲', '1包', 50, 250, 'seafood'),
(255, '萬歲牌開心果', '1包', 113, 680, 'bean'),
(256, '萬歲牌蜜汁果', '1包', 110, 679, 'bean'),
(257, '萬歲牌杏仁果', '1包', 90, 585, 'bean'),
(258, '萬歲牌杏仁小魚', '1包', 80, 438, 'seafood'),
(259, '優鮮沛蔓越苺', '大罐', 200, 650, 'fruit'),
(260, '香蕉', '1根', 0, 40, 'fruit'),
(261, '荔枝', '4粒', 0, 45, 'fruit'),
(262, '櫻桃', '20粒', 0, 50, 'fruit'),
(263, '楊桃', '-', 310, 100, 'fruit'),
(264, '雪梨', '1個', 0, 45, 'fruit'),
(265, '鳳梨', '1片', 120, 50, 'fruit'),
(266, '西瓜', '1片', 240, 40, 'fruit'),
(267, '杏梅', '1個', 0, 45, 'fruit'),
(268, '桃子', '1個', 0, 45, 'fruit'),
(269, '芒果', '1個', 0, 100, 'fruit'),
(270, '木瓜', '-', 390, 85, 'fruit'),
(271, '龍眼', '12個', 0, 60, 'fruit'),
(272, '李子', '5顆', 35, 140, 'fruit'),
(273, '蘋果', '-', 120, 60, 'fruit'),
(274, '桔子', '6顆', 0, 60, 'fruit'),
(275, '橘子', '-', 200, 65, 'fruit'),
(276, '香蕉', '-', 370, 295, 'fruit'),
(277, '葡萄', '-', 350, 170, 'fruit'),
(278, '柿子', '-', 200, 120, 'fruit'),
(279, '香瓜', '-', 500, 160, 'fruit'),
(280, '水梨', '-', 210, 90, 'fruit'),
(281, '山竹', '1個', 75, 10, 'fruit'),
(282, '蓮霧', '1個', 270, 70, 'fruit'),
(283, '棗子', '1個', 70, 30, 'fruit'),
(284, '芭樂', '-', 215, 70, 'fruit'),
(285, '蕃茄', '-', 70, 18, 'fruit'),
(286, '釋迦', '1個', 350, 160, 'fruit'),
(287, '草莓', '5顆', 85, 30, 'fruit'),
(288, '甘蔗', '-', 130, 60, 'fruit'),
(289, '柳橙', '1個', 0, 50, 'fruit'),
(290, '百香果', '1個', 100, 45, 'fruit'),
(291, '火龍果', '1個', 250, 60, 'fruit'),
(292, '青蘋果', '-', 165, 80, 'fruit'),
(293, '葡萄柚', '1個', 700, 220, 'fruit'),
(294, '哈密瓜', '1片', 240, 60, 'fruit'),
(295, '奇異果', '1片', 100, 40, 'fruit'),
(296, '西洋梨', '1個', 265, 120, 'fruit'),
(297, '加州李', '1個', 100, 45, 'fruit'),
(298, '洋香瓜', '-', 350, 115, 'fruit'),
(299, '葡萄', '-', 270, 130, 'fruit'),
(300, '小玉西瓜', '4斤', 2400, 430, 'fruit'),
(301, '羊奶', '1杯', 240, 170, 'dairy'),
(302, '蒸發奶', '半杯', 120, 170, 'dairy'),
(303, '全脂牛奶', '1杯', 240, 150, 'dairy'),
(304, '全脂奶粉', '4湯匙', 35, 150, 'dairy'),
(305, '牛奶布丁', '1杯', 260, 320, 'dairy'),
(306, '優酪乳', '1杯', 227, 140, 'dairy'),
(307, '硬式牛奶冰淇淋', '1杯', 133, 270, 'dairy'),
(308, '軟式牛奶冰淇淋', '1杯', 173, 375, 'dairy'),
(309, '鹽', '-', 100, 0, 'sauce'),
(310, '醋', '-', 100, 11, 'sauce'),
(311, '辣醬', '-', 100, 33, 'sauce'),
(312, '米酒', '-', 1, 20, 'sauce'),
(313, '醬油', '-', 100, 44, 'sauce'),
(314, '紅槽', '-', 100, 100, 'sauce'),
(315, '黑糖', '-', 100, 324, 'sauce'),
(316, '白醋', '-', 1, 2, 'sauce'),
(317, '白糖', '-', 100, 380, 'sauce'),
(318, '紅蔥頭', '-', 100, 75, 'sauce'),
(319, '蕃茄醬', '-', 100, 93, 'sauce'),
(320, '花生粉', '-', 8, 45, 'sauce'),
(321, '美乃滋', '-', 0, 45, 'sauce'),
(322, '沙拉醬', '-', 10, 45, 'sauce'),
(323, '甜麵醬', '-', 100, 259, 'sauce'),
(324, '芝麻醬', '-', 100, 481, 'sauce'),
(325, '草莓果醬', '-', 100, 120, 'sauce'),
(326, '葡萄果醬', '-', 100, 120, 'sauce'),
(327, '起司醬', '-', 100, 485, 'sauce'),
(328, '果醬', '1湯匙', 18, 50, 'sauce'),
(329, '花椰菜米', '1', 0, 25, 'vegetable'),
(330, '原味玉米片', '1', 0, 110, 'grains'),
(331, '水煮鮪魚', '1', 0, 130, 'seafood'),
(332, '熟紅蘿蔔', '1', 0, 45, 'vegetable'),
(333, '細蘆筍', '1', 0, 20, 'vegetable'),
(334, '小蘇打粉', '1', 0, 0, 'sauce'),
(335, '聖女小番茄', '1', 0, 3, 'vegetable'),
(336, '結球萵苣', '1', 0, 15, 'vegetable'),
(337, '7-11黑木耳', '1', 0, 10, 'vegetable'),
(338, '辣椒粉', '1', 0, 5, 'sauce'),
(339, '小南瓜', '1', 0, 30, 'vegetable'),
(340, '煙燻烏梅', '1', 0, 20, 'fruit'),
(341, '純咖哩粉', '1', 0, 15, 'sauce'),
(342, '意大利醋', '1', 0, 5, 'sauce'),
(343, '乾燥時蘿', '1', 0, 10, 'vegetable'),
(344, '玉米筍', '1', 0, 20, 'vegetable'),
(345, '蘿蔓生菜', '1', 0, 5, 'vegetable'),
(346, '和風醬油', '1', 0, 10, 'sauce'),
(347, '蘿美生菜', '1', 0, 5, 'vegetable'),
(348, '磨菇', '1', 0, 15, 'vegetable'),
(349, '鹽麴：', '1', 0, 5, 'sauce'),
(350, '白胡椒', '1', 0, 5, 'sauce'),
(351, '芋頭', '1', 0, 150, 'vegetable'),
(352, '鯛魚', '1', 0, 130, 'seafood'),
(353, '胡椒', '1', 0, 5, 'sauce'),
(354, '藍莓', '1', 0, 80, 'fruit'),
(355, '新鮮大透抽', '1', 0, 90, 'seafood'),
(356, '蒜瓣', '1', 0, 5, 'vegetable'),
(357, '月桂葉', '1', 0, 2, 'sauce'),
(358, '牛柳粒', '1', 0, 150, 'beef'),
(359, '櫛瓜', '1', 0, 20, 'vegetable'),
(360, '純在葡萄柚蘋果綠茶', '1', 0, 30, '-'),
(361, '雞柳', '1', 0, 120, 'poultry'),
(362, '大蒜末', '1', 0, 5, 'vegetable'),
(363, '蒜', '1', 0, 5, 'vegetable'),
(364, '西芹', '1', 0, 10, 'vegetable'),
(365, '紅蘿蔔絲', '1', 0, 15, 'vegetable'),
(366, '鮮冬菇', '1', 0, 20, 'vegetable'),
(367, '生菜片', '1', 0, 5, 'vegetable'),
(368, '紫蘇葉', '1', 0, 2, 'vegetable'),
(369, '中筋麵粉', '1', 0, 110, 'grains'),
(370, '韭菜', '1', 0, 10, 'vegetable'),
(371, '全麥吐司', '1', 0, 80, 'grains'),
(372, '牛肉里肌火鍋肉片', '1', 0, 120, 'beef'),
(373, '生干貝', '1', 0, 70, 'seafood'),
(374, 'AK安康藜麥', '1', 0, 120, 'grains'),
(375, '為卡蒟蒻麵條', '1', 0, 10, 'grains'),
(376, '舞菇', '1', 0, 15, 'vegetable'),
(377, '蔥段', '1', 0, 5, 'vegetable'),
(378, '越南米線', '1', 0, 50, 'grains'),
(379, '金菇', '1', 0, 10, 'vegetable'),
(380, '中卷', '1', 0, 80, 'seafood'),
(381, '櫻桃茄', '1', 0, 10, 'vegetable'),
(382, '辣椒絲', '1', 0, 5, 'vegetable'),
(383, '大白菜', '1', 0, 10, 'vegetable'),
(384, '蒜茸', '1', 0, 5, 'vegetable'),
(385, '沙拉用生菜', '1', 0, 5, 'vegetable'),
(386, '罵鈴薯', '1', 0, 90, 'vegetable'),
(387, '韭菜花', '1', 0, 15, 'vegetable'),
(388, '小黃瓜斜切片', '1', 0, 10, 'vegetable'),
(389, '三色藜麥', '1', 0, 120, 'grains'),
(390, '蘿蔓生菜丁', '1', 0, 5, 'vegetable'),
(391, '喜歡的香料或醬汁', '1', 0, 0, 'sauce'),
(392, '小顆蘋果切丁', '1', 0, 50, 'fruit'),
(393, '豬排骨', '1', 0, 150, 'pork'),
(394, '花枝圈', '1', 0, 80, 'seafood'),
(395, '五穀米', '1', 0, 100, 'grains'),
(396, '柴魚香鬆', '1', 0, 60, 'seafood'),
(397, '地瓜 sweet potato', '1', 0, 90, 'vegetable'),
(398, '薄鹽醬油', '1', 0, 5, 'sauce'),
(399, '脫脂魚湯', '1', 0, 10, 'sauce'),
(400, '蝦', '1', 0, 80, 'seafood'),
(401, '黑胡椒粗粒', '1', 0, 5, 'sauce'),
(402, '梨', '1', 0, 50, 'fruit'),
(403, '肉桂粉', '1', 0, 5, 'sauce'),
(404, '火鍋肉片', '1', 0, 120, 'pork'),
(405, '雞胸絞肉', '1', 0, 110, 'poultry'),
(406, '新鮮無花果', '1', 0, 50, 'fruit'),
(407, '美白菇或精靈菇', '1', 0, 15, 'vegetable'),
(408, '紅甜椒', '1', 0, 20, 'vegetable'),
(409, '原味優格', '1', 0, 50, 'dairy'),
(410, '檸檬皮', '1', 0, 5, 'fruit'),
(411, '小蘋果', '1', 0, 50, 'fruit'),
(412, '大蝦仁', '1', 0, 80, 'seafood'),
(413, '胡蘿蔔絲', '1', 0, 15, 'vegetable'),
(414, '蒜頭', '1', 0, 5, 'vegetable'),
(415, '西洋芹', '1', 0, 5, 'vegetable'),
(416, '粗黑胡椒粉', '1', 0, 5, 'sauce'),
(417, '糊椒粉', '1', 0, 5, 'sauce'),
(418, '雞腿片', '1', 0, 120, 'poultry'),
(419, '碗豆苗', '1', 0, 10, 'vegetable'),
(420, '蔥', '1', 0, 5, 'vegetable'),
(421, '紫洋蔥?', '1', 0, 20, 'vegetable'),
(422, '無糖希臘優格', '1', 0, 50, 'dairy'),
(423, '椰菜', '1', 0, 20, 'vegetable'),
(424, '100%純天然蜂蜜', '1', 0, 60, 'sauce'),
(425, '純淨水', '1', 0, 0, '-'),
(426, '海帶芽', '1', 0, 10, 'seafood'),
(427, '雞肉丁', '1', 0, 100, 'poultry'),
(428, '芒果 ／1個', '1', 0, 50, 'fruit'),
(429, '生粉', '1', 0, 5, '-'),
(430, '去皮生雞胸肉', '1', 0, 120, 'poultry'),
(431, '海鮮加自己喜歡的', '1', 0, 0, 'seafood'),
(432, '泰式甜辣醬', '1', 0, 30, 'sauce'),
(433, '穀物麵包', '1', 0, 80, 'grains'),
(434, '香油或麻油', '1', 0, 120, 'oil'),
(435, '黑胡椒粉或粗粒', '1', 0, 5, 'sauce'),
(436, '酪梨', '1', 0, 80, 'fruit'),
(437, '白木耳', '1', 0, 15, 'vegetable'),
(438, '煙燻鹹豬肉或肉絲', '1', 0, 100, 'pork'),
(439, '義大利香料', '1', 0, 5, 'sauce'),
(440, '青甜椒', '1', 0, 20, 'vegetable'),
(441, '米', '1', 0, 100, 'grains'),
(442, '水煮鮪魚罐頭', '1', 0, 130, 'seafood'),
(443, '七味粉', '1', 0, 5, 'sauce'),
(444, '熱水', '1', 0, 0, '-'),
(445, '濕黃豆渣', '1', 0, 50, 'bean'),
(446, '檸檬汁', '1', 0, 5, 'fruit'),
(447, '獼猴桃', '1', 0, 50, 'fruit'),
(448, '大黃瓜切薄片', '1', 0, 10, 'vegetable'),
(449, '紅', '1', 0, 0, '-'),
(450, '電鍋', '1', 0, 0, '-'),
(451, '藜麥', '1', 0, 120, 'grains'),
(452, '熟綠竹筍', '1', 0, 40, 'vegetable'),
(453, '黃秋葵', '1', 0, 15, 'vegetable'),
(454, '花椰米', '1', 0, 50, 'grains'),
(455, '芝麻菜', '1', 0, 10, 'vegetable'),
(456, '新鮮迷迭香葉', '1', 0, 5, 'sauce'),
(457, '食材', '1', 0, 0, '-'),
(458, 'AK安康有機腰果', '1', 0, 120, 'oil'),
(459, '筍', '1', 0, 20, 'vegetable'),
(460, '彩色紅蘿蔔', '1', 0, 20, 'vegetable'),
(461, '柴魚片', '1', 0, 10, 'seafood'),
(462, '雞胸肉2小塊', '1', 0, 200, 'poultry'),
(463, '匈牙利紅椒粉', '1', 0, 5, 'sauce'),
(464, '熟薏仁', '1', 0, 100, 'grains'),
(465, '消化餅', '1', 0, 50, 'grains'),
(466, '法式香草粉', '1', 0, 5, 'sauce'),
(467, '蘿曼生菜', '1', 0, 10, 'vegetable'),
(468, '毛豆莢', '1', 0, 30, 'bean'),
(469, '雞里肌肉切柳狀', '1', 0, 100, 'poultry'),
(470, '漢堡包', '1', 0, 150, 'grains'),
(471, '燻鮭魚', '1', 0, 150, 'seafood'),
(472, '牛鍵', '1', 0, 150, 'beef'),
(473, '甜雞醬', '1', 0, 50, 'sauce'),
(474, '調味', '1', 0, 0, 'sauce'),
(475, '蒟蒻', '1', 0, 10, 'vegetable'),
(476, '雪白菇', '1', 0, 15, 'vegetable'),
(477, '去骨雞腿或帶骨雞腿', '1', 0, 200, 'poultry'),
(478, '黃椒', '1', 0, 20, 'vegetable'),
(479, '原味無香料添加大燕麥片', '1', 0, 80, 'grains'),
(480, '冷壓初榨橄欖油', '1', 0, 120, 'oil'),
(481, '麥片', '1', 0, 90, 'grains'),
(482, '五穀粉或薏仁粉', '1', 0, 100, 'grains'),
(483, '甜豆', '1', 0, 30, 'bean'),
(484, '蒜香調味', '1', 0, 20, 'sauce'),
(485, '鹹味蘇打餅', '1', 0, 20, 'grains'),
(486, '高麗菜絲', '1', 0, 10, 'vegetable'),
(487, '柚肉和風醬', '1', 0, 50, 'sauce'),
(488, '鹽 黑胡椒粉', '1', 0, 5, 'sauce'),
(489, '韓國辣椒粉', '1', 0, 5, 'sauce'),
(490, '燙熟放涼玉米筍', '1', 0, 30, 'vegetable'),
(491, '牛蒡', '1', 0, 20, 'vegetable'),
(492, '筊白筍', '1', 0, 20, 'vegetable'),
(493, '印度咖哩粉', '1', 0, 10, 'sauce'),
(494, '韓國甜辣醬', '1', 0, 50, 'sauce'),
(495, '起司', '1', 0, 100, 'dairy'),
(496, '各式海鮮', '1', 0, 0, 'seafood'),
(497, '青花椰菜', '1', 0, 15, 'vegetable'),
(498, '三色綜合蔬菜', '1', 0, 20, 'vegetable'),
(499, '低筋麵粉', '1', 0, 100, 'grains'),
(500, '可可粉', '1', 0, 20, 'sauce'),
(501, '五味粉', '1', 0, 5, 'sauce'),
(502, '絞肉', '1', 0, 150, 'pork'),
(503, '鮮山藥', '1', 0, 100, 'vegetable'),
(504, '7-11鮮採牛蕃茄', '1', 0, 20, 'vegetable'),
(505, '吉利丁粉', '1', 0, 20, 'sauce'),
(506, '奇亞籽', '1', 0, 50, 'sauce'),
(507, '香茅', '1', 0, 5, 'sauce'),
(508, '小芋頭', '1', 0, 80, 'vegetable'),
(509, '白酒：', '1', 0, 100, 'wine'),
(510, '去骨牛小排', '1', 0, 150, 'beef'),
(511, '米紙', '1', 0, 50, 'grains'),
(512, '材料', '1', 0, 0, '-'),
(513, '牛蒡絲', '1', 0, 20, 'vegetable'),
(514, '金桔', '1', 0, 30, 'fruit'),
(515, '乾羅勒葉', '1', 0, 5, 'sauce'),
(516, '杏鮑菇', '1', 0, 20, 'vegetable'),
(517, '吐司', '1', 0, 80, 'grains'),
(518, '鴻禧菇', '1', 0, 15, 'vegetable'),
(519, '新鮮香菇', '1', 0, 15, 'vegetable'),
(520, '中等大小番茄', '1', 0, 15, 'vegetable'),
(521, '五花腩', '1', 0, 200, 'pork'),
(522, 'Ikea燻鮭魚', '1', 0, 150, 'seafood'),
(523, '蒜粒', '1', 0, 5, 'vegetable'),
(524, '撒神秘粉', '1', 0, 0, 'sauce'),
(525, '昨天冰箱的剩菜', '1', 0, 0, '-'),
(526, '黃櫛瓜', '1', 0, 20, 'vegetable'),
(527, '低脂芝士片', '1', 0, 60, 'dairy'),
(528, '紅黃甜椒', '1', 0, 20, 'vegetable'),
(529, '魚露', '1', 0, 10, 'sauce'),
(530, '切好的土雞肉', '1', 0, 150, 'poultry'),
(531, '蘿蔓', '1', 0, 10, 'vegetable'),
(532, '沙茶醬', '1', 0, 50, 'sauce'),
(533, '熟鷹嘴豆', '1', 0, 100, 'bean'),
(534, '蒟蒻條', '1', 0, 20, 'vegetable'),
(535, '高麗菜', '1', 0, 20, 'vegetable'),
(536, '熟雞絲', '1', 0, 150, 'poultry'),
(537, '蘑菇濃湯湯粉', '1', 0, 50, 'grains'),
(538, '黑/白胡椒', '1', 0, 5, 'sauce'),
(539, '玻璃瓶', '1', 0, 0, '-'),
(540, '小型三色彩椒', '1', 0, 20, 'vegetable'),
(541, '紅蘿蔔片', '1', 0, 20, 'vegetable'),
(542, '十穀飯', '1', 0, 150, 'grains'),
(543, '熟雞胸', '1', 0, 150, 'poultry'),
(544, '冬菇', '1', 0, 15, 'vegetable'),
(545, '熟南瓜', '1', 0, 30, 'vegetable'),
(546, '黃豆粉', '1', 0, 50, 'bean'),
(547, '越南春卷米紙', '1', 0, 30, 'grains'),
(548, '蔥花', '1', 0, 5, 'vegetable'),
(549, '豬梅花/豬里肌', '1', 0, 200, 'pork'),
(550, '新鮮迷迭香', '1', 0, 5, 'sauce'),
(551, '全麥土司', '1', 0, 80, 'grains'),
(552, '青瓜', '1', 0, 10, 'vegetable'),
(553, '地瓜', '1', 0, 50, 'vegetable'),
(554, '雞胸切丁', '1', 0, 120, 'poultry'),
(555, '全麥麵粉', '1', 0, 100, 'grains'),
(556, '味琳', '1', 0, 50, 'sauce'),
(557, '鬆餅粉', '1', 0, 100, 'grains'),
(558, '小麥胚芽', '1', 0, 50, 'grains'),
(559, '芝麻油', '1', 0, 120, 'oil'),
(560, '豆渣', '1', 0, 50, 'bean'),
(561, '綠花耶菜', '1', 0, 15, 'vegetable'),
(562, '洋蔥絲', '1', 0, 10, 'vegetable'),
(563, '義大利黑醋', '1', 0, 50, 'sauce'),
(564, '生萵苣', '1', 0, 10, 'vegetable'),
(565, '原味白芝麻醬', '1', 0, 80, 'sauce'),
(566, '鯛魚腹片', '1', 0, 100, 'seafood'),
(567, '泡打粉', '1', 0, 5, 'sauce'),
(568, '低鈉醬油', '1', 0, 10, 'sauce'),
(569, '松露醬', '1', 0, 50, 'sauce'),
(570, '玫瑰鹽', '1', 0, 5, 'sauce'),
(571, '日式照燒烤肉醬', '1', 0, 50, 'sauce'),
(572, '葵遙甘薯', '1', 0, 50, 'vegetable'),
(573, '燕麥粒', '1', 0, 50, 'grains'),
(574, '乾黑木耳', '1', 0, 20, 'vegetable'),
(575, '鴻喜菇', '1', 0, 15, 'vegetable'),
(576, '白米', '1', 0, 150, 'grains'),
(577, '雞胸肉2塊', '1', 0, 200, 'poultry'),
(578, '菇類', '1', 0, 0, 'vegetable'),
(579, '泡菜', '1', 0, 20, 'vegetable'),
(580, '葡萄柚果肉', '1', 0, 30, 'fruit'),
(581, '芥蘭菜心', '1', 0, 15, 'vegetable'),
(582, '珊瑚草', '1', 0, 10, 'vegetable'),
(583, '山楂乾', '1', 0, 20, 'fruit'),
(584, '紫洋蔥切片', '1', 0, 10, 'vegetable'),
(585, 'OXO蔬果削鉛筆機', '-', 0, 0, '-'),
(586, '香草精', '1', 0, 10, 'sauce'),
(587, '鮭魚罐頭或者新鮮鮭魚', '1', 0, 150, 'seafood'),
(588, '墨西哥玉米餅皮', '1', 0, 80, 'grains'),
(589, '無糖豆乳', '1', 0, 50, 'dairy'),
(590, '小黃瓜', '1', 0, 10, 'vegetable'),
(591, '帶骨雞胸肉', '1', 0, 200, 'poultry'),
(592, '水蓮', '1', 0, 15, 'vegetable'),
(593, '起司片', '1', 0, 100, 'dairy'),
(594, '黑醋', '1', 0, 50, 'sauce'),
(595, '粗粒胡椒', '1', 0, 5, 'sauce'),
(596, '辣椒片', '1', 0, 5, 'vegetable'),
(597, '九層塔', '1', 0, 5, 'sauce'),
(598, '鵝油or豬油', '1', 0, 120, 'oil'),
(599, '豆瓣醬', '1', 0, 30, 'sauce'),
(600, '家樂福嚴選紅蘿蔔', '1', 0, 30, 'vegetable'),
(601, '無糖優酪乳', '1', 0, 50, 'dairy'),
(602, '橄欖油 olive oil', '1', 0, 120, 'oil'),
(603, '海鹽', '1', 0, 0, 'sauce'),
(604, '娃娃菜', '1', 0, 10, 'vegetable'),
(605, '茶葉', '1', 0, 0, 'sauce'),
(606, '豬肉片', '1', 0, 150, 'pork'),
(607, '罐頭水煮鮪魚', '1', 0, 150, 'seafood'),
(608, '熟毛豆仁', '1', 0, 100, 'bean'),
(609, '香吉士果肉切片', '1', 0, 50, 'fruit'),
(610, '鹽漬檸檬汁', '1', 0, 10, 'sauce'),
(611, '寒天麵or麵', '1', 0, 80, 'grains'),
(612, '熟透香蕉', '1', 0, 100, 'fruit'),
(613, '冬粉', '1', 0, 50, 'grains'),
(614, '原味乳酪', '1', 0, 100, 'dairy'),
(615, '西瓜挖球', '1', 0, 50, 'fruit'),
(616, '蒲燒秋刀魚罐頭', '1', 0, 150, 'seafood'),
(617, '野菇', '1', 0, 20, 'vegetable'),
(618, '原味燕麥片', '1', 0, 80, 'grains'),
(619, '急凍有機粟米粒', '1', 0, 50, 'vegetable'),
(620, '黃豆芽', '1', 0, 10, 'vegetable'),
(621, '荷蘭豆', '1', 0, 20, 'vegetable'),
(622, '牛奶', '1', 0, 50, 'dairy'),
(623, '球芽甘藍', '1', 0, 10, 'vegetable'),
(624, '蒟蒻米', '1', 0, 20, 'vegetable'),
(625, '太白粉', '1', 0, 50, 'grains'),
(626, '玉米鬚', '1', 0, 20, 'vegetable'),
(627, '鰹魚粉', '1', 0, 10, 'sauce'),
(628, '大漠孜然風味料', '1', 0, 10, 'sauce'),
(629, '胡椒粉', '1', 0, 5, 'sauce'),
(630, '海苔', '1', 0, 10, 'vegetable'),
(631, '去皮雞胸肉', '1', 0, 150, 'poultry'),
(632, '低鹽醬油', '1', 0, 10, 'sauce'),
(633, '豬絞肉', '1', 0, 200, 'pork'),
(634, '醬油膏', '1', 0, 50, 'sauce'),
(635, '越南火腿', '1', 0, 50, 'pork'),
(636, '決明子', '1', 0, 5, 'sauce'),
(637, '十穀米飯', '1', 0, 150, 'grains'),
(638, '白皮小馬鈴薯', '1', 0, 50, 'vegetable'),
(639, '醬汁︰豆腐乳', '1', 0, 50, 'sauce'),
(640, '去骨雞腿肉', '1', 0, 200, 'poultry'),
(641, '蒜油（沒蒜油就蒜頭六瓣', '1', 0, 50, 'sauce'),
(642, '醬油/味霖 各', '1', 0, 50, 'sauce'),
(643, '水餃皮', '1', 0, 50, 'grains'),
(644, '味霖', '1', 0, 50, 'sauce'),
(645, '青蔥', '1', 0, 5, 'vegetable'),
(646, '小乾黑木耳', '1', 0, 20, 'vegetable'),
(647, '黑胡椒粉', '1', 0, 5, 'sauce'),
(648, '生米', '1', 0, 150, 'grains'),
(649, '雞高湯', '1', 0, 30, 'sauce'),
(650, '熟蛋黃', '1', 0, 50, 'egg'),
(651, '番茄', '1', 0, 20, 'vegetable'),
(652, '綜合生菜', '1', 0, 10, 'vegetable'),
(653, '洋芋沙拉', '1', 0, 100, 'vegetable'),
(654, '瘦雞肉碎', '1', 0, 150, 'poultry'),
(655, '八角', '1', 0, 5, 'sauce'),
(656, '燕麥片', '1', 0, 80, 'grains'),
(657, '梅花豬肉片', '1', 0, 200, 'pork'),
(658, '小白菜', '1', 0, 10, 'vegetable'),
(659, '冷凍石斑魚塊', '1', 0, 150, 'seafood'),
(660, '抹茶粉', '1', 0, 10, 'sauce'),
(661, '紅蔥頭：', '1', 0, 10, 'vegetable'),
(662, '鯛魚片大', '1', 0, 150, 'seafood'),
(663, '涼拌小黃瓜材料', '1', 0, 0, 'vegetable'),
(664, '牛勒條', '1', 0, 150, 'beef'),
(665, '烏醋', '1', 0, 10, 'sauce'),
(666, '小黃', '1', 0, 10, 'vegetable'),
(667, '盒裝豆腐', '1', 0, 100, 'bean'),
(668, '蒜末', '1', 0, 10, 'vegetable'),
(669, '蘆筍切段', '1', 0, 20, 'vegetable'),
(670, '金針菇', '1', 0, 10, 'vegetable'),
(671, '蘑菇', '1', 0, 10, 'vegetable'),
(672, '黑胡椒粒', '1', 0, 5, 'sauce'),
(673, '甘筍', '1', 0, 20, 'vegetable'),
(674, '枸杞', '1', 0, 5, 'vegetable'),
(675, '市售紅茶', '1', 0, 0, '-'),
(676, '味醂', '1', 0, 30, 'sauce'),
(677, '寬冬粉', '1', 0, 80, 'grains'),
(678, '冰塊', '1', 0, 0, '-'),
(679, '雕魚', '1', 0, 150, 'seafood'),
(680, '蕎麥麵', '1', 0, 150, 'grains'),
(681, '青蔥段', '1', 0, 10, 'vegetable'),
(682, '各式香草', '1', 0, 5, 'sauce'),
(683, '台灣紅藜', '1', 0, 50, 'grains'),
(684, '青蔥切碎', '1', 0, 10, 'vegetable'),
(685, '嫩豆腐', '1', 0, 100, 'bean'),
(686, '美白菇', '1', 0, 10, 'vegetable'),
(687, '雞里肌肉', '1', 0, 150, 'poultry'),
(688, '嫩薑', '1', 0, 10, 'vegetable'),
(689, '韮菜', '1', 0, 10, 'vegetable'),
(690, '筆管麵', '1', 0, 150, 'grains'),
(691, '老薑片', '1', 0, 10, 'vegetable'),
(692, '食用油', '1', 0, 120, 'oil'),
(693, '帶子', '1', 0, 100, 'seafood'),
(694, '蒟蒻雪麵', '1', 0, 20, 'grains'),
(695, '金黃奇異果', '1', 0, 80, 'fruit'),
(696, '牛肋條', '1', 0, 200, 'beef'),
(697, '豬里肌', '1', 0, 150, 'pork'),
(698, '紅辣椒', '1', 0, 10, 'vegetable'),
(699, '黃甜椒', '1', 0, 20, 'vegetable'),
(700, '水果', '1', 0, 0, 'fruit'),
(701, '無刺鮭魚塊', '1', 0, 150, 'seafood'),
(702, '孜然粉cumin powder', '1', 0, 5, 'sauce'),
(703, '雞蛋豆腐', '1', 0, 100, 'bean'),
(704, '白芝麻', '1', 0, 50, 'sauce'),
(705, 'costco大蝦仁', '1', 0, 150, 'seafood'),
(706, '昆布', '1', 0, 10, 'vegetable'),
(707, '洛神花', '1', 0, 10, 'sauce'),
(708, '西班牙紅椒粉', '1', 0, 5, 'sauce'),
(709, '和風芝麻醬', '1', 0, 50, 'sauce'),
(710, '葉菜類', '1', 0, 0, 'vegetable'),
(711, '海帶芽絲', '1', 0, 20, 'vegetable'),
(712, '凍豆腐', '1', 0, 100, 'bean'),
(713, '芝麻', '1', 0, 50, 'sauce'),
(714, '豬里肌火鍋肉片', '1', 0, 150, 'pork'),
(715, '大蕃茄', '1', 0, 50, 'vegetable'),
(716, '無糖麥片', '1', 0, 100, 'grains'),
(717, '碗豆莢', '1', 0, 20, 'vegetable'),
(718, '鮮味炒手', '1', 0, 150, 'seafood'),
(719, '紅酒醋', '1', 0, 10, 'sauce'),
(720, '菇', '1', 0, 10, 'vegetable'),
(721, '鮮香菇', '1', 0, 10, 'vegetable'),
(722, '黑椒粉', '1', 0, 5, 'sauce'),
(723, '豆干', '1', 0, 50, 'vegetable'),
(724, '雞胸', '1', 0, 150, 'poultry'),
(725, '七味粉和辣椒粉', '1', 0, 10, 'sauce'),
(726, '十穀米', '1', 0, 150, 'grains'),
(727, '好菇道雪白菇', '1', 0, 10, 'vegetable'),
(728, '蝦子', '1', 0, 100, 'seafood'),
(729, '茄子', '1', 0, 20, 'vegetable'),
(730, '香菇切片', '1', 0, 10, 'vegetable'),
(731, '無糖優格', '1', 0, 50, 'dairy'),
(732, '蘿蔔櫻桃', '1', 0, 10, 'vegetable'),
(733, '即食燕麥片', '1', 0, 100, 'grains'),
(734, '米飯', '1', 0, 150, 'grains'),
(735, '龍眼乾', '1', 0, 50, 'fruit'),
(736, '牛油果', '1', 0, 150, 'fruit'),
(737, '匈牙利紅甜椒粉', '1', 0, 5, 'sauce'),
(738, '高湯', '1', 0, 30, 'sauce'),
(739, '富士蘋果', '1', 0, 50, 'fruit'),
(740, '菠菜泥', '1', 0, 10, 'vegetable'),
(741, '苦瓜', '1', 0, 20, 'vegetable'),
(742, '香油', '1', 0, 120, 'oil'),
(743, '鯛魚背肉', '1', 0, 150, 'seafood'),
(744, '白蘿蔔', '1', 0, 20, 'vegetable'),
(745, '美國進口酪梨', '1', 0, 150, 'fruit'),
(746, '三色豆', '1', 0, 50, 'vegetable'),
(747, '越南米紙', '1', 0, 50, 'grains'),
(748, '鹽巴', '1', 0, 0, 'sauce'),
(750, '薑片', '1', 0, 5, 'vegetable'),
(751, '蓮藕粉', '1', 0, 50, 'grains'),
(752, '夏威夷火山豆', '1', 0, 50, 'bean'),
(753, '希臘優格或檸檬汁', '1', 0, 50, 'dairy'),
(754, '生薑末', '1', 0, 5, 'vegetable'),
(755, '和風醬', '1', 0, 50, 'sauce'),
(756, '牛肉片', '1', 0, 150, 'beef'),
(757, '瘦肉', '1', 0, 150, 'pork'),
(759, '小黃瓜切丁', '1', 0, 10, 'vegetable'),
(760, '豬後腿瘦絞肉', '1', 0, 150, 'pork'),
(761, '栗子南瓜', '1', 0, 50, 'vegetable'),
(762, '雞小腿', '1', 0, 100, 'poultry'),
(763, '板豆腐', '1', 0, 100, 'bean'),
(764, '蜂蜜', '1', 0, 50, 'sauce'),
(765, '無骨雞胸肉', '1', 0, 150, 'poultry'),
(766, '紅蘿蔔', '1', 0, 20, 'vegetable'),
(767, '自製美乃滋', '1', 0, 100, 'sauce'),
(768, '甘草', '1', 0, 10, 'sauce'),
(769, '乳酪起司', '1', 0, 150, 'dairy'),
(770, '蒸馬鈴薯切丁', '1', 0, 50, 'vegetable'),
(771, '蛤蜊', '1', 0, 100, 'seafood'),
(772, '料酒', '1', 0, 10, 'sauce'),
(773, '欖橄油', '1', 0, 120, 'oil'),
(774, '豬小里肌肉', '1', 0, 150, 'pork'),
(775, '味增', '1', 0, 10, 'sauce'),
(776, '羅曼生菜', '1', 0, 10, 'vegetable'),
(777, '熟蝦', '1', 0, 100, 'seafood'),
(778, '鮮奶', '1', 0, 150, 'dairy'),
(779, '黑胡椒', '1', 0, 5, 'sauce'),
(780, '有機藜麥', '1', 0, 100, 'grains'),
(781, '紅椒', '1', 0, 20, 'vegetable'),
(782, '地瓜切塊', '1', 0, 50, 'vegetable'),
(783, '鹽麴', '1', 0, 10, 'sauce'),
(784, '巴薩米克醋', '1', 0, 50, 'sauce'),
(785, '果仁碎', '1', 0, 100, 'oil'),
(786, '和風柚子醬', '1', 0, 50, 'sauce'),
(787, '白豆干', '1', 0, 50, 'vegetable'),
(788, '家常豆腐', '1', 0, 100, 'bean'),
(789, '花椰菜', '1', 0, 50, 'vegetable'),
(790, '薑末', '1', 0, 5, 'vegetable'),
(791, '碎海苔', '1', 0, 10, 'vegetable'),
(792, '美生菜', '1', 0, 10, 'vegetable'),
(793, '蘑菇：', '1', 0, 10, 'vegetable'),
(794, '燙熟放涼黃秋葵', '1', 0, 20, 'vegetable'),
(795, '水煮四季豆切丁', '1', 0, 20, 'vegetable'),
(796, '寒天條', '1', 0, 50, 'sauce'),
(797, '玉米須', '1', 0, 10, 'vegetable'),
(798, '水', '1', 0, 0, '-'),
(799, '市售堅果飲隨身包', '1', 0, 100, 'oil'),
(800, '蘑菇切片', '1', 0, 10, 'vegetable'),
(801, '鮮蝦', '1', 0, 100, 'seafood'),
(802, '紅蘿蔔末', '1', 0, 20, 'vegetable'),
(803, '水煮蛋', '1', 0, 70, 'egg'),
(804, '小番茄', '1', 0, 10, 'vegetable'),
(805, '低脂牛奶', '1', 0, 100, 'dairy'),
(806, '低鈉豉油', '1', 0, 10, 'sauce'),
(807, '沙拉', '1', 0, 10, 'vegetable'),
(808, '蔥/蘆筍/高麗菜/蔬菜', '1', 0, 0, 'vegetable'),
(809, '鯛魚片', '1', 0, 100, 'seafood'),
(810, '山楂', '1', 0, 10, 'fruit'),
(811, '生薏仁', '1', 0, 50, 'grains'),
(812, '義式香料/蒜粉', '1', 0, 10, 'sauce'),
(813, '熟筍', '1', 0, 50, 'vegetable'),
(814, '紅蘿蔔／蓮藕', '1', 0, 50, 'vegetable'),
(815, '玉米粒', '1', 0, 50, 'vegetable'),
(816, '紫高麗菜苗', '1', 0, 10, 'vegetable'),
(817, '鮮咸蛋', '1', 0, 80, 'egg'),
(818, '秀珍菇', '1', 0, 10, 'vegetable'),
(819, '芙蓉豆腐', '1', 0, 100, 'bean'),
(820, '甜椒', '1', 0, 20, 'vegetable'),
(821, '熟毛豆', '1', 0, 50, 'bean'),
(822, '老抽', '1', 0, 10, 'sauce'),
(823, '山葵胡椒粉', '1', 0, 5, 'sauce'),
(824, '可用市售柳橙原汁代替', '1', 0, 50, 'fruit'),
(825, '無鹽奶油', '1', 0, 50, 'dairy'),
(826, '萵苣', '1', 0, 10, 'vegetable'),
(827, '火箭菜', '1', 0, 10, 'vegetable'),
(828, '青檸汁', '1', 0, 20, 'fruit'),
(829, '牛番茄切片', '1', 0, 20, 'vegetable'),
(830, '吞拿魚', '1', 0, 100, 'seafood'),
(831, '鈕扣乾香菇', '1', 0, 20, 'vegetable'),
(832, '或牛攪肉', '1', 0, 100, 'beef'),
(833, '調料', '1', 0, 0, 'sauce'),
(834, '脫脂優格', '1', 0, 50, 'dairy'),
(835, '熟雞胸肉', '1', 0, 150, 'poultry'),
(836, '柴魚昆布高湯', '1', 0, 20, 'sauce'),
(837, '雞蛋白', '1', 0, 20, 'egg'),
(838, '無糖高纖燕麥豆漿or豆漿', '1', 0, 50, 'bean'),
(839, '黃櫛瓜切片', '1', 0, 20, 'vegetable'),
(840, '玉米筍對半斜切', '1', 0, 20, 'vegetable'),
(841, '蔓越莓', '1', 0, 20, 'fruit'),
(842, '清水', '1', 0, 0, '-'),
(843, '鹹陳皮', '1', 0, 10, 'sauce'),
(844, '傳統豆腐', '1', 0, 50, 'bean'),
(845, '蔬菜', '1', 0, 0, 'vegetable'),
(846, '椰子細粉', '1', 0, 50, 'oil'),
(847, '低脂豬絞肉', '1', 0, 100, 'pork'),
(848, '豆豉辣椒醬', '1', 0, 20, 'sauce'),
(849, '青江菜', '1', 0, 10, 'vegetable'),
(850, '地瓜葉', '1', 0, 10, 'vegetable'),
(851, '黑木耳', '1', 0, 10, 'vegetable'),
(852, '義大利麵', '1', 0, 100, 'grains'),
(853, '青紅蘿蔔', '1', 0, 20, 'vegetable'),
(854, '醬汁︰紅酒醋', '1', 0, 20, 'sauce'),
(855, '蝦仁,小卷', '1', 0, 100, 'seafood'),
(856, '辣椒', '1', 0, 5, 'vegetable'),
(857, '紅甜椒切丁', '1', 0, 20, 'vegetable'),
(858, '乾海帶芽', '1', 0, 10, 'vegetable'),
(859, '無農藥檸檬', '1', 0, 20, 'fruit'),
(860, '綜合燕麥片', '1', 0, 100, 'grains'),
(861, '綠櫛瓜', '1', 0, 10, 'vegetable'),
(862, '黃甜椒切丁', '1', 0, 20, 'vegetable'),
(863, '蔭豉', '1', 0, 10, 'sauce'),
(864, '無糖原味優格', '1', 0, 50, 'dairy'),
(865, '飯', '1', 0, 100, 'grains'),
(866, '檸檬', '1', 0, 10, 'fruit'),
(867, '青木瓜', '1', 0, 20, 'fruit'),
(868, '蒟蒻凍粉', '1', 0, 10, 'grains'),
(869, '豌豆莢', '1', 0, 10, 'vegetable'),
(870, '非基改千張豆腐皮', '1', 0, 50, 'bean'),
(871, '涼粉', '1', 0, 20, 'grains'),
(872, '洋蔥半顆', '1', 0, 50, 'vegetable'),
(873, '雞肉', '1', 0, 100, 'poultry'),
(874, '冷開水', '1', 0, 0, '-'),
(875, '鮭魚卵', '1', 0, 50, 'seafood'),
(876, '番茄片', '1', 0, 10, 'vegetable'),
(877, '雞柳條', '1', 0, 100, 'poultry'),
(878, '綠色花椰菜', '1', 0, 10, 'vegetable'),
(879, '美蔬菜', '1', 0, 0, 'vegetable'),
(880, '排骨', '1', 0, 150, 'pork'),
(881, '羅勒香料', '1', 0, 5, 'sauce'),
(882, '豆輪', '1', 0, 50, 'bean'),
(883, '蟹棒肉', '1', 0, 50, 'seafood'),
(884, '豬里肌肉片', '1', 0, 100, 'pork'),
(885, '味噌', '1', 0, 50, 'sauce'),
(886, '大陸妹', '1', 0, 20, 'vegetable'),
(887, '韓式泡菜', '1', 0, 0, 'sauce'),
(888, '脫脂清雞湯', '1', 0, 10, 'poultry'),
(889, '粉絲', '1', 0, 50, 'grains'),
(890, '有機玉米筍', '1', 0, 20, 'vegetable'),
(891, '蛋皮', '1', 0, 50, 'egg'),
(892, '枝豆', '1', 0, 50, 'vegetable'),
(893, '有機芹菜', '1', 0, 10, 'vegetable'),
(894, '藍莓果醬', '1', 0, 50, 'fruit'),
(895, '油', '1', 0, 0, 'oil'),
(896, '無糖豆漿', '1', 0, 50, 'dairy'),
(897, '沙拉油', '1', 0, 0, 'oil'),
(898, '葡萄乾', '1', 0, 50, 'fruit'),
(899, '細糖', '1', 0, 50, 'sauce'),
(900, '酸奶油或奶克', '1', 0, 50, 'dairy'),
(901, '乾辣椒片', '1', 0, 10, 'sauce'),
(902, 'LE CREUSET鑄鐵', '1', 0, 0, '-'),
(903, '蘋果丁', '1', 0, 50, 'fruit'),
(904, '醬汁︰白醋', '1', 0, 0, 'sauce'),
(905, '國產白蝦', '1', 0, 100, 'seafood'),
(906, '玄米油', '1', 0, 0, 'oil'),
(907, '白胡椒粉', '1', 0, 10, 'sauce'),
(908, '鋁箔紙', '1', 0, 0, '-'),
(909, '蔥絲', '1', 0, 10, 'vegetable'),
(910, '牛攪肉', '1', 0, 100, 'beef'),
(911, '黑砂糖', '1', 0, 50, 'sauce'),
(912, '椰漿', '1', 0, 50, 'dairy'),
(913, '蒜味鹽', '1', 0, 0, 'sauce'),
(914, '醬汁︰醬油', '1', 0, 0, 'sauce'),
(915, '優格', '1', 0, 50, 'dairy'),
(916, '酒', '1', 0, 0, 'wine'),
(917, '鮮蝦仁', '1', 0, 100, 'seafood'),
(918, '覆盆子', '1', 0, 50, 'fruit'),
(919, '洋香菜葉', '1', 0, 10, 'vegetable'),
(920, '果醋', '1', 0, 50, 'sauce'),
(921, '海鮮', '1', 0, 0, 'seafood'),
(922, '黑麵包', '1', 0, 100, 'grains'),
(923, '【香料共和國】醍味白胡椒', '1', 0, 0, 'sauce'),
(924, '綠咖哩粉', '1', 0, 0, 'sauce'),
(925, '糖', '1', 0, 50, 'sauce'),
(926, '香菇素蠔油', '1', 0, 0, 'sauce'),
(928, '蒜片', '1', 0, 10, 'vegetable'),
(929, '雞胸肉：', '1', 0, 100, 'poultry'),
(930, '紅彩椒', '1', 0, 50, 'vegetable'),
(931, '冰糖', '1', 0, 50, 'sauce'),
(932, '沙拉菜', '1', 0, 10, 'vegetable'),
(933, '筍絲', '1', 0, 20, 'vegetable'),
(934, '青苦瓜', '1', 0, 20, 'vegetable'),
(935, 'Cream cheese', '1', 0, 100, 'dairy'),
(936, '黑芝麻', '1', 0, 50, 'grains'),
(937, '綜合海鮮', '1', 0, 0, 'seafood'),
(938, '牛番茄', '1', 0, 20, 'vegetable'),
(939, '長糯米', '1', 0, 100, 'grains'),
(940, '香菜', '1', 0, 10, 'vegetable'),
(941, '草菇', '1', 0, 0, 'vegetable'),
(942, '牛柳', '1', 0, 150, 'beef'),
(943, '黃金亞麻籽粉', '1', 0, 50, 'grains'),
(944, '粗粒黑胡椒粉', '1', 0, 0, 'sauce'),
(945, '木耳', '1', 0, 0, 'vegetable'),
(946, '白花椰菜粒', '1', 0, 20, 'vegetable'),
(947, '砂糖', '1', 0, 50, 'sauce'),
(948, '綜合沙拉葉', '1', 0, 10, 'vegetable'),
(949, '薑', '1', 0, 10, 'vegetable'),
(950, '粟米', '1', 0, 50, 'grains'),
(951, '醬油：味霖：米酒', '1', 0, 0, 'sauce'),
(952, '低脂鮮奶', '1', 0, 50, 'dairy'),
(953, '蓮子', '1', 0, 0, 'fruit'),
(954, '山苦瓜', '1', 0, 20, 'vegetable'),
(955, '車厘茄', '1', 0, 10, 'vegetable'),
(956, '辣油', '1', 0, 0, 'sauce'),
(957, '山藥', '1', 0, 0, 'vegetable'),
(958, '木耳切碎', '1', 0, 0, 'vegetable'),
(959, '鮪魚罐頭', '1', 0, 0, 'seafood'),
(960, '芋絲', '1', 0, 50, 'vegetable'),
(961, '紅棗', '1', 0, 20, 'fruit'),
(962, '綠花椰菜', '1', 0, 20, 'vegetable'),
(963, '梅花豬火鍋肉片', '1', 0, 150, 'pork'),
(964, '小蕃茄', '1', 0, 10, 'vegetable'),
(965, '海藻', '1', 0, 0, 'vegetable'),
(966, '比薩乳酪絲', '1', 0, 100, 'dairy'),
(967, '楓糖漿', '1', 0, 50, 'sauce'),
(968, '蒟蒻麵', '1', 0, 10, 'grains'),
(969, '玉米粉', '1', 0, 50, 'grains'),
(970, '秋葵', '1', 0, 20, 'vegetable'),
(971, '小捲', '1', 0, 0, 'seafood'),
(972, '豬小里肌', '1', 0, 150, 'pork'),
(973, '黑蔭豉', '1', 0, 0, 'sauce'),
(974, '放山古早雞雞胸', '1', 0, 0, 'poultry'),
(975, '蓮藕', '1', 0, 0, 'vegetable'),
(976, '番茄罐頭', '1', 0, 0, 'vegetable'),
(977, '四季豆', '1', 0, 0, 'vegetable'),
(978, '水牛奶酪', '1', 0, 50, 'dairy'),
(979, '白精靈菇', '1', 0, 0, 'vegetable'),
(980, '去骨雞腿肉2支', '1', 0, 0, 'poultry'),
(981, '韓國薯粉', '1', 0, 50, 'grains'),
(982, '鹽 ', '1', 0, 0, 'sauce'),
(983, '墨西哥餅皮 ', '1', 0, 80, 'grains'),
(984, '#沾麵汁#水', '1', 0, 5, 'sauce'),
(985, '醬汁︰蒜薑蔥末', '1', 0, 25, 'sauce'),
(986, '#沾麵汁#柴魚', '1', 0, 15, 'sauce'),
(990, '#沾麵汁#昆布', '1', 0, 7, 'sauce'),
(992, '美蔬菜 ', '1', 0, 0, 'vegetable'),
(993, '黃金亞麻籽粉 ', '1', 0, 55, 'grains'),
(994, '熟雞胸 ', '1', 0, 150, 'poultry'),
(995, '雞胸肉 ', '1', 0, 150, 'poultry');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `cal_info`
--
ALTER TABLE `cal_info`
  ADD PRIMARY KEY (`c_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cal_info`
--
ALTER TABLE `cal_info`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=996;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
