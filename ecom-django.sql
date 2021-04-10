-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 10, 2021 lúc 09:18 AM
-- Phiên bản máy phục vụ: 10.3.25-MariaDB-0ubuntu0.20.04.1
-- Phiên bản PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecom-django`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add comment', 7, 'add_comment'),
(26, 'Can change comment', 7, 'change_comment'),
(27, 'Can delete comment', 7, 'delete_comment'),
(28, 'Can view comment', 7, 'view_comment'),
(29, 'Can add image', 8, 'add_image'),
(30, 'Can change image', 8, 'change_image'),
(31, 'Can delete image', 8, 'delete_image'),
(32, 'Can view image', 8, 'view_image'),
(33, 'Can add cart', 9, 'add_cart'),
(34, 'Can change cart', 9, 'change_cart'),
(35, 'Can delete cart', 9, 'delete_cart'),
(36, 'Can view cart', 9, 'view_cart'),
(37, 'Can add product', 10, 'add_product'),
(38, 'Can change product', 10, 'change_product'),
(39, 'Can delete product', 10, 'delete_product'),
(40, 'Can view product', 10, 'view_product'),
(41, 'Can add shipping unit', 11, 'add_shippingunit'),
(42, 'Can change shipping unit', 11, 'change_shippingunit'),
(43, 'Can delete shipping unit', 11, 'delete_shippingunit'),
(44, 'Can view shipping unit', 11, 'view_shippingunit'),
(45, 'Can add product cart', 12, 'add_productcart'),
(46, 'Can change product cart', 12, 'change_productcart'),
(47, 'Can delete product cart', 12, 'delete_productcart'),
(48, 'Can view product cart', 12, 'view_productcart'),
(49, 'Can add payment', 13, 'add_payment'),
(50, 'Can change payment', 13, 'change_payment'),
(51, 'Can delete payment', 13, 'delete_payment'),
(52, 'Can view payment', 13, 'view_payment'),
(53, 'Can add order', 14, 'add_order'),
(54, 'Can change order', 14, 'change_order'),
(55, 'Can delete order', 14, 'delete_order'),
(56, 'Can view order', 14, 'view_order'),
(57, 'Can add cart detail', 12, 'add_cartdetail'),
(58, 'Can change cart detail', 12, 'change_cartdetail'),
(59, 'Can delete cart detail', 12, 'delete_cartdetail'),
(60, 'Can view cart detail', 12, 'view_cartdetail');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$GiHKCziP92vq$k8zdj98KfAVDyUknNgFIFfT2X6yDbdbyyWaMKc1g8iQ=', '2021-04-10 02:15:37.893074', 0, 'admin', 'Nguyễn', 'Hạnh', 'nguyenduchanh99tnvn@gmail.com', 0, 1, '2021-03-18 16:09:52.839708');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'register', 'comment'),
(8, 'register', 'image'),
(6, 'sessions', 'session'),
(9, 'store', 'cart'),
(12, 'store', 'cartdetail'),
(14, 'store', 'order'),
(13, 'store', 'payment'),
(10, 'store', 'product'),
(11, 'store', 'shippingunit');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-03-18 16:08:33.302924'),
(2, 'auth', '0001_initial', '2021-03-18 16:08:33.395722'),
(3, 'admin', '0001_initial', '2021-03-18 16:08:33.642936'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-03-18 16:08:33.710218'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-03-18 16:08:33.717798'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-03-18 16:08:33.776298'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-03-18 16:08:33.813711'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-03-18 16:08:33.827745'),
(9, 'auth', '0004_alter_user_username_opts', '2021-03-18 16:08:33.834890'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-03-18 16:08:33.866850'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-03-18 16:08:33.871445'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-03-18 16:08:33.883708'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-03-18 16:08:33.922990'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-03-18 16:08:33.960737'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-03-18 16:08:33.970697'),
(16, 'auth', '0011_update_proxy_permissions', '2021-03-18 16:08:33.980022'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-03-18 16:08:34.012764'),
(18, 'register', '0001_initial', '2021-03-18 16:08:34.183271'),
(19, 'register', '0002_auto_20210318_0950', '2021-03-18 16:08:34.710569'),
(20, 'sessions', '0001_initial', '2021-03-18 16:08:34.724332'),
(21, 'store', '0001_initial', '2021-03-18 16:08:34.876433'),
(22, 'register', '0003_auto_20210318_1615', '2021-03-18 16:15:40.101594'),
(23, 'store', '0002_auto_20210318_1650', '2021-03-18 16:50:57.366575'),
(24, 'store', '0003_auto_20210402_0200', '2021-04-02 02:00:55.295041'),
(25, 'store', '0004_auto_20210402_0209', '2021-04-02 02:09:38.600281'),
(26, 'store', '0005_remove_cart_is_current_cart', '2021-04-02 02:14:32.048631'),
(27, 'store', '0006_auto_20210402_0216', '2021-04-02 02:16:45.857903'),
(28, 'store', '0007_auto_20210402_0251', '2021-04-02 02:51:36.042836');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2oj8nfr4gtd9jeia1fyfrd1gpzua090b', '.eJxVjEEOwiAQRe_C2pAi0Cku3fcMZJgBqRpISrsy3l1JutDtf-_9l_C4b9nvLa5-YXERSpx-t4D0iKUDvmO5VUm1bOsSZFfkQZucK8fn9XD_DjK2_K2RFZBNeiDNYC04HGlErScDANyRsSY6lUKY4hnRGTRMPCRLqFxQ4v0B6UE4Zw:1lV39t:YLHYGxDyK9ITrP2Me_SoMlSro2ereS4L4TXflAxQq2Q', '2021-04-24 02:15:37.900089'),
('drogf4a3wuhksss8lglxg2tj8e2w9pri', '.eJxVjEEOwiAQRe_C2pAi0Cku3fcMZJgBqRpISrsy3l1JutDtf-_9l_C4b9nvLa5-YXERSpx-t4D0iKUDvmO5VUm1bOsSZFfkQZucK8fn9XD_DjK2_K2RFZBNeiDNYC04HGlErScDANyRsSY6lUKY4hnRGTRMPCRLqFxQ4v0B6UE4Zw:1lS9uZ:4zLnkl_U3Ltofhy4Dx7tt5XYMsBy_8Nr3TztEo3XwiI', '2021-04-16 02:51:51.971231'),
('x651bp33p9bjpx3ilo99d8p42j0e4fxt', '.eJxVjEEOwiAQRe_C2pAi0Cku3fcMZJgBqRpISrsy3l1JutDtf-_9l_C4b9nvLa5-YXERSpx-t4D0iKUDvmO5VUm1bOsSZFfkQZucK8fn9XD_DjK2_K2RFZBNeiDNYC04HGlErScDANyRsSY6lUKY4hnRGTRMPCRLqFxQ4v0B6UE4Zw:1lNRAt:4TYj4w14grxd6-XJSvpxbe9oLil7bT48lIhXwkp1zW0', '2021-04-03 02:17:11.883152');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `register_comment`
--

CREATE TABLE `register_comment` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `created_time` time(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `register_image`
--

CREATE TABLE `register_image` (
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `register_image`
--

INSERT INTO `register_image` (`id`, `img_url`) VALUES
(1, '/static/images/watch.jpg'),
(2, '/static/images/shirt.jpg'),
(3, '/static/images/shoes.jpg'),
(4, '/static/images/book.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `store_cart`
--

CREATE TABLE `store_cart` (
  `id` int(11) NOT NULL,
  `created_time` time(6) NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `store_cart`
--

INSERT INTO `store_cart` (`id`, `created_time`, `complete`, `transaction_id`, `user_id`) VALUES
(1, '16:09:55.167769', 1, NULL, 1),
(2, '00:56:48.600418', 1, NULL, 1),
(3, '00:56:54.579173', 1, NULL, 1),
(4, '00:57:05.389690', 1, NULL, 1),
(5, '00:59:49.832174', 1, NULL, 1),
(6, '06:27:25.615539', 1, NULL, 1),
(7, '06:31:30.270662', 1, NULL, 1),
(8, '02:17:05.015075', 1, NULL, 1),
(9, '02:06:19.263687', 1, NULL, 1),
(10, '02:06:29.825385', 1, NULL, 1),
(11, '02:06:43.920499', 1, NULL, 1),
(12, '02:07:45.774596', 1, NULL, 1),
(13, '02:09:16.603429', 1, NULL, 1),
(14, '02:09:48.836398', 1, NULL, 1),
(15, '02:09:51.487046', 0, NULL, 1),
(16, '02:09:55.167743', 1, NULL, 1),
(17, '02:13:58.663148', 0, NULL, 1),
(18, '02:13:59.736909', 1, NULL, 1),
(19, '02:16:22.986132', 1, NULL, 1),
(20, '02:46:22.405482', 1, NULL, NULL),
(21, '02:46:27.140338', 1, NULL, NULL),
(22, '02:48:56.679055', 1, NULL, NULL),
(23, '02:52:02.485102', 1, NULL, 1),
(24, '03:03:33.943354', 1, NULL, 1),
(25, '03:18:48.778244', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `store_cartdetail`
--

CREATE TABLE `store_cartdetail` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `store_cartdetail`
--

INSERT INTO `store_cartdetail` (`id`, `quantity`, `price`, `cart_id`, `product_id`) VALUES
(1, 6, 10000, 1, 1),
(2, 2, 10000, 1, 2),
(3, 2, 10000, 3, 2),
(4, 2, 10000, 3, 3),
(5, 2, 10000, 4, 1),
(6, 2, 10000, 4, 3),
(7, 2, 10000, 4, 4),
(8, 2, 10000, 5, 3),
(9, 2, 10000, 5, 2),
(10, 2, 10000, 6, 1),
(11, 3, 10000, 7, 2),
(12, 2, 10000, 7, 1),
(13, 2, 10000, 7, 3),
(14, 2, 10000, 8, 1),
(15, 6, 10000, 8, 3),
(16, 2, 10000, 8, 2),
(17, 2, 10000, 9, 2),
(18, 2, 10000, 9, 3),
(19, 2, 10000, 10, 2),
(20, 2, 10000, 11, 3),
(21, 2, 10000, 11, 2),
(22, 2, 10000, 12, 2),
(23, 2, 10000, 16, 2),
(24, 2, 10000, 16, 3),
(25, 2, 10000, 16, 1),
(26, 2, 10000, 18, 2),
(27, 2, 10000, 18, 3),
(28, 2, 10000, 18, 4),
(29, 2, 10000, 18, 1),
(30, 1, 10000, 19, 1),
(31, 1, 10000, 19, 2),
(32, 1, 10000, 19, 3),
(33, 0, 10000, 20, 2),
(34, 0, 10000, 20, 3),
(35, 0, 10000, 21, 2),
(36, 0, 10000, 21, 3),
(37, 0, 10000, 22, 2),
(38, 0, 10000, 22, 3),
(39, 1, 10000, 23, 3),
(40, 1, 10000, 23, 2),
(41, 1, 10000, 25, 2),
(42, 1, 10000, 25, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `store_order`
--

CREATE TABLE `store_order` (
  `id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `order_time` time(6) NOT NULL,
  `confirm_time` time(6) DEFAULT NULL,
  `payment_time` time(6) DEFAULT NULL,
  `delivery_time` time(6) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `shipping_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `store_order`
--

INSERT INTO `store_order` (`id`, `status`, `order_time`, `confirm_time`, `payment_time`, `delivery_time`, `cart_id`, `comment_id`, `shipping_unit_id`) VALUES
(1, 1, '02:46:22.422177', NULL, NULL, NULL, 20, NULL, NULL),
(2, 1, '02:46:27.156563', NULL, NULL, NULL, 21, NULL, NULL),
(3, 1, '02:48:56.693165', NULL, NULL, NULL, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `store_payment`
--

CREATE TABLE `store_payment` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `store_product`
--

CREATE TABLE `store_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `source` varchar(255) NOT NULL,
  `information` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `store_product`
