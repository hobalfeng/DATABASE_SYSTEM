-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2026-06-19 14:30:58
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `倉儲管理`
--

-- --------------------------------------------------------

--
-- 資料表結構 `location`
--

CREATE TABLE `location` (
  `location_id` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  `shelf_no` varchar(50) NOT NULL,
  `location_type` varchar(50) NOT NULL,
  `max_capacity` int(11) NOT NULL CHECK (`max_capacity` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `location`
--

INSERT INTO `location` (`location_id`, `area`, `shelf_no`, `location_type`, `max_capacity`) VALUES
('L001', 'A區', 'S01', '儲存區', 100),
('L002', 'A區', 'S02', '儲存區', 100),
('L003', 'B區', 'S01', '揀貨區', 50),
('L004', 'B區', 'S02', '揀貨區', 50),
('L005', 'C區', 'S01', '暫存區', 200),
('L006', 'C區', 'S02', '暫存區', 200),
('L007', 'D區', 'S01', '退貨區', 80),
('L008', 'D區', 'S02', '退貨區', 80),
('L009', 'E區', 'S01', '冷藏區', 30),
('L010', 'E區', 'S02', '冷凍區', 30);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `product_id` varchar(50) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`product_id`, `product_code`, `name`) VALUES
('P001', 'A100', '鮪魚'),
('P002', 'A101', '米飯'),
('P003', 'A102', '蔬菜'),
('P004', 'A103', '鮮果'),
('P005', 'A104', '小卷'),
('P006', 'A105', '蝦仁'),
('P007', 'A106', '電容'),
('P008', 'A107', '電阻'),
('P009', 'A108', '晶片'),
('P010', 'A109', '傳感器');

-- --------------------------------------------------------

--
-- 資料表結構 `product_movement`
--

CREATE TABLE `product_movement` (
  `movement_id` int(11) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `start_location` varchar(50) NOT NULL,
  `end_location` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0),
  `move_time` datetime NOT NULL,
  `user_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `product_movement`
--

INSERT INTO `product_movement` (`movement_id`, `product_id`, `start_location`, `end_location`, `quantity`, `move_time`, `user_id`) VALUES
(1, 'P001', 'L001', 'L003', 5, '2026-06-06 10:00:00', 'U001'),
(2, 'P002', 'L001', 'L003', 2, '2026-06-06 10:05:00', 'U002'),
(3, 'P003', 'L002', 'L004', 1, '2026-06-06 11:00:00', 'U003'),
(4, 'P004', 'L002', 'L004', 10, '2026-06-06 11:10:00', 'U004'),
(5, 'P005', 'L003', 'L005', 2, '2026-06-07 09:00:00', 'U005'),
(6, 'P006', 'L003', 'L005', 5, '2026-06-07 09:15:00', 'U001'),
(7, 'P007', 'L004', 'L006', 1, '2026-06-07 10:00:00', 'U002'),
(8, 'P008', 'L004', 'L006', 3, '2026-06-07 10:30:00', 'U003'),
(9, 'P009', 'L005', 'L001', 20, '2026-06-08 14:00:00', 'U004'),
(10, 'P010', 'L006', 'L002', 2, '2026-06-08 15:00:00', 'U005');

-- --------------------------------------------------------

--
-- 資料表結構 `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` varchar(50) NOT NULL,
  `purchase_time` datetime NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `purchase_time`, `supplier`, `user_id`) VALUES
('PUR001', '2026-06-01 09:00:00', '供應商A', 'U002'),
('PUR002', '2026-06-01 10:00:00', '供應商B', 'U002'),
('PUR003', '2026-06-02 09:00:00', '供應商A', 'U004'),
('PUR004', '2026-06-02 11:00:00', '供應商C', 'U004'),
('PUR005', '2026-06-03 08:30:00', '供應商B', 'U006'),
('PUR006', '2026-06-03 14:00:00', '供應商A', 'U006'),
('PUR007', '2026-06-04 09:00:00', '供應商C', 'U009'),
('PUR008', '2026-06-04 10:00:00', '供應商B', 'U009'),
('PUR009', '2026-06-05 13:00:00', '供應商A', 'U002'),
('PUR010', '2026-06-05 15:00:00', '供應商C', 'U004');

-- --------------------------------------------------------

--
-- 資料表結構 `purchase_detail`
--

CREATE TABLE `purchase_detail` (
  `purchase_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0),
  `user_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `purchase_detail`
--

INSERT INTO `purchase_detail` (`purchase_id`, `product_id`, `quantity`, `user_id`) VALUES
('PUR001', 'P001', 50, 'U002'),
('PUR002', 'P002', 30, 'U002'),
('PUR003', 'P003', 20, 'U004'),
('PUR004', 'P004', 100, 'U004'),
('PUR005', 'P005', 10, 'U006'),
('PUR006', 'P006', 40, 'U006'),
('PUR007', 'P007', 5, 'U009'),
('PUR008', 'P008', 15, 'U009'),
('PUR009', 'P009', 200, 'U002'),
('PUR010', 'P010', 20, 'U004');

-- --------------------------------------------------------

--
-- 資料表結構 `shipment`
--

CREATE TABLE `shipment` (
  `shipment_id` varchar(50) NOT NULL,
  `shipment_time` datetime NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `shipment`
--

INSERT INTO `shipment` (`shipment_id`, `shipment_time`, `customer_name`, `user_id`) VALUES
('SHP001', '2026-06-10 10:00:00', '客戶A', 'U001'),
('SHP002', '2026-06-10 11:00:00', '客戶B', 'U002'),
('SHP003', '2026-06-11 09:00:00', '客戶A', 'U003'),
('SHP004', '2026-06-11 10:00:00', '客戶C', 'U001'),
('SHP005', '2026-06-12 09:00:00', '客戶B', 'U002'),
('SHP006', '2026-06-12 14:00:00', '客戶A', 'U003'),
('SHP007', '2026-06-13 09:00:00', '客戶C', 'U001'),
('SHP008', '2026-06-13 10:00:00', '客戶B', 'U002'),
('SHP009', '2026-06-14 13:00:00', '客戶A', 'U003'),
('SHP010', '2026-06-14 15:00:00', '客戶C', 'U001');

-- --------------------------------------------------------

--
-- 資料表結構 `shipment_detail`
--

CREATE TABLE `shipment_detail` (
  `shipment_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0),
  `user_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `shipment_detail`
--

INSERT INTO `shipment_detail` (`shipment_id`, `product_id`, `quantity`, `user_id`) VALUES
('SHP001', 'P001', 10, 'U001'),
('SHP002', 'P002', 5, 'U002'),
('SHP003', 'P003', 2, 'U003'),
('SHP004', 'P004', 20, 'U001'),
('SHP005', 'P005', 3, 'U002'),
('SHP006', 'P006', 8, 'U003'),
('SHP007', 'P007', 1, 'U001'),
('SHP008', 'P008', 4, 'U002'),
('SHP009', 'P009', 50, 'U003'),
('SHP010', 'P010', 5, 'U001');

-- --------------------------------------------------------

--
-- 資料表結構 `stock`
--

CREATE TABLE `stock` (
  `product_id` varchar(50) NOT NULL,
  `location_id` varchar(50) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0 CHECK (`stock_quantity` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `stock`
--

INSERT INTO `stock` (`product_id`, `location_id`, `stock_quantity`) VALUES
('P001', 'L010', 50),
('P002', 'L009', 30),
('P003', 'L009', 20),
('P004', 'L009', 100),
('P005', 'L010', 10),
('P006', 'L010', 40),
('P007', 'L004', 5),
('P008', 'L004', 15),
('P009', 'L005', 200),
('P010', 'L006', 20);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`user_id`, `username`, `role`) VALUES
('U001', '王大明', '管理員'),
('U002', '李小美', '作業員'),
('U003', '張志豪', '作業員'),
('U004', '林美玲', '作業員'),
('U005', '陳志偉', '作業員'),
('U006', '許雅婷', '作業員'),
('U007', '黃建國', '管理員'),
('U008', '鄭雅惠', '作業員'),
('U009', '劉家豪', '作業員'),
('U010', '吳淑芬', '作業員');

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `view_current_stock_report`
-- (請參考以下實際畫面)
--
CREATE TABLE `view_current_stock_report` (
`product_id` varchar(50)
,`product_code` varchar(50)
,`location_id` varchar(50)
,`area` varchar(50)
,`shelf_no` varchar(50)
,`stock_quantity` int(11)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `view_location_capacity_alert`
-- (請參考以下實際畫面)
--
CREATE TABLE `view_location_capacity_alert` (
`location_id` varchar(50)
,`area` varchar(50)
,`shelf_no` varchar(50)
,`max_capacity` int(11)
,`stock_quantity` int(11)
,`remaining_capacity` bigint(12)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `view_product_movement_full`
-- (請參考以下實際畫面)
--
CREATE TABLE `view_product_movement_full` (
`movement_id` int(11)
,`product_id` varchar(50)
,`name` varchar(200)
,`start_location` varchar(50)
,`end_location` varchar(50)
,`quantity` int(11)
,`move_time` datetime
,`username` varchar(100)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `view_purchase_detail_full`
-- (請參考以下實際畫面)
--
CREATE TABLE `view_purchase_detail_full` (
`purchase_id` varchar(50)
,`product_id` varchar(50)
,`name` varchar(200)
,`quantity` int(11)
,`username` varchar(100)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `view_shipment_detail_full`
-- (請參考以下實際畫面)
--
CREATE TABLE `view_shipment_detail_full` (
`shipment_id` varchar(50)
,`product_id` varchar(50)
,`name` varchar(200)
,`quantity` int(11)
,`username` varchar(100)
);

-- --------------------------------------------------------

--
-- 檢視表結構 `view_current_stock_report`
--
DROP TABLE IF EXISTS `view_current_stock_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_current_stock_report`  AS SELECT `stock`.`product_id` AS `product_id`, `product`.`product_code` AS `product_code`, `stock`.`location_id` AS `location_id`, `location`.`area` AS `area`, `location`.`shelf_no` AS `shelf_no`, `stock`.`stock_quantity` AS `stock_quantity` FROM ((`stock` join `product` on(`stock`.`product_id` = `product`.`product_id`)) join `location` on(`stock`.`location_id` = `location`.`location_id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `view_location_capacity_alert`
--
DROP TABLE IF EXISTS `view_location_capacity_alert`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_location_capacity_alert`  AS SELECT `location`.`location_id` AS `location_id`, `location`.`area` AS `area`, `location`.`shelf_no` AS `shelf_no`, `location`.`max_capacity` AS `max_capacity`, `stock`.`stock_quantity` AS `stock_quantity`, `location`.`max_capacity`- `stock`.`stock_quantity` AS `remaining_capacity` FROM (`location` join `stock` on(`location`.`location_id` = `stock`.`location_id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `view_product_movement_full`
--
DROP TABLE IF EXISTS `view_product_movement_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_movement_full`  AS SELECT `product_movement`.`movement_id` AS `movement_id`, `product_movement`.`product_id` AS `product_id`, `product`.`name` AS `name`, `product_movement`.`start_location` AS `start_location`, `product_movement`.`end_location` AS `end_location`, `product_movement`.`quantity` AS `quantity`, `product_movement`.`move_time` AS `move_time`, `user`.`username` AS `username` FROM ((`product_movement` join `product` on(`product_movement`.`product_id` = `product`.`product_id`)) join `user` on(`product_movement`.`user_id` = `user`.`user_id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `view_purchase_detail_full`
--
DROP TABLE IF EXISTS `view_purchase_detail_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_purchase_detail_full`  AS SELECT `purchase_detail`.`purchase_id` AS `purchase_id`, `purchase_detail`.`product_id` AS `product_id`, `product`.`name` AS `name`, `purchase_detail`.`quantity` AS `quantity`, `user`.`username` AS `username` FROM ((`purchase_detail` join `product` on(`purchase_detail`.`product_id` = `product`.`product_id`)) join `user` on(`purchase_detail`.`user_id` = `user`.`user_id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `view_shipment_detail_full`
--
DROP TABLE IF EXISTS `view_shipment_detail_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_shipment_detail_full`  AS SELECT `shipment_detail`.`shipment_id` AS `shipment_id`, `shipment_detail`.`product_id` AS `product_id`, `product`.`name` AS `name`, `shipment_detail`.`quantity` AS `quantity`, `user`.`username` AS `username` FROM ((`shipment_detail` join `product` on(`shipment_detail`.`product_id` = `product`.`product_id`)) join `user` on(`shipment_detail`.`user_id` = `user`.`user_id`)) ;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_code` (`product_code`);

--
-- 資料表索引 `product_movement`
--
ALTER TABLE `product_movement`
  ADD PRIMARY KEY (`movement_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `start_location` (`start_location`),
  ADD KEY `end_location` (`end_location`);

--
-- 資料表索引 `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `purchase_detail`
--
ALTER TABLE `purchase_detail`
  ADD PRIMARY KEY (`purchase_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`shipment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `shipment_detail`
--
ALTER TABLE `shipment_detail`
  ADD PRIMARY KEY (`shipment_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`product_id`,`location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_movement`
--
ALTER TABLE `product_movement`
  MODIFY `movement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `product_movement`
--
ALTER TABLE `product_movement`
  ADD CONSTRAINT `product_movement_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `product_movement_ibfk_2` FOREIGN KEY (`start_location`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `product_movement_ibfk_3` FOREIGN KEY (`end_location`) REFERENCES `location` (`location_id`);

--
-- 資料表的限制式 `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- 資料表的限制式 `purchase_detail`
--
ALTER TABLE `purchase_detail`
  ADD CONSTRAINT `purchase_detail_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- 資料表的限制式 `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- 資料表的限制式 `shipment_detail`
--
ALTER TABLE `shipment_detail`
  ADD CONSTRAINT `shipment_detail_ibfk_1` FOREIGN KEY (`shipment_id`) REFERENCES `shipment` (`shipment_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipment_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- 資料表的限制式 `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
