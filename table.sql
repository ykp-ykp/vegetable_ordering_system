//����Ա��
CREATE TABLE `adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
//��������
INSERT INTO `vegetablesorder`.`adminuser`(`id`, `name`, `password`) VALUES (1, 'ykp', '123456');







//�û���
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
//��������
INSERT INTO `vegetablesorder`.`user`(`id`, `name`, `password`, `phone`, `address`, `ismember`, `tooltips`, `answer`) VALUES (1, '����', '111111', '15617526348', '�Ϻ���������', 0, '�ҵ�����', '����');
INSERT INTO `vegetablesorder`.`user`(`id`, `name`, `password`, `phone`, `address`, `ismember`, `tooltips`, `answer`) VALUES (2, '����', '222222', '15617876348', '������', 0, '����˭', '����');
INSERT INTO `vegetablesorder`.`user`(`id`, `name`, `password`, `phone`, `address`, `ismember`, `tooltips`, `answer`) VALUES (3, 'ykp', '222222', '19913328359', '����ʡ¹����', 0, '�²�����˭', '����xxx');
INSERT INTO `vegetablesorder`.`user`(`id`, `name`, `password`, `phone`, `address`, `ismember`, `tooltips`, `answer`) VALUES (4, '������', '111111', '15611111121', '����ʡ�²���', 0, '����˭��˧', '������');





//�߲˱�
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
//��������
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (1, '�ƹ�', 1.5, 0.0, '/images/goods/huanggua.jpg', 48.6, '��������Ļƹ�');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (2, '������', 2.5, 0.0, '/images/goods/xihongshi.jpg', 208.0, '���������������');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (4, '����', 5.5, 0.0, '/images/goods/goods002.jpg', 186.0, '��������Ĵ�����');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (5, '����', 3.9, 0.0, '/images/goods/goods001.jpg', 300.0, '�������������');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (6, '�����', 25.8, 0.0, '/images/goods/goods012.jpg', 146.0, '��������������');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (14, '���', 5.5, 0.0, '/images/goods/���.jpg', 210.0, '���ʵ����');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (15, '���', 1.5, 0.0, '/images/goods/���.jpg', 600.0, '���ʵ����');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (16, '����', 2.5, 0.0, '/images/goods/�㶹.jpg', 297.0, '���ʵĶ���');
INSERT INTO `vegetablesorder`.`vegetables`(`id`, `name`, `price`, `discount`, `image`, `surplus`, `introduction`) VALUES (17, '���', 2.3, 0.0, '/images/goods/���.jpg', 200.0, '�ÿ�Ŀ�ϰ�');





//������
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
//��������
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (8, 'ykp', '����', 5.0, 5.5, 27.5, 0, 1, '2020-06-27 09:04:16');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (16, '������', '����', 2.0, 5.5, 11.0, 0, 0, '2020-06-27 09:20:21');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (20, 'ykp', '�����', 4.0, 25.8, 103.2, 0, 1, '2020-06-27 10:24:17');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (22, '������', '������', 2.0, 2.5, 3.0, 0, 1, '2020-06-27 16:12:08');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (30, '����', '����', 4.0, 5.5, 22.0, 0, 1, '2020-06-27 16:31:04');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (33, '����', '�ƹ�', 2.0, 2.5, 5.0, 0, 1, '2020-06-27 21:37:52');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (34, '����', '�����', 2.0, 25.8, 51.6, 0, 0, '2020-06-27 21:42:29');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (49, 'ykp', '����', 3.0, 5.5, 16.5, 0, 1, '2020-06-28 17:08:07');
INSERT INTO `vegetablesorder`.`orders`(`orderid`, `username`, `vegetablename`, `weight`, `price`, `totalprice`, `ismember`, `state`, `time`) VALUES (50, 'ykp', '�ƹ�', 5.0, 2.5, 7.5, 0, 1, '2020-06-28 17:09:43');






//������Ϣ��
CREATE TABLE `remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `vegetablename` varchar(255) NOT NULL,
  `remark_time` varchar(255) NOT NULL,
  `order_time` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
//������Ϣ
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (1, 'ykp', '����', '2020-06-30 11:29:50', '2020-06-27 09:04:16', '������������̫�ó��ˣ��´λ�����');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (2, '������', '������', '2020-06-30 11:31:02', '2020-06-27 16:12:08', '�úó�');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (4, 'ykp', '�����', '2020-06-30 12:05:59', '2020-06-27 10:24:17', '�ó�');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (6, 'ykp', '�ƹ�', '2020-06-30 12:19:20', '2020-06-28 17:09:43', '�ƹϻ��а�');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (7, '����', '����', '2020-06-30 12:40:01', '2020-06-27 16:31:04', '���Ѻúó�');
INSERT INTO `vegetablesorder`.`remarks`(`id`, `username`, `vegetablename`, `remark_time`, `order_time`, `content`) VALUES (8, '����', '�ƹ�', '2020-06-30 12:40:19', '2020-06-27 21:37:52', '�ƹ�Ҳ����');





//�Ƽ��߲˱�
CREATE TABLE `recommendation` (
  `vegetableid` int(11) NOT NULL,
  `vegetablename` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(4,1) DEFAULT NULL,
  KEY `FK_recommendvegetableid` (`vegetableid`),
  CONSTRAINT `FK_recommendvegetableid` FOREIGN KEY (`vegetableid`) REFERENCES `vegetables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
//������Ϣ
INSERT INTO `vegetablesorder`.`recommendation`(`vegetableid`, `vegetablename`, `image`, `price`) VALUES (4, '����', '/images/goods/goods002.jpg', 5.5);
INSERT INTO `vegetablesorder`.`recommendation`(`vegetableid`, `vegetablename`, `image`, `price`) VALUES (5, '����', '/images/goods/goods001.jpg', 3.9);
INSERT INTO `vegetablesorder`.`recommendation`(`vegetableid`, `vegetablename`, `image`, `price`) VALUES (6, '�����', '/images/goods/goods012.jpg', 25.8);



