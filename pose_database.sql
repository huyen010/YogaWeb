-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 04, 2022 lúc 09:09 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `pose_database`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id` bigint(20) NOT NULL,
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
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add pose', 8, 'add_pose'),
(30, 'Can change pose', 8, 'change_pose'),
(31, 'Can delete pose', 8, 'delete_pose'),
(32, 'Can view pose', 8, 'view_pose'),
(33, 'Can add pose_history', 9, 'add_pose_history'),
(34, 'Can change pose_history', 9, 'change_pose_history'),
(35, 'Can delete pose_history', 9, 'delete_pose_history'),
(36, 'Can view pose_history', 9, 'view_pose_history'),
(37, 'Can add site', 10, 'add_site'),
(38, 'Can change site', 10, 'change_site'),
(39, 'Can delete site', 10, 'delete_site'),
(40, 'Can view site', 10, 'view_site'),
(41, 'Can add email address', 11, 'add_emailaddress'),
(42, 'Can change email address', 11, 'change_emailaddress'),
(43, 'Can delete email address', 11, 'delete_emailaddress'),
(44, 'Can view email address', 11, 'view_emailaddress'),
(45, 'Can add email confirmation', 12, 'add_emailconfirmation'),
(46, 'Can change email confirmation', 12, 'change_emailconfirmation'),
(47, 'Can delete email confirmation', 12, 'delete_emailconfirmation'),
(48, 'Can view email confirmation', 12, 'view_emailconfirmation'),
(49, 'Can add social account', 13, 'add_socialaccount'),
(50, 'Can change social account', 13, 'change_socialaccount'),
(51, 'Can delete social account', 13, 'delete_socialaccount'),
(52, 'Can view social account', 13, 'view_socialaccount'),
(53, 'Can add social application', 14, 'add_socialapp'),
(54, 'Can change social application', 14, 'change_socialapp'),
(55, 'Can delete social application', 14, 'delete_socialapp'),
(56, 'Can view social application', 14, 'view_socialapp'),
(57, 'Can add social application token', 15, 'add_socialtoken'),
(58, 'Can change social application token', 15, 'change_socialtoken'),
(59, 'Can delete social application token', 15, 'delete_socialtoken'),
(60, 'Can view social application token', 15, 'view_socialtoken'),
(61, 'Can add list pose user', 16, 'add_listposeuser'),
(62, 'Can change list pose user', 16, 'change_listposeuser'),
(63, 'Can delete list pose user', 16, 'delete_listposeuser'),
(64, 'Can view list pose user', 16, 'view_listposeuser');

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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_pose`
--

