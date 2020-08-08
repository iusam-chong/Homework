-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-08-08 19:57:39
-- 伺服器版本： 10.4.13-MariaDB
-- PHP 版本： 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `cydinbendong`
--

-- --------------------------------------------------------

--
-- 資料表結構 `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, '便當'),
(2, '粥'),
(3, '麵'),
(4, '小吃'),
(5, '點心'),
(6, '西式料理'),
(7, '飲料'),
(8, '快餐');

-- --------------------------------------------------------

--
-- 資料表結構 `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `BirthDate` date NOT NULL,
  `HireDate` date NOT NULL,
  `Address` varchar(60) NOT NULL,
  `City` varchar(15) NOT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `Country` varchar(15) NOT NULL,
  `Phone` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `employees`
--

INSERT INTO `employees` (`EmployeeID`, `LastName`, `FirstName`, `BirthDate`, `HireDate`, `Address`, `City`, `PostalCode`, `Country`, `Phone`) VALUES
(1, '一旦', '朱', '1969-08-07', '1988-12-24', '西嶼鄉北安三街九段484巷271弄688號27樓', '澎湖縣', '991', '台灣', '0942-641-604'),
(2, '熊', '筱', '1973-12-30', '2001-07-01', '鶯歌區文萊街三段389巷68弄175號23樓', '新北市', '905', '台灣', '0971-892-795'),
(3, '万俟', '宇翰', '1985-02-03', '2017-04-01', 'Block 39, Nok Min Estate Stanley', 'Stanley', '', 'Hong Kong', '850-65-8773'),
(4, '向', '婷', '1962-02-20', '2008-11-11', '馬公市和祥七街707號19樓', '澎湖縣', '172-59', '台灣', '0982-649-348'),
(5, '嘉美', '溫', '1964-02-14', '2006-09-21', '溪口鄉鹽田街159號', '嘉義縣', '712', '台灣', '0959-197-745'),
(6, '建', '鍾', '1976-02-16', '2001-10-19', '宜蘭市吉利六街五段653巷416號', '宜蘭縣', '524', '台灣', '0913-095-031'),
(7, '俊美', '甄', '1992-06-15', '2012-12-23', '卓溪鄉嘉祥五路六段817巷508號', '花蓮縣', '711-09', '台灣', '(020)550-651'),
(8, '依佳', '崔', '1976-06-13', '1999-03-27', '銅鑼鄉長億東三街六段268巷15號44樓', '苗栗縣', '388-60', '台灣', '0981-409-915'),
(9, '枯內', '紀德川', '1994-08-22', '2016-04-01', '都野村市北区山田町西之園4-3-4', '東京', '2855662', '日本', '080-3688-0845'),
(10, '詩蓉', '姬', '1989-04-27', '2007-06-07', '復興區親民街939巷490弄655號10樓', '桃園市', '434-78', '台灣', '0962-239-694'),
(11, '瑋翰', '何', '1955-12-31', '1995-01-01', '香山區永安東路721號82樓', '新竹市', '167-06', '台灣', '0958-588-957'),
(12, '思芳', '水', '1984-08-22', '2004-02-29', '北區勢林街馨園一巷街六段612號64樓', '新竹市', '945', '台灣', '0923695520');

-- --------------------------------------------------------

--
-- 資料表結構 `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailsID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UnitPrice` decimal(14,4) NOT NULL,
  `Quantity` int(6) NOT NULL,
  `Discount` float DEFAULT NULL,
  `Remark` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `orderdetails`
--

INSERT INTO `orderdetails` (`OrderDetailsID`, `OrderID`, `ProductID`, `UnitPrice`, `Quantity`, `Discount`, `Remark`) VALUES
(1, 1, 7, '4.5000', 160, NULL, NULL),
(2, 1, 6, '35.0000', 4, NULL, NULL),
(3, 2, 4, '75.0000', 7, NULL, NULL),
(4, 2, 5, '85.0000', 2, NULL, NULL),
(5, 3, 10, '75.0000', 9, NULL, NULL),
(6, 4, 1, '85.0000', 3, NULL, NULL),
(7, 4, 3, '49.0000', 8, NULL, NULL),
(8, 4, 2, '69.0000', 7, NULL, NULL),
(9, 5, 8, '27.5000', 6, 0.5, '買一送一活動'),
(10, 5, 9, '60.0000', 2, NULL, NULL),
(11, 6, 11, '49.0000', 10, NULL, NULL),
(12, 6, 1, '85.0000', 4, NULL, NULL),
(13, 6, 2, '69.0000', 7, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT current_timestamp(),
  `RequiredDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`OrderID`, `EmployeeID`, `SupplierID`, `OrderDate`, `RequiredDate`) VALUES
(1, 1, 3, '2020-07-22 17:18:11', '2020-07-23 12:00:00'),
(2, 4, 2, '2020-07-23 19:01:19', '2020-07-24 12:00:00'),
(3, 7, 5, '2020-07-29 18:11:01', '2020-07-30 12:00:00'),
(4, 6, 1, '2020-07-31 18:52:51', '2020-08-03 12:00:00'),
(5, 9, 4, '2020-08-05 19:24:19', '2020-08-06 12:00:00'),
(6, 12, 1, '2020-08-10 17:34:14', '2020-08-11 12:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `KindPerUnit` varchar(40) DEFAULT NULL,
  `Unitprice` decimal(14,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `KindPerUnit`, `Unitprice`) VALUES
(1, '勁辣鷄腿堡', 1, 8, NULL, '85.0000'),
(2, '麥香魚', 1, 8, NULL, '69.0000'),
(3, '薯條(中包)', 1, 5, NULL, '49.0000'),
(4, '招牌烤肉飯', 2, 1, NULL, '75.0000'),
(5, '霜降烤五花飯', 2, 1, NULL, '85.0000'),
(6, '古早味乾麵', 3, 3, NULL, '35.0000'),
(7, '招牌鍋貼', 3, 4, '1顆', '4.5000'),
(8, '翡翠檸檬', 4, 7, NULL, '55.0000'),
(9, 'TP餅', 4, 5, '3入', '60.0000'),
(10, '皮蛋瘦肉粥', 5, 2, NULL, '75.0000'),
(11, '可樂(中杯)', 1, 7, NULL, '49.0000');

-- --------------------------------------------------------

--
-- 資料表結構 `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) NOT NULL,
  `City` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Phone` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `suppliers`
--

INSERT INTO `suppliers` (`SupplierID`, `CompanyName`, `ContactName`, `ContactTitle`, `Address`, `City`, `PostalCode`, `Phone`) VALUES
(1, '麥當勞 文心二店', NULL, NULL, '文心路二段57號', '台中', NULL, '0422580809'),
(2, '吉野烤肉飯', '吉永', NULL, '西屯區文華路123巷7號', '台中', NULL, '0427071725'),
(3, '八方雲集 台中逢明點', '阿梅', NULL, '西屯區黎明路三段196號', '台中', '407', '0424528589'),
(4, '茶湯會 朝富店', '龍子', NULL, '西屯區朝負路40號', '台中', '407', '0422540381'),
(5, '廣味珍', NULL, NULL, '西屯區福星路328號', NULL, NULL, '0427027716');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- 資料表索引 `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- 資料表索引 `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailsID`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- 資料表索引 `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