--

INSERT INTO `store_product` (`id`, `name`, `price`, `source`, `information`, `amount`, `image_id`) VALUES
(1, 'Sách', 10000, 'Kim Đồng', 'Sách rất hay', 200, 4),
(2, 'Giày Thể thao', 900000, 'Giày thượng đình', 'Giày đeo bao phê', 200, 3),
(3, 'Áo Phông họa tiết đẹp', 200000, 'Áo Baby', 'abcdef', 1000, 2),
(4, 'Đồng hồ nam', 200000, 'Casio', 'abcdfeasd', 1000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `store_shippingunit`
--

CREATE TABLE `store_shippingunit` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `store_shippingunit`
--

INSERT INTO `store_shippingunit` (`id`, `name`, `price`) VALUES
(1, 'Grab', 200000),
(2, 'Now', 200000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `register_comment`
--
ALTER TABLE `register_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `register_comment_user_id_20d504a4_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `register_image`
--
ALTER TABLE `register_image`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `store_cart`
--
ALTER TABLE `store_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_cart_user_id_99e99107_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `store_cartdetail`
--
ALTER TABLE `store_cartdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_productcart_cart_id_251318fc_fk_store_cart_id` (`cart_id`),
  ADD KEY `store_productcart_product_id_26fb3efe_fk_store_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `store_order`
--
ALTER TABLE `store_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_order_cart_id_3150a667_fk_store_cart_id` (`cart_id`),
  ADD KEY `store_order_comment_id_e54b4c0a_fk_register_comment_id` (`comment_id`),
  ADD KEY `store_order_shipping_unit_id_5ddde640_fk_store_shippingunit_id` (`shipping_unit_id`);

--
-- Chỉ mục cho bảng `store_payment`
--
ALTER TABLE `store_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_payment_user_id_5edbc869_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `store_product`
--
ALTER TABLE `store_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_image_id_4005d444_fk_register_image_id` (`image_id`);

--
-- Chỉ mục cho bảng `store_shippingunit`
--
ALTER TABLE `store_shippingunit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `register_comment`
--
ALTER TABLE `register_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `register_image`
--
ALTER TABLE `register_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `store_cart`
--
ALTER TABLE `store_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `store_cartdetail`
--
ALTER TABLE `store_cartdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `store_order`
--
ALTER TABLE `store_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `store_payment`
--
ALTER TABLE `store_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `store_product`
--
ALTER TABLE `store_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `store_shippingunit`
--
ALTER TABLE `store_shippingunit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `register_comment`
--
ALTER TABLE `register_comment`
  ADD CONSTRAINT `register_comment_user_id_20d504a4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `store_cart`
--
ALTER TABLE `store_cart`
  ADD CONSTRAINT `store_cart_user_id_99e99107_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `store_cartdetail`
--
ALTER TABLE `store_cartdetail`
  ADD CONSTRAINT `store_productcart_cart_id_251318fc_fk_store_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `store_cart` (`id`),
  ADD CONSTRAINT `store_productcart_product_id_26fb3efe_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`);

--
-- Các ràng buộc cho bảng `store_order`
--
ALTER TABLE `store_order`
  ADD CONSTRAINT `store_order_cart_id_3150a667_fk_store_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `store_cart` (`id`),
  ADD CONSTRAINT `store_order_comment_id_e54b4c0a_fk_register_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `register_comment` (`id`),
  ADD CONSTRAINT `store_order_shipping_unit_id_5ddde640_fk_store_shippingunit_id` FOREIGN KEY (`shipping_unit_id`) REFERENCES `store_shippingunit` (`id`);

--
-- Các ràng buộc cho bảng `store_payment`
--
ALTER TABLE `store_payment`
  ADD CONSTRAINT `store_payment_user_id_5edbc869_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `store_product`
--
ALTER TABLE `store_product`
  ADD CONSTRAINT `store_product_image_id_4005d444_fk_register_image_id` FOREIGN KEY (`image_id`) REFERENCES `register_image` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