CREATE TABLE `course_pose` (
  `idPose` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `times` int(11) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `image3` varchar(100) NOT NULL,
  `image4` varchar(100) NOT NULL,
  `image5` varchar(100) NOT NULL,
  `image6` varchar(100) NOT NULL,
  `image7` varchar(100) NOT NULL,
  `image8` varchar(100) NOT NULL,
  `image9` varchar(100) NOT NULL,
  `image10` varchar(100) NOT NULL,
  `advantage` longtext NOT NULL,
  `excepts` longtext NOT NULL,
  `exercise` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `course_pose`
--

INSERT INTO `course_pose` (`idPose`, `name`, `times`, `image1`, `image2`, `image3`, `image4`, `image5`, `image6`, `image7`, `image8`, `image9`, `image10`, `advantage`, `excepts`, `exercise`) VALUES
(1, 'plank', 3, 'images/2_5Fjm3Il.jpg', 'images/2_kBRXnt7.jpg', 'images/2_yrs0qTT.jpg', 'images/2_yzk3ZQQ.jpg', 'images/2_E7yeQQK.jpg', 'images/2_jzIzwyh.jpg', 'images/2_oFK8csT.jpg', 'images/2_gPJxrm2.jpg', 'images/2_uAup7pC.jpg', 'images/2_2R8zrzE.jpg', 'Giúp phần bụng săn chắc hơn\r\ngiảm nguy cơ chấn thương lưng và cột sống\r\nThúc đẩy quá trình chuyển hóa\r\nCải thiện đáng kể tư thế của mình\r\nCải thiện sự cân bằng tổng thể\r\nGiúp bạn linh hoạt hơn bao giờ hết', 'Người bị đau lưng và đau xương khớp', 'Chuẩn bị một tấm thảm yoga.\r\nĐể đầu giữ thẳng, nhìn về phía trước.\r\nHạ thấp người, hai tay chống xuống sàn, cố định ở khuỷu tay, tạo thành một góc 90 độ, cánh tay thẳng với vai.\r\nTừ vai, hông, lưng đến chân tạo thành đường thẳng.\r\nÉp chặt cơ bụng.\r\nMông siết chặt.'),
(2, 'downdog', 3, 'images/downdog.jpg', 'images/00000118.jpg', 'images/00000128.jpg', 'images/00000129_o9Z7a6v.jpg', 'images/00000137.jpg', 'images/00000138_70cAyZA.jpg', 'images/00000140_IQEK7GU.jpg', 'images/00000150.jpg', 'images/00000160.jpg', 'images/00000170.jpg', 'Downdog có tác dụng tăng cường sức mạnh cho xương và cải thiện mật độ xương, là chìa khoá để ngăn ngừa bệnh loãng xương. Đặc biệt là, động tác này còn giúp tăng sức mạnh khớp xương ở cổ tay và mắt cá chân.\r\nDowndog là một trong những tư thế rất tốt cho việc tăng cường và săn chắc vùng bụng. Bên cạnh đó, những động tác liên quan đến cơ bụng còn có tác dụng tích cực lên cơ quan tiêu hoá, giúp cải thiện khả năng tiêu hoá thức ăn của cơ thể.\r\nDowndog là tư thế đảo ngược từ đầu cho đến trái tim. Động tác này giúp cải thiện dòng máu đi khắp cơ thể và đưa máu lên não. Sự lưu thông máu được cải thiện sẽ giúp thải độc tố, tăng cường khả năng miễn dịch và điều hoà huyết áp.', 'Lưng dễ bị gù khu vực gần thắt lưng\r\nCột sống không thẳng\r\nVai bị rút gần về lỗ tai', 'Bước 1: Bắt đầu với tư thế bò trên tấm thảm (lòng bàn tay, đầu gối và các ngón chân phải chạm thảm).\r\n\r\nBước 2: Dồn lực vào phía trong của 2 lòng bàn tay.\r\n\r\nBước 3: Hít sâu, nâng đầu gối lên khỏi mặt đất, gót chân không được chạm mặt đất. Đẩy người lên từ từ, nâng cao hông và mông lên.\r\n\r\nBước 4: Thở ra, đè phần ngực xuống sàn, cố gắng duỗi thẳng sống lưng, giữ thẳng phần tay sa cho từ mông đến cổ tay xếp thành một đường thẳng.\r\n\r\nBước 5: Từ từ duỗi thẳng phần chân.\r\n\r\nBước 6: Giữ tư thế này trong vòng 1 phút ( hoặc thay phiên khụy gối với phương phấp: 1 bên khụy 1 bên thẳng trong vòng 1 phút).\r\n\r\nBước 7: Kết thúc động tác, từ từ quay trở lại vị trí ban đầu theo thứ tự ngược.'),
(3, 'bitilasana', 2, 'images/biti.jpg', 'images/26.jpg', 'images/28.jpg', 'images/33.jpg', 'images/34.jpg', 'images/41.jpg', 'images/53-0.png', 'images/59.jpg', 'images/65.jpg', 'images/The-cow-pose.jpg', 'Tư thế này giúp kéo căng cổ và phần trước của thân.\r\nGiảm căng thẳng.\r\n Xoa bóp các cơ quan nội tạng, lưu thông máu huyết.\r\n Động tác chủ yếu là chuỗi chuyển động của cột sống vì vậy nó làm giảm căng thẳng từ lưng và làm cho nó săn chắc hơn. Đồng thời giúp giảm đau lưng và chữa đau dây thần kinh tọa.', 'Nếu bạn có một chiếc cổ nhạy cảm, đừng nên gập gáy quá nhiều khi ngước cổ lên, tránh sự căng thẳng . Ngoài ra hãy đảm bảo rằng vai của bạn luôn cách xa vai.\r\nTham khảo ý kiến của bác sĩ khi thực hiện động tác này nếu bạn là người bị chấn thương ở cổ. Và điều tốt nhất là bạn nên tập yoga dưới sự giám sát của chuyên gia.\r\nLưu ý nếu bạn là người bị huyết áp thấp , đau nửa , viêm cột sống , viêm khớp  và cổ tay nên cân nhắc khi thực hiện động tác này.\r\nThực hiện tư thế sau bữa ăn từ 4 đến 5 tiếng để đảm bảo không ảnh hưởng đến dạ dày , đồng thời để cơ thể chúng ta có đủ năng lượng để hoạt động.', 'Bước 1: Bắt đầu tư thế bằng việc hai tay và hai chân của bạn đặt ở vị trí mặt sàn\r\nBước 2: Đầu gối ngang hông; đảm bảo cổ tay, khuỷu tay và vai nằm trên một đường thẳng và vuông góc với mặt sàn.\r\nBước 3: Đầu ở vị trí tự nhiên, thoải mái và nhẹ nhàng nhìn sàn nhà.\r\nBước 4: Hít vào và nâng mông lên hướng trần nhà khi bạn mở ngực, để bụng hóp xuống đất, ngẩng đầu và nhìn về phía trước hoặc có thể hướng về phía mái nhà.\r\nBước 5: Giữ nguyên tư thế một vài giây sau đó thở ra và trở về vị trí ban đầu\r\nBước 6: Có thể kết hợp chuyển sang tư thế Con Mèo\r\nLặp lại động tác từ 5-6 lần'),
(4, 'dandasana', 7, 'images/danda.jpg', 'images/30.jpg', 'images/33_sl8Zgc4.jpg', 'images/35-0.png', 'images/38._.jpg', 'images/47.jpg', 'images/61.jpg', 'images/145.jpg', 'images/332.jpg', 'images/61_asXn2en.jpg', '1- Tư thế ngồi làm việc giúp tăng cường sức mạnh cơ lưng\r\n2- Tư thế này cũng giúp mở rộng ngực và vai\r\n3- Nếu bạn thường xuyên luyện tập tư thế này, tư thế cơ thể bạn sẽ được cải thiện, chống gù lưng.\r\n4- Các cơ quan nội tạng cũng được tăng cường sức mạnh đáng kể\r\n5- Giúp chữa các bệnh đau thần kinh tọa và hen suyễn\r\n6- Giúp bạn tập trung hơn, xoa dịu tâm trí. Khi kết hợp với việc điều hòa hơi thở trong tư thế, bạn sẽ bớt căng thẳng và tăng cường sự tập trung hơn.\r\n ', '1- Tốt nhất bạn nên tránhthực hiện tư thế này nếu bạn đang bị đau thắt lưng và chấn thương cổ tay.\r\n2- Mặc dù đây là một tư thế khá đơn giản, nhưng khi luyện tập, hãy lắng nghe cơ thể và thực hiện dướisự giám sát của người hướng dẫn', '1- Ngồi thẳng lưng trênsàn, 2 chân duỗi thẳng trước mặt, đặt song song nhau, bàn chân hướng lên trên.\r\n2- Siết mông trên sàn,chỉnh sao cho đầu bạn nhìn thẳng, cột sống thẳng đứng kéo dài.\r\n3- Co duỗi bàn chân, 2gót chân chạm sàn.\r\n4- Đặt lòng bàn tay bạnxuống sàn để hỗ trợ cột sống và thư giãn vai. Lưng giữ thẳng nhưng thư giãn.\r\n5- Thả lỏng chân, giữ nguyên vị trí thân dưới dưới sàn.\r\n6- Hít thở nhẹ nhàng, giữtư thế trong tầm 20-30s'),
(5, 'goddess', 1, 'images/goddess.jpg', 'images/00000106.jpg', 'images/00000317.jpg', 'images/00000355.jpg', 'images/00000397.jpg', 'images/download.jpg', 'images/Goddess.jpg', 'images/hhh.jpg', 'images/qq.jpg', 'images/00000088_5GwP5jf.jpg', 'Giúp tăng cường sức mạnh cho toàn bộ phần dưới cơ thể, bao gồm cơ mông, hông, đùi, bắp chân và mắt cá chân.\r\nGiúp mở hông và ngực, kéo căng đùi và kéo dài cột sống.\r\nLàm ấm cơ thể và tái tạo năng lượng cho toàn bộ cơ thể.\r\nCải thiện sự cân bằng, tập trung\r\nKích thích hệ hô hấp và tim mạch, đồng thời giúp thư giãn các cơ ở sàn chậu.\r\nĐặc biệt, Tư thế Nữ thần cũng rất có lợi cho phụ nữ đang mang thai, vì ngồi xổm có thể tạo ra nhiều khoảng trống hơn trong khung xương chậu, giúp quá trình mang thai, chuyển dạ và sinh nở thoải mái hơn.', 'Không tập tư thế này nếu bạn bị chấn thương gần đây hoặc mãn tính ở chân, hông, lưng hoặc vai. Luôn tập luyện trong phạm vi giới hạn và khả năng của bản thân.', 'Bắt đầu đứng trong tư thế Mountain Pose (Tadasana) ở đầu tấm thảm với hai cánh tay ở hai bên. Đưa hai tay đặt trên hông một cách thoải mái.\r\nQuay sang bên phải và bước rộng hai chân ra xa nhau, khoảng bốn feet. Hơi xoay các ngón chân ra ngoài để chúng hướng vào các góc của tấm thảm.\r\nKhi thở ra, uốn cong đầu gối của bạn trực tiếp trên các ngón chân và hạ thấp hông của bạn trong tư thế ngồi xổm. Hướng đùi song song với sàn, nhưng không ép mình vào tư thế ngồi xổm.\r\nMở rộng cánh tay của bạn ra hai bên, cao bằng vai với lòng bàn tay úp xuống. Sau đó, xoay ngón tay cái của bạn theo hình xoắn ốc hướng lên trần nhà, để lòng bàn tay hướng về phía trước. Gập khuỷu tay và hướng các đầu ngón tay lên trần nhà; bắp tay và cẳng tay của bạn phải ở một góc 90 độ.\r\nHóp nhẹ xương cụt vào và ấn hông về phía trước khi kéo đùi ra sau. Giữ đầu gối của bạn thẳng hàng với các ngón chân. Làm mềm đôi vai của bạn. Nhẹ nhàng nhìn về phía chân trời.\r\nGiữ tối đa 10 nhịp thở. Để thả lỏng, từ từ đưa tay về phía hông. Giữ cột sống của bạn thẳng đứng, hít vào khi bạn ấn mạnh vào bàn chân và duỗi thẳng chân. Bước hai chân của bạn lại gần nhau và trở lại đầu tấm thảm của bạn trong tư thế Mountain Pose.'),
(6, 'hanumanasana', 7, 'images/hamu.jpg', 'images/17-0.png', 'images/44.jpg', 'images/52-0.png', 'images/89.jpg', 'images/r.jpg', 'images/h.jpg', 'images/v.jpg', 'images/zzzz.jpg', 'images/3_DrdhB6R.jpg', 'Kéo căng và làm săn chắc cơ bắp đùi, vùng háng và gân kheo\r\nKích thích và cải thiện chức năng của các cơ quan sinh sản, tiêu hóa\r\nTăng độ linh hoạt cho hông\r\nKéo căng cơ lưng\r\nGiảm căng thẳng', 'Trong yoga, quá trình sẽ quan trọng hơn kết quả. Do đó, nếu bạn xoạc chân thành công nhưng chân đặt trên thảm lại không thẳng thì cũng không được xem là chinh phục tư thế thành công.\r\n\r\nĐối với tư thế này, điều quan trọng là vị trí của hông. Khi thực hiện, cả 2 điểm ở hông đều phải hướng về phía trước. Cách tốt nhất, bạn vẫn nên đến lớp tập yoga hoặc mời giáo viên dạy yoga riêng để được hướng dẫn thực hiện tư thế đúng nhất.', 'Quỳ gối với đùi vuông góc với sàn, hai đầu gối cách nhau 1 chút\r\nGập người về phía trước 1 chút và chạm 2 bàn tay xuống sàn\r\nTừ từ di chuyển chân phải về phía trước với gót chân chạm sàn cho đến khi cả chân chạm sàn hoàn toàn.\r\nGiữ chân phải thẳng và từ từ di chuyển đầu gối trái về phía sau cho đến khi mu bàn chân và đầu gối chạm sàn.\r\nGiữ hông hướng về phía trước\r\nVươn 2 tay lên đầu và chắp tay lại. Siết cánh tay và từ từ uốn lưng về sau\r\nHít thở sâu, giữ tầm 30 đến 60 giây rồi trở về tư thế ban đầu.'),
(7, 'warrior2', 12, 'images/warrior.jpg', 'images/00000136.jpg', 'images/00000083.png', 'images/00000100_nGn8ED4.jpg', 'images/00000216.jpg', 'images/00000105.jpg', 'images/00000249.jpg', 'images/00000431_4FhIxBD.jpg', 'images/00000437.jpg', 'images/00000107.jpg', 'Tăng sức chịu đựng\r\nGiảm đau lưng\r\nTốt cho các cơ quan vùng bụng, kích thích tiêu hóa\r\nMở hông sâu, từ đó, làm săn chắc cơ đùi và mông\r\nSăn chắc bụng, mắt cá chân và vòm bàn chân.\r\nMở ngực và vai, cải thiện khả năng hít thở và tăng tuần hoàn khắp cơ thể.\r\nHỗ trợ điều trị cho bàn chân bẹt, đau thần kinh tọa, vô sinh và loãng xương.', 'Chú ý quan sát đầu gối phải bởi khu vực này có xu hướng nhô nhiều về phía trước. Bạn hãy chú ý giữ ống chân vuông góc với sàn, đồng thời đầu gối nằm ngay vị trí ngón chân giữa.', 'Để thực hiện tư thế chiến binh 2, bạn hãy:\r\nBắt đầu ở tư thế chó cúi mặt, bước chân phải vào giữa 2 tay\r\nGập đầu gối phải nhưng vẫn giữ thẳng với mắt cá chân, đùi song song với sàn\r\nXoay gan bàn chân trái để đưa gót chân trái  chạm thảm. Chân trái phải vuông góc với lòng bàn chân để tạo sự ổn định.\r\nGiữ nguyên tư thế đặt chân, hít vào, nâng thân và cánh tay lên.\r\nDang rộng 2 cánh tay để tạo thành hình chữ T khi bạn xoay thân sang trái\r\nLòng bàn tay úp xuống. Giữ cả hai cánh tay song song với sàn\r\nQuay đầu nhìn về mặt trước của thảm, mắt nhìn theo tay phải.\r\nSau 5 đến 10 nhịp thở, bạn hãy làm ngược lại các bước trên để trở về tư thế ban đầu'),
(8, 'purvottanasana', 3, 'images/purvo.jpg', 'images/h_346Qg1z.jpg', 'images/m.jpg', 'images/oo.jpg', 'images/Purvottanasana.jpg', 'images/q.jpg', 'images/saa.jpg', 'images/uu.jpg', 'images/uuu.jpg', 'images/zd.jpg', '1- Giúp tăng cường sức khỏe lưng, chân, cơ quanh đầu, cổ tay bạn\r\n2- Giúp mắt cá chân, ngực, vai bạn linh hoạt hơn\r\n3- Giúp xoa dịu tâm trí', '1- Tránh thực hiện tư thế này nếu bạn đang bị chấn thương cổ tay\r\n2- Nếu bạn bị chấn thương cổ, hãy sử dụng một chiếc để hỗ trợ đầu.', '1- Bắt đầu tư thế này với tư thế ngồi làm việc. Đặt bàn tay của bạn phía sau hông của bạn, đầu ngón tay của bạn hướng về phía trước. Gập đầu gối, đặt chân xuống sàn. 2 chân mở rộng bằng hông.\r\n2- Thở ra. Ấn mạnh bàn tay và bàn chân xuống sàn và nâng hông lên sao cho chúng thẳng với vai của bạn. Duỗi thẳng cánh tay.\r\n2- Duỗi thẳng chân, siết cơ bụng. Nâng hông của bạn lên cao nhất có thể.\r\n4- Nâng ngực của bạn. Đầu bạn ngẩng hướng lên trên trần, cẩn thận giữ cổ của bạn.\r\n5- Giữ tư thế cho đến khi bạn cảm thấy thoải mái. Sau đó nhẹ nhàng thả lỏng.'),
(9, 'virabhadrasana', 0, 'images/vira.jpg', 'images/4_bzerVp1.png', 'images/11.png', 'images/9.jpg', 'images/12.png', 'images/13.jpeg', 'images/15.png', 'images/14.png', 'images/33.png', 'images/14_05OhGkd.png', 'Cải thiện sự cân bằng và cải thiện tư thế.\r\nKéo dài và tăng cường sức mạnh cho bàn chân, mắt cá chân, bắp chân và cơ đùi.\r\nCải thiện khả năng vận động ở khớp vai và hông và mở ngực và phổi.', 'Tìm một vị trí đứng thoải mái và ổn định để bắt đầu.\r\nĐể ngăn chặn đầu gối phía trước sụp xuống, quấn các cơ xung quanh hông ngoài để xoay chân ra ngoài.\r\nĐể ngăn các xương sườn không bị bung ra, dùng cơ lõi và kéo xương đuôi xuống về phía thảm, nó cũng giữ cho lưng dưới dài ra.', 'Từ tư thế Tadasana / Tư thế trái núi, bước chân trái ra sau, các ngón chân hơi hướng ra ngoài, hai chân cách nhau bằng khoảng cách hông. Điều chỉnh tư thế để bạn cảm thấy ổn định và tiếp đất qua bàn chân.\r\nĐưa tay lên hông, căn chỉnh hông với cạnh trước của tấm thảm, bằng cách đưa hông bên phải ra sau một chút và hông bên trái về phía trước. Giữ thân trên đối diện với cạnh trước của thảm và hai vai cân bằng.\r\nCo đầu gối phải, đùi phải song song với sàn. Giữ trọng lượng ở phía trước bàn chân và ngón chân cái.\r\nNhấn bàn chân sau xuống và nâng vòm chân bên trong. Giữ chân sau được tham gia vào – đây là mỏ neo của bạn trong tư thế.\r\nKéo bụng dưới vào trong và hướng lên một cách nhẹ nhàng, kéo dài cột sống và làm mềm đáy cổ.\r\nXương đòn trải rộng, nâng hai cánh tay qua đầu, mở ngực.\r\nMở rộng khoảng cách giữa hai xương bả vai, đế của xương bả vai nâng lên và hướng về phía cột sống. Làm chắc cơ tam đầu để duỗi thẳng cánh tay.\r\nNếu cổ của bạn cho phép, hãy nhìn lên, nâng xương ức của bạn nhưng giữ cho xương sườn dưới hạ xuống.\r\nGiữ nguyên tư thế này trong khoảng 5 đến 15 nhịp thở, làm mềm khuôn mặt và cảm nhận sức mạnh phát sinh từ nền móng của bạn trong tư thế.\r\nĐể ra khỏi tư thế, hít vào và ấn qua gót chân sau khi bạn duỗi thẳng chân trước. Thở ra và hạ cánh tay xuống. Bước chân sau về phía trước, trở lại Tadasana, và sau đó lặp lại ở phía bên kia.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_pose_history`
--

CREATE TABLE `course_pose_history` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `Check` varchar(40) NOT NULL,
  `time` date DEFAULT current_timestamp(),
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `course_pose_history`
--

INSERT INTO `course_pose_history` (`id`, `name`, `Check`, `time`, `image`) VALUES
(1, 'Unknow', 'False', '2022-07-04', 'images/123.jpg'),
(2, 'Plank', 'True', '2022-07-04', 'images/T.jpg'),
(4, 'plank', '1', '2022-07-04', 'p.png');

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
(11, 'account', 'emailaddress'),
(12, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(16, 'course', 'listposeuser'),
(8, 'course', 'pose'),
(9, 'course', 'pose_history'),
(6, 'sessions', 'session'),
(10, 'sites', 'site'),
(13, 'socialaccount', 'socialaccount'),
(14, 'socialaccount', 'socialapp'),
(15, 'socialaccount', 'socialtoken'),
(7, 'user', 'user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-07-03 20:06:27.183164'),
(2, 'auth', '0001_initial', '2022-07-03 20:06:27.649302'),
(3, 'account', '0001_initial', '2022-07-03 20:06:27.797032'),
(4, 'account', '0002_email_max_length', '2022-07-03 20:06:27.817652'),
(5, 'admin', '0001_initial', '2022-07-03 20:06:27.966353'),
(6, 'admin', '0002_logentry_remove_auto_add', '2022-07-03 20:06:27.973570'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-03 20:06:27.984525'),
(8, 'contenttypes', '0002_remove_content_type_name', '2022-07-03 20:06:28.052465'),
(9, 'auth', '0002_alter_permission_name_max_length', '2022-07-03 20:06:28.116154'),
(10, 'auth', '0003_alter_user_email_max_length', '2022-07-03 20:06:28.135007'),
(11, 'auth', '0004_alter_user_username_opts', '2022-07-03 20:06:28.145606'),
(12, 'auth', '0005_alter_user_last_login_null', '2022-07-03 20:06:28.189313'),
(13, 'auth', '0006_require_contenttypes_0002', '2022-07-03 20:06:28.193659'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2022-07-03 20:06:28.205172'),
(15, 'auth', '0008_alter_user_username_max_length', '2022-07-03 20:06:28.226131'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2022-07-03 20:06:28.275966'),
(17, 'auth', '0010_alter_group_name_max_length', '2022-07-03 20:06:28.295454'),
(18, 'auth', '0011_update_proxy_permissions', '2022-07-03 20:06:28.305863'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2022-07-03 20:06:28.327110'),
(20, 'course', '0001_initial', '2022-07-03 20:06:28.385446'),
(21, 'sessions', '0001_initial', '2022-07-03 20:06:28.428289'),
(22, 'sites', '0001_initial', '2022-07-03 20:06:28.456145'),
(23, 'sites', '0002_alter_domain_unique', '2022-07-03 20:06:28.476133'),
(24, 'socialaccount', '0001_initial', '2022-07-03 20:06:28.826955'),
(25, 'socialaccount', '0002_token_max_lengths', '2022-07-03 20:06:28.875394'),
(26, 'socialaccount', '0003_extra_data_default_dict', '2022-07-03 20:06:28.893765'),
(27, 'user', '0001_initial', '2022-07-03 20:06:28.931868');

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
('80dxje6bxlaq06390x29job58tjxiaoe', 'eyJ1c2VybmFtZSI6ImtoYW5oaHV5ZW4iLCJwYXNzd29yZCI6IjEyMzQ1NiIsInVzZXJfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1o86SU:NeZ3ghvYZWEIGyU2TQUhXlvEmS9hPipiEltWHpWjfzo', '2022-07-03 20:49:46.097403'),
('kmdcpf8jqwb74ln4veh5f7napeujf050', 'eyJ1c2VybmFtZSI6ImtoYW5oaHV5ZW4iLCJwYXNzd29yZCI6IjEyMzQ1NiIsInVzZXJfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1o8Fh7:a9XOQ0zDx1K-G5hswVrl5LpUMiLo6Lw2PPiYoT20y40', '2022-07-04 06:41:29.680031'),
('p1xh4x47gqhxb4iscfjzlghb6o64wauc', 'eyJ1c2VybmFtZSI6ImtoYW5oaHV5ZW4iLCJwYXNzd29yZCI6IjEyMzQ1NiIsInVzZXJfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1o871U:i_mgqkfW43ziluczcHinjWiJYDIbJLkxkTegDSQMXqk', '2022-07-03 21:25:56.231576');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(2, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `socialaccount_socialaccount`
--

CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `socialaccount_socialapp`
--

CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `socialaccount_socialapp_sites`
--

CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint(20) NOT NULL,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `socialaccount_socialtoken`
--

CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_user`
--

CREATE TABLE `user_user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(500) NOT NULL,
  `date` datetime(6) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `role` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_user`
--

INSERT INTO `user_user` (`user_id`, `username`, `password`, `first_name`, `last_name`, `email`, `phone`, `address`, `date`, `gender`, `role`) VALUES
(1, 'khanhhuyen', '123456', 'Huyen', 'Khanh', 'nkh@gmai.com', '99977777', 'QB', '0000-00-00 00:00:00.000000', 1, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

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
-- Chỉ mục cho bảng `course_pose`
--
ALTER TABLE `course_pose`
  ADD PRIMARY KEY (`idPose`);

--
-- Chỉ mục cho bảng `course_pose_history`
--
ALTER TABLE `course_pose_history`
  ADD PRIMARY KEY (`id`);

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
-- Chỉ mục cho bảng `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Chỉ mục cho bảng `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Chỉ mục cho bảng `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- Chỉ mục cho bảng `user_user`
--
ALTER TABLE `user_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `course_pose`
--
ALTER TABLE `course_pose`
  MODIFY `idPose` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `course_pose_history`
--
ALTER TABLE `course_pose_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_user`
--
ALTER TABLE `user_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

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
-- Các ràng buộc cho bảng `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Các ràng buộc cho bảng `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
