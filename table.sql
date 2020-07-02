//管理员表
CREATE TABLE `adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
//插入数据
INSERT INTO `vegetablesorder`.`adminuser`(`id`, `name`, `password`) VALUES (1, 'ykp', '123456');







//用户表
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `ismember` int(1) DEFAULT '0',
  `tooltips` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `ismember` (`ismember`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
//插入数据
INSERT INTO `vegetablesorder`.`user`(`id`, `name`, `password`, `phone`, `address`, `ismember`, `tooltips`, `answer`) VALUES (1, '张四', '111111', '15617526348', '上海市浦西区', 0, '我的名字', '张四');
INSERT INTO `vegetablesorder`.`user`(`id`, `name`, `password`, `phone`, `address`, `ismember`, `tooltips`, `answer`) VALUES (2, '张三', '222222', '15617876348', '北京市', 0, '我是谁', '张三');
INSERT INTO `vegetablesorder`.`user`(`id`, `name`, `password`, `phone`, `address`, `ismember`, `tooltips`, `answer`) VALUES (3, 'ykp', '222222', '19913328359', '河南省鹿邑县', 0, '猜猜我是谁', '我是xxx');
INSERT INTO `vegetablesorder`.`user`(`id`, `name`, `password`, `phone`, `address`, `ismember`, `tooltips`, `answer`) VALUES (4, '赵李赞', '111111', '15611111121', '河南省新蔡县', 0, '天下谁最帅', '赵李赞');





//蔬菜表
CREATE TABLE `vegetables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(4,1) DEFAULT NULL,
  `discount` decimal(4,1) DEFAULT '0.0',
  `image` varchar(255) DEFAULT NULL,
  `surplus` decimal(6,1) DEFAULT '0.0',
  `introduction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `price` (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
//插入数据
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (1, '黄瓜', 1.5, 0.0, '/images/goods/huanggua.jpg', 48.6, '我是甜甜的黄瓜');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (2, '西红柿', 2.5, 0.0, '/images/goods/xihongshi.jpg', 208.0, '我是甜甜的西红柿');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (4, '葡萄', 5.5, 0.0, '/images/goods/goods002.jpg', 186.0, '我是甜甜的大葡萄');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (5, '柠檬', 3.9, 0.0, '/images/goods/goods001.jpg', 300.0, '我是甜甜的柠檬');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (6, '奇异果', 25.8, 0.0, '/images/goods/goods012.jpg', 146.0, '我是甜甜的奇异果');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (14, '瓠子', 5.5, 0.0, '/images/goods/瓠子.jpg', 210.0, '新鲜的瓠子');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (15, '香菜', 1.5, 0.0, '/images/goods/香菜.jpg', 600.0, '新鲜的香菜');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (16, '豆角', 2.5, 0.0, '/images/goods/豌豆.jpg', 297.0, '新鲜的豆角');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (17, '苦瓜', 2.3, 0.0, '/images/goods/苦瓜.jpg', 200.0, '好酷的苦瓜啊');





//订单表
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `vegetablename` varchar(255) DEFAULT NULL,
  `weight` decimal(4,1) DEFAULT '0.0',
  `price` decimal(4,1) DEFAULT NULL,
  `totalprice` decimal(6,1) DEFAULT '0.0',
  `ismember` int(1) DEFAULT '0',
  `state` int(2) DEFAULT '0',
  `time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FK_username` (`username`),
  KEY `FK_vegetablename` (`vegetablename`),
  KEY `FK_price` (`price`),
  KEY `FK_ismember` (`ismember`),
  CONSTRAINT `FK_price` FOREIGN KEY (`price`) REFERENCES `vegetables` (`price`) ON UPDATE CASCADE,
  CONSTRAINT `FK_username` FOREIGN KEY (`username`) REFERENCES `user` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vegetablename` FOREIGN KEY (`vegetablename`) REFERENCES `vegetables` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
//插入数据
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (8, 'ykp', '葡萄', 5.0, 5.5, 27.5, 0, 1, '2020-06-27 09:04:16');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (16, '赵李赞', '葡萄', 2.0, 5.5, 11.0, 0, 0, '2020-06-27 09:20:21');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (20, 'ykp', '奇异果', 4.0, 25.8, 103.2, 0, 1, '2020-06-27 10:24:17');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (22, '赵李赞', '西红柿', 2.0, 2.5, 3.0, 0, 1, '2020-06-27 16:12:08');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (30, '张三', '葡萄', 4.0, 5.5, 22.0, 0, 1, '2020-06-27 16:31:04');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (33, '张三', '黄瓜', 2.0, 2.5, 5.0, 0, 1, '2020-06-27 21:37:52');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (34, '张三', '奇异果', 2.0, 25.8, 51.6, 0, 0, '2020-06-27 21:42:29');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (49, 'ykp', '葡萄', 3.0, 5.5, 16.5, 0, 1, '2020-06-28 17:08:07');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (50, 'ykp', '黄瓜', 5.0, 2.5, 7.5, 0, 1, '2020-06-28 17:09:43');






//评论信息表
CREATE TABLE `remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `vegetablename` varchar(255) NOT NULL,
  `remark_time` varchar(255) NOT NULL,
  `order_time` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
//插入信息
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (1, 'ykp', '葡萄', '2020-06-30 11:29:50', '2020-06-27 09:04:16', '这个葡萄真的是太好吃了，下次还来。');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (2, '赵李赞', '西红柿', '2020-06-30 11:31:02', '2020-06-27 16:12:08', '好好吃');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (4, 'ykp', '奇异果', '2020-06-30 12:05:59', '2020-06-27 10:24:17', '好吃');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (6, 'ykp', '黄瓜', '2020-06-30 12:19:20', '2020-06-28 17:09:43', '黄瓜还行吧');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (7, '张三', '葡萄', '2020-06-30 12:40:01', '2020-06-27 16:31:04', '葡萄好好吃');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (8, '张三', '黄瓜', '2020-06-30 12:40:19', '2020-06-27 21:37:52', '黄瓜也不错啊');





//推荐蔬菜表
CREATE TABLE `recommendation` (
  `vegetableid` int(11) NOT NULL,
  `vegetablename` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(4,1) DEFAULT NULL,
  KEY `FK_recommendvegetableid` (`vegetableid`),
  CONSTRAINT `FK_recommendvegetableid` FOREIGN KEY (`vegetableid`) REFERENCES `vegetables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
//插入信息
INSERT INTO `vegetablesorder`.`recommendation`(`vegetableid`, `vegetablename`, `image`, `price`) VALUES (4, '葡萄', '/images/goods/goods002.jpg', 5.5);
INSERT INTO `vegetablesorder`.`recommendation`(`vegetableid`, `vegetablename`, `image`, `price`) VALUES (5, '柠檬', '/images/goods/goods001.jpg', 3.9);
INSERT INTO `vegetablesorder`.`recommendation`(`vegetableid`, `vegetablename`, `image`, `price`) VALUES (6, '奇异果', '/images/goods/goods012.jpg', 25.8);



