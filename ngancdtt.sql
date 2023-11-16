-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2023 at 09:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ngancdtt`
--

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_brand`
--

CREATE TABLE `cdtt_brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_brand`
--

INSERT INTO `cdtt_brand` (`id`, `name`, `slug`, `image`, `sort_order`, `metakey`, `metadesc`, `trash`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 'Salvatore Ferragamo', 'salvatore-ferragamo', 'Salvatore Ferragamo.png', 0, 'Salvatore Ferragamo', 'Salvatore Ferragamo', 0, '2023-10-05 00:51:14', '2023-11-14 21:11:47', 1, NULL, 1),
(2, 'Giorgio Armani', 'giorgio-armani', 'Giorgio Armani.png', 0, 'Giorgio Armani', 'Giorgio Armani', 0, '2023-10-05 00:54:42', '2023-10-05 00:56:43', 1, 1, 1),
(3, 'Hermes', 'hermes', 'Hermes.png', 0, 'Hermes', 'Hermes', 0, '2023-10-05 00:57:40', '2023-10-05 00:57:40', 1, NULL, 1),
(4, 'Versace', 'versace', 'Versace.png', 0, 'Versace', 'Versace', 0, '2023-10-05 00:58:53', '2023-10-05 00:58:53', 1, NULL, 1),
(5, 'Yves Saint Laurent', 'yves-saint-laurent', 'Yves Saint Laurent.png', 0, 'Yves Saint Laurent', 'Yves Saint Laurent', 0, '2023-10-05 00:59:43', '2023-10-05 00:59:43', 1, NULL, 1),
(6, 'Chanel', 'chanel', 'Chanel.png', 0, 'Chanel', 'Chanel', 0, '2023-10-05 01:00:50', '2023-10-05 01:00:50', 1, NULL, 1),
(7, 'Dolce & Gabbana', 'dolce-gabbana', 'Dolce & Gabbana.png', 0, 'Dolce & Gabbana', 'Dolce & Gabbana', 0, '2023-10-05 01:02:36', '2023-10-05 01:02:36', 1, NULL, 1),
(8, 'Christian Dior', 'christian-dior', 'Christian Dior.png', 0, 'Christian Dior', 'Christian Dior', 0, '2023-10-05 01:03:58', '2023-10-05 01:03:58', 1, NULL, 1),
(9, 'Guess', 'guess', 'Guess.png', 0, 'Guess', 'Guess', 0, '2023-10-05 01:07:34', '2023-10-05 01:07:34', 1, NULL, 1),
(11, 'Narciso Rodriguez', 'narciso-rodriguez', 'Narciso Rodriguez.png', 0, 'Narciso Rodriguez', 'Narciso Rodriguez', 0, '2023-10-05 04:46:30', '2023-10-05 04:46:30', 1, NULL, 1),
(12, 'Louis Vuitton', 'louis-vuitton', 'Louis Vuitton.png', 0, 'Louis Vuitton', 'Louis Vuitton', 0, '2023-10-06 00:37:31', '2023-10-06 00:37:31', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_category`
--

CREATE TABLE `cdtt_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `trash` int(11) NOT NULL DEFAULT 0,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_category`
--

INSERT INTO `cdtt_category` (`id`, `name`, `slug`, `image`, `parent_id`, `sort_order`, `trash`, `metakey`, `metadesc`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 'Nước hoa Nam', 'nuoc-hoa-nam', 'Nước hoa Nam.png', 0, 0, 0, 'Nước hoa Nam', 'Nước hoa Nam', '2023-10-04 23:49:18', '2023-10-04 23:49:18', 1, NULL, 1),
(2, 'Nước hoa Nữ', 'nuoc-hoa-nu', 'Nước hoa Nữ.png', 0, 1, 0, 'Nước hoa Nữ', 'Nước hoa Nữ', '2023-10-04 23:50:25', '2023-10-04 23:50:25', 1, NULL, 1),
(4, 'Nước hoa Niche', 'nuoc-hoa-niche', 'Nước hoa Niche.png', 0, 2, 0, 'Nước hoa Niche', 'Nước hoa Niche', '2023-10-04 23:51:25', '2023-10-04 23:51:25', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_config`
--

CREATE TABLE `cdtt_config` (
  `id` bigint(20) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `zalo` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `metadesc` varchar(255) DEFAULT NULL,
  `metakey` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_contact`
--

CREATE TABLE `cdtt_contact` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `replay_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_contact`
--

INSERT INTO `cdtt_contact` (`id`, `user_id`, `name`, `email`, `phone`, `title`, `content`, `trash`, `replay_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, NULL, 'Ring', 'ringgggg@gmail.com', NULL, NULL, 'Hello', 0, NULL, '2023-10-04 12:26:49', '2023-10-04 12:26:49', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_menu`
--

CREATE TABLE `cdtt_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `link` varchar(1000) DEFAULT NULL,
  `position` varchar(1000) DEFAULT NULL,
  `type` varchar(1000) DEFAULT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(10) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_menu`
--

INSERT INTO `cdtt_menu` (`id`, `name`, `link`, `position`, `type`, `trash`, `parent_id`, `sort_order`, `table_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 'Trang chủ', '/', 'mainmenu', 'Trang chủ', 0, 0, NULL, NULL, '2023-10-04 12:12:35', '2023-10-04 12:12:35', 1, NULL, 1),
(2, 'Giới thiệu', '/gioi-thieu', 'mainmenu', 'Giới thiệu', 0, 0, NULL, NULL, '2023-10-04 12:12:55', '2023-11-14 07:29:41', 1, 1, 1),
(3, 'Sản phẩm', '/san-pham', 'mainmenu', 'Sản phẩm', 0, 0, NULL, NULL, '2023-10-04 12:13:15', '2023-11-14 07:29:51', 1, 1, 1),
(6, 'Thương hiệu', '/brand', 'mainmenu', 'Thương hiệu', 0, 0, NULL, NULL, '2023-10-04 12:22:08', '2023-11-14 07:30:02', 1, 1, 1),
(7, 'Bài viết', '/blog', 'mainmenu', 'Bài viết', 0, 0, NULL, NULL, '2023-10-04 12:23:58', '2023-11-14 07:30:17', 1, 1, 1),
(8, 'Liên hệ', '/lien-he', 'mainmenu', 'Liên hệ', 0, 0, NULL, NULL, '2023-10-04 12:24:13', '2023-11-14 07:30:25', 1, 1, 1),
(10, 'Nước hoa Nam', '/danh-muc-san-pham/nuoc-hoa-nam', 'mainmenu', 'Nước hoa Nam', 0, 3, NULL, NULL, '2023-10-04 23:54:02', '2023-10-04 23:54:02', 1, NULL, 1),
(11, 'Nước hoa Niche', '/danh-muc-san-pham/nuoc-hoa-niche', 'mainmenu', 'Nước hoa Niche', 0, 3, NULL, NULL, '2023-10-04 23:54:27', '2023-11-14 07:30:35', 1, 1, 1),
(12, 'Nước hoa Nữ', '/danh-muc-san-pham/nuoc-hoa-nu', 'mainmenu', 'Nước hoa Nữ', 0, 3, NULL, NULL, '2023-10-04 23:55:00', '2023-10-04 23:55:00', 1, NULL, 1),
(13, 'Salvatore Ferragamo', '/thuong-hieu/salvatore-ferragamo', 'mainmenu', 'Salvatore Ferragamo', 0, 6, NULL, NULL, '2023-10-05 01:09:32', '2023-10-05 01:09:33', 1, NULL, 1),
(14, 'Giorgio Armani', '/thuong-hieu/giorgio-armani', 'mainmenu', 'Giorgio Armani', 0, 6, NULL, NULL, '2023-10-05 01:10:00', '2023-10-05 01:10:00', 1, NULL, 1),
(15, 'Hermes', '/thuong-hieu/hermes', 'mainmenu', 'Hermes', 0, 6, NULL, NULL, '2023-10-05 01:10:25', '2023-10-05 01:10:25', 1, NULL, 1),
(16, 'Versace', '/thuong-hieu/versace', 'mainmenu', 'Versace', 0, 6, NULL, NULL, '2023-10-05 01:10:48', '2023-10-05 01:10:48', 1, NULL, 1),
(17, 'Yves Saint Laurent', '/thuong-hieu/yves-saint-laurent', 'mainmenu', 'Yves Saint Laurent', 0, 6, NULL, NULL, '2023-10-05 01:11:10', '2023-10-05 01:11:10', 1, NULL, 1),
(18, 'Chanel', '/thuong-hieu/chanel', 'mainmenu', 'Chanel', 0, 6, NULL, NULL, '2023-10-05 01:11:34', '2023-10-05 01:11:34', 1, NULL, 1),
(19, 'Dolce & Gabbana', '/thuong-hieu/dolce-gabbana', 'mainmenu', 'Dolce & Gabbana', 0, 6, NULL, NULL, '2023-10-05 01:11:56', '2023-10-05 01:11:56', 1, NULL, 1),
(20, 'Christian Dior', '/thuong-hieu/christian-dior', 'mainmenu', 'Christian Dior', 0, 6, NULL, NULL, '2023-10-05 01:12:21', '2023-10-05 01:12:21', 1, NULL, 1),
(21, 'Guess', '/thuong-hieu/guess', 'mainmenu', 'Guess', 0, 6, NULL, NULL, '2023-10-05 01:12:40', '2023-10-05 01:12:40', 1, NULL, 1),
(22, 'Narciso Rodriguez', '/thuong-hieu/narciso-rodriguez', 'mainmenu', 'Narciso Rodriguez', 0, 6, NULL, NULL, '2023-10-05 04:47:11', '2023-10-05 04:47:11', 1, NULL, 1),
(23, 'Kiến thức Nước hoa', '/danh-muc-bai-viet/kien-thuc-nuoc-hoa', 'mainmenu', 'Kiến thức Nước hoa', 0, 7, NULL, NULL, '2023-10-05 08:38:02', '2023-10-05 08:38:02', 1, NULL, 1),
(24, 'Review Nước hoa', '/danh-muc-bai-viet/review-nuoc-hoa', 'mainmenu', 'Review Nước hoa', 0, 7, NULL, NULL, '2023-10-05 08:38:34', '2023-10-05 08:38:34', 1, NULL, 1),
(25, 'Nước hoa được ưa chuộng', '/danh-muc-bai-viet/nuoc-hoa-duoc-ua-chuong', 'mainmenu', 'Nước hoa được ưa chuộng', 0, 7, NULL, NULL, '2023-10-05 08:38:58', '2023-10-05 08:38:58', 1, NULL, 1),
(26, 'Louis Vuitton', '/thuong-hieu/louis-vuitton', 'mainmenu', 'Louis Vuitton', 0, 6, NULL, NULL, '2023-10-06 00:38:41', '2023-10-06 00:38:41', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_order`
--

CREATE TABLE `cdtt_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `delivery_name` varchar(1000) DEFAULT NULL,
  `delivery_gender` varchar(1000) DEFAULT NULL,
  `delivery_email` varchar(1000) DEFAULT NULL,
  `delivery_phone` varchar(1000) DEFAULT NULL,
  `delivery_address` varchar(1000) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_order`
--

INSERT INTO `cdtt_order` (`id`, `user_id`, `delivery_name`, `delivery_gender`, `delivery_email`, `delivery_phone`, `delivery_address`, `note`, `trash`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 5, '123456', '123456', 'xiaoxiao@gmail.com', '123456789', 'TPHCM', 'Note', 0, 1, NULL, '2023-11-15 21:15:35', '2023-11-15 21:15:35'),
(3, 4, '111111', '111111', 'yangyang@gmail.com', '123456789', 'HN', 'Note', 0, 1, NULL, '2023-11-15 21:16:03', '2023-11-15 21:16:03'),
(4, 3, '222222', '222222', 'lijjinyin@gmail.com', '123456789', 'VT', 'Note', 0, 1, NULL, '2023-11-15 21:16:29', '2023-11-15 21:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_orderdetail`
--

CREATE TABLE `cdtt_orderdetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_orderdetail`
--

INSERT INTO `cdtt_orderdetail` (`id`, `order_id`, `product_id`, `price`, `qty`, `discount`, `amount`, `note`, `trash`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 4, 53, 2290000, 2, 2, 4550000, 'Note', 0, '2023-11-15 21:17:47', '2023-11-15 21:17:47', 1, NULL, 1),
(2, 3, 52, 4550000, 1, 2, 3500000, 'Note', 0, '2023-11-15 21:18:11', '2023-11-15 21:18:11', 1, NULL, 1),
(3, 2, 47, 3500000, 2, 3, 5900000, 'Note', 0, '2023-11-15 21:18:39', '2023-11-15 21:18:39', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_policy`
--

CREATE TABLE `cdtt_policy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(1000) NOT NULL,
  `subtitle` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `detail` varchar(1000) NOT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_policy`
--

INSERT INTO `cdtt_policy` (`id`, `title`, `subtitle`, `slug`, `detail`, `trash`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 'Chính sách vận chuyển', 'Sau khi tiếp nhận được đơn hàng của quý khách, chúng tôi sẽ gọi điện xác nhận thông tin đặt hàng và nhanh chóng vận chuyển đến tay khách hàng trong thời gian sớm nhất có thể.  Nhằm tạo điều kiện thuận lợi cho việc giao hàng và hàng hóa được gửi đến khách hàng sớm nhất, quý khách vui lòng cung cấp chi tiết số nhà, tên đường, phường, thôn, ấp, tổ, khu, bản, xã, thị trấn, quận, huyện, tỉnh … một cách chi tiết và chính xác. Chúng tôi có quyền hủy bỏ các đơn đặt hàng không rõ ràng hoặc không chịu trách nhiệm đối với những trường hợp giao hàng chậm trễ hay thất lạc v.v.. do Quý khách cung cấp thông tin không chính xác.', 'chinh-sach-van-chuyen', '- Miễn phí giao hàng cho đơn hàng từ 750.000 đặt trực tiếp trên Website\r\n\r\n- Hỗ trợ phí giao hàng đồng giá 25.000 cho tất cả các đơn hàng đặt trực tiếp trên website. \r\n\r\n- Phạm vi giao hàng trên toàn quốc\r\n\r\nThời hạn ước tính cho việc giao hàng hoặc cung ứng dịch vụ, có tính đến yếu tố khoảng cách địa lý và phương thức giao hàng \r\n\r\nTrước khi chuyển hàng, chúng tôi sẽ gọi điện xác nhận thông tin và thông báo cho Quý khách về cước phí giao hàng.', 0, '2023-10-05 08:57:39', '2023-10-05 08:57:39', 1, NULL, 1),
(2, 'Chính sách bảo mật', 'Mục đích thu thập thông tin cá nhân:  Các thông tin thu thập thông qua website doucemuse.com.vn sẽ giúp chúng tôi:  – Hỗ trợ khách hàng khi mua sản phẩm  – Giải đáp thắc mắc khách hàng  – Cung cấp cho bạn thông tin mới nhất trên Website của chúng tôi  – Xem xét và nâng cấp nội dung và giao diện của Website  – Thực hiện các hoạt động quảng bá liên quan đến các sản phẩm và dịch vụ của doucemuse.com.vn  Để được hỗ trợ trực tuyến tại emuse.com.vn, quý khách có thể sẽ được yêu cầu đăng nhập/đăng ký tài khoản.  - Họ và tên, địa chỉ liên lạc  - Email, số điện thoại di động', 'chinh-sach-bao-mat', 'Phạm vi sử dụng thông tin cá nhân:\r\ndoucemuse.com.vn thu thập và sử dụng thông tin cá nhân quý khách với mục đích phù hợp và hoàn toàn tuân thủ nội dung của “Chính sách bảo mật” này.\r\nKhi cần thiết, chúng tôi có thể sử dụng những thông tin này để liên hệ trực tiếp với bạn dưới các hình thức như: Gửi thư ngỏ, đơn đặt hàng, thư cảm ơn, thông tin về kỹ thuật và bảo mật, quý khách có thể nhận được thư định kỳ cung cấp thông tin sản phẩm, dịch vụ mới, thông tin về các sự kiện sắp tới hoặc thông tin tuyển dụng nếu quý khách đăng kí nhận email thông báo.\r\nChúng tôi có thể tiết lộ hoặc cung cấp thông tin cá nhân của bạn trong các trường hợp thật sự cần thiết như sau: (a) Khi có yêu cầu của các cơ quan pháp luật; (b) Trong trường hợp mà chúng tôi tin rằng điều đó sẽ giúp chúng tôi bảo vệ quyền lợi chính đáng của mình trước pháp luật', 0, '2023-10-05 09:02:22', '2023-10-05 09:02:22', 1, NULL, 1),
(3, 'Chính sách đổi trả', 'Các trường hợp được đổi lại hàng hóa:  - Trường hợp sản phẩm bị lỗi do nhà sản xuất, sản phẩm kém chất lượng, sản phẩm không đúng chủng loại, mẫu mã, số lượng như đã đặt hàng.  - Sản phẩm đổi phải đảm bảo chưa được sử dụng, đối với hàng Full seal thì phải còn nguyên seal, đối với các sản phẩm Gift Set, Tester phải đảm bảo còn nguyên hộp, sản phẩm chưa bị can thiệp và sử dụng. sản phẩm sẽ được chúng tôi kiểm tra lại để đảm bảo sản phẩm là hàng hóa của bên chúng tôi phân phối.', 'chinh-sach-doi-tra', 'Các trường hợp không được áp dụng đổi lại hàng hóa:\r\n- Sản phẩm không phải do doucemuse.com.vn cung cấp, không chứng minh được nguồn gốc của sản phẩm (hóa đơn, thời gian mua hàng). \r\n- Sản phẩm được mua quá 7 ngày kể từ khi sản phẩm được bán ra.\r\n- Sản phẩm bị tác động từ phía người sử dụng dẫn đến hư hỏng, móp méo, thay đổi hình dạng.\r\n- Sản phẩm đã được sử dụng\r\n- Chúng tôi không chấp nhận trả lại hàng, hoàn lại tiền với các trường hợp muốn trả lại hàng vì lý do không thích mùi, thay đổi ý định, hay các lý do cá nhân khác.\r\n- Không bảo hành lỗi chai/vòi xịt do nhà sản xuất\r\n- Không bảo hành đối với sản phẩm nước hoa mini ( <= 20ml )\r\n- Không đổi trả lotion, sữa tắm, lăn khử mùi', 0, '2023-10-05 09:03:58', '2023-10-05 09:06:51', 1, 1, 1),
(4, 'Điều khoản dịch vụ', 'Chấp nhận đơn hàng và giá cả:  - Chúng tôi có quyền từ chối hoặc hủy đơn hàng của quý khách vì bất kỳ lý do gì vào bất kỳ lúc nào. Chúng tôi có thể hỏi thêm về số điện thoại và địa chỉ trước khi nhận đơn hàng.  - Chúng tôi cam kết sẽ cung cấp thông tin giá cả chính xác nhất cho người tiêu dùng. Tuy nhiên, đôi lúc vẫn có sai sót xảy ra, ví dụ như trường hợp giá sản phẩm không hiển thị chính xác trên trang web hoặc sai giá, tùy theo từng trường hợp chúng tôi sẽ liên hệ hướng dẫn hoặc thông báo hủy đơn hàng đó cho quý khách. Chúng tôi cũng có quyền từ chối hoặc hủy bỏ bất kỳ đơn hàng nào dù đơn hàng đó đã hay chưa được xác nhận hoặc đã bị thanh toán.', 'dieu-khoan-dich-vu', 'Hướng dẫn sử dụng web:\r\n- Khi vào web của chúng tôi, người dùng tối thiểu phải 18 tuổi hoặc truy cập dưới sự giám sát của cha mẹ hay người giám hộ hợp pháp.\r\n- Nghiêm cấm sử dụng bất kỳ phần nào của trang web này với mục đích thương mại hoặc nhân danh bất kỳ đối tác thứ ba nào nếu không được chúng tôi cho phép bằng văn bản. Nếu vi phạm bất cứ điều nào trong đây, chúng tôi sẽ hủy giấy phép của bạn mà không cần báo trước.\r\n- Quý khách phải đăng ký tài khoản với thông tin xác thực về bản thân và phải cập nhật nếu có bất kỳ thay đổi nào. Mỗi người truy cập phải có trách nhiệm với mật khẩu, tài khoản và hoạt động của mình trên web. Hơn nữa, quý khách phải thông báo cho chúng tôi biết khi tài khoản bị truy cập trái phép. Chúng tôi không chịu bất kỳ trách nhiệm nào, dù trực tiếp hay gián tiếp, đối với những thiệt hại hoặc mất mát gây ra do quý khách không tuân thủ quy định.', 0, '2023-10-05 09:09:31', '2023-10-05 09:09:31', 1, NULL, 1),
(5, 'Giới thiệu', 'Với mục tiêu và sứ mệnh “Mang hương Pháp về đất Việt”, Douce Muse Perfume mong rằng có thể đưa các sản phẩm nước hoa, những mùi hương được giữ nguyên vẹn tinh thần Pháp về với người tiêu dùng Việt Nam khắp cả nước. Với mức giá hợp túi tiền, đảm bảo chất lượng, dịch vụ tư vấn và sự trân trọng đối với người tiêu dùng. Giúp bạn có những trải nghiệm an tâm nhất khi lựa chọn sản phẩm tại Douce Muse. Dựa trên phương châm “Chân thật từ lời nói đến mùi hương”. Douce Muse luôn cố gắng đem đến những gì tốt nhất giúp bảo toàn cảm xúc sử dụng nước hoa của bạn. Bằng cách liên tục nâng cao kiến thức tư vấn cũng như sự chu đáo trong phong cách phục vụ.', 'gioi-thieu', 'Đồng thời, hiểu rõ tâm lý của khách hàng về chất lượng nước hoa ở Việt Nam. Douce Muse Perfume luôn tập trung vào xuất xứ Made in France của nước hoa.\r\nĐi cùng với những giá trị cốt lõi đã đem đến cho hơn 12.000 khách hàng trong 8 năm qua. Douce Muse luôn khẳng định:\r\n- Chất lượng: Sản phẩm chính hãng 100%. Xuất xứ Pháp và sức khoẻ của người tiêu dùng luôn là ưu tiên hàng đầu.\r\n- Đạo đức: Là nguyên tắc cho sự tồn tại của doanh nghiệp. Cũng như định hướng kinh doanh và hoạt động nhân sự của Douce Muse.\r\n- Uy tín: Là trách nhiệm mà Douce Muse luôn gìn giữ không chỉ cho thương hiệu. Mà còn là uy tín của cá nhân mỗi thành viên. Là lời hứa với người tiêu dùng kể từ những ngày đầu thành lập.\r\n- Khách hàng là trên hết: Là yếu tố cốt lõi cho mọi hoạt động kinh doanh. Lợi ích của khách hàng là giá trị sống còn của Douce Muse. Là kim chỉ nam mà Douce Muse luôn hướng đến trong mọi thông điệp và hoạt động sau này.', 0, '2023-10-11 05:16:18', '2023-10-11 05:16:18', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_post`
--

CREATE TABLE `cdtt_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `detail` mediumtext NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `type` varchar(1000) NOT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `metakey` varchar(1000) NOT NULL,
  `metadesc` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_post`
--

INSERT INTO `cdtt_post` (`id`, `topic_id`, `title`, `slug`, `detail`, `image`, `description`, `type`, `trash`, `metakey`, `metadesc`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 1, 'SAI LẦM MÀ MỌI NGƯỜI HAY “TƯỞNG” VỀ NƯỚC HOA', 'sai-lam-ma-moi-nguoi-hay-tuong-ve-nuoc-hoa', 'Ngược lại với chúng ta “tưởng”, thành phần chủ yếu và quan trọng của một chai nước hoa là cồn (kể cả nước hoa chính hãng). Mỗi chai nước hoa có thể mang trong mình từ 50% đến 70% là cồn.\r\nNhưng cồn được sử dụng trong nước hoa chính hãng là loại cồn tinh khiết. Có thành phần cồn này trong nước hoa mang lại rất nhiều tác dụng tốt: bảo vệ khỏi vi khuẩn, giữ nước hoa nguyên vẹn và hạn chế biến chất nước hoa trong quá trình sử dụng, tỏa hương mạnh mẽ khi cồn bay hơi mang theo tinh dầu nước hoa lan tỏa đến mọi người,… Thay vì cồn thường sẽ không đủ độ tinh khiết, gây ảnh hưởng đến sức khỏe và khô da.\r\nTuy nhiên cái gì quá cũng không tốt, nếu tỉ lệ cồn tinh khiết chiếm quá cao trong chai nước hoa sẽ khiến mùi tinh dầu bị lấn át. Chỉ tạo ra một tầng hương thơm và khi sử dụng lâu ngày sẽ gây nhức đầu, khó chịu, ảnh hưởng lớn đến tinh thần và sức khỏe của chúng ta.', 'sai-lam-ma-moi-nguoi-hay-tuong-ve-nuoc-hoa.png', NULL, 'Nước hoa có mùi cồn là nước hoa “fake”', 0, 'Mùi trên giấy thử là đúng tuyệt đối', 'Giấy thử mùi được phổ biến như là một phương pháp được sử dụng khi mua sắm nước hoa. Thực tế, mùi hương trên giấy thử không giống hoàn toàn như khi lên da. \r\nVì các loại nước hoa được tinh chế để trở nên phù hợp với các loại hoocmon được tiết ra từ da. Và mỗi người sẽ có mùi hương cơ thể riêng, hòa cùng mùi nước hoa sẽ ra hương thơm khác biệt đôi chút. Nên mùi hương khi xức lên da sẽ mang mùi hương khác so với giấy thử.', '2023-10-05 06:09:38', '2023-10-05 06:09:38', 1, NULL, 1),
(2, 1, 'NHỮNG LỢI ÍCH KHI SỬ DỤNG NƯỚC HOA MINI', 'nhung-loi-ich-khi-su-dung-nuoc-hoa-mini', 'Nước hoa mini được xem là phiên bản thu nhỏ của các chai nước hoa lớn. Có thể giống hoàn toàn hoặc thiết kế đơn giản hơn. Nhưng thành phần, chất lượng hay mùi hương thì không có gì khác biệt so với chai lớn cả.\r\nNước hoa mini được sản xuất với dung tích nhỏ từ 4-15ml. Có thể là dạng chấm, dạng xịt hay dạng lăn. Nhưng phần lớn thì dạng chấm vẫn phổ biến nhất.\r\nĐa phần con gái mà đi ra đường thì không thể thiếu túi xách hay ví cầm tay được. Bạn thử nghĩ xem nếu một chai nước hoa quá to nằm trong túi xách rồi thì có còn chỗ để chứa những vật dụng cần thiết khác nữa không.', 'nhung-loi-ich-khi-su-dung-nuoc-hoa-mini.png', NULL, 'Nước hoa mini là gì?', 0, 'Cực kì nhỏ gọn có thể mang theo mọi nơi & Có thể thay đổi mùi hương', 'Chính vì thế một chai nước hoa nhỏ nhắn xinh xắn chắc chắn sẽ rất gọn nhẹ mà cực kì tiện lợi nữa. Bạn có thể mang theo bất cứ nơi đâu mà không phải lo lắng rằng nó có chiếm quá nhiều diện tích không nhé.\r\nChắc chắn sẽ có những bạn dùng mãi một mùi hương thì cảm thấy chán, bỏ đi thì tiếc mà để lại cũng không sử dụng đến. Hoặc một số bạn muốn trải nghiệm một mùi hương mới và không biết mùi hương đó có phù hợp với mình không. Thì nước hoa mini chính là giải pháp giúp cho bạn đây.\r\n\r\nThay vì sử dụng một chai nước hoa full size thì một chai nước hoa nhỏ như thế này có thể giúp bạn sở hữu nhiều mùi hương khác nhau đấy.', '2023-10-05 07:53:09', '2023-10-05 07:53:09', 1, NULL, 1),
(3, 1, 'NƯỚC HOA NICHE LÀ GÌ?', 'nuoc-hoa-niche-la-gi', 'Niche tiếng Pháp có nghĩa là ngách, hốc. Hiệp hội nước hoa Thế giới sử dụng từ này để nói đến những loại nước hoa được sản xuất trong quy mô nhỏ, xuất hiện rất ít. Hoặc không bao giờ xuất hiện trong các Trung tâm thương mại, cửa hàng bán lẻ.\r\nĐó là Mancera, Aftelier, Goutal, Annick, Clive Creed, Christian,Serge Lutens, Guerlain, Acqua di Parma, Diptyque, … – những cái tên khá lạ lẫm với phần đông tín đồ nước hoa. Và ngược lại những dòng nước hoa phổ biến bạn thường hay gặp bày bán trong các shop nước hoa, các trung tâm thương mại như Lancome, Gucci, Verrsace, Calvin Klein, … được gọi là nước hoa Designer.\r\nNói đến nước hoa Niche là nói đến nghệ thuật và sáng tạo. Và mặc dù không được bày bán phổ biến rộng rãi. Nhưng các hãng nước hoa này vẫn miệt mài ngày đêm nghiên cứu để cho ra đời những dòng sản phẩm mới. Nhằm đáp ứng cho một phân khúc khách hàng riêng của họ. Những người thích sự tinh tế, độc đáo, khác biệt để thể hiện bản thân, cá tính riêng của họ.', 'nuoc-hoa-niche-la-gi.jpg', NULL, 'Một số điểm đặc biệt của nước hoa Niche:', 0, 'Mặc dù có những điểm độc đáo như trên, sử dụng nguyên liệu chuyên biệt, sản xuất ít. Nhưng bạn đừng nghĩ rằng Niche là sản phẩm xa xỉ, sang chảnh hay đắt tiền. Có những loại cũng vài trăm $, tuy nhiên cũng có những loại chỉ vài chục $ một chai.\r\nCái quan trọng nhất của Niche Perfume là sự tỉ mỉ, kỳ công cũng như cả tinh thần của người sáng chế muốn gửi gắm trong đó. Chứ không phải là sản phẩm được làm công nghiệp, đáp ứng số đông chỉ để tạo ra doanh thu cao nhất.\r\nDo đó mùi hương của Niche không phải ai cũng dùng được, có khi rất khó ngửi. Những mùi hương đậm đặc tinh dầu của khói, da thuộc, gỗ đôi khi khiến người sử dụng lần đầu bị shock. Tuy nhiên Niche cũng có những chai rất mộc mạc, giản dị và khá dễ chịu.', '– Sử dụng các tinh chất tự nhiên độc quyền, riêng biệt.\r\n\r\n– Tạo một dòng sản phẩm độc quyền tại một vài địa điểm riêng biệt như: Bond No9, Aqaba tại NewYork. Eau d’Italie ở những vùng đồng quê, Profumi di Pantelleria chuyên dùng ở các đảo, …\r\n– Sử dụng duy nhất một mùi hương như Vanille hay hoa hồng.\r\n\r\n– Tận dụng hương thơm đặc trưng tại địa phương đó như: Comptoir Sud Pacifique với mùi hương của biển Nam Thái Bình Dương.', '2023-10-05 07:59:01', '2023-10-05 07:59:01', 1, NULL, 1),
(4, 1, 'NHỮNG KIẾN THỨC CƠ BẢN VỀ NƯỚC HOA', 'nhung-kien-thuc-co-ban-ve-nuoc-hoa', 'Nước hoa là hỗn hợp pha trộn của các hương liệu chiết xuất tự nhiên và các hương liệu tổng hợp được hòa tan trong dung môi nước hoặc cồn cao cấp. Hàm lượng hương liệu trong dung môi của nước hoa sẽ quyết định độ lâu của mùi hương khi sử dụng.', 'nhung-kien-thuc-co-ban-ve-nuoc-hoa.png', NULL, 'Các dòng nước hoa chính:', 0, 'Nước hoa được phân chia thành các dòng dựa theo thành phần hương liệu và mùi hương của nó. Có thể chia nước hoa ra thành một số dòng chính như sau:\r\n\r\n– Dòng hương cam, quýt: Có thể nhận dạng bằng những mùi hương nhẹ và tươi của Bergamot, cam, chanh, quýt… mang phong cách thơm mát, sảng khoái.\r\n– Dòng hương hoa, trái cây: Mang hương thơm của các loại hoa hồng, hoa nhài, hoa lan, hoa violet…và các loại trái cây như nho, dưa leo, táo, kiwi, mơ… mang lại cho bạn cảm giác ngọt ngào, tươi trẻ, nhẹ nhàng.\r\n\r\n– Dòng hương Phương Đông: Là nhóm có hương thơm đậm nhất. Nước hoa dòng này thường có mùi đặc trưng ấm, hơi gắt và có gì đó bí ẩn như chính phương Đông vậy. Họ phương Đông thường là mùi tạo ra từ hỗn hợp của gỗ quý và hương cây cỏ.\r\n\r\n– Dòng hương gỗ: Hầu hết nước hoa nam đều có mùi của dòng này. Được chiết xuất chủ yếu từ các loài gỗ quý như đàn hương, hồng sắc, tuyết tùng.', '– Dòng hương liệu gia vị: Dòng này chủ yếu được làm từ các loại thảo mộc như xạ hương, cây hồi, nutmet, cây đinh hương và gia vị như hồ tiêu, dầu hồng… Nó thường có mặt trong nước hoa dành cho nam.\r\n– Dòng Floral Aldehydic: Mùi hương này thường thấy trong nước hoa tổng hợp, được làm hoàn toàn từ các hóa chất nhân tạo. Nó tạo nên độ sắc sảo cho những mùi hương. Cảm giác về nó là một sự sáng tạo thuần chất, hơi thiên về hướng thanh lịch.\r\n\r\n– Dòng Fougere: là những hỗn hợp bao gồm mùi dương xỉ cùng mùi của cam quýt với hoa oải hương và gỗ. Ấn tượng nó mang lại là sự tươi mới đậm đà.\r\n\r\n– Dòng Chypre (Sip): Chẳng có dòng nào đa hương như Chypre. Nước hoa họ này cũng ấm như khí hậu của đảo Síp ở Địa Trung Hải mà nó mượn tên và giữ mùi rất lâu.\r\n\r\n– Dòng nước: Có thể coi đây là dòng mới nhất trong gia đình nước hoa dù nhiều người vẫn xếp nó vào họ Đại dương. Mùi hương họ nước gợi nhớ đến một cái gì đó nhẹ thênh, trong vắt, dịu mát và tĩnh lặng của Đại dương.', '2023-10-05 08:05:01', '2023-10-05 08:05:01', 1, NULL, 1),
(5, 2, 'ĐIỀU GÌ KHIẾN NARCISO RODIGUEZ MUSC NOIR ROSE TRỞ NÊN HOT HIT?', 'dieu-gi-khien-narciso-rodiguez-musc-noir-rose-tro-nen-hot-hit', 'Narciso Rodriguez Musc Noir Rose là chai nước hoa được đánh giá cao với mùi thơm gợi cảm, quyến rũ. Không bí ẩn như Musc Noir, chai nước hoa lột tả được nét chân thật của người phụ nữ cá tính nhưng cũng không kém phần mềm mại. \r\nMùi hương của Narciso Rodriguez Musc Noir Rose: Mở đầu bằng cam Bergamot, mận và tiêu hồng nhưng khi mới xịt lại cảm nhận được mùi phấn thơm từ xạ hương. Tuy nhiên khác với bản Musc Noir, mùi phấn trong em này có đệm thêm cả hoa hồng. Đem đến một mùi thơm tinh tế và sâu lắng hơn. Kết hợp với vị chua thanh của cam Bergamot khiến Musc Noir Rose vừa có mùi phấn, vừa có mùi trái cây. Một mùi hương rất cuốn, rất đặc trưng. Hương hoa huệ khiến cho mùi thơm của Musc Noir Rose trở nên mỏng manh quyến rũ.\r\nMùi phấn thơm thơm rất lâu, là mùi chủ đạo của chai nước hoa. Dù thơm lâu nhưng mùi phấn trong em này không quá gắt đâu. Ngọt, thơm vừa đủ để nàng cảm thấy thư giãn. Đến cuối chỉ lưu lại một mùi thơm thoang thoảng của hoa trắng dễ chịu vô cùng.', 'dieu-gi-khien-narciso-rodiguez-musc-noir-rose-tro-nen-hot-hit.png', NULL, 'Thành phần: - Hương đầu: Cam bergamot, mận, tiêu hồng - Hương giữa: Xạ hương, Hoa huệ, Hoa hồng - Hương cuối: Vani', 0, 'Thiết kế của Narciso Rodriguez Musc Noir Rose: Chai nước hoa vẫn mang phong cách cũ của dòng Nar cao. Đúng như đặc tính ngọt và trầm của mùi hương, chai nước hoa Musc Noir Rose có màu đỏ đậm trầm ấm giống như màu của quả mận chín. Toát lên vẻ sang trọng, quyến rũ.', 'Độ lưu hương: Thuộc dòng EDP nên độ lưu hương của em này khá ổn. Khoảng tầm từ 5 đến 6 giờ đồng hồ. Nếu muốn thơm lâu hơn thì có thể xịt lên quần áo, thơm đến khoảng 8 – 9 giờ lận đó. Bên cạnh đó thì độ lưu hương cũng như mùi phấn của em này sẽ toả ra tuỳ cơ địa của mỗi người. Nếu là người có làn da ẩm, Musc Noir Rose khi xịt ra sẽ tạo mùi phấn khá rõ, lưu hương tốt hơn. Còn nếu da bạn khô, mùi phấn sẽ chỉ hiện lên thoang thoảng nhưng rất dễ chịu và cũng lưu hương kém hơn.', '2023-10-05 08:10:14', '2023-10-05 08:14:33', 1, 1, 1),
(6, 2, 'REVIEW D&G LIGHT BLUE EAU INTENSE FOR MEN', 'review-dg-light-blue-eau-intense-for-men', 'Dolce & Gabbana luôn là cái tên có ảnh hưởng lớn đến toàn cầu về thời trang. Bên cạnh những thành công vang dội trong lĩnh vực thiết kế, hãng còn phát triển sang chế tạo nước hoa với những dòng nước hoa mang hương thơm quyến rũ, sang trọng. \r\nLight Blue là dòng nước hoa nổi tiếng nhất của nhà D&G. Bộ sưu tập này bao gồm nước hoa cho cả nữ và nam. Nước hoa Light Blue mang hơi hướng tươi sáng, mát mẻ và thư giãn. Mùi thơm thanh mát, trẻ trung nhưng vẫn giữ được nét sang trọng. \r\nSau 16 năm kể từ khi ra mắt chai nước hoa Light Blue đầu tiên, năm 2017, Light Blue Eau Intense for Men được trình làng. Chai nước hoa được coi là biểu tượng của dòng Light Blue Pour Homme. Với mùi thơm sâu sắc và độc đáo. Màu sắc cũng như thiết kế đều mang đậm chất biển cả. Light Blue Eau Intense for Men luôn trong tình trạng cháy hàng mỗi khi hè đến.', 'review-dg-light-blue-eau-intense-for-men.png', NULL, 'Thành phần: - Hương Đầu: Quả quýt hồng, Quả bưởi  - Hương giữa: Nước biển, Cây bách xù  - Hương cuối: Hổ phách, Xạ hương', 0, 'Thiết kế của D&G Light Blue Eau Intense for Men: Vẫn giữ nguyên mẫu thiết kế của dòng Pour Homme. Nhưng chất lỏng trong Light Blue Eau Intense đã được đổi sang màu xanh biển. Nắp chai cũng là màu xanh đồng nhất với màu nước hoa. Thân chai làm bằng thủy tinh trắng đục, dễ dàng nhìn thấy bên trong. Tạo cảm giác mát mẻ, vừa nhìn vào thôi là đã thấy cả mùa hè.', 'Độ lưu hương: Về độ lưu hương thì cũng còn tùy vào cơ địa của mỗi người. Cũng sẽ có người khi dùng em này thì chỉ lưu lại khoảng 3 – 4 giờ, thậm chí ít hơn. Nhưng theo trải nghiệm thực tế của Missi và phần đông các khách hàng thì Light Blue Eau Intense for Men có mức độ lưu hương trung bình từ 4 – 6 tiếng trên da. Còn trên quần áo thì sẽ lưu được lâu hơn, khoảng 7-8 tiếng.', '2023-10-05 08:17:43', '2023-10-05 08:17:43', 1, NULL, 1),
(7, 2, 'YVES SAINT LAURENT LIBRE –  NÀNG THƠ TỰ DO CỦA NĂM 2019', 'yves-saint-laurent-libre-nang-tho-tu-do-cua-nam-2019', 'Yves Saint Laurent Libre thuộc nhóm hương phương đông, mùi hương vừa xịt ra đã có sức lan tỏa xa gần 2m.\r\nMùi hương thơm nồng nàn, sang chảnh, hiện đại, quyến rũ chính là những điểm các bạn có thể cảm nhận được ở em này.\r\nVới sự kết hợp chính của các thành phần quả cam, hoa oải hương, hoa lan ở những nốt hương đầu mang đến mùi thơm nồng nhưng không gắt rất dễ chịu.\r\nNổi bật, quyến rũ hơn theo từng giây với hoa nhài, hoa oải hương, làm toát lên vẻ đẹp riêng biệt của người phụ nữ.\r\nNốt hương cuối sẽ có một chút vị Vani Madagasca, Gỗ Tuyết Tùng, xạ Hương, mùi hương thơm ngọt sang, tinh tế làm người khác quyến luyến và nhớ mãi.', 'yves-saint-laurent-libre-nang-tho-tu-do-cua-nam-2019.png', NULL, 'MÙI HƯƠNG MANG HƠI HƯỚNG HIỆN ĐẠI SANG CHẢNH', 0, 'ƯU ĐIỂM: YSL Libre thuộc dòng EDP có nồng độ khá cao thời gian lưu hương rất tốt từ 7- 12 giờ trên quần áo, trên da tùy cơ địa mỗi người.\r\n\r\nRất nổi bật khi các nàng xịt em ấy lên người đi dự tiệc, đi chơi, hẹn hò, đi làm đều rất tốt.\r\n\r\nĐộ tỏa hương trên cả tuyệt vời, khoảng 2m.\r\n\r\nNước hoa phát huy tốt vào: Ngày, đêm, thu, đông.\r\n\r\nĐặc biệt: YSL Libre là dòng mới ra mắt 2019, mùi hương được cải tiến, khó đụng hàng và hợp xu hướng với các nàng hiện đại, dùng rất rất thích.', 'KHUYẾT ĐIỂM: YSL Libre không phù hợp với các nàng yêu thể thao, thích hương nhẹ nhàng, hương biển nhé.\r\n\r\nDùng vào mùa hè sẽ không hợp lắm vì sẽ không mang đến sự tươi mát cần thiết cho thời điểm này.', '2023-10-05 08:22:06', '2023-10-05 08:22:06', 1, NULL, 1),
(8, 2, 'GUCCI BLOOM EDP – QUÝ CÔ THANH NHÃ SANG TRỌNG.', 'gucci-bloom-edp-quy-co-thanh-nha-sang-trong', 'Gucci Bloom thuộc tông mùi hoa cỏ cảm giác mang đến các nàng sự nhẹ nhàng.\r\nMở màn là mùi hương hoa kim ngân biến các nàng trông vừa nữ tính, điệu đà kích thích sự chở che bảo vệ từ người khác.\r\nTiếp đến là mùi hương của hoa nhài Sambac, hương hoa này cũng góp phần làm cho mùi hương này có phần đặc biệt.\r\nCuối cùng cũng là mùi hương chính trong Gucci Bloom, nồng nàn của hoa huệ trắng, là điểm giúp hương Gucci Bloom nổi bật và dễ nhận biết khi tiếp xúc.\r\nMùi hoa huệ trắng mềm mại, nhẹ nhàng mà trang trọng. Nhà thiết kế đã thêm vào đó hương của rễ cây diên vĩ để tất cả các hương hoa có trong Gucci Bloom trộn lẫn hài hòa với nhau.\r\nĐể rồi khi xịt nước hoa Gucci Bloom, bạn như đang đắm chìm vào một khu vườn trải đầy hoa thơm ngào ngạt.', 'gucci-bloom-edp-quy-co-thanh-nha-sang-trong.png', NULL, 'MÙI HƯƠNG HOA NỔI BẬT CỰC THU HÚT', 0, 'THIẾT KẾ  CỦA GUCCI BLOOM: Gucci Bloom có vỏ chai được thiết kế cổ điển và sang trọng. Vỏ chai được làm bằng sứ chắc chắn với gam màu hồng pastel nhẹ nhàng. Chai có dáng hình chữ nhật đơn giản nhưng không kém phần sang trọng.\r\n\r\nNắp chai hình trụ hài hòa cùng với phần thân, tạo nên một Gucci Bloom đậm chất cổ điển.\r\n\r\nGucci Bloom chính là hình ảnh của đóa hoa đằm thắm, quyến rũ.', 'ĐỘ LƯU HƯƠNG VÀ TỎA HƯƠNG CỦA GUCCI BLOOM: Gucci Bloom thuộc tông mùi hoa, nên độ lưu hương trung bình từ 6-7 giờ.\r\n\r\nBạn có thể nghe thấy mùi hương rõ ràng trong phạm vi nửa cánh tay.\r\n\r\nCác cô nàng có thể khoác lên mình mùi hương này đi làm, cà phê cùng bạn, hẹn hò với người yêu hay sử dụng trong những bữa tiệc quan trọng.\r\n\r\nMùi hương rất phù hợp với các nàng yêu phong cách nữ tính, dịu dàng, trang nhã và sang trọng.', '2023-10-05 08:24:49', '2023-10-05 08:24:49', 1, NULL, 1),
(9, 4, 'CÁCH CHỌN NƯỚC HOA PHÙ HỢP LÀM QUÀ VALENTINE CHO BẠN GÁI', 'cach-chon-nuoc-hoa-phu-hop-lam-qua-valentine-cho-ban-gai', 'Hiểu được cá tính của người nhận: Hẳn bạn sẽ không muốn nước hoa mình tặng làm quà Valentine lại không được sử dụng đến. Nên đây là một bước quan trọng để chứng tỏ mức độ quan tâm của bạn đối với cô ấy. Một cô gái có tính cách nhẹ nhàng, tĩnh lặng thường không thích mùi hương quá nổi trội và khác lạ. Và một cô nàng cá tính thường không thích mùi hương quá an toàn. Hoặc nếu như tỏ tình thì nên chọn những thiết kế đẹp và có thương hiệu nổi tiếng một chút. Đó là cách để bạn loại bớt được hằng hà sa số những dòng nước hoa không phù hợp. Giúp thu hẹp phạm vi sản phẩm dễ lựa chọn hơn.\r\nBạn muốn bạn gái dùng nước hoa được tặng vào lúc nào: Bởi vì dùng nước hoa mỗi dịp, mỗi sự kiện đều có cách chọn khác nhau. Nên nếu bạn muốn nước hoa được dùng lúc đi dạo công viên, vườn hoa vào ban ngày thì nên chọn những dòng thanh mát, dễ chịu. Còn dùng vào những dịp đặc biệt, hẹn hò lãng mạn và tiệc tùng thì nên có điểm nhấn nổi bật hơn.\r\nMức giá mà bạn muốn tặng: Có thể bạn nghĩ điều này không cần thiết, nhưng nước hoa ở Việt Nam vẫn có giá thành khá cao. Nên việc bạn xác định trước mức giá sẽ giúp bạn có sự chuẩn bị tốt hơn. Ví dụ như nước hoa trong tầm giá 1 đến dưới 2 triệu đồng thì có thể xét đến một số dòng của Versace hay Burberry. Còn cao cấp hơn thì có Kilian, Dior hay MFK.', 'cach-chon-nuoc-hoa-phu-hop-lam-qua-valentine-cho-ban-gai.png', NULL, 'Những yếu tố cần xét trước khi chọn nước hoa làm quà tặng Valentine', 0, 'Cách chọn nước hoa phù hợp và những chai nước hoa thường được chọn làm quà Valentine', 'Chọn những dòng nước hoa nịnh mũi, dễ được yêu thích: Vì dù sao bạn cũng sẽ không thể biết chắc chắn 100% người kia có thích hay không. Nên để an toàn thì hãy chọn những dòng nước hoa được nhiều người yêu thích và nịnh mũi. Thì khả năng bạn gái bạn thích cũng sẽ cao hơn là những dòng nước hoa quá mức đặc biệt và lạ.\r\nChọn mức giá theo thương hiệu: Như đã nói ở trên, mức giá là cái bạn nên định ra trước để dễ dàng khoanh vùng sản phẩm hơn. Vì thử nước hoa quá nhiều dễ dẫn đến lờn mùi, bạn lại càng khó chọn hơn. Nên nếu như dự định của bạn trong khoảng 1 – 2 triệu đồng thì có Versace, Burberry, Armaf, Victoria’s Secret,… Trong tầm 2 – 4 triệu đồng có Chanel, Dior, Gucci, Narciso, Lancome, Dolce&Gabanna,… Từ 4 triệu đồng đến dưới 8 triệu có Le Labo, MFK, Tom Ford, Kilian, Maison Margiela, Jo Malone, Creed, Roja,…', '2023-10-05 08:30:03', '2023-10-05 08:30:03', 1, NULL, 1),
(10, 4, 'TOP NƯỚC HOA NAM ĐƯỢC PHỤ NỮ ƯA CHUỘNG NHẤT', 'top-nuoc-hoa-nam-duoc-phu-nu-ua-chuong-nhat', 'Là hai dòng nước hoa nam nổi tiếng nhất của nhà Chanel và cũng là nước hoa bán chạy nhất, top nước hoa được phụ nữ yêu thích trong vòng 10 năm trở lại. Tuy nhiên, Bleu de Chanel eau de toilette nhấn mạnh mùi hương tươi và đậm Citrus như chanh, một số note khá mát như lá bạc hà. \r\nBleu de Chanel eau de parfum thì nồng mùi hơn Bleu de Chanel EDT. Bản EDP cũng nhấn mạnh vào tầng hương gỗ. So sánh thì EDT có sự tiến bộ về độ lan tỏa hơn so với EDP. Bản EDT bám trên da tầm 5 tiếng và tỏa trong vòng 1 đến 2 tiếng đầu, vì nó là tone hương mát, nhẹ nhàng và dễ chịu. Tuy nhiên, đến bản EDP thì mức độ bám trên da đã lên được 6 đến 7 tiếng.\r\nVới những khu vực khí hậu không lạnh như Việt Nam thì Bleu de Chanel EDT hay EDP đều có thể dùng quanh năm suốt tháng. Nếu bạn là một người không có quá nhiều yêu cầu về phong cách cá tính và độc đáo thì Chanel cả hai phiên bản này sẽ là sự lựa chọn an toàn.', 'top-nuoc-hoa-nam-duoc-phu-nu-ua-chuong-nhat.png', NULL, 'Nước hoa nam BLEU DE CHANEL EDT và EDP', 0, 'Nước hoa nam VERSACE EROS EDP', 'Versace Eros là một trong những chai nước hoa phổ thông, có thiết kế không hề thua kém thậm chí là còn hơn một số dòng nước hoa cao cấp khác. Bên ngoài chai mang hơi hướng cổ điển và phong cách thần thoại Hy Lạp. Bản EDP ra mắt năm 2020, sau khi EDT đã chiếm lĩnh thị trường, thì EDP ra mắt để khắc phục vấn đề lưu hương.\r\n\r\nẤn tượng đầu tiên khi xịt Eros EDP là sự dễ chịu. Nhóm hương đầu toàn những thành phần tươi mát như là bạc hà, táo và cam. Phải nói là cực kỳ mát luôn. Nên nếu là những người yêu thích tông mùi trầm như da thuộc hay gỗ ấm, thì Versace Eros sẽ khó đáp ứng. Nhưng nếu là kiểu người vốn thích mùi mát và nam tính mạnh mẽ, thì chắc chắn hợp.\r\n\r\nSau tông đầu thì mùi mát ở tầng giữa giảm đi khá nhanh, chuyển sang mùi gỗ nhẹ. Hơn nữa là trong Versace Eros EDP còn có hương gia vị của ambroxan, nên khá kích thích khứu giác. Đặc biệt là cho những người thích sự quyến rũ và hấp dẫn trong mắt phái đẹp.', '2023-10-05 08:32:36', '2023-10-05 08:34:18', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_product`
--

CREATE TABLE `cdtt_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `brand_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `trash` int(11) NOT NULL DEFAULT 0,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `price` float NOT NULL,
  `pricesale` float DEFAULT NULL,
  `image` varchar(1000) NOT NULL,
  `qty` int(10) UNSIGNED DEFAULT 0,
  `detail` varchar(1000) NOT NULL,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_product`
--

INSERT INTO `cdtt_product` (`id`, `category_id`, `brand_id`, `trash`, `name`, `slug`, `description`, `price`, `pricesale`, `image`, `qty`, `detail`, `metakey`, `metadesc`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 1, 1, 0, 'Salvatore Ferragamo Uomo Signature EDP', 'salvatore-ferragamo-uomo-signature-edp', NULL, 1450000, NULL, 'Salvatore Ferragamo Uomo Signature EDP.png', NULL, 'Ferragamo mang phong cách da thuộc phương đông với những nốt hương trầm ấm chính từ đậu tonka, cafe và da cây hoắc hương.\r\n\r\nMở đầu với hỗn hợp rực rỡ của quả bưởi và quả quýt hồng mang một thanh âm cay nồng của hồng tiêu. Theo sau là sự ấm áp của Bạch đậu khấu pha một chút nồng nàn của cây Bách và Quế, mang cả hơi thở của nền trời cuối thu. Sau cùng, sự hứng khởi từ đậu Tonka chưng cất cùng cây cà phê làm mê mẩn những trái tim phóng đãng.\r\n\r\nNhững nét chấm phá từ Cây hoắc hương và da thuộc khơi dậy một tâm hồn đầy táo bạo và tinh thần tươi mới của một thời tuổi trẻ đầy năng động..\r\n\r\n- Hương đầu: Qủa bưởi, Qủa quýt hồng ý, Hồng tiêu\r\n- Hương giữa: Cây bách, Bạch đậu khấu, Quế\r\n- Hương cuối: Đậu tonka, Cà phê, Cây hoắc hương, Da thuộc', 'Salvatore Ferragamo Uomo Signature EDP', 'Salvatore Ferragamo Uomo Signature EDP', '2023-10-05 01:30:05', '2023-10-05 01:30:05', 1, NULL, 1),
(2, 1, 2, 0, 'Giorgio Armani Acqua Pour Homme', 'giorgio-armani-acqua-pour-homme', NULL, 3550000, 0, 'Giorgio Armani Acqua di Gio Pour Homme Parfum.png', 0, 'Vẫn giữ nguyên thiết kế kinh điển của line nước hoa Acqua Di Giò, phiên bản mới \"Parfum\" này được khoác lên một lớp áo mới, một chiếc áo choàng 2 màu mang phong cách ombre, phần thân đen từ trên xuống dần bạc/trắng, trông rất mới lạ những cũng không kém phấn cổ điển. Nói về mùi hương, vẫn với note hương biển làm chủ đạo, mùi hương của bản Parfum có phần xanh hơn, tươi tắn và trẻ trung hơn so với bản Profumo.\r\nThuộc nhóm hương aromatic - fresh spicy - marine, các tầng hương của phiên bản Parfum trải dài từ biển cả đến rừng cây, từ hương đầu là sự dữ dội và mạnh mẽ của note hương biển, xen lẫn một chút chua nhẹ của bergamot. Drydown, tầng hương giữa rõ rệt hơn mùi hương của rosemary và cây xô thơm, điểm nhấn thêm chút dịu dàng của hoa phong lữ. Mùi hương kết thúc bằng hoắc hương và nhũ hương. - Hương đầu: Hương biển, Bergamot.\r\n- Hương giữa: Rosemary, Xô thơm, Phong lữ.\r\n- Hương cuối: Nhũ hương, Hoắc Hương.', 'Giorgio Armani Acqua di Gio Pour Homme Parfum', 'Giorgio Armani Acqua di Gio Pour Homme Parfum', '2023-10-05 01:35:58', '2023-10-05 11:09:24', 1, 1, 1),
(3, 1, 3, 0, 'Hermes Terre d\'Hermes Perfume', 'hermes-terre-dhermes-perfume', NULL, 2350000, 0, 'Hermes Terre d\'Hermes Perfume EDT.png', 0, 'Nhiều người ví Hermes Terre d\'Hermes có mùi hương của một một người đàn ông quyền lực đứng ngửa mặt nhìn lên bầu trời, là mùi uy quyền của con người kết hợp cùng gió, nắng và màu xanh bao la của bầu trời, có người lại thấy nó trầm lặng, lạnh lùng, xa hoa của những loài gỗ quý ẩn mình dưới lòng đất. Dù là thế nào, Hermes Terre d\'Hermes cũng thể hiện được sự tinh tế, sang trọng và quyền uy như chính cách nhà Hermes đang thể hiện ở mọi góc độ thời trang, nước hoa cũng như phong cách hoàng gia hãng luôn mang lại cho những fan trung thành của mình. Terre d\'Hermes là \"Đất\" của Hermes, và mặc nó lên người, bạn sẽ trở thành người nhà của Hermes. \r\n\r\n- Hương Đầu: Quả cam, Quả bưởi\r\n- Hương giữa: Tiêu, Chi quỳ thiên trúc\r\n- Hương cuối: Cây hoắc hương, Gỗ tuyết tùng, Cỏ hương bài', 'Hermes Terre d\'Hermes Perfume EDT', 'Hermes Terre d\'Hermes Perfume EDT', '2023-10-05 03:07:59', '2023-10-05 11:09:51', 1, 1, 1),
(4, 1, 4, 0, 'Versace Perfume Signature Eros EDT', 'versace-perfume-signature-eros-edt', NULL, 1650000, 0, 'Versace Perfume Eros EDT.png', 0, 'Eros thể hiện sự mạnh mẽ nam tính thông qua sự kết hợp tinh tế của hương lá bạc hà tươi, vỏ chanh và táo xanh. Hương giữa gây nghiện bởi sự pha trộn của một số thành phần hương hoa phương Đông hấp dẫn như đậu tonka, hổ phách, hoa phong lữ , vani cùng với một chút thành phần hương đặc trưng của hương gỗ như gỗ tuyết tùng từ Atlas và Virginia. Trong khi ở lớp hương cuối hương hoa cỏ lau và rêu sồi làm tăng thêm sự quyến rũ, tinh tế và đam mê cho phái mạnh.\r\nVới thiết kế màu xanh ngọc đầy ấn tượng, chai nước hoa mang đến sự tươi mát và gợi cảm. Hình dáng của chai nước hoa như một mê cung, như muốn nhấn mạnh lên sự bí ấn của nó. Versace Eros là mùi thơm dành cho người đàn ông mạnh mẽ, là người làm chủ được bản thân và luôn đứng ra đấu tranh bảo vệ ý tượng và mục đích của mình.\r\n- Hương đầu: Táo Xanh, Bạc Hà.\r\n- Hương giữa: Đậu Tonka , Hoa Phong Lữ.\r\n- Hương cuối: Cỏ Hương Bài, Vani.', 'Versace Perfume Signature Eros EDT', 'Versace Perfume Signature Eros EDT', '2023-10-05 03:16:35', '2023-10-05 03:20:31', 1, 1, 1),
(5, 1, 4, 0, 'Versace Dylan Blue Pour Homme EDT', 'versace-dylan-blue-pour-homme-edt', NULL, 1650000, 0, 'Versace Dylan Blue Pour Homme EDT.png', 0, 'Là mùi hương mang dấu ấn đặc biệt của các loại gỗ thơm thiên nhiên quý hiếm. Bằng phương pháp tinh chế khéo léo, Versace Dylan Blue mở đầu bằng hương thơm mới mẻ của hỗn hợp cam, chanh và bưởi pha trộn cùng hương lá sung ẩn hiện tạo cảm giác thanh mát sắc sảo mang hương vị Địa Trung Hải. Hương biển quyến rũ, lá Violet và một chút hương tiêu đen ở tầng hương thứ hai góp thêm chút rắn rỏi cho người đàn ông. Nhưng mùi hương tinh tế của gỗ, long diên hương, giấy cói và hoắc hương mới chính là thành phần tạo nên sự quyền lực và mạnh mẽ của hương nước hoa này. Cuối cùng khép lại bằng sự quyến rũ ấm áp của xạ hương và khoáng chất.\r\nChai nước hoa mang hình dáng thiết kế vượt thời gian với gam màu thu hút người đối diện ngay từ cái nhìn đầu tiên – xanh dương sáng và vàng gold. Các đường kẻ trên thân chai được điêu khắc tỉ mỉ cùng với biểu tượng quen thuộc của Versace – hình đầu rắn Medusa. Hương thơm phù hợp khi đi làm, những buổi tiệc sang trọng hay những cuộc hẹn hò lãng mạn.', 'Versace Dylan Blue Pour Homme EDT', 'Versace Dylan Blue Pour Homme EDT', '2023-10-05 03:19:14', '2023-10-05 03:21:52', 1, 1, 1),
(6, 1, 2, 0, 'Giorgio Armani Acqua Di Gio Profondo EDP', 'giorgio-armani-acqua-di-gio-profondo-edp', NULL, 2800000, 0, 'Giorgio Armani Acqua Di Gio Profondo EDP.png', 0, 'Acqua Di Gio Profondo thuộc nhóm hương thơm thảo mộc với các nốt hương biển và khoáng rất đặc trưng. Mùi hương gợi nên một chàng trai bãi biển tràn đầy sự nam tính, rắn rỏi mang trên mình hương vị của cả đại dương bao la, phóng khoáng, tự do như tính cách của chàng trai ấy. Sự mát mẻ phủ lên từng đường nét cơ thể, đây chắc chắn sẽ là mùi hương được phái mạnh yêu thích nhất năm nay.\r\n- Hương đầu: Hương biển, Cam Bergamot, Quýt xanh, Aquozone\r\n- Hương giữa: Hương thảo, Hoa oải hương, Cây bách, Mastic, lentisque.\r\n- Hương cuối: Hổ phách, Hoắc hương, Xạ hương, Hương khoáng.', 'Giorgio Armani Acqua Di Gio Profondo EDP', 'Giorgio Armani Acqua Di Gio Profondo EDP', '2023-10-05 03:25:27', '2023-10-05 03:25:27', 1, NULL, 1),
(7, 1, 6, 0, 'Chanel Allure Homme Sport Eau Extreme', 'chanel-allure-homme-sport-eau-extreme', NULL, 3950000, 0, 'Chanel Allure Homme Sport Eau Extreme.png', 0, 'Chai nước hoa mang hình dáng giống với nước hoa Allure Homme. Thân chai Allure Homme Sport Eau Extreme mang một màu đen tuyền được tô điểm với vòng bạc trên nắp chai có tên hãng được khắc trên đó. Điểm nhấn tạo nên sự năng động sáng tạo trên phiên bản này chính là những dòng chữ trắng và đỏ nổi bật màu xám của thân chai nước hoa.\r\n\r\nTổ hợp nước hoa này là sự hòa quyện tuyệt vời của quýt và đậu tonka, tạo nên một mùi hương lâu dài và làm hài lòng bất cứ ai sử dụng. Nước hoa tỏa hương đủ mạnh vào mùa đông, nhưng vẫn nhẹ nhàng vào những mùa xuân/hè. Việc này làm nước hoa trờ nên đa năng và xứng đáng được trở thành mùi hương độc nhất của một ai đó sử dụng thường xuyên. Mùi hương nước hoa rất thích hợp cho những cuộc hẹn về đêm hoặc những khi bạn đi làm hằng ngày.\r\n- Hương đầu: Cây xô thơm, Cây bạc hà, Quả quýt hồng, Cây bách\r\n- Hương giữa: Tiêu\r\n- Hương cuối: Xạ hương, Gỗ tuyết tùng, Gỗ đàn hương, Đậu Tonka', 'Chanel Allure Homme Sport Eau Extreme', 'Chanel Allure Homme Sport Eau Extreme', '2023-10-05 03:28:48', '2023-10-05 03:28:48', 1, NULL, 1),
(8, 1, 6, 0, 'Chanel Allure Homme Sport Perfume EDT', 'chanel-allure-homme-sport-perfume-edt', NULL, 3300000, 0, 'Chanel Allure Homme Sport Perfume EDT.png', 0, 'Allure Homme Sport được tạo thành bởi Jacques Polge – nhà thiết kế nước hoa đại tài của Chanel. Ông là người đứng sau hàng loạt những mùi hương đình đám của Chanel như Coco Noir, Coco Mademoiselle, Chance Eau Fraiche hay Bleu de Chanel. Chai nước hoa nhỏ mang thiết kế khỏe khoắn và đầy tươi mới với thân chai tráng bạc, logo được in bằng chữ đen chắc khỏe, nắp nhựa đen tuyền được bao quanh bởi một vòng thép cũng góp phần tạo nên sự nam tính mạnh mẽ.', 'Chanel Allure Homme Sport Perfume EDT', 'Chanel Allure Homme Sport Perfume EDT', '2023-10-05 03:40:51', '2023-10-05 03:40:51', 1, NULL, 1),
(9, 1, 8, 0, 'Christian Dior Homme Intense Perfume EDP', 'christian-dior-homme-intense-perfume-edp', NULL, 3050000, 0, 'Christian Dior Homme Intense Perfume EDP.png', 0, '- Hương đầu: Hoa Oải Hương\r\n- Hương giữa: Hoa diên vĩ, Cây vông vang, Quả lê.\r\n- Hương cuối: Cỏ hương bài, Gỗ tuyết tùng Virginia.', 'Christian Dior Homme Intense Perfume EDP', 'Christian Dior Homme Intense Perfume EDP', '2023-10-05 03:48:23', '2023-10-05 03:48:23', 1, NULL, 1),
(10, 1, 8, 0, 'Christian Dior Homme Cologne Perfume EDT', 'christian-dior-homme-cologne-perfume-edt', NULL, 2700000, 0, 'Christian Dior Homme Cologne Perfume EDT.png', 0, 'Cam Bergamot, Hoa bưởi mở ra đồng thời, nó như tạo thành một khoảng hương bao trùm lấy người mặc, nó như tạo cho người mặc một cảm giác thoải mái mà ở xung quanh cũng cảm nhận được sự hiện đại, không phô trương.\r\nTheo như hãng thì những thành phần hương đều xuất xứ từ miền Bắc nước Ý và tính chất của nó là tạo ra hương thơm ngọt, mát lạnh, độc đáo và có tone mùi sáng hơn cho nhóm citrus. Bám toả khá ổn và blending cũng rất mượt. Dễ dùng - Self blindbuy.\r\n- Hương đầu: Cam Bergamot Calabria.\r\n- Hương giữa: Hoa Bưởi Ý.\r\n- Hương cuối: Xạ hương.', 'Christian Dior Homme Cologne Perfume EDT', 'Christian Dior Homme Cologne Perfume EDT', '2023-10-05 03:51:15', '2023-10-05 03:51:15', 1, NULL, 1),
(11, 1, 7, 0, 'Dolce & Gabbana The One Intense For Men', 'dolce-gabbana-the-one-intense-for-men', NULL, 2550000, 0, 'Dolce & Gabbana The One Intense For Men.png', 0, 'Thiết kế quen thuộc này được DG lấy ý tưởng từ hình ảnh của chai rượu Tây truyền thống, và khi được điểm tô lên màu đen tuyền, nó tượng trưng cho sự sang trọng và gợi cảm tinh tế. \r\nỞ cái chạm mũi đầu tiên, có lẽ những ấn tượng mùi về The One gần như thay đổi toàn bộ trong tôi, không nhẹ nhàng quyến rũ như The One EDP nữa! \r\nMạnh mẽ, sắc cạnh và già dặn hơn hẳn khi cảm nhận được vị cay nồng của Gỗ, Xô Thơm và Bách Xù. Tất nhiên Bạch Đậu Khấu vẫn rất mượt mà và thơm nồng nàn (đây là notes hương tôi yêu thích nhất) sau khi tầng hương chuyển dần sang cay ngọt của nhựa thơm Benzoin, Da thuộc, Cashmeran,...cảm giác như có chút mùi khói quyện cùng. \r\n- Hương đầu:hương hoa cam, cây bách, thảo quả\r\n- Hương giữa: gỗ, an tức hương\r\n- Hương cuối: Da thuộc, hoắc hương, hổ phách', 'Dolce & Gabbana The One Intense For Men', 'Dolce & Gabbana The One Intense For Men', '2023-10-05 03:55:05', '2023-10-05 03:55:05', 1, NULL, 1),
(12, 1, 7, 0, 'Dolce & Gabbana Light Blue Perfume', 'dolce-gabbana-light-blue-perfume', NULL, 2300000, 0, 'Dolce & Gabbana Light Blue Eau Intense Pour Homme EDP.png', 0, 'Light Blue của D&G bản Intense với khả năng lưu hương tốt, ngửi mùi vẫn cứ khiến người ta không thể ngừng say đắm! Một mùi hương không thể nào mà sai được, trong mọi hoàn cảnh và mọi khí hậu. Bởi lẽ, hương quá mát mẻ, sảng khoái, dễ chịu: cam chanh, soda ướp đá lạnh, táo xanh vỡ đôi. Bay bổng và nhẹ nhàng tưởng như không giới hạn, như hớp giọt sương thu trong veo vào lòng. Các tầng hương:\r\n- Hương đầu: cam Mandarin, bưởi.\r\n- Hương giữa: hương biển, cây bách xù.\r\n- Hương cuối: gỗ hổ phách, xạ hương.', 'Dolce & Gabbana Light Blue Eau Intense Pour Homme EDP', 'Dolce & Gabbana Light Blue Eau Intense Pour Homme EDP', '2023-10-05 03:56:54', '2023-10-05 11:16:15', 1, 1, 1),
(13, 1, 2, 0, 'Giorgio Armani Acqua di Gio Pour Homme', 'giorgio-armani-acqua-di-gio-pour-homme', NULL, 2150000, 0, 'Giorgio Armani Acqua di Gio Pour Homme EDT.png', 0, 'Acqua Di Gio Pour Homme For men là sự thể hiện rõ ràng nhất của nam tính ở mỗi người đàn ông. Được lấy cảm hứng từ những gì tinh túy nhất của biển khơi, ánh mặt trời, đất và gió từ miền biển Địa Trung Hải. \r\nKhi vừa xịt lên da, cơ thể như vườn hoa thơm ngát và quả chín mọng. Sau đó là sự hòa hợp hoàn hảo giữa mùi hương ngòn ngọt mằn mặn của nước biển và ánh nắng ấm áp mơn trớn trên làn da của bạn. Cuối cùng là một sự gợi cảm từ hương gỗ trầm lắng.\r\n- Hương đầu: quả cam; chanh vỏ cam; quả quýt; hoa nhài; cam bergamot; quả chanh; hoa cam\r\n- Hương giữa: hoa anh thảo; nhục đậu khấu; mộc tê; rau mùi; hoa Violet; lan Nam Phi; hương biển; quả đào; hoa dạ lan hương; hoa hồng; hoa nhài; cây hương thảo\r\n- Hương cuối: hổ phách; hoắc hương; địa y; tuyết tùng; xạ hương', 'Giorgio Armani Acqua di Gio Pour Homme EDT', 'Giorgio Armani Acqua di Gio Pour Homme EDT', '2023-10-05 03:58:27', '2023-10-05 11:07:18', 1, 1, 1),
(14, 1, 4, 0, 'Versace Pour Homme Perfume EDT', 'versace-pour-homme-perfume-edt', NULL, 1550000, 0, 'Versace Pour Homme Perfume EDT.png', 0, 'Được chiết xuất từ nguyên liệu thiên nhiên, nước hoa Versace Pour Homme Eau de Toilette có hương thơm nam tính, mạnh mẽ, quyến rũ. Versace Pour Homme Eau de Toilette sẽ giúp bạn trở nên tự tin, hấp dẫn hơn khi gặp gỡ bạn bè, hay tham gia vào những buổi tiệc quan trọng. Ngoài ra, với thiết kế vỏ ngoài đặc biệt, đơn giản nhưng không kém phần tinh tế và sang trọng với thiết kể cổ điển quen thuộc trong dung dịch màu xanh dịu nhẹ. Nổi bật nhất là chiếc nắp tròn mạ kim loại khắc tên thương hiệu xung quanh và biểu tượng nữ thần tóc rắn Medusa đặt phía trước thân chai sáng bóng.\r\n- Hương đầu: Quả chanh vàng, hoa cam Neroli, cam Bergamot, hoa hồng.\r\n- Hương giữa: Hoa lan dạ hương, cây đơn sâm, gỗ tuyết tùng, hoa phong lữ.\r\n- Hương cuối: Đậu Tonka, xạ hương, hổ phách.', 'Versace Pour Homme Perfume EDT', 'Versace Pour Homme Perfume EDT', '2023-10-05 04:00:13', '2023-10-05 04:00:13', 1, NULL, 1),
(15, 1, 9, 0, 'Guess Seductive Homme Perfume EDT', 'guess-seductive-homme-perfume-edt', NULL, 1000000, 0, 'Guess Seductive Homme Perfume EDT.png', 0, 'Guess Seductive Homme xây dựng mùi hương xung quanh mùi hoa lan, là trung tâm sự phát triển của mùi hương, do vậy, đây chính là điểm quan trọng đểm xem bạn có thích nó hay không, bởi mọi thứ xung quanh nó được liệt kê trong mùi hương này dường như đều đóng vai trò ở đó để tô điểm cho hoa lan. Khi mùi hương khô xuống, hổ phách cũng là một nhân tố quan trọng và đáng chú ý, nhưng nó cũng là một yếu tố kết hợp tốt với hoa lan. Nó cung cấp thêm vị ngọt ngào cho Guess Seductive Homme và một lớp đệm mềm mịn cho bông hoa nghỉ ngơi, nhưng vẫn khiến hoa lan trở thành trung tâm của sự chú ý. Hoa lan trong Guess Seductive Homme là một bông hoa tím hồng đậm sắc, phấn, thơm, một chút ngọt ngào theo kiểu thanh lịch, một chút hoa cỏ theo kiểu fougere nhưng cũng thêm một chút bụi bặm và gợi cảm.\r\n- Hương đầu: Tiêu hồng, Quả quýt, Bạch đậu khấu.\r\n- Hương giữa: Hoa lan, Lá Violet, cỏ hương bài.\r\n- Hương cuối: Hổ phách, Hoắc hương, Gỗ đàn hương, Xạ hương.', 'Guess Seductive Homme Perfume EDT', 'Guess Seductive Homme Perfume EDT', '2023-10-05 04:09:06', '2023-10-05 04:09:06', 1, NULL, 1),
(16, 1, 9, 0, 'Guess Seductive Blue For Men Perfume EDT', 'guess-seductive-blue-for-men-perfume-edt', NULL, 1000000, 0, 'Guess Seductive Blue For Men Perfume EDT.png', 0, 'Guess Seductive Homme Blue là một hương thơm tuyệt vời và nằm ở mức an toàn để sử dụng hàng ngày, đặc biệt nếu bạn làm việc với tất cả các loại môi trường và tiếp xúc với nhiều người. Bạn có thể mang nó trên người ở bất cứ môi trường nào từ văn phòng, cho đến phòng gym, hay đi dạo phố, ăn uống hẹn hò lãng mạn. Độ bám tỏa tốt cũng là một điểm cộng lớn của Guess Seductive Homme Blue.\r\nTin tôi đi, đó là một mùi hương sạch sẽ, mềm mại, mang đến sức sống để bắt đầu một ngày mới phấn khởi và tràn đầy năng lượng chỉ với một vài shot xịt.\r\n- Hương đầu: Trứng cá, Chi cam chanh, Bạch đậu khấu, Tiêu đen.\r\n- Hương giữa: Hoa phong lữ, Hương nước biển.\r\n- Hương cuối: Gỗ cây Cashmir, Rêu sồi Moss, Cát.', 'Guess Seductive Blue For Men Perfume EDT', 'Guess Seductive Blue For Men Perfume EDT', '2023-10-05 04:16:53', '2023-10-05 04:16:53', 1, NULL, 1),
(17, 1, 5, 0, 'Yves Saint Laurent L\'Homme Le Parfum', 'yves-saint-laurent-lhomme-le-parfum', NULL, 1950000, 0, 'Yves Saint Laurent L\'Homme Le Parfum.png', 0, 'Người được chọn còn phải có trong mình một chất “tình\", sự hào hoa phong lưu cố hữu như cách mà tông vị của Hoa phong lữ cùng Hoa tím chưng cất, quyến rũ nhưng cũng sẽ “hư hỏng” đến cùng tận cùng nếu được dùng lên đúng người. Cuối cùng, L\'Homme Le Parfum lựa chọn đối tượng cho nó cũng giống như cách ta lựa chọn người yêu, bỏ qua những tiêu chuẩn rườm rà thì cốt yếu vẫn phải yêu thương ta.\r\n- Hương đầu: Hương ozon, Bạch đậu khấu, Chanh vàng\r\n- Hương giữa: Hoa phong lữ, Hoa tím, Húng quế\r\n- Hương cuối: Nhựa cây, Tuyết tùng, Gỗ vetiver', 'Yves Saint Laurent L\'Homme Le Parfum', 'Yves Saint Laurent L\'Homme Le Parfum', '2023-10-05 04:19:47', '2023-10-05 04:19:47', 1, NULL, 1),
(18, 1, 5, 0, 'Yves Saint Laurent Y Le Parfum Perfume', 'yves-saint-laurent-y-le-parfum-perfume', NULL, 3700000, 0, 'Yves Saint Laurent Y Le Parfum Perfume.png', 0, 'Y Le Parfum một biến tấu mới trên nên hương thơm Y.S.L Y EDP kết hợp hương gỗ đậm của Phong lữ và Gỗ tuyết tùng với Hoa Oải hương. Đầy gợi cảm và say đắm, Y Le Parfum là phiên bản mãnh liệt và sâu lắng hơn so với Y(Thể hiện qua cả đường nét thiết kế và cả mùi hương nữa). Y.S.L Y Le Parfum khoác lên mình màu đen tuyền sang trọng, sáng bóng thể hiện sự khao khát tuyệt đối.\r\n- Hương Đầu: Bưởi, Táo, gừng, Andehit\r\n- Hương Giữa: cây Xô thơm, Oải hương, Phong lữ\r\n- Hương Cuối: đậu Tonka, Tuyết tùng, Olibanum, Tonka, Hoắc hương', 'Yves Saint Laurent Y Le Parfum Perfume', 'Yves Saint Laurent Y Le Parfum Perfume', '2023-10-05 04:22:00', '2023-10-05 04:22:00', 1, NULL, 1),
(19, 2, 6, 0, 'Chanel Coco Mademoiselle Female', 'chanel-coco-mademoiselle-female', NULL, 3800000, 0, 'Chanel Coco Mademoiselle Perfume EDP.png', 0, 'Ấn tượng đầu tiên thuộc về thiết kế. Coco Mademoiselle mang thiết kế cổ điển nhiều góc cạnh đã đi vào huyền thoại của nhà Chanel. Mạnh mẽ và cá tính, vỏ chai được làm bằng thủy tinh trong suốt, nhìn rõ màu sắc quyến rũ của chất nước hoa bên trong. Ngoại hình đầy sang trọng và tinh tế với những đường vát kim cương hoàn mỹ đến từng milimet.\r\nĐiểm đặc biệt khác của Chanel Coco Mademoiselle còn nằm ở những giá trị thông điệp mà nó truyền tải. Chanel Coco không dành cho những cô gái trẻ rụt rè nhút nhát. Nên biết rằng chai nước hoa được đặt tên theo người phụ nữ đã sáng lập ra đế chế Chanel, và bà cũng là người đầu tiên dùng tên chính mình đặt cho một mùi hương. Mặc dù đã mất hơn bốn thập kỷ, những cảm hứng về thời trang và ngành công nghiệp nước hoa của “Coco” vẫn mang một giá trị vĩnh hằng. Chanel Coco Mademoiselle còn hơn cả một mùi hương, đó là lời khẳng định mạnh mẽ về nữ quyền: “Tôi là phụ nữ và tôi tự tin để sống cuộc đời do chính mình lựa chọn.”', 'Chanel Coco Mademoiselle Perfume EDP', 'Chanel Coco Mademoiselle Perfume EDP', '2023-10-05 04:25:24', '2023-11-12 10:40:21', 1, 1, 1),
(20, 2, 4, 0, 'Versace Bright Crystal Perfume EDT', 'versace-bright-crystal-perfume-edt', NULL, 1600000, 0, 'Versace Bright Crystal Perfume EDT.png', 0, 'Hương thơm hoàn hảo từ lớp hương đầu tiên cho đến tận lớp hương cuối cùng, nó có thể biến người sử dụng trở thành nàng công chúa hoang dã trong rừng sâu cũng có thể biến bạn thành nữ hoàng trong những buổi dạ tiệc hoặc làm bạn trở thành cô gái xinh đẹp, quyến rũ, đầy lôi cuốn làm xao xuyến trái tim cánh mày râu từ những ánh nhìn đầu tiên.\r\nLớp hương đầu là hương quả lựu và hương yuzu. Lớp hương giữa là hương hoa mẫu đơn, hoa mộc lan được pha trộn với thành phần hương hoa sen làm tăng thêm sự ngọt ngào và tinh tế cho dòng nước hoa này. Lớp hương cuối khá sang trọng khi được kết hợp các thành phần hương chiết xuất từ xạ hương, thực vật, gỗ đỏ và hổ phách.\r\nTươi mới, dịu ngọt và uyển chuyển là hương thơm là Versace Bright Crystal mang đến.', 'Versace Bright Crystal Perfume EDT', 'Versace Bright Crystal Perfume EDT', '2023-10-05 04:27:11', '2023-10-05 04:27:11', 1, NULL, 1),
(21, 2, 7, 0, 'Dolce & Gabbana 3 L\'Imperatrice EDT', 'dolce-gabbana-3-limperatrice-edt', NULL, 1700000, 0, 'Dolce & Gabbana 3 L\'Imperatrice EDT.png', 0, 'Có thể còn khá mới với nhiều người, nhưng khách hàng thân thiết với Chietnuochoa hẳn đã quen mặt mùi hương này bởi lọ nước hoa nhỏ đã từng dành vị trí best seller khi chúng mình bắt đầu nhập về bán mùa hè năm ngoái. Lấy cảm hứng từ tên một trong bộ ba lá bài quyền lực nhất của Tarot - The Empress. L\' IMPERATRICE hay The Empress trong tiếng Anh mang ý nghĩa chỉ về Nữ Hoàng, về Người Mẹ, về tình cảm yêu thương, nhân hậu và tất cả những điều nữ tính nhất mà thế giới này mong đợi ở người phụ nữ. Mang mùi hương hoa quả ngọt ngào: kiwi xanh, dưa hấu đỏ cùng một chút vị ổi chín - D&G 3 như một ly cocktail tươi mát vào mỗi trưa hè, thích hợp để chúng ta sử dụng hằng ngày khi đi làm, khi dạo phố, khi tận hưởng những tháng ngày sôi động nhất của tuổi trẻ. Không cần đến một thiết kế cầu kì, thứ nước màu hồng nhạt trong chiếc lọ chữ nhật cổ điển của nhà D&G vẫn luôn có sức hấp dẫn của riêng mình', 'Dolce & Gabbana 3 L\'Imperatrice EDT', 'Dolce & Gabbana 3 L\'Imperatrice EDT', '2023-10-05 04:28:44', '2023-10-05 04:28:44', 1, NULL, 1),
(22, 2, 5, 0, 'Yves Saint Laurent Black Opium Perfume', 'yves-saint-laurent-black-opium-perfume', NULL, 3150000, 0, 'Yves Saint Laurent Black Opium Perfume EDP.png', 0, 'Là hương nước hoa mang phong vị của hoa cỏ cà phê đầu tiên của Yves Saint Laurent, Black Opium hoàn toàn nữ tính nhưng lại không kém phần nổi loạn. Không phải là những nàng thơ kiêu kì và duyên dáng thường thấy với vẻ ngoài lộng lẫy, hương thơm mang đến cảm giác của một cô gái trẻ nổi loạn với rock-chic và những đường kẻ eyeliner đậm màu: đầy hoang dại nhưng thú vị. Café và vani là hai nguyên liệu chính của mùi hương, kết hợp cùng một chút hoa cam và tiêu hồng ở lớp hương đầu rồi kết thúc với xạ hương cùng hoa nhài thoang thoảng. Hương thơm của Black Opium vì thế vừa ngọt ngào vừa dễ gây nghiện, nhất là với các cô nàng yêu sự cá tính năng động mà nó mang lại. Đó cũng chính là điểm đặc biệt nhất của Black Opium: thoát khỏi cấu trúc thường thấy của nước hoa nữ cổ điển, hướng đến thị hiếu phụ nữ hiện đại và trẻ trung hơn trong phong cách.', 'Yves Saint Laurent Black Opium Perfume EDP', 'Yves Saint Laurent Black Opium Perfume EDP', '2023-10-05 04:30:36', '2023-10-05 11:15:21', 1, 1, 1),
(23, 2, 5, 0, 'Yves Saint Laurent Libre Perfume EDP', 'yves-saint-laurent-libre-perfume-edp', NULL, 4000000, 0, 'Yves Saint Laurent Libre Perfume EDP.png', 0, 'Libre EDP  mở đầu với sự bùng nổ từ cam Mandarin, lý chua đen và tinh dầu lá cam, thành phần hương lavender xuất hiện để tô thêm nét mềm mại cho vị tươi mát từ cam chanh. Hoa nhài ở hương giữa tạo nên vẻ đẹp tinh tế, có thể khiến người khác mê mẩn hàng giờ, khi đi cùng với hương lavender thanh lịch. Vì mang phong cách Phương Đông nên nốt cuối của Libre không thể thiếu các thành phần xạ hương, vanilla, tuyết tùng mang đến hương vị nồng nàn, ấm áp và giúp cô nàng Libre EDP trở nên ngọt ngào và quyến rũ hơn, nhưng vẫn giữ được độ thanh lịch và tươi mới khi Note hương cam vẫn hiện hữu. Sự sang trọng, gợi cảm và cá tính là điều hãng Yves Saint Laurent muốn gửi gắm đến cô nàng kiêu kỳ này.  \r\n\r\nLibre EDP thể hiện hình ảnh của người phụ nữ đương đại: mạnh mẽ, chân thực và tự do. Mùi hương hòa quyện giữa hương thơm của hoa cam, hoa nhài, tinh dầu hoa oải hương đặc trưng của Pháp, xạ hương và mùi kem vani gợi cảm.', 'Yves Saint Laurent Libre Perfume EDP', 'Yves Saint Laurent Libre Perfume EDP', '2023-10-05 04:32:18', '2023-10-05 04:32:18', 1, NULL, 1),
(24, 2, 6, 0, 'Chanel Chance Eau Tendre Perfume EDP', 'chanel-chance-eau-tendre-perfume-edp', NULL, 4850000, 0, 'Chanel Chance Eau Tendre Perfume EDP.png', 0, 'Cơ hội đến rồi đi, không bao giờ dừng lại... bạn chỉ có vài giây để nắm bắt cơ hội của mình. Cơ hội khó đoán và chỉ xuất hiện khi bạn ít mong đợi nhất, nhưng nếu bạn quyết tâm, bất cứ điều gì cũng có thể trở thành hiện thực.\r\n\"Khi cơ hội xuất hiện, tôi đã nắm bắt nó.\" Mademoiselle Chanel biết rằng cơ hội luôn hiện hữu, trong những sáng tạo của mình, cũng như trong tâm hồn và trong phong cách sống.\r\n\r\nMùi hương tinh tế đan xen giữa hương bưởi và mộc qua với tinh chất hoa nhài và hoa hồng dịu nhẹ. Hiện có sẵn với các dung tích khác nhau phù hợp cho dùng tại nhà hay mang theo bên mình dù bất cứ đâu.\r\n- Hương Đầu: Quả bưởi, Quả mộc qua\r\n- Hương giữa: Hoa nhài, Hoa hồng\r\n- Hương cuối: Xạ hương trắng', 'Chanel Chance Eau Tendre Perfume EDP', 'Chanel Chance Eau Tendre Perfume EDP', '2023-10-05 04:34:28', '2023-10-05 04:34:28', 1, NULL, 1),
(25, 2, 8, 0, 'Christian Dior Joy Intense Perfume EDP', 'christian-dior-joy-intense-perfume-edp', NULL, 3100000, 0, 'Christian Dior Joy Intense Perfume EDP.png', 0, 'Vẫn là hương thơm thanh khiết đến từ những cánh hồng xứ Grasse truyền thống, kết hợp với hoa nhài và hương cam chanh mang dư vị ngọt ngào đầy tươi trẻ. Gỗ đàn hương thơm nồng đặc trưng là lựa chọn chủ đạo và ngự trị tại lớp hương giữa góp phần tăng độ quyến rũ. Cuối cùng, xạ hương trắng hoàn thiện toàn bộ hỗn hợp nước hoa. Một mùi hương trong trẻo và ngọt ngào, không nồng nàn mà lan tỏa như một lời thì thầm e ấp. \r\n- Hương đầu: cam Bergamot, cam Mandarin\r\n- Hương giữa: hoa hồng, hoa nhài\r\n- Hương cuối: Gỗ đàn hương, xạ hương, hoắc hương, gỗ tuyết tùng', 'Christian Dior Joy Intense Perfume EDP', 'Christian Dior Joy Intense Perfume EDP', '2023-10-05 04:36:40', '2023-10-05 04:36:40', 1, NULL, 1),
(26, 2, 2, 0, 'Giorgio Armani My Way Intense Perfume', 'giorgio-armani-my-way-intense-perfume', NULL, 3100000, 0, 'Giorgio Armani My Way Intense Perfume EDP.png', 0, 'Hương thơm của Giorgio Armani My Way Intense là sự kết hợp nhuần nhuyễn bởi hỗn hợp cam đắng và hoa cam tinh khiết mở ra sự tươi mát, thôi thúc khứu giác của bạn. Tầng hương giữa được chiết xuất từ hoa huệ và hoa nhài Ấn tạo nên ấn tượng đặc biệt, thanh tao và đầy quyến luyến. Mùi hương hấp dẫn càng trở nên lôi cuốn khi càng về sau, lớp hương cuối với hỗn hợp nồng nàn của vani ngọt ngào cùng đàn hương gợi cảm. Tất cả như quả bomb năng lượng thể hiện sự mạnh mẽ đằng sau một mùi hương ngọt ngào, nữ tính. Nước hoa Giorgio Arnani My Way Intense là hương thơm dành tặng cho những cô gái cá tính, hiện đại, đầy đam mê với sắc màu cuộc sống.\r\n- Hương đầu: Cam bergamot, hoa cam\r\n\r\n- Hương giữa: Hoa huệ, hoa nhài Ấn Độ\r\n\r\n- Hương cuối: Gỗ đàn hương, hương vani Madagascar', 'Giorgio Armani My Way Intense Perfume EDP', 'Giorgio Armani My Way Intense Perfume EDP', '2023-10-05 04:38:06', '2023-10-05 11:11:58', 1, 1, 1),
(27, 2, 7, 0, 'Dolce & Gabbana Q Signature Perfume', 'dolce-gabbana-q-signature-perfume', NULL, 3400000, 0, 'Dolce & Gabbana Q Signature Perfume EDP.png', 0, 'Mang khuynh hướng là một chai nước hoa có vibe mùi fruity dành cho nữ, D&G Q EDP thể hiện nét căng mọng, sảng khoái ngay từ những nốt hương đầu với chanh Sicilian và cam máu, kèm thêm một chút trong trẻo của hoa nhài, mang đến cảm giác tràn đầy năng lượng tích cực cho một ngày mới năng động.\r\n\r\nSau khi mùi cam chanh dịu đi thì đó là lúc mùi quả anh đào thể hiện được khả năng chinh phục khứu giác người ngửi của nó. Với vị chua thanh, ngọt lành, kết hợp cùng hương thơm đặc trưng của hoa vòi voi, giúp tăng thêm nét quyến rũ thuần khiết và tự tin cho người phụ nữ hiện đại.\r\n\r\nChút nồng nàn khi drydown đến từ xạ hương, gỗ tuyết tùng điểm tô thêm cho chai nước hoa này một sự cuốn hút và êm ái đến lạ thường, đồng thời trung hòa lại sự tương phản ở tầng hương đầu và giữa, từ đó làm đọng lại chút gần gũi cùng những ấn tượng tốt đẹp.', 'Dolce & Gabbana Q Signature Perfume EDP', 'Dolce & Gabbana Q Signature Perfume EDP', '2023-10-05 04:42:00', '2023-10-05 11:11:48', 1, 1, 1),
(28, 2, 5, 0, 'Yves Saint Laurent Libre Le Parfum', 'yves-saint-laurent-libre-le-parfum', NULL, 3300000, 0, 'Yves Saint Laurent Libre Le Parfum Perfume EDP.png', 0, 'Libre Le Parfum tựa như một cái ôm ân cần khiến cảm xúc của bạn được vỗ về trong làn hương của Hoa Oải hương sâu lắng và sắc sảo, nhẹ nhàng cảm nhận từng cái chạm thật mềm mại và ái ân bằng hương hoa cam bay bổng tạo ra một sự hấp dẫn, đầy nắng. Kết thúc với hương cuối là mùi kem của Madagascan Vanilla, Ambergris và Cedarwood, hỗn hợp hương mô phỏng sự tinh tế thể hiện cái tôi người phụ nữ đương đại: mạnh mẽ, chân thực và tự do.\r\n- Hương đầu: Hương thơm của nghệ tây, gừng, quýt và cam bergamot từ Calabria.\r\n- Hương Giữa: hoa cam từ Maroc, tinh chất hoa oải hương và lavandin từ Pháp.\r\n- Hương Cuối: Vanilla Bourbon từ Madagascar, mật ong và cỏ vetiver', 'Yves Saint Laurent Libre Le Parfum Perfume EDP', 'Yves Saint Laurent Libre Le Parfum Perfume EDP', '2023-10-05 04:45:10', '2023-10-05 11:11:16', 1, 1, 1),
(29, 2, 11, 0, 'Narciso Rodriguez Narciso Rouge', 'narciso-rodriguez-narciso-rouge', NULL, 2550000, 0, 'Narciso Rodriguez Narciso Rouge Perfume EDP.png', 0, 'Thành phần gây nghiện gồm hoa hồng Bulgari mang đến cảm giác ngọt ngào, tinh tế ở nốt hương đầu đầy thiêng liêng. Ở nốt hương giữa và cuối, một hỗn hợp quyến rũ gồm cỏ vertiver thơm ngon, tuyết tùng đen và tuyết tùng trắng, đậu tonka và hổ phách tạo nên hợp âm hoàn chỉnh cho bản nhạc du dương của Rouge. Narciso Rouge màu đỏ phiên bản 2018 chính là sự lựa chọn tuyệt vời hội tụ đủ các yếu tố đẹp từ mùi hương đến khiến kế. Narciso Rouge chắc chắn khiến bạn ngẩn ngơ vì bị mê hoặc!', 'Narciso Rodriguez Narciso Rouge Perfume EDP', 'Narciso Rodriguez Narciso Rouge Perfume EDP', '2023-10-05 05:28:30', '2023-10-05 11:10:55', 1, 1, 1),
(30, 2, 11, 0, 'Narciso Rodriguez For Her Perfume EDP', 'narciso-rodriguez-for-her-perfume-edp', NULL, 2790000, 0, 'Narciso Rodriguez For Her Perfume EDP.png', 0, 'Không dành cho các cô gái trẻ còn ngây thơ trong sáng, xạ hương của Narciso thấm đẫm vị ái tình, là hương thơm trên da người phụ nữ từng trải và hoang dại. Thoang thoảng hoa hồng kết hợp cùng vị đào xen lẫn, những note hương đầu tiên như vẫn còn e ấp phấn son. Nhưng khi mùi đào qua đi rồi, những gì còn lại trên da chỉ là hoa hồng thơm ngát và xạ hương quyến rũ. Được xử lý rất khéo nên xạ hương của Narciso EDP không gây cho người đối diện cảm giác ngột ngạt, đó là mùi xạ hương được quện chặt vào da và thơm như chính mùi da thịt vậy, nhưng tinh tế và nữ tính hơn rất nhiều. Do đó, lọ nước hoa nhiều lần được bình chọn là mùi hương thích hợp nhất để dùng khi đi hẹn hò. Còn gì bằng một buổi tối se lạnh, bôi một chút Narciso ở cổ tay và trao nhau những lời yêu thương mật ngọt. Hương hoa hồng xen lẫn xạ hương dịu dàng mà vẫn quyến rũ như dư vị của một nụ hôn', 'Narciso Rodriguez For Her Perfume EDP', 'Narciso Rodriguez For Her Perfume EDP', '2023-10-05 05:30:11', '2023-10-05 05:30:11', 1, NULL, 1),
(31, 2, 11, 0, 'Narciso Rodriguez Musc Noir Perfume', 'narciso-rodriguez-musc-noir-perfume', NULL, 2690000, 0, 'Narciso Rodriguez Musc Noir Perfume EDP.png', 0, 'Mùi hương được phát triển có phần đầm tính hơn và say hơn nhấn mạnh “bản chất bí ẩn của sự gợi cảm nữ tính”. Musc Noir như thể phác thảo hình ảnh của một người phụ nữ \"khó nắm bắt\" có điều gì đó bí ẩn, dao động giữa sự vô hình và bóng tối. Giống như một con mèo đang ẩn nấp, mùi hương dường như xuất hiện và biến mất ... Khi bạn gần như quên mất sự hiện diện của nó, bạn lại tìm thấy dấu vết của nó. Không nghi ngờ gì nữa, điều này được thực hiện có chủ đích, để làm chúng ta ngạc nhiên và tình cờ cuốn chúng ta vào chiếc lưới phủ đầy mùi hương. Hương thơm gợi lên một sự gợi cảm tinh tế với những bước đi nhẹ nhàng, có sức mạnh gây nhầm lẫn mà không gây áp lực.\r\n- Hương đầu: Mận\r\n- Hương giữa: Hoa Heliotrope, Xạ Hương\r\n- Hương cuối: Da lộn', 'Narciso Rodriguez Musc Noir Perfume EDP', 'Narciso Rodriguez Musc Noir Perfume EDP', '2023-10-05 05:35:18', '2023-10-05 11:14:48', 1, 1, 1),
(39, 4, 6, 0, 'Chanel Jersey Les Exclusifs De Chanel', 'chanel-jersey-les-exclusifs-de-chanel', NULL, 4900000, 0, 'Chanel Jersey Les Exclusifs De Chanel EDT.png', 0, 'Mùi hương mở đầu ngào ngạt và khá nhẹ nhàng của Jersey có được nhờ vào nốt hương hoa oải hương, vốn dĩ là nốt hương chính yếu của chai nước hoa. Thương hiệu Chanel đã sáng lọc kỹ lưỡng loại hoa oải hương mà họ cho vào nước hoa, kết quả là họ đã dùng chiết xuất hoa oải hương giản dị, tươi mát và có phần kỳ ảo, lấy được từ cách chưng cất bằng hơi nóng khô để không không làm mất hay biến chất hương thơm. Mùi hương của Jersey thực sự rất khó để có thể phân loại vào một nhóm hương nhất định, và ngoài ra, nước hoa còn sử dụng một số nốt hương hoa cỏ khác, cùng với các nốt hương phương Đông.\r\nHương chính: Hoa Oải Hương, Xạ hương, Hương Va ni (Vanille), Hoa dại, Cỏ, Hoa hồng, Hoa nhài, Đậu Tonka', 'Chanel Jersey Les Exclusifs De Chanel EDT', 'Chanel Jersey Les Exclusifs De Chanel EDT', '2023-10-06 00:31:56', '2023-10-06 00:47:21', 1, 1, 1),
(40, 4, 3, 0, 'Hermes Jardin A Cythere EDT Perfume', 'hermes-jardin-a-cythere-edt-perfume', NULL, 2690000, 0, 'Hermes Jardin A Cythere EDT Perfume.png', 0, 'Được sáng tạo bởi chuyên gia nước hoa Christine Nagel của Hermès, Un Jardin à Cythère là một tạo tác mới mang mùi thơm của cỏ, gỗ cây olive và hạt dẻ cười. Hương nước hoa khơi gợi ký ức về những khu vườn hoang sơ trên hòn đảo Kythira, Hy Lạp, nơi mặt trời mùa hè chiếu rọi quanh năm, nơi gió hát trong những bụi cỏ cao và cây cối, nơi thổi bừng lên khát vọng về hạnh phúc và tự do.\r\n\r\nNhững mảnh ghép tạo nên mùi hương Un Jardin à Cythère\r\nUn Jardin à Cythère được tạo nên từ 5 mảnh ghép khác nhau. Qua từng khung cảnh, mùi hương, ký ức, bạn sẽ được du hành vào một vùng đất đầy nắng, gió, ánh sáng của mùa Hè Hy Lạp.', 'Hermes Jardin A Cythere EDT', 'Hermes Jardin A Cythere EDT', '2023-10-06 00:34:10', '2023-10-06 00:34:10', 1, NULL, 1),
(41, 4, 12, 0, 'Louis Vuitton LV California Dream', 'louis-vuitton-lv-california-dream', NULL, 9900000, 0, 'Louis Vuitton LV California Dream 200ml.png', 0, 'Ý tưởng tổng thể: Một sự ấm áp bao trùm lấy sự mát lạnh, tương phản tạo nên bởi sự phối trộn giữa những nốt hương mạnh mẽ đầy cảm xúc và nốt hương nhẹ nhàng. Cảm nhận được sự chơi đùa của cái đối lập trên làn da.\r\n- Tinh chất quýt chứa đựng nhiều tầng lớp giống như bầu trời nhiều màu của hoàng hôn.\r\n- Tinh chất chanh là niềm vui ngọt ngào không thể che giấu mỗi khi hè đến.\r\n- Xạ hương kéo dài cảm giác ấm áp. Ambrette làm bật lên hương đất ẩm và quả lê mùa hè. Đó là niềm hạnh phúc trong lời tiễn biệt ánh sáng cuối ngày, cũng là niềm hân hoan chờ đợi những điều thú vị sắp tới của màn đêm. Khi màn đêm buông xuống, đôi vai mềm như được ôm ấp cùng benzoin duyên dáng và hương vani, nhẹ nhàng như lời chào của mùa hạ.', 'Louis Vuitton LV California Dream', 'Louis Vuitton LV California Dream', '2023-10-06 00:42:12', '2023-10-06 07:35:18', 1, 1, 1),
(42, 4, 12, 0, 'Louis Vuitton Spell On You EDP 200ml', 'louis-vuitton-spell-on-you-edp-200ml', NULL, 9500000, 0, 'Louis Vuitton Spell On You EDP 200ml.png', 0, 'Louis Vuitton Spell On You mang đến những cung bậc cảm xúc từ nhẹ nhàng đến mãnh liệt. Để bắt đầu làn hương xanh ngát, tươi mới đầy mơn mơn làm khoảng không gian xung quanh dễ chịu. Hòa quyện trong đó là hương thơm ngọt ngào, dịu nhẹ và đầy mát mẻ của những bông hoa Violet. Nốt hương hoa diên vĩ mang sự tinh khôi, trong trẻo trải dài kết nối nốt hương đầu với nốt hương trái tim. Để rồi sự nữ tính, duyên dáng của hoa hồng phủ đầy kết hợp cùng nốt hương ngọt ngào, tinh khiết đến từ những bông hoa nhài. Càng về cuối chuỗi hương càng trở nên mãnh liệt, nồng cháy hơn. Hương đào chín mọng, thơm ngon mời gọi xạ hương trắng quyến rũ cùng nhảy múa. Tô điểm thêm hương hoa Acacia cho phong vị thêm thơm mát, ngọt ngào bền lâu.\r\n- Hương đầu: Hoa diên vĩ, Hương xanh, Hoa Violet\r\n- Hương giữa: Hoa diên vĩ, Hoa hồng, Hoa nhài\r\n- Hương cuối: Xạ hương trắng, Trái đào, Hoa keo', 'Louis Vuitton Spell On You EDP', 'Louis Vuitton Spell On You EDP', '2023-10-06 00:44:50', '2023-10-06 09:24:29', 1, 1, 1),
(44, 2, 11, 0, 'Narciso Rodriguez For Her Forever EDP', 'narciso-rodriguez-for-her-forever-edp', NULL, 3350000, 0, 'Narciso Rodriguez For Her Forever EDP.png', 0, 'Kế thừa nốt hương đầy lôi cuốn từ hoa Chi Mộc Tê, Hoắc Hương và Xạ Hương của dòng for her eau de toilette kinh điển, for her forever làm mới mình bằng tầng hương rạng rỡ đầy mê hoặc từ nhóm hoa trắng với sự hòa quyện của nốt hương hoa Sứ trắng, hoa Dành Dành xen lẫn với hương thơm gợi cảm từ hoa Huệ Tây.\r\n- Nốt hương đầu: nốt hoa Sứ Trắng, hoa Dành Dành\r\n- Nốt hương giữa: nốt hoa Lài, hoa Huệ Tây, hoa Chi Mộc Tê\r\n- Nốt hương cuối: Hoắc Hương và Xạ Hương\r\n“for her forever là món quà dành tặng cho những nàng thơ của narciso rodriguez – đó là hương thơm tựa một đóa hoa tinh tế, mềm mại được sưởi ấm bởi những tia nắng, kèm theo đó là những rung động nhẹ nhàng như những ngày đầu tiên” – nhà sáng tạo hương Sonia Constant\r\n\r\nfor her forever tạo ra sự kết hợp giữa hai tông màu đen bí ẩn mang tính biểu tượng của for her và hồng tinh tế biểu trưng cho sự đổi mới đầy rực rỡ.', 'Narciso Rodriguez For Her Forever EDP', 'Narciso Rodriguez For Her Forever EDP', '2023-11-12 10:03:41', '2023-11-12 10:03:41', 1, NULL, 1),
(45, 1, 11, 0, 'Narciso Rodriguez Bleu Noir For Him', 'narciso-rodriguez-bleu-noir-for-him', NULL, 2300000, 0, 'Narciso Rodriguez Bleu Noir For Him Parfum.png', 0, 'Narciso Bleu Noir Parfum là một sáng tạo mới cho một người đàn ông xác định sự độc đáo của riêng mình, bí ẩn và táo bạo tôn vinh sự gợi cảm nam tính và thể hiện thế của sự quyến rũ. \r\n\r\nTrong hương thơm mới này, da lộn được tăng cường bởi sự gợi cảm của hoa diên vĩ và được làm ngọt bởi hiệu ứng gây nghiện của tonka. Bleu Noir Parfum là hiện thân của một hương thơm ấm áp, phương Đông và hoàn toàn gây nghiện.\r\nVề mặt thiết kế, bleu noir mang tính biểu tượng lần đầu tiên được giới thiệu mà không có lớp sơn mài bên trong, để lộ màu xanh lam thanh lịch với lớp sơn mài mờ bên ngoài màu đen. Nắp màu xanh nước biển mờ mang đến cho chai nét gợi cảm cuối cùng.\r\nBleu Noir Parfum là một chất nghiện mới cho người đàn ông có ý thức thời trang, muốn có một mùi thơm hấp dẫn mọi người.\r\n- Hương đầu: Lá bách, Bạch đậu khấu, Cam Bergamot, Quả quýt.\r\n- Hương giữa: Diên vĩ, Xạ hương, Da lộn.\r\n- Hương cuối: Đậu Tonka, Gỗ đàn hương, Da thuộc, Cỏ hương bài, Gỗ tuyết tùng.', 'Narciso Rodriguez Bleu Noir For Him Parfum', 'Narciso Rodriguez Bleu Noir For Him Parfum', '2023-11-12 10:07:22', '2023-11-12 10:07:53', 1, 1, 1),
(46, 2, 11, 0, 'Narciso Rodriguez Narciso Pure Musc', 'narciso-rodriguez-narciso-pure-musc', NULL, 2690000, 0, 'Narciso Rodriguez Narciso Pure Musc EDP.png', 0, 'Nước hoa Narciso Rodriguez PURE MUSC For Her EDP là dòng nước hoa mới nhất của thương hiệu nổi tiếng thế giới Narciso Rodriguez, ra mắt năm 2019. Với thành phần hương chính là mùi xạ hương và hoa, mùi hương này lấy cảm hứng từ vẻ đẹp thuần khiết của người mẫu Julia Bergshoeff.\r\nNarciso Rodriguez PURE MUSC For Her EDP được tạo ra bởi nhà điều chế Sonia Constant tượng trưng cho một loại nước hoa tinh khiết, thanh tao và mềm mại. Vẫn giữ nguyên thiết kế chai thủy tinh mờ đơn giản nhưng sang trọng, cùng tông màu đen trắng toát lên vẻ đẹp kiêu kỳ, Narciso Rodriguez PURE MUSC For Her EDP trở nên nổi bật và đáng nhớ nhất khi đứng cạnh các dòng nước hoa For Her của hãng.\r\nVới nốt hương chính là mùi xạ hương mãnh liệt, sản phẩm khuấy động hương sắc mùa hè bằng những nốt hương trầm ấm áp pha trộn với hương hổ phách, hoa hồng, hương gỗ cashmeran thanh lịch và nồng cháy chắc chắn sẽ “đốn gục” trái tim bất cứ cô nàng nào thử qua.', 'Narciso Rodriguez Narciso Pure Musc EDP', 'Narciso Rodriguez Narciso Pure Musc EDP', '2023-11-12 10:09:17', '2023-11-12 10:09:59', 1, 1, 1),
(47, 2, 8, 0, 'Christian Dior Miss Dior Perfume EDP', 'christian-dior-miss-dior-perfume-edp', NULL, 3350000, 0, 'Christian Dior Miss Dior Perfume EDP.png', 0, 'Miss Dior 2021 cho cả ngày dài của nàng tràn đầy cảm hứng của hạnh phúc và tiếng cười. Hương hoa linh lan thung lũng mang hương thơm ngọt ngào lay động cảm xúc nàng ngay từ những phút đầu tiên. Trong đó còn lộ ra sự tinh khôi của hoa diên vĩ kết hợp cùng nét tươi trẻ, nhẹ nhàng của hoa mẫu đơn. Nối tiếp sự nữ tính không thể thiếu đi hương hoa hồng duyên dáng kì diệu. Trái đào và trái mơ căng mọng, tỏa hương dịu nhẹ cho nốt hương thêm tự nhiên. Gỗ đàn hương cùng đậu tonka ngọt ngào, ấm áp thơm mùi gỗ mới. Hương thơm này bao bọc lấy Vanilla mềm mịn và xạ hương cho nốt hương thêm gợi cảm, quyến rũ.\r\n\r\nNâng cấp và phát triển, Miss Dior càng ngày càng tiếp cận với nhiều đối tượng hơn. Miss Dior EDP 2021 dành cho những cô gái trưởng thành, biết yếu bản thân nhiều hơn. Miss Dior 2021 nổi trội giữa thế giới nước hoa với hàng ngàn hương thơm mang phong cách khác nhau. Kết hợp cùng làn da mịn màng của nàng hương thơm sẽ gây thương nhớ cho bất kì ai chạm phải mùi hương này.', 'Christian Dior Miss Dior EDP', 'Christian Dior Miss Dior EDP', '2023-11-12 10:11:11', '2023-11-12 10:11:11', 1, NULL, 1),
(48, 2, 8, 0, 'Christian Dior Jadore EDT', 'christian-dior-jadore-edt', NULL, 2950000, 0, 'Christian Dior Jadore EDT.png', 0, 'Dior J’adore EDT được “khai sinh” bởi Francois Demachy, nhà chế tác nước hoa đại tài của Dior. Sản phẩm “nước thơm” xa xỉ này đi theo phong cách pha trộn giữa hiện đại và cổ điển. Gây ấn tượng với sự tao nhã, quyến rũ đầy tươi mới, nước hoa nữ này được coi như biểu tượng cho nét đẹp thời thượng.\r\n\r\nChạm vào khứu giác những nốt hương đầu tiên khi xịt Dior J’adore là tinh dầu cam tươi mới, tràn trề sức sống. Hòa quyện vào đó là hương quả mọng, rồi hoa cam. Khởi đầu là dậy lên những nốt hương trái cây chứa đựng trong từng giọt nước hoa thì hương giữa lại là xếp chồng từng mùi hương hoa dịu ngọt. Khóa trọn mọi con tim với “bản hòa ca” của hoa nhài, hoa cam Nam Phi, hoa ngọc lan tây, hoa huệ rồi hoa hồng. Sau khoảng 3 giờ, hương giữa nhường chỗ cho sự ấm áp, sang trọng đầy quyến rũ của gỗ và vani.', 'Christian Dior Jadore EDT', 'Christian Dior Jadore EDT', '2023-11-12 10:12:44', '2023-11-12 10:12:44', 1, NULL, 1),
(49, 1, 1, 0, 'Salvatore Ferragamo Uomo Perfume EDT', 'salvatore-ferragamo-uomo-perfume-edt', NULL, 1450000, 0, 'Salvatore Ferragamo Uomo Perfume EDT.png', 0, 'Với tầng hương giữa như bắt đầu ve vuốt, ru tôi vào dòng suy nghĩ lan man bởi sự ngọt ngào khó mà chối từ với Hương kẹo và Ambroxan, đan xen tông hương của Hoa cam, mát mẻ và dễ chịu như những sớm ngày hè. Tuy nhận thức rõ sự hồi ức nào cũng phải trở về hiện thực, thế nhưng Uomo Salvatore Ferragamo đã biết cách dẫn dắt khứu giác đến cuối hành trình thật tinh tế và đầy thấu cảm với vẻ ấm đượm của Đậu tonka và vỗ về của Đàn hương.\r\n\r\nĐôi khi tôi ghét việc yêu thích duy một mùi hương nào, vì điều đó sẽ khiến bản thân mình trở nên kém đa dạng hơn hẳn. Nhưng sau lần này, có lẽ Uomo Salvatore Ferragamo sẽ là một lựa chọn rất ngoại lệ.\r\n\r\n- Hương đầu: Bạch đậu khấu, Tiêu đen, Cam bergamot\r\n- Hương giữa: Hương kẹo, Ambroxan, Hoa cam\r\n- Hương cuối: Đậu tonka, Đàn hương, Len cashmere', 'Salvatore Ferragamo Uomo EDT', 'Salvatore Ferragamo Uomo EDT', '2023-11-12 10:16:13', '2023-11-12 10:16:13', 1, NULL, 1),
(50, 2, 1, 0, 'Salvatore Ferragamo Signorina Misteriosa', 'salvatore-ferragamo-signorina-misteriosa', NULL, 1300000, 0, 'Salvatore Ferragamo Signorina Misteriosa.png', 0, 'Hương thơm mở đầu với lớp hương trái cây đầy tươi mới từ quả mâm xôi hoang dã và tinh dầu hoa cam. Nhưng bất chớt bị thay thế bởi lớp là hương hoa thơm ngát điệu đà của hoa cam và hoa huệ hòa quyện cùng với nốt hương cuối ấm áp của hoắc hương, và ngọt ngào từ mousse vani. Tổng thể đã tạo nên một mùi hương thơm bất ngờ và phong cách.\r\n\r\nMisteriosa là một mùi hương táo bạo, lôi cuốn thích hợp cho những cô nàng muốn phá vỡ mọi quy tắc của cuộc sống. Signorina Misteriosa phù hợp khi sử dụng ban đêm, tiết trời se lạnh, để cảm giác ngọt ngào từ quả mâm xôi, vani đen, hoa cam sẽ mang đến sự ấm áp cho người dùng. Dòng sản phẩm mới không hổ danh là một tác phẩm hoàn hảo quyến rũ từ thiết kế nổi bật, sang trọng đến mùi hương thu hút, lôi cuốn.', 'Salvatore Ferragamo Signorina Misteriosa', 'Salvatore Ferragamo Signorina Misteriosa', '2023-11-12 10:18:36', '2023-11-12 10:18:36', 1, NULL, 1),
(51, 2, 9, 0, 'Guess Seductive Noir For Women EDT', 'guess-seductive-noir-for-women-edt', NULL, 1000000, 0, 'Guess Seductive Noir For Women EDT.png', 0, 'Mẫu nước hoa quyến rũ này được kết hợp bởi các loại thảo dược, hoa và phấn tạo mùi thơm tinh tế và làm bạn trở nên nổi bật bất kỳ trang phục ban ngày nào. Hương đầu là hoa mẫu đơn, cam bergamot và cây xô thơm giới thiệu mùi hương với năng lượng nhẹ nhàng, tươi mới và hoàn toàn. Hương giữa với hoa nhài Sambac, lily và iris càng làm tăng thêm sự quyến rũ, tạo sự phong phú trong khứu giác nhưng cũng mang đến sự tinh tế nhất định. Cuối cùng, các nốt hương cơ bản của cỏ vetiver Haiti, vani và nhung hoàn thành bố cục với sự thanh lịch mềm mại của chúng cho một mùi hương sang trọng và rất gợi cảm mà bạn có thể tự hào khi khoe với người đặc biệt nào đó.\r\n- Hương đầu: Hoa mẫu đơn, cam bergamot, cây xô thơm\r\n- Hương giữa: Hoa nhài Sambac, hoa Lily và hoa Iris\r\n- Hương cuối: Vetiver Haiti, vani và nhung', 'Guess Seductive Noir Women EDT', 'Guess Seductive Noir Women EDT', '2023-11-12 10:20:39', '2023-11-12 10:23:49', 1, 1, 1),
(52, 1, 9, 0, 'Guess Seductive Noir For Men Perfume', 'guess-seductive-noir-for-men-perfume', NULL, 1200000, 0, 'Guess Seductive Noir For Men Perfume.png', 0, 'Lớp hương đầu tiên được hình thành bởi hỗn hợp cay nồng của tiêu đen, nhục đậu khấu hòa chung với nguồn năng lượng tràn trề của bưởi mang đến cho người sử dụng cả một không gian mát mẻ, phấn khích. Hương thơm khiến cả ngũ quan choàng tỉnh giấc để khởi động cho một ngày làm việc thật hứng khởi. Trái với tầng hương thứ nhất, lớp giữa lại tiếp cận làn da một cách thật cẩn trọng, nhẹ nhàng của oải hương, thanh mát của hoa cam và mọng nước của quả táo. Mùi hương yêu thật ấn tượng và khác biệt, chúng biến cả không gian xung quanh như xích lại gần nhau hơn, cuốn hút đầy si mê. Để rồi khi đó lại gieo vào lòng nhau cả một nỗi nhớ của sự dịu êm, ngọt ngào của đậu tonka, hổ phách sang trọng và mềm mượt của đàn hương. Một sự kết thúc thật ấm áp, thoang thoảng lan tỏa trong không khí, làm chàng thật tự tin khi thể hiện bản thân mình trước mọi người.\r\n\r\n- Hương đầu: Tiêu đen, bưởi Pomelo, nhục đậu khấu\r\n\r\n- Hương giữa: Oải hương, hoa cam, quả táo \r\n\r\n- Hương cuối: Đậu Tonka, hổ phách, gỗ đàn hương', 'Guess Seductive Noir For Men EDT', 'Guess Seductive Noir For Men EDT', '2023-11-12 10:21:56', '2023-11-12 10:23:39', 1, 1, 1),
(53, 2, 3, 0, 'Hermes Terre d’Hermes Parfum Pure', 'hermes-terre-dhermes-parfum-pure', NULL, 2650000, 0, 'Hermes Terre d’Hermes Parfum Pure.png', 0, 'Hỗn hợp bưởi và cam đã chiếm thiện cảm của đối phương bởi sự mộc mạc và giản dị nhưng không kém sự tươi mới, thanh thoát. Mang theo sự ấm áp, trầm tích không đơn giản được “ưu ái” chiếm vị thế độc tôn tại midnote. Trầm tích như một viên ngọc sáng với những quyền lực và năng lượng riêng để “một mình một cõi” thể hiện những nét chấm phá của mình.\r\nCuối hành trình, sự nhẹ nhàng của một khu rừng nguyên sinh được đánh bật, hương rêu sồi trở nên một linh hồn với tinh thần khẳng khái, thư thái kết hợp cùng hương gỗ và benzoin không khiến những trái tim rung động khi vô tình “giáp mặt”.\r\n- Hương đầu: bưởi, cam\r\n- Hương giữa: Trầm tích\r\n- Hương cuối: Hương gỗ, Rêu sồi, Benzoin', 'Hermes Terre d’Hermes Parfum Pure Perfume', 'Hermes Terre d’Hermes Parfum Pure Perfume', '2023-11-12 10:26:11', '2023-11-12 10:26:11', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_productsale`
--

CREATE TABLE `cdtt_productsale` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `pricesale` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `date_begin` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cdtt_productsale`
--

INSERT INTO `cdtt_productsale` (`id`, `product_id`, `pricesale`, `qty`, `trash`, `date_begin`, `date_end`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 50, 1190000, 8, 0, '2023-11-16 04:30:06', '2023-11-16 04:30:06', '2023-11-12 10:34:37', '2023-11-15 21:30:06', 1, 1),
(2, 4, 1450000, 9, 0, '2023-11-16 04:29:59', '2023-11-16 04:29:59', '2023-11-12 10:35:43', '2023-11-15 21:29:59', 1, 1),
(3, 18, 3550000, 21, 0, '2023-11-16 04:29:51', '2023-11-16 04:29:51', '2023-11-12 10:36:37', '2023-11-15 21:29:51', 1, 1),
(4, 22, 2950000, 22, 0, '2023-11-16 04:29:41', '2023-11-16 04:29:41', '2023-11-12 10:37:07', '2023-11-15 21:29:41', 1, 1),
(5, 24, 4300000, 11, 0, '2023-11-16 04:29:30', '2023-11-16 04:29:30', '2023-11-12 10:38:03', '2023-11-15 21:29:30', 1, 1),
(6, 11, 2300000, 6, 0, '2023-11-16 04:29:20', '2023-11-16 04:29:20', '2023-11-12 10:38:39', '2023-11-15 21:29:20', 1, 1),
(7, 47, 3000000, 14, 0, '2023-11-16 04:29:12', '2023-11-16 04:29:12', '2023-11-12 10:42:05', '2023-11-15 21:29:12', 1, 1),
(8, 30, 2500000, 13, 0, '2023-11-16 04:29:02', '2023-11-16 04:29:02', '2023-11-12 10:42:57', '2023-11-15 21:29:02', 1, 1),
(9, 41, 9000000, 3, 0, '2023-11-16 04:28:48', '2023-11-16 04:28:48', '2023-11-12 10:43:41', '2023-11-15 21:28:48', 1, 1),
(10, 42, 8900000, 3, 0, '2023-11-16 04:28:41', '2023-11-16 04:28:41', '2023-11-12 10:44:06', '2023-11-15 21:28:41', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_productstore`
--

CREATE TABLE `cdtt_productstore` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_slider`
--

CREATE TABLE `cdtt_slider` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `position` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(1000) NOT NULL,
  `sort_order` int(10) DEFAULT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_slider`
--

INSERT INTO `cdtt_slider` (`id`, `name`, `link`, `position`, `description`, `image`, `sort_order`, `trash`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(3, 'Slider 1', 'Slider 1', 'slidershow', NULL, 'Slider 1.png', NULL, 0, '2023-11-14 09:12:20', '2023-11-14 09:13:58', 1, 1, 1),
(4, 'Slider 2', 'Slider 2', 'slidershow', NULL, 'Slider 2.jpg', NULL, 0, '2023-11-14 09:14:51', '2023-11-14 09:15:22', 1, 1, 1),
(5, 'Slider 3', 'Slider 3', 'slidershow', NULL, 'Slider 3.png', NULL, 0, '2023-11-14 09:15:42', '2023-11-14 09:15:42', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_topic`
--

CREATE TABLE `cdtt_topic` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `trash` int(11) NOT NULL DEFAULT 0,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_topic`
--

INSERT INTO `cdtt_topic` (`id`, `name`, `slug`, `sort_order`, `description`, `parent_id`, `trash`, `metakey`, `metadesc`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 'Kiến thức Nước hoa', 'kien-thuc-nuoc-hoa', NULL, NULL, 0, 0, 'Kiến thức Nước hoa', 'Kiến thức Nước hoa', '2023-10-05 01:17:42', '2023-10-05 01:17:42', 1, NULL, 1),
(2, 'Review Nước hoa', 'review-nuoc-hoa', NULL, NULL, 0, 0, 'Review Nước hoa', 'Review Nước hoa', '2023-10-05 01:18:09', '2023-10-05 01:18:09', 1, NULL, 1),
(4, 'Nước hoa được ưa chuộng', 'nuoc-hoa-duoc-ua-chuong', NULL, NULL, 0, 0, 'Nước hoa được ưa chuộng', 'Nước hoa được ưa chuộng', '2023-10-05 01:19:43', '2023-10-05 01:19:43', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdtt_users`
--

CREATE TABLE `cdtt_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdtt_users`
--

INSERT INTO `cdtt_users` (`id`, `name`, `email`, `phone`, `username`, `password`, `gender`, `roles`, `address`, `image`, `trash`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(3, 'Li Jin Yin', 'lijinyin@gmail.com', '123456789', 'liyin', '$2y$10$1LuTn1cEXFtnodn1X3dWneIYMV1GhvQY6tNYHWIjvWvlSx/NO2i0G', 'Nữ', 'User', 'TPHCM', 'Li Jin Yin.jpg', 0, '2023-11-15 11:56:38', '2023-11-15 11:56:38', 1, NULL, 1),
(4, 'Yang Yang', 'yangyang@gmail.com', '123456789', 'yangyang', '$2y$10$SgWuA/nu1nb3E4wlCv1J.udyQj3p11uTSkb5VYqkjXw52H2qmbINS', 'Nam', 'User', 'HN', 'Yang Yang.jpg', 0, '2023-11-15 11:57:47', '2023-11-15 12:00:12', 1, 1, 1),
(5, 'Xiao Xiao', 'xiaoxiao@gmail.com', '123456789', 'xiaoxiao', '$2y$10$mrU0YnL/bDu3p8C47JjHyuzUevaRV8asmSmhLv4DzOwExCqFVXaRC', 'Nữ', 'User', 'VT', 'Xiao Xiao.jpg', 0, '2023-11-15 11:59:03', '2023-11-15 11:59:03', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_10_04_164154_create_brand_table', 1),
(4, '2023_10_04_164626_create_category_table', 1),
(5, '2023_10_04_164632_create_contact_table', 1),
(6, '2023_10_04_164655_create_menu_table', 1),
(7, '2023_10_04_164702_create_order_table', 1),
(8, '2023_10_04_164707_create_orderdetail_table', 1),
(9, '2023_10_04_164712_create_product_table', 1),
(10, '2023_10_04_164719_create_post_table', 1),
(11, '2023_10_04_164724_create_slider_table', 1),
(12, '2023_10_04_164728_create_topic_table', 1),
(13, '2023_10_04_165331_create_policy_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdtt_brand`
--
ALTER TABLE `cdtt_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_category`
--
ALTER TABLE `cdtt_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_config`
--
ALTER TABLE `cdtt_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_contact`
--
ALTER TABLE `cdtt_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_menu`
--
ALTER TABLE `cdtt_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_order`
--
ALTER TABLE `cdtt_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_orderdetail`
--
ALTER TABLE `cdtt_orderdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_policy`
--
ALTER TABLE `cdtt_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_post`
--
ALTER TABLE `cdtt_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_product`
--
ALTER TABLE `cdtt_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_productsale`
--
ALTER TABLE `cdtt_productsale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_productstore`
--
ALTER TABLE `cdtt_productstore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_slider`
--
ALTER TABLE `cdtt_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_topic`
--
ALTER TABLE `cdtt_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdtt_users`
--
ALTER TABLE `cdtt_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cdtt_brand`
--
ALTER TABLE `cdtt_brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cdtt_category`
--
ALTER TABLE `cdtt_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cdtt_contact`
--
ALTER TABLE `cdtt_contact`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cdtt_menu`
--
ALTER TABLE `cdtt_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cdtt_order`
--
ALTER TABLE `cdtt_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cdtt_orderdetail`
--
ALTER TABLE `cdtt_orderdetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cdtt_policy`
--
ALTER TABLE `cdtt_policy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cdtt_post`
--
ALTER TABLE `cdtt_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cdtt_product`
--
ALTER TABLE `cdtt_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `cdtt_productsale`
--
ALTER TABLE `cdtt_productsale`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cdtt_slider`
--
ALTER TABLE `cdtt_slider`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cdtt_topic`
--
ALTER TABLE `cdtt_topic`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cdtt_users`
--
ALTER TABLE `cdtt_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
