/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-njokm572.bj.tencentcdb.com:10165
 Source Schema         : banana

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 12/12/2019 20:46:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `users_id` int(11) NOT NULL COMMENT '用户id',
  `users_name` varchar(255) NOT NULL COMMENT '姓名',
  `users_mobile` char(11) NOT NULL COMMENT '联系方式手机号',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `area` varchar(255) DEFAULT NULL COMMENT '区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `zipcode` int(10) DEFAULT NULL COMMENT '邮政编码',
  `sdefault` tinyint(4) NOT NULL COMMENT '是否默认。 0 不是默认 1 是默认',
  `dormitory_no` varchar(255) NOT NULL COMMENT '宿舍号',
  `dormitory` varchar(255) NOT NULL COMMENT '宿舍楼',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
INSERT INTO `address` VALUES (1, 1, '请问', '18904376606', '江苏省', '宿迁市', '沭阳县', '北京南路6号', 123789, 0, '333宿舍', '1号楼');
INSERT INTO `address` VALUES (2, 1, '老王', '18904376606', NULL, NULL, NULL, 'null', NULL, 0, '321宿舍', '1号楼');
INSERT INTO `address` VALUES (23, 1, '安全额', '123', '0', '0', '0', '123', 0, 0, '1231', '23');
INSERT INTO `address` VALUES (24, 1, '请问1', '123', '0', '0', '0', '', 0, 0, '123', '123');
INSERT INTO `address` VALUES (25, 1, '09080', '123', '0', '0', '0', '', 0, 0, '123', '89080');
INSERT INTO `address` VALUES (27, 1, 'gfh', '7897987897', '0', '0', '0', 'fgh', 0, 0, 'hf', 'ghfgh');
INSERT INTO `address` VALUES (28, 1, 'qwe', '123123', '0', '0', '0', '213', 0, 0, '123', '123');
INSERT INTO `address` VALUES (29, 1, '王海龙', '13778424516', '0', '0', '0', '321', 0, 0, '321', '321');
INSERT INTO `address` VALUES (30, 1, '213', '123', '0', '0', '0', '123', 0, 0, '123', '213');
INSERT INTO `address` VALUES (31, 1, '刘晓天', '13778424516', '0', '0', '0', '321', 0, 1, '321', '321');
INSERT INTO `address` VALUES (32, 1, '刘晓天', '13778424516', '0', '0', '0', '321', 0, 0, '321', '321');
COMMIT;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `auth_name` varchar(20) NOT NULL COMMENT '权限名称',
  `auth_state` tinyint(3) NOT NULL COMMENT '0:普通用户 1：食堂用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
BEGIN;
INSERT INTO `authority` VALUES (1, '管理员', 0);
INSERT INTO `authority` VALUES (2, '老板', 0);
COMMIT;

-- ----------------------------
-- Table structure for commit
-- ----------------------------
DROP TABLE IF EXISTS `commit`;
CREATE TABLE `commit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `req_id` int(11) NOT NULL COMMENT '发送者id',
  `res_id` int(11) NOT NULL COMMENT '接收者id',
  `message` text NOT NULL COMMENT '发送的信息',
  `add_time` int(10) NOT NULL COMMENT '发送时间 时间戳(秒)',
  `room_id` int(10) NOT NULL COMMENT '聊天室id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commit
-- ----------------------------
BEGIN;
INSERT INTO `commit` VALUES (2, 1, 3, '在吗', 1574058867, 2);
INSERT INTO `commit` VALUES (3, 1, 4, '晚上吃啥', 1574058868, 3);
INSERT INTO `commit` VALUES (5, 3, 1, '在的', 1574609900, 2);
INSERT INTO `commit` VALUES (6, 5, 1, '在吗？给你100万', 1599990044, 4);
INSERT INTO `commit` VALUES (26, 1, 2, '在吗？', 1574218629, 1);
INSERT INTO `commit` VALUES (102, 1, 5, '我不想要', 1574821792, 4);
INSERT INTO `commit` VALUES (107, 1, 3, '', 1574822010, 2);
INSERT INTO `commit` VALUES (108, 1, 3, '', 1574822012, 2);
INSERT INTO `commit` VALUES (109, 1, 5, '。。。', 1574822147, 4);
INSERT INTO `commit` VALUES (110, 1, 5, '下次啊', 1574822155, 4);
INSERT INTO `commit` VALUES (124, 2, 1, '在的', 1574905669, 1);
INSERT INTO `commit` VALUES (125, 2, 1, '往事如风你好', 1574905676, 1);
INSERT INTO `commit` VALUES (126, 1, 2, '轻舞飞扬你好', 1574905690, 1);
INSERT INTO `commit` VALUES (127, 2, 1, '晚上准备吃啥子哦', 1574905702, 1);
INSERT INTO `commit` VALUES (128, 1, 2, '扬扬我想吃烤山药', 1574905735, 1);
INSERT INTO `commit` VALUES (129, 2, 1, '吃，吃大块的 ，两块够吗？孩子', 1574905751, 1);
INSERT INTO `commit` VALUES (130, 1, 2, '够了谢谢，扬扬。', 1574905777, 1);
INSERT INTO `commit` VALUES (131, 2, 1, '好的 不谢', 1574905794, 1);
INSERT INTO `commit` VALUES (132, 1, 2, '你好骚啊', 1574905810, 1);
INSERT INTO `commit` VALUES (133, 1, 2, '。。。', 1575547206, 1);
INSERT INTO `commit` VALUES (134, 1, 2, '嘿嘿', 1575547216, 1);
INSERT INTO `commit` VALUES (135, 1, 2, '大兄弟', 1575617860, 1);
COMMIT;

-- ----------------------------
-- Table structure for escare
-- ----------------------------
DROP TABLE IF EXISTS `escare`;
CREATE TABLE `escare` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '二手市场购物车表id',
  `shop_id` int(11) NOT NULL COMMENT '二手商品id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `shop _num` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量默认为1',
  `shop _check` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '默认为 0 补选中\r\n1为选中\r\n\r\n',
  `eruser_id` int(11) NOT NULL COMMENT '二手市场商铺用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for esclassify
-- ----------------------------
DROP TABLE IF EXISTS `esclassify`;
CREATE TABLE `esclassify` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `name` varchar(30) NOT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esclassify
-- ----------------------------
BEGIN;
INSERT INTO `esclassify` VALUES (1, '游戏设备');
INSERT INTO `esclassify` VALUES (2, '办公用品');
INSERT INTO `esclassify` VALUES (3, '女士鞋靴');
INSERT INTO `esclassify` VALUES (4, '古董收藏');
INSERT INTO `esclassify` VALUES (5, '钟表眼镜');
INSERT INTO `esclassify` VALUES (6, '珠宝首饰');
INSERT INTO `esclassify` VALUES (7, '家纺布艺');
INSERT INTO `esclassify` VALUES (8, '家装/建材');
INSERT INTO `esclassify` VALUES (9, '服饰配件');
INSERT INTO `esclassify` VALUES (10, '网络设备');
INSERT INTO `esclassify` VALUES (11, '宠物/用品');
INSERT INTO `esclassify` VALUES (12, '动漫/周边');
INSERT INTO `esclassify` VALUES (13, '箱包');
INSERT INTO `esclassify` VALUES (15, '321');
INSERT INTO `esclassify` VALUES (17, 'lalala');
COMMIT;

-- ----------------------------
-- Table structure for esclassify_shop
-- ----------------------------
DROP TABLE IF EXISTS `esclassify_shop`;
CREATE TABLE `esclassify_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品-分类',
  `shop_id` int(11) NOT NULL COMMENT '商品id',
  `esclassify_id` int(11) NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esclassify_shop
-- ----------------------------
BEGIN;
INSERT INTO `esclassify_shop` VALUES (1, 1, 1);
INSERT INTO `esclassify_shop` VALUES (2, 2, 2);
INSERT INTO `esclassify_shop` VALUES (3, 3, 3);
INSERT INTO `esclassify_shop` VALUES (4, 4, 4);
INSERT INTO `esclassify_shop` VALUES (5, 5, 5);
INSERT INTO `esclassify_shop` VALUES (6, 6, 6);
INSERT INTO `esclassify_shop` VALUES (7, 7, 7);
INSERT INTO `esclassify_shop` VALUES (8, 8, 8);
INSERT INTO `esclassify_shop` VALUES (9, 9, 9);
INSERT INTO `esclassify_shop` VALUES (10, 10, 10);
INSERT INTO `esclassify_shop` VALUES (11, 11, 11);
INSERT INTO `esclassify_shop` VALUES (12, 12, 12);
INSERT INTO `esclassify_shop` VALUES (13, 13, 13);
INSERT INTO `esclassify_shop` VALUES (14, 4, 1);
INSERT INTO `esclassify_shop` VALUES (15, 5, 2);
INSERT INTO `esclassify_shop` VALUES (16, 6, 3);
INSERT INTO `esclassify_shop` VALUES (17, 6, 38);
INSERT INTO `esclassify_shop` VALUES (18, 12, 39);
INSERT INTO `esclassify_shop` VALUES (19, 12, 40);
INSERT INTO `esclassify_shop` VALUES (20, 41, 12);
INSERT INTO `esclassify_shop` VALUES (21, 48, 7);
INSERT INTO `esclassify_shop` VALUES (22, 49, 2);
INSERT INTO `esclassify_shop` VALUES (23, 50, 3);
INSERT INTO `esclassify_shop` VALUES (24, 51, 4);
INSERT INTO `esclassify_shop` VALUES (25, 55, 1);
COMMIT;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `me_id` int(11) NOT NULL COMMENT '自己id',
  `good_id` int(11) NOT NULL COMMENT '好友Id',
  `is_attention` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否关注 0 未关注 1 已关注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------
BEGIN;
INSERT INTO `friend` VALUES (1, 1, 2, 0);
INSERT INTO `friend` VALUES (2, 1, 3, 1);
INSERT INTO `friend` VALUES (3, 1, 4, 1);
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `menu_name` varchar(50) NOT NULL COMMENT '菜品名称',
  `menu_describe` varchar(255) DEFAULT NULL COMMENT '菜品 描述',
  `menu_price` decimal(10,2) NOT NULL COMMENT '菜品价钱',
  `menu_img` varchar(255) DEFAULT NULL COMMENT '菜品图片',
  `menu_unit` varchar(10) NOT NULL COMMENT '计量单位为什么什么一斤等',
  `recommend` tinyint(4) DEFAULT NULL COMMENT '0为推荐\r\n1为不推荐\r\n\r\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (2, '黄焖排骨', '正宗黄焖排骨绝对回味无穷,让你吃一次就上瘾', 30.00, 'https://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/04358b007f4168126b439b102a7b74e8.jpg?x-oss-process=style/123_ds', '30元/份', 1);
INSERT INTO `menu` VALUES (3, '红烧狮子头', '四个色泽金黄、香味四溢、形态栩栩如生的丸子组成，寓意人生福、寿、喜', 40.00, 'https://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/u%3D2994977836%2C256823547%26fm%3D26%26gp%3D0.jpg?x-oss-process=style/123_ds', '40元/份', 1);
INSERT INTO `menu` VALUES (4, '红烧肉', '非常美味的红烧肉 ， 入口立即化', 15.00, NULL, '15元一份', 0);
INSERT INTO `menu` VALUES (5, '红烧肉', '入口即化的肉。', 15.00, NULL, '15元一份', 0);
INSERT INTO `menu` VALUES (6, '1', '1', 1.00, NULL, '1', 0);
INSERT INTO `menu` VALUES (7, '1', '1', 1.00, NULL, '1', 0);
INSERT INTO `menu` VALUES (8, '1', '1', 1.00, NULL, '1', 0);
INSERT INTO `menu` VALUES (9, '1', '1', 1.00, NULL, '1', 0);
INSERT INTO `menu` VALUES (10, '1', '1', 1.00, NULL, '1', 0);
INSERT INTO `menu` VALUES (11, '1', '1', 1.00, NULL, '1', 0);
INSERT INTO `menu` VALUES (12, '2', '2', 2.00, NULL, '2', 0);
INSERT INTO `menu` VALUES (13, '1', '1', 2.00, NULL, '2', 0);
INSERT INTO `menu` VALUES (14, '1', '1', 1.00, NULL, '1', 0);
INSERT INTO `menu` VALUES (15, '黄焖排骨', '正宗黄焖排骨绝对回味无穷,让你吃一次就上瘾', 30.00, 'https://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/04358b007f4168126b439b102a7b74e8.jpg?x-oss-process=style/123_ds', '30元/份', 0);
INSERT INTO `menu` VALUES (16, '红烧聂代睿', '以天地为炉，生活于水生火热之中', 10.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/TLItLSk6IZoPWAdn.jpg', '10元', 0);
INSERT INTO `menu` VALUES (17, '洛天依的小龙包', '中华美食，人间美味，长沙臭豆腐', 5.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/88si8efnQXBFFGGg.png', '5元', 0);
INSERT INTO `menu` VALUES (18, '红烧王海龙', '油炸，红烧', 250.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/Lr0WpYFxxR2K7gL6.jpg', '12', 0);
INSERT INTO `menu` VALUES (19, '红烧王海龙', '油炸，红烧', 250.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/Lr0WpYFxxR2K7gL6.jpg', '12', 0);
INSERT INTO `menu` VALUES (20, 'faldfs`ejrl', 'dfadjfsk;d', 12.00, NULL, '12', 0);
INSERT INTO `menu` VALUES (21, 'faldfs`ejrl', 'dfadjfsk;d', 12.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/4tWeUlXW3KmKFEtj.jpg', '12', 0);
INSERT INTO `menu` VALUES (22, 'faldfs`ejrl', 'dfadjfsk;d', 12.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/4tWeUlXW3KmKFEtj.jpg', '12', 0);
INSERT INTO `menu` VALUES (23, 'faldfs`ejrl', 'dfadjfsk;d', 12.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/4tWeUlXW3KmKFEtj.jpg', '12', 0);
INSERT INTO `menu` VALUES (24, 'hondf', 'dfsd', 123.00, NULL, '12', 0);
INSERT INTO `menu` VALUES (25, 'hondf', 'dfsd', 123.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/levfqXqgqRu7eEdC.jpg', '12', 0);
INSERT INTO `menu` VALUES (26, '混沌蝴蝶', '蝴蝶中的饺子，好吃过嫂子', 10.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/8d1qZ4WYifQjbqPj.jpg', '10元/份', 0);
COMMIT;

-- ----------------------------
-- Table structure for menuimg
-- ----------------------------
DROP TABLE IF EXISTS `menuimg`;
CREATE TABLE `menuimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '商品id',
  `menu_img` varchar(255) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menuimg
-- ----------------------------
BEGIN;
INSERT INTO `menuimg` VALUES (1, 1, '');
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_num` varchar(20) NOT NULL COMMENT '订单编号',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  `price` decimal(10,2) NOT NULL COMMENT '支付金额',
  `state` tinyint(4) NOT NULL COMMENT '订单状态 0待支付 1已支付，待收货 2：已发货，待收货 3已收货，待评价 4已完成 5.取消',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `classify_State` tinyint(4) NOT NULL COMMENT '1为食堂订单\r\n2为二手市场订单\r\n',
  `return_state` tinyint(4) NOT NULL COMMENT '默认0退货功能未开启\r\n1:发起退货\r\n2：退货成功\r\n3：退货失败\r\n',
  `pay_method` tinyint(4) NOT NULL COMMENT '支付方式 \r\n0: 未支付情况\r\n1: 微信支付 2：支付宝支付 3.银联 4.货到付款\r\n5．其他\r\n',
  `shr_name` varchar(255) NOT NULL COMMENT '收货人姓名',
  `shr_mobile` char(11) NOT NULL COMMENT '收货人手机',
  `shr_province` varchar(255) DEFAULT NULL COMMENT '省',
  `shr_city` varchar(255) DEFAULT NULL COMMENT '市',
  `shr_area` varchar(255) DEFAULT NULL COMMENT '区',
  `shr_zipcode` int(10) DEFAULT NULL COMMENT '邮政编码',
  `shr_address` varchar(255) NOT NULL COMMENT '详细地址',
  `order_comment` varchar(600) DEFAULT NULL COMMENT '评论',
  `st_users_id` int(11) DEFAULT NULL COMMENT '商铺用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (2, '15740813000001610946', 1574081300, 3.00, 2, 1, 2, 0, 4, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', '飒飒', 1);
INSERT INTO `order` VALUES (22, '15741454670006641500', 1574145467, 8888.00, 3, 1, 2, 0, 4, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', '东西很好', 1);
INSERT INTO `order` VALUES (23, '15741456390008897806', 1574145639, 10.00, 4, 1, 2, 0, 4, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', '886', 1);
INSERT INTO `order` VALUES (24, '15741483500002143291', 1574148349, 10.00, 5, 1, 2, 0, 4, '小车', '13654498649', NULL, NULL, NULL, NULL, '3191号楼', '12321', 1);
INSERT INTO `order` VALUES (26, '15741579690006664473', 1574157969, 10.00, 1, 1, 2, 0, 4, '刘某人是傻子', '12366', NULL, NULL, NULL, NULL, '13121312', '能尽快比较快吧那就看吧', 1);
INSERT INTO `order` VALUES (27, '15741580280005205362', 1574158028, 10.00, 2, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, 1);
INSERT INTO `order` VALUES (28, '15741580290003938542', 1574158029, 10.00, 3, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, 1);
INSERT INTO `order` VALUES (31, '15742091120009540204', 1574209112, 10.00, 4, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, 1);
INSERT INTO `order` VALUES (39, '15742987270006125138', 1574298727, 5.00, 5, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, 1);
INSERT INTO `order` VALUES (40, '15743040110005235418', 1574304011, 9.90, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, 1);
INSERT INTO `order` VALUES (41, '15743052690007182416', 1574305269, 9.90, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, 1);
INSERT INTO `order` VALUES (42, '15743053030000113540', 1574305303, 2.00, 2, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, 1);
INSERT INTO `order` VALUES (52, '15743824250009706114', 1574382425, 422.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (53, '15743824360003302025', 1574382436, 1.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (64, '15744264780008896896', 1574426478, 90.00, 5, 1, 1, 0, 0, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (65, '15744280440006246215', 1574428044, 30.00, 5, 1, 1, 0, 0, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (66, '15744281160000999143', 1574428116, 120.00, 4, 1, 1, 0, 3, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (67, '15744281840009542508', 1574428184, 120.00, 5, 1, 1, 0, 0, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (68, '15744297000004803875', 1574429700, 2.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (69, '15744802180007757597', 1574480218, 10.00, 1, 1, 2, 0, 4, '安全额', '123', NULL, NULL, NULL, NULL, '231231', NULL, NULL);
INSERT INTO `order` VALUES (70, '15746020160000839244', 1574602016, 60.00, 3, 1, 1, 1, 3, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (71, '15746020180001992086', 1574602018, 60.00, 3, 1, 1, 0, 3, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (72, '15746020190005434859', 1574602019, 60.00, 3, 1, 1, 0, 0, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (73, '15746020200000992431', 1574602020, 60.00, 5, 1, 1, 0, 0, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (74, '15746020200001245038', 1574602020, 60.00, 5, 1, 1, 0, 0, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (75, '15746020200001734694', 1574602020, 60.00, 5, 1, 1, 0, 0, 'qwe', '123123', NULL, NULL, NULL, NULL, '123123', NULL, NULL);
INSERT INTO `order` VALUES (76, '15746023250009528260', 1574602325, 2.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', '我觉得还可以', NULL);
INSERT INTO `order` VALUES (77, '15746090880008161599', 1574609088, 150.00, 5, 1, 1, 0, 0, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (78, '15746090920008953853', 1574609092, 150.00, 5, 1, 1, 0, 0, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (79, '15746090940009290517', 1574609094, 150.00, 5, 1, 1, 0, 0, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (80, '15746090940003330289', 1574609094, 150.00, 5, 1, 1, 0, 0, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (81, '15746090940002645366', 1574609094, 150.00, 5, 1, 1, 0, 0, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (82, '15746090940002151983', 1574609094, 150.00, 5, 1, 1, 0, 0, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (83, '15746091350009694337', 1574609135, 100.00, 3, 1, 1, 0, 1, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (84, '15746119790008949515', 1574611979, 89800.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (85, '15746136350000382378', 1574613635, 5.00, 1, 1, 2, 0, 4, '王海龙', '13778424516', NULL, NULL, NULL, NULL, '321321', NULL, NULL);
INSERT INTO `order` VALUES (86, '15746148130002928724', 1574614813, 758.00, 5, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (87, '15746149210005677331', 1574614921, 758.00, 5, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (88, '15746149550003413208', 1574614955, 758.00, 5, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (89, '15746151460005605415', 1574615146, 246.00, 5, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (90, '15746152250002625666', 1574615225, 30.00, 5, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (91, '15746152790005436205', 1574615279, 30.00, 5, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (92, '15746153380000028325', 1574615338, 123.00, 3, 1, 1, 0, 3, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (93, '15746153830002546292', 1574615383, 123.00, 3, 1, 1, 0, 3, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (94, '15746154060001589555', 1574615406, 3423.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', '213123', NULL);
INSERT INTO `order` VALUES (95, '15746236620002992585', 1574623662, 423.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', 'sasasa', NULL);
INSERT INTO `order` VALUES (96, '15746248470007173279', 1574624847, 0.00, 5, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (97, '15746248570008554093', 1574624857, 10.00, 3, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (98, '15746252660001268202', 1574625266, 243.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (99, '15746253130000322436', 1574625313, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (100, '15746253490007665269', 1574625349, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (101, '15746254470006688838', 1574625447, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (102, '15746255150003356480', 1574625515, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (103, '15746255150007513846', 1574625515, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (104, '15746256490005915687', 1574625649, 10.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (105, '15746257210006339769', 1574625721, 213.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (106, '15746257470002497852', 1574625747, 273.00, 3, 1, 1, 0, 3, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (107, '15746259690007272125', 1574625969, 40.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (108, '15746259900006039277', 1574625990, 10.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (109, '15746260620004794518', 1574626062, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (110, '15746262140004670091', 1574626214, 123.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (111, '15746262890008665184', 1574626289, 123.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (112, '15746263470003764576', 1574626347, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (113, '15746263470002759509', 1574626347, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (114, '15746273000002871525', 1574627300, 153.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (115, '15746289340008346914', 1574628934, 153.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (116, '15746289520002468010', 1574628952, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (117, '15746289880007368359', 1574628988, 10.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (118, '15746289880007184189', 1574628988, 10.00, 3, 1, 1, 0, 1, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (119, '15746289880004138586', 1574628988, 10.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (120, '15746289880007932728', 1574628988, 10.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (121, '15746290040003494236', 1574629004, 10.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (122, '15746290050005191814', 1574629005, 10.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (123, '15746290050001644790', 1574629005, 10.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (124, '15746290050006187779', 1574629005, 10.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (125, '15746290860009649602', 1574629086, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (126, '15746291370005194629', 1574629137, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (127, '15746291930002525103', 1574629193, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (128, '15746293700003575826', 1574629370, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (129, '15746295500002556305', 1574629550, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (130, '15746296050007539157', 1574629605, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (131, '15746296390004318986', 1574629639, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (132, '15746297660001397272', 1574629766, 40.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (133, '15746301760000903170', 1574630176, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (134, '15746302350005977420', 1574630235, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (135, '15746304090008910672', 1574630409, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (136, '15746304900009929308', 1574630490, 30.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (137, '15746334040008126398', 1574633404, 516.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (138, '15746335330003154870', 1574633533, 193.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (139, '15746422400009090423', 1574642240, 70.00, 0, 1, 1, 0, 0, '刘晓天', '13778424516', NULL, NULL, NULL, NULL, '321321', NULL, NULL);
INSERT INTO `order` VALUES (140, '15746426490003359164', 1574642649, 998.00, 1, 1, 2, 0, 4, '刘晓天', '13778424516', NULL, NULL, NULL, NULL, '321321', '我觉得很差', NULL);
INSERT INTO `order` VALUES (141, '15746632950003010896', 1574663295, 213.00, 3, 1, 1, 0, 3, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (142, '15746646900003584192', 1574664690, 449.00, 3, 1, 1, 0, 3, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (143, '15746651220009530040', 1574665122, 9.90, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (144, '15746651220008807605', 1574665122, 9.90, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', '游戏体验感极差', NULL);
INSERT INTO `order` VALUES (145, '15746651250000578752', 1574665125, 9.90, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', '。。。\n', NULL);
INSERT INTO `order` VALUES (146, '15746652240001368977', 1574665224, 1.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', '游戏体验极差', NULL);
INSERT INTO `order` VALUES (147, '15746862130001059613', 1574686213, 2.00, 1, 1, 2, 0, 4, 'gfh', '7897987897', NULL, NULL, NULL, NULL, 'ghfghhf', '111', NULL);
INSERT INTO `order` VALUES (148, '15747290520003734748', 1574729052, 120.00, 1, 1, 1, 0, 2, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (149, '15747291800002893574', 1574729180, 1.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (150, '15747571380009686730', 1574757138, 153.00, 0, 1, 1, 0, 0, '老王', '18904376606', NULL, NULL, NULL, NULL, '1号楼321宿舍', NULL, NULL);
INSERT INTO `order` VALUES (151, '15747573100008449491', 1574757310, 2.00, 1, 1, 2, 0, 4, '请问', '18904376606', NULL, NULL, NULL, NULL, '1号楼333宿舍', NULL, NULL);
INSERT INTO `order` VALUES (152, '15750244890005957008', 1575024489, 130.00, 1, 1, 1, 0, 3, '王海龙', '13778424516', NULL, NULL, NULL, NULL, '321321', NULL, NULL);
INSERT INTO `order` VALUES (153, '15750382620004090799', 1575038262, 163.00, 1, 1, 1, 0, 3, '王海龙', '13778424516', NULL, NULL, NULL, NULL, '321321', NULL, NULL);
INSERT INTO `order` VALUES (154, '15756179550009025260', 1575617955, 160.00, 1, 1, 1, 0, 3, '刘晓天', '13778424516', NULL, NULL, NULL, NULL, '321321', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for order_esdetail
-- ----------------------------
DROP TABLE IF EXISTS `order_esdetail`;
CREATE TABLE `order_esdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情表的id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `shop_id` int(11) NOT NULL COMMENT '二手商品id',
  `shop_name` varchar(50) DEFAULT NULL COMMENT '二手商品名称',
  `shop_price` decimal(10,2) DEFAULT NULL COMMENT '二手商品金额',
  `shop_num` tinyint(255) DEFAULT NULL COMMENT '二手商品的数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_esdetail
-- ----------------------------
BEGIN;
INSERT INTO `order_esdetail` VALUES (1, 2, 1, '', NULL, NULL);
INSERT INTO `order_esdetail` VALUES (15, 22, 1, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (16, 23, 2, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (17, 24, 2, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (18, 26, 2, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (19, 27, 2, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (20, 28, 2, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (23, 31, 2, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (24, 39, 3, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (25, 40, 9, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (26, 41, 9, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (27, 42, 4, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (28, 52, 6, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (29, 53, 11, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (30, 61, 7, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (31, 62, 10, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (32, 68, 13, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (33, 69, 2, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (34, 76, 4, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (35, 84, 1, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (36, 85, 3, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (37, 94, 5, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (38, 95, 7, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (39, 140, 8, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (40, 143, 9, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (41, 144, 9, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (42, 145, 10, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (43, 146, 11, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (44, 147, 13, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (45, 149, 55, NULL, NULL, NULL);
INSERT INTO `order_esdetail` VALUES (46, 151, 14, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for order_stdetail
-- ----------------------------
DROP TABLE IF EXISTS `order_stdetail`;
CREATE TABLE `order_stdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情表的id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `menu_id` int(11) NOT NULL COMMENT '菜品id',
  `menu_name` varchar(50) DEFAULT NULL COMMENT '菜品名称',
  `menu_price` decimal(10,2) DEFAULT NULL COMMENT '菜品金额',
  `menu_num` tinyint(4) DEFAULT NULL COMMENT '菜品的数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_stdetail
-- ----------------------------
BEGIN;
INSERT INTO `order_stdetail` VALUES (5, 34, 3, '红烧狮子头', 40.00, 2);
INSERT INTO `order_stdetail` VALUES (6, 35, 2, '黄焖排骨', 30.00, 10);
INSERT INTO `order_stdetail` VALUES (7, 36, 1, '黄焖鸡', 20.00, 3);
INSERT INTO `order_stdetail` VALUES (8, 37, 1, '黄焖鸡', 20.00, 2);
INSERT INTO `order_stdetail` VALUES (9, 38, 1, '黄焖鸡', 20.00, 4);
INSERT INTO `order_stdetail` VALUES (10, 48, 1, NULL, NULL, NULL);
INSERT INTO `order_stdetail` VALUES (11, 48, 3, NULL, NULL, NULL);
INSERT INTO `order_stdetail` VALUES (12, 48, 2, NULL, NULL, NULL);
INSERT INTO `order_stdetail` VALUES (13, 49, 1, NULL, NULL, NULL);
INSERT INTO `order_stdetail` VALUES (14, 49, 3, NULL, NULL, NULL);
INSERT INTO `order_stdetail` VALUES (15, 50, 1, NULL, NULL, NULL);
INSERT INTO `order_stdetail` VALUES (16, 50, 3, NULL, NULL, NULL);
INSERT INTO `order_stdetail` VALUES (17, 51, 1, NULL, NULL, NULL);
INSERT INTO `order_stdetail` VALUES (18, 51, 3, NULL, NULL, NULL);
INSERT INTO `order_stdetail` VALUES (19, 60, 1, '黄焖鸡', 20.00, 10);
INSERT INTO `order_stdetail` VALUES (20, 60, 2, '黄焖排骨', 30.00, 11);
INSERT INTO `order_stdetail` VALUES (21, 64, 2, '黄焖排骨', 30.00, 3);
INSERT INTO `order_stdetail` VALUES (22, 65, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (23, 66, 2, '黄焖排骨', 30.00, 4);
INSERT INTO `order_stdetail` VALUES (24, 67, 2, '黄焖排骨', 30.00, 4);
INSERT INTO `order_stdetail` VALUES (25, 70, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (26, 71, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (27, 72, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (28, 73, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (29, 74, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (30, 75, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (31, 77, 2, '黄焖排骨', 30.00, 5);
INSERT INTO `order_stdetail` VALUES (32, 78, 2, '黄焖排骨', 30.00, 5);
INSERT INTO `order_stdetail` VALUES (33, 79, 2, '黄焖排骨', 30.00, 5);
INSERT INTO `order_stdetail` VALUES (34, 80, 2, '黄焖排骨', 30.00, 5);
INSERT INTO `order_stdetail` VALUES (35, 81, 2, '黄焖排骨', 30.00, 5);
INSERT INTO `order_stdetail` VALUES (36, 82, 2, '黄焖排骨', 30.00, 5);
INSERT INTO `order_stdetail` VALUES (37, 83, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (38, 83, 3, '红烧狮子头', 40.00, 1);
INSERT INTO `order_stdetail` VALUES (39, 86, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (40, 86, 3, '红烧狮子头', 40.00, 5);
INSERT INTO `order_stdetail` VALUES (41, 86, 17, '洛天依的小龙包', 5.00, 1);
INSERT INTO `order_stdetail` VALUES (42, 86, 25, 'hondf', 123.00, 4);
INSERT INTO `order_stdetail` VALUES (43, 86, 14, '1', 1.00, 1);
INSERT INTO `order_stdetail` VALUES (44, 87, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (45, 87, 17, '洛天依的小龙包', 5.00, 1);
INSERT INTO `order_stdetail` VALUES (46, 87, 25, 'hondf', 123.00, 4);
INSERT INTO `order_stdetail` VALUES (47, 87, 3, '红烧狮子头', 40.00, 5);
INSERT INTO `order_stdetail` VALUES (48, 87, 14, '1', 1.00, 1);
INSERT INTO `order_stdetail` VALUES (49, 88, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (50, 88, 14, '1', 1.00, 1);
INSERT INTO `order_stdetail` VALUES (51, 88, 25, 'hondf', 123.00, 4);
INSERT INTO `order_stdetail` VALUES (52, 88, 17, '洛天依的小龙包', 5.00, 1);
INSERT INTO `order_stdetail` VALUES (53, 88, 3, '红烧狮子头', 40.00, 5);
INSERT INTO `order_stdetail` VALUES (54, 89, 25, 'hondf', 123.00, 2);
INSERT INTO `order_stdetail` VALUES (55, 90, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (56, 91, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (57, 92, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (58, 93, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (59, 97, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (60, 98, 2, '黄焖排骨', 30.00, 4);
INSERT INTO `order_stdetail` VALUES (61, 98, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (62, 99, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (63, 100, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (64, 101, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (65, 102, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (66, 103, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (67, 104, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (68, 105, 2, '黄焖排骨', 30.00, 3);
INSERT INTO `order_stdetail` VALUES (69, 105, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (70, 106, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (71, 106, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (72, 106, 3, '红烧狮子头', 40.00, 3);
INSERT INTO `order_stdetail` VALUES (73, 107, 3, '红烧狮子头', 40.00, 1);
INSERT INTO `order_stdetail` VALUES (74, 108, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (75, 109, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (76, 110, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (77, 111, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (78, 112, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (79, 113, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (80, 114, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (81, 114, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (82, 115, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (83, 115, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (84, 116, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (85, 117, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (86, 118, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (87, 120, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (88, 119, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (89, 121, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (90, 124, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (91, 122, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (92, 123, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (93, 125, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (94, 126, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (95, 127, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (96, 128, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (97, 129, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (98, 130, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (99, 131, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (100, 132, 3, '红烧狮子头', 40.00, 1);
INSERT INTO `order_stdetail` VALUES (101, 133, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (102, 134, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (103, 135, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (104, 136, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (105, 137, 2, '黄焖排骨', 30.00, 6);
INSERT INTO `order_stdetail` VALUES (106, 137, 26, '混沌蝴蝶', 10.00, 5);
INSERT INTO `order_stdetail` VALUES (107, 137, 25, 'hondf', 123.00, 2);
INSERT INTO `order_stdetail` VALUES (108, 137, 3, '红烧狮子头', 40.00, 1);
INSERT INTO `order_stdetail` VALUES (109, 138, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (110, 138, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (111, 138, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (112, 139, 2, '黄焖排骨', 30.00, 2);
INSERT INTO `order_stdetail` VALUES (113, 139, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (114, 141, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (115, 141, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (116, 141, 26, '混沌蝴蝶', 10.00, 6);
INSERT INTO `order_stdetail` VALUES (117, 142, 3, '红烧狮子头', 40.00, 2);
INSERT INTO `order_stdetail` VALUES (118, 142, 25, 'hondf', 123.00, 3);
INSERT INTO `order_stdetail` VALUES (119, 148, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (120, 148, 3, '红烧狮子头', 40.00, 2);
INSERT INTO `order_stdetail` VALUES (121, 148, 17, '洛天依的小龙包', 5.00, 2);
INSERT INTO `order_stdetail` VALUES (122, 150, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (123, 150, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (124, 152, 17, '洛天依的小龙包', 5.00, 2);
INSERT INTO `order_stdetail` VALUES (125, 152, 3, '红烧狮子头', 40.00, 3);
INSERT INTO `order_stdetail` VALUES (126, 153, 26, '混沌蝴蝶', 10.00, 1);
INSERT INTO `order_stdetail` VALUES (127, 153, 25, 'hondf', 123.00, 1);
INSERT INTO `order_stdetail` VALUES (128, 153, 2, '黄焖排骨', 30.00, 1);
INSERT INTO `order_stdetail` VALUES (129, 154, 3, '红烧狮子头', 40.00, 4);
COMMIT;

-- ----------------------------
-- Table structure for plaza
-- ----------------------------
DROP TABLE IF EXISTS `plaza`;
CREATE TABLE `plaza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `me_id` int(11) NOT NULL COMMENT '发送人【表情】',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  `content` text NOT NULL COMMENT '发送内容',
  `isSolook` tinyint(3) unsigned NOT NULL COMMENT '公开(默认)0,仅自己可见 1，互相关注可见 2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plaza
-- ----------------------------
BEGIN;
INSERT INTO `plaza` VALUES (1, 1, 1574169908, '测试测试！！！', 0);
INSERT INTO `plaza` VALUES (2, 2, 1574169908, '测试测试2！！', 0);
INSERT INTO `plaza` VALUES (3, 3, 1574251646, '测试测试3', 0);
INSERT INTO `plaza` VALUES (11, 1, 1574424445, '123123', 0);
INSERT INTO `plaza` VALUES (12, 1, 1574424929, '11', 0);
INSERT INTO `plaza` VALUES (13, 1, 1574425022, '测试测试！！！！！！！', 0);
INSERT INTO `plaza` VALUES (14, 1, 1574663561, 'sheng\'yu', 0);
COMMIT;

-- ----------------------------
-- Table structure for plazaimg
-- ----------------------------
DROP TABLE IF EXISTS `plazaimg`;
CREATE TABLE `plazaimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plaza_id` int(11) NOT NULL COMMENT '帖子id',
  `plaza_img` text NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plazaimg
-- ----------------------------
BEGIN;
INSERT INTO `plazaimg` VALUES (1, 1, 'http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg');
INSERT INTO `plazaimg` VALUES (2, 2, 'http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg');
INSERT INTO `plazaimg` VALUES (3, 3, 'http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg,http://img95.699pic.com/photo/50055/5642.jpg_wh300.jpg');
INSERT INTO `plazaimg` VALUES (4, 11, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/OfkCvILGknmipl7h.jpeg,http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/smcZvBKNnfNswMfB.jpg');
INSERT INTO `plazaimg` VALUES (5, 12, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/9X6wBDfT8JdU6jrX.jpeg,http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/7Y6lSN5tatskZXjf.jpg');
INSERT INTO `plazaimg` VALUES (6, 13, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/dWgEx1oWbxh9Uaw3.jpeg');
INSERT INTO `plazaimg` VALUES (7, 14, '');
COMMIT;

-- ----------------------------
-- Table structure for plazalike
-- ----------------------------
DROP TABLE IF EXISTS `plazalike`;
CREATE TABLE `plazalike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `me_id` int(11) NOT NULL COMMENT '本人Id',
  `like_id` int(11) NOT NULL COMMENT '点赞人id',
  `plaza_id` int(11) NOT NULL COMMENT '帖子的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plazalike
-- ----------------------------
BEGIN;
INSERT INTO `plazalike` VALUES (1, 1, 2, 1);
INSERT INTO `plazalike` VALUES (2, 2, 1, 2);
INSERT INTO `plazalike` VALUES (3, 3, 3, 3);
INSERT INTO `plazalike` VALUES (5, 1, 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for plazareview
-- ----------------------------
DROP TABLE IF EXISTS `plazareview`;
CREATE TABLE `plazareview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plaza_id` int(11) NOT NULL COMMENT '帖子id',
  `commont_id` int(11) NOT NULL COMMENT '评论人id',
  `message` text NOT NULL COMMENT '评论内容',
  `beCommont_id` int(11) NOT NULL COMMENT '被评论人id',
  `plaza_time` int(11) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plazareview
-- ----------------------------
BEGIN;
INSERT INTO `plazareview` VALUES (1, 1, 1, '写的真好', 3, 1574316953);
INSERT INTO `plazareview` VALUES (2, 1, 3, '谢谢', 1, 1574316950);
INSERT INTO `plazareview` VALUES (3, 1, 1, '不谢', 3, 1574316951);
INSERT INTO `plazareview` VALUES (4, 1, 2, 'nice', 1, 1574316910);
INSERT INTO `plazareview` VALUES (5, 1, 4, '真不错', 1, 1574316910);
INSERT INTO `plazareview` VALUES (6, 1, 4, '最佳好评', 1, 1574316910);
INSERT INTO `plazareview` VALUES (9, 1, 1, '123', 1, 1574344850);
INSERT INTO `plazareview` VALUES (10, 1, 1, '1', 1, 1574393054);
INSERT INTO `plazareview` VALUES (11, 1, 1, '2019/11/25 6.17 真的冷', 1, 1574633874);
INSERT INTO `plazareview` VALUES (12, 1, 1, '2019/11/25 6.17 真的冷', 1, 1574633878);
INSERT INTO `plazareview` VALUES (13, 3, 1, '213', 3, 1574636540);
INSERT INTO `plazareview` VALUES (14, 1, 1, '12', 1, 1574636662);
COMMIT;

-- ----------------------------
-- Table structure for self_tag
-- ----------------------------
DROP TABLE IF EXISTS `self_tag`;
CREATE TABLE `self_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `tag_our_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '我的个人tag',
  `tag_games_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '我的游戏tag',
  `tag_sport_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '体育tag',
  `tag_music_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '音乐tag',
  `tag_foods_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '食物tag',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of self_tag
-- ----------------------------
BEGIN;
INSERT INTO `self_tag` VALUES (1, '文静淑女,理性派,萌妹子,善解人意,极品吃货,敢爱敢恨,随性,直率,无趣,可以话痨,热血少年,多变,文艺精致,慢热,脾气好,安静,好奇心,笑点低,奇妙性格,独立,开朗,骑车,健身,漫步,篮球,台球,宅,蹦床,排球,小巧,可爱,啦,234,贱,卡爱,拉拉,开啊,商量,12,可爱的人,我爱你,23,23,哈哈,二次元,小辣鸡,222', '极品飞车,qq炫舞,王者荣耀,吃鸡,刺激战场,梦幻西游,剑仙3,一起来捉妖,三国杀,王振,23,卡爱', '骑车,健身,漫步,篮球,台球,宅,蹦床,排球,橄榄球,22,23,21,11', '民谣,古典,张国荣,林宥嘉,流行,爵士乐,民谣,周杰伦,华宇晨,李荣浩,一见倾心', '民谣,古典,张国荣,林宥嘉,流行,爵士乐,民谣,周杰伦,华宇晨,李荣浩,一见倾心,曲婉莹', 1);
INSERT INTO `self_tag` VALUES (2, '文静淑女,理性派,萌妹子,善解人意,极品吃货,敢爱敢恨,随性,直率,无趣,可以话痨,热血少年,多变,文艺精致,慢热,脾气好,安静,好奇心,笑点低,奇妙性格,独立,开朗,骑车,健身,漫步,篮球,台球,宅,蹦床,排球', '极品飞车,qq炫舞,王者荣耀,吃鸡,刺激战场,梦幻西游,剑仙3,一起来捉妖,三国杀', '骑车,健身,漫步,篮球,台球,宅,蹦床,排球', '民谣,古典,张国荣,林宥嘉,流行,爵士乐,民谣,周杰伦,华宇晨,李荣浩', '方便面,鸡啤酒,卤肉饭,石锅拌饭,韩国料理,寿司,炸鸡,烤串,牛排,火锅,鸡翅,麻辣香锅,粤菜,东北菜,巧克力,麻小', 2);
INSERT INTO `self_tag` VALUES (3, '文静淑女,理性派,萌妹子,善解人意,极品吃货,敢爱敢恨,随性,直率,无趣,可以话痨,热血少年,多变,文艺精致,慢热,脾气好,安静,好奇心,笑点低,奇妙性格,独立,开朗,骑车,健身,漫步,篮球,台球,宅,蹦床,排球', '极品飞车,qq炫舞,王者荣耀,吃鸡,刺激战场,梦幻西游,剑仙3,一起来捉妖,三国杀', '骑车,健身,漫步,篮球,台球,宅,蹦床,排球', '民谣,古典,张国荣,林宥嘉,流行,爵士乐,民谣,周杰伦,华宇晨,李荣浩', '方便面,鸡啤酒,卤肉饭,石锅拌饭,韩国料理,寿司,炸鸡,烤串,牛排,火锅,鸡翅,麻辣香锅,粤菜,东北菜,巧克力,麻小', 3);
INSERT INTO `self_tag` VALUES (4, '文静淑女,理性派,萌妹子,善解人意,极品吃货,敢爱敢恨,随性,直率,无趣,可以话痨,热血少年,多变,文艺精致,慢热,脾气好,安静,好奇心,笑点低,奇妙性格,独立,开朗,骑车,健身,漫步,篮球,台球,宅,蹦床,排球', '极品飞车,qq炫舞,王者荣耀,吃鸡,刺激战场,梦幻西游,剑仙3,一起来捉妖,三国杀', '骑车,健身,漫步,篮球,台球,宅,蹦床,排球', '民谣,古典,张国荣,林宥嘉,流行,爵士乐,民谣,周杰伦,华宇晨,李荣浩', '方便面,鸡啤酒,卤肉饭,石锅拌饭,韩国料理,寿司,炸鸡,烤串,牛排,火锅,鸡翅,麻辣香锅,粤菜,东北菜,巧克力,麻小', 4);
INSERT INTO `self_tag` VALUES (5, '文静淑女,理性派,萌妹子,善解人意,极品吃货,敢爱敢恨,随性,直率,无趣,可以话痨,热血少年,多变,文艺精致,慢热,脾气好,安静,好奇心,笑点低,奇妙性格,独立,开朗,骑车,健身,漫步,篮球,台球,宅,蹦床,排球', '极品飞车,qq炫舞,王者荣耀,吃鸡,刺激战场,梦幻西游,剑仙3,一起来捉妖,三国杀', '骑车,健身,漫步,篮球,台球,宅,蹦床,排球', '民谣,古典,张国荣,林宥嘉,流行,爵士乐,民谣,周杰伦,华宇晨,李荣浩', '方便面,鸡啤酒,卤肉饭,石锅拌饭,韩国料理,寿司,炸鸡,烤串,牛排,火锅,鸡翅,麻辣香锅,粤菜,东北菜,巧克力,麻小', 5);
COMMIT;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '二手商品id',
  `shop_name` varchar(50) NOT NULL COMMENT '商品名称',
  `shop_describe` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `shop_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `shop_img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `shop_unit` varchar(10) NOT NULL COMMENT '计量单位 为什么什么一斤等',
  `user_id` int(11) NOT NULL COMMENT '发布者id',
  `buys` tinyint(4) NOT NULL COMMENT '0:为未卖出\r\n1:为卖出\r\n默认为0\r\n\r\n',
  `shop_original_cost` decimal(10,2) NOT NULL COMMENT '商品原价',
  `shop_num_new` tinyint(1) NOT NULL COMMENT '商品新旧程度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
BEGIN;
INSERT INTO `shop` VALUES (1, 'Apple iPhone X 256GB 深空灰色 移动联通电信4G手机', '因为他快乐', 89800.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '个', 10, 1, 0.00, 0);
INSERT INTO `shop` VALUES (2, 'Apple iPad 平板电脑 2018年新款9.7英寸', '啊啊擦撒', 10.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '个', 12, 1, 0.00, 0);
INSERT INTO `shop` VALUES (3, 'Apple MacBook Pro 13.3英寸笔记本电脑（2017款Core i5处理器/8GB', '发我发撒', 5.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '双', 11, 1, 0.00, 0);
INSERT INTO `shop` VALUES (4, '微软（Microsoft）新Surface Pro 二合一', '下载程序的', 2.00, 'https://img-cdn-http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '件', 13, 1, 0.00, 0);
INSERT INTO `shop` VALUES (5, 'Apple Watch Series 3智能手表（GPS款 42毫米 ', '收到VS VS发', 3423.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '个', 14, 1, 0.00, 0);
INSERT INTO `shop` VALUES (7, '王永红电脑', '反复擦我擦我大苏打实打实大苏打实打实的', 423.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '个', 13, 1, 0.00, 0);
INSERT INTO `shop` VALUES (8, '王永红牌脑残片', '吃了以后一片更比六片强', 998.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '盒', 12, 1, 0.00, 0);
INSERT INTO `shop` VALUES (9, '是文博', '史上最帅的男人之一', 9.90, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '1个', 17, 1, 9999999.00, 9);
INSERT INTO `shop` VALUES (10, '是文博', '史上最帅的男人之一', 9.90, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '1个', 17, 1, 9999999.00, 9);
INSERT INTO `shop` VALUES (11, '李雨晨', '史上最丑的傻逼之一', 1.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '1只', 17, 1, 5.00, 9);
INSERT INTO `shop` VALUES (12, '李雨晨', '史上最丑的傻逼之一', 1.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '1只', 17, 0, 5.00, 9);
INSERT INTO `shop` VALUES (13, '王永红', '史上最笨的笨蛋', 2.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '一只', 17, 1, 99.00, 9);
INSERT INTO `shop` VALUES (14, '王永红', '史上最笨的笨蛋', 2.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '一只', 17, 1, 99.00, 9);
INSERT INTO `shop` VALUES (15, '王永红', '史上最笨的笨蛋', 2.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '一只', 17, 0, 99.00, 9);
INSERT INTO `shop` VALUES (16, '王永红', '史上最笨的笨蛋', 2.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '一只', 17, 0, 99.00, 9);
INSERT INTO `shop` VALUES (17, '123', '3123', 31.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '31', 17, 0, 312.00, 1);
INSERT INTO `shop` VALUES (18, '搞好', '2312', 44.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '一个', 17, 0, 99.00, 5);
INSERT INTO `shop` VALUES (19, '搞好', '2312', 44.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '一个', 17, 0, 99.00, 5);
INSERT INTO `shop` VALUES (20, '搞好', '2312', 44.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '一个', 17, 0, 99.00, 5);
INSERT INTO `shop` VALUES (21, '搞好', '2312', 44.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '一个', 17, 0, 99.00, 5);
INSERT INTO `shop` VALUES (22, '1231', '312', 231123.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '11', 17, 0, 213123.00, 3);
INSERT INTO `shop` VALUES (23, '23123', '21313', 312.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '312', 17, 0, 3123.00, 3);
INSERT INTO `shop` VALUES (24, 'qweqweqweqwe', '12312321312', 12.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '12', 17, 0, 12.00, 1);
INSERT INTO `shop` VALUES (25, 'qweqweqweqwe', '12312321312', 12.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '12', 17, 0, 12.00, 1);
INSERT INTO `shop` VALUES (27, '3313', '123123', 312.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '123', 17, 8, 3123.00, 3);
INSERT INTO `shop` VALUES (28, '3123', '3123', 3123.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '13', 17, 8, 1313.00, 3);
INSERT INTO `shop` VALUES (29, '3123', '3123', 312.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '312', 17, 8, 312.00, 3);
INSERT INTO `shop` VALUES (30, 'bcb', 'cvb', 67.00, '//img30.360buyimg.com/mobilecms/s140x140_jfs/t1/90256/11/3042/174398/5ddcaa02E0d809c90/94e8ac1c3c8d5206.jpg.webp', '67', 17, 8, 67.00, 6);
INSERT INTO `shop` VALUES (31, 'jkjljklj', 'jkljklkjjk', 78787.00, '//img30.360buyimg.com/mobilecms/s140x140_jfs/t1/90256/11/3042/174398/5ddcaa02E0d809c90/94e8ac1c3c8d5206.jpg.webp', '8', 17, 8, 787.00, 8);
INSERT INTO `shop` VALUES (32, '31', '3123', 3123.00, '//img30.360buyimg.com/mobilecms/s140x140_jfs/t1/90256/11/3042/174398/5ddcaa02E0d809c90/94e8ac1c3c8d5206.jpg.webp', '31', 17, 0, 31.00, 3);
INSERT INTO `shop` VALUES (33, 'e31', '312', 312.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png//img30.360buyimg.com/mobilecms/s140x140_jfs/t1/90256/11/3042/174398/5ddcaa02E0d809c90/94e8ac1c3c8d5206.jpg.webp', '31', 17, 0, 312.00, 3);
INSERT INTO `shop` VALUES (34, '313', '3123', 31.00, '//img30.360buyimg.com/mobilecms/s140x140_jfs/t1/90256/11/3042/174398/5ddcaa02E0d809c90/94e8ac1c3c8d5206.jpg.webp', '312', 17, 0, 312.00, 3);
INSERT INTO `shop` VALUES (35, '312', '312', 312.00, '//img30.360buyimg.com/mobilecms/s140x140_jfs/t1/90256/11/3042/174398/5ddcaa02E0d809c90/94e8ac1c3c8d5206.jpg.webp', '312', 17, 0, 31.00, 3);
INSERT INTO `shop` VALUES (36, '31', '3123', 312.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '312', 17, 0, 312.00, 3);
INSERT INTO `shop` VALUES (37, '2q', '312', 312.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '31', 17, 0, 31.00, 1);
INSERT INTO `shop` VALUES (38, '31', '312', 312.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '31', 17, 0, 312.00, 3);
INSERT INTO `shop` VALUES (39, '123213', '123213123', 123.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '1', 17, 0, 123.00, 1);
INSERT INTO `shop` VALUES (40, '123', '123', 1.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '1', 17, 0, 1.00, 1);
INSERT INTO `shop` VALUES (41, '23', '23', 1.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '', 17, 0, 1.00, 3);
INSERT INTO `shop` VALUES (42, '312', '3123', 312.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '31', 17, 8, 312.00, 3);
INSERT INTO `shop` VALUES (43, '312', '312', 312.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '31', 17, 8, 312312.00, 1);
INSERT INTO `shop` VALUES (44, '312', '312', 312.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '31', 17, 8, 31.00, 3);
INSERT INTO `shop` VALUES (45, '312', '312', 312.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '3121', 17, 0, 31.00, 3);
INSERT INTO `shop` VALUES (46, '312', '31', 31.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '31', 17, 0, 321.00, 3);
INSERT INTO `shop` VALUES (47, '312', '312', 31.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '312', 17, 0, 31.00, 3);
INSERT INTO `shop` VALUES (48, '31', '312', 312.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '31', 17, 0, 312.00, 3);
INSERT INTO `shop` VALUES (49, '哇好难过', '123123123', 300.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '1', 17, 0, 500.00, 8);
INSERT INTO `shop` VALUES (50, '王海龙', '大沙碉', 1.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '1', 17, 0, 1.00, 10);
INSERT INTO `shop` VALUES (51, '1', '1', 1.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '1', 17, 0, 1.00, 1);
INSERT INTO `shop` VALUES (52, '1', '1', 1.00, '//img20.360buyimg.com/babel/s190x240_jfs/t1/103048/40/4203/26730/5de605deEf51eb1f7/4a86e25a2ac781e6.png!cc_190x240.webp', '1', 17, 0, 1.00, 1);
INSERT INTO `shop` VALUES (53, '1', '1', 1.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/fUjTlQJCn5hwNxmB.png', '1', 17, 0, 1.00, 1);
INSERT INTO `shop` VALUES (54, '1', '1', 1.00, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/bHrq0M5uNmWEVbHw.png', '1', 17, 0, 1.00, 1);
INSERT INTO `shop` VALUES (55, '1', '1', 1.00, '//img30.360buyimg.com/mobilecms/s140x140_jfs/t1/90256/11/3042/174398/5ddcaa02E0d809c90/94e8ac1c3c8d5206.jpg.webp', '1', 17, 1, 1.00, 1);
COMMIT;

-- ----------------------------
-- Table structure for shopimg
-- ----------------------------
DROP TABLE IF EXISTS `shopimg`;
CREATE TABLE `shopimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '商品id',
  `shop_img` varchar(255) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopimg
-- ----------------------------
BEGIN;
INSERT INTO `shopimg` VALUES (1, 55, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/PNiKJiGiwREu46VH.png');
INSERT INTO `shopimg` VALUES (2, 55, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/yAuCBLeu9nMQ1S3M.png');
INSERT INTO `shopimg` VALUES (3, 3, 'http://zhangchaotang.oss-cn-beijing.aliyuncs.com/banana/yAuCBLeu9nMQ1S3M.png');
COMMIT;

-- ----------------------------
-- Table structure for stcare
-- ----------------------------
DROP TABLE IF EXISTS `stcare`;
CREATE TABLE `stcare` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食堂购物车id',
  `menu_id` int(11) NOT NULL COMMENT '食堂商品id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `menu_num` tinyint(4) unsigned NOT NULL COMMENT '商品数量',
  `menu_check` tinyint(4) NOT NULL COMMENT '商品选中默认为 0 补选中\r\n1为选中\r\n',
  `stuser_id` int(11) NOT NULL COMMENT '食堂商铺用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stclassify
-- ----------------------------
DROP TABLE IF EXISTS `stclassify`;
CREATE TABLE `stclassify` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜谱分类id',
  `name` varchar(30) NOT NULL COMMENT '菜谱分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stclassify
-- ----------------------------
BEGIN;
INSERT INTO `stclassify` VALUES (1, '川菜');
INSERT INTO `stclassify` VALUES (3, '湘菜');
INSERT INTO `stclassify` VALUES (4, '浙菜');
INSERT INTO `stclassify` VALUES (5, '鲁菜');
INSERT INTO `stclassify` VALUES (6, '闽菜');
INSERT INTO `stclassify` VALUES (7, '苏菜');
INSERT INTO `stclassify` VALUES (8, '浙菜');
INSERT INTO `stclassify` VALUES (11, '鲁菜');
INSERT INTO `stclassify` VALUES (12, '鲁菜');
COMMIT;

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户权限表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `auth_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_auth
-- ----------------------------
BEGIN;
INSERT INTO `user_auth` VALUES (1, 18, 1);
INSERT INTO `user_auth` VALUES (2, 19, 2);
COMMIT;

-- ----------------------------
-- Table structure for user_list
-- ----------------------------
DROP TABLE IF EXISTS `user_list`;
CREATE TABLE `user_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `childs` varchar(60) NOT NULL,
  `router` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_list
-- ----------------------------
BEGIN;
INSERT INTO `user_list` VALUES (17, '王海龙', '食堂管理', 'menuList');
INSERT INTO `user_list` VALUES (20, '高浩', '商品订单', 'ShopOrder');
INSERT INTO `user_list` VALUES (21, '王海龙', '分类管理', 'menuClassify');
INSERT INTO `user_list` VALUES (22, '王海龙', '窗口管理', 'winList');
INSERT INTO `user_list` VALUES (24, '张朝堂', '订单显示', 'ordersShow');
INSERT INTO `user_list` VALUES (25, '师文博', '商品管理', 'shop');
INSERT INTO `user_list` VALUES (26, '师文博', '商品分类管理', 'esclassfiy');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) DEFAULT '默认用户' COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '用户密码',
  `phone` char(11) NOT NULL COMMENT '用户手机号',
  `head_img` varchar(255) DEFAULT NULL COMMENT '用户图片路径',
  `sex` tinyint(3) DEFAULT NULL COMMENT '用户性别  0 ：女 1：男 2：保密',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  `school` varchar(25) DEFAULT NULL COMMENT '学校名称',
  `birthday` int(10) DEFAULT NULL COMMENT '生日',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '钱包',
  `sign` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '签名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, '往事如风', '123456', '13778424516', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3398098025,531958352&fm=26&gp=0.jpg', 1, 1574047083, '北京大学', 0, 9997730.30, '如果我是dj，你们会爱我吗？不会');
INSERT INTO `users` VALUES (2, '轻舞飞扬', '123321', '18502866256', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2852465323,1772350090&fm=26&gp=0.jpg', NULL, 1574047083, '传智专修学院', NULL, 99936.00, '');
INSERT INTO `users` VALUES (3, 'CheSir', '123321', '13387063359', 'https://ossweb-img.qq.com/images/lol/web201310/skin/big21003.jpg', NULL, 1574058869, NULL, NULL, 999999.00, '');
INSERT INTO `users` VALUES (4, 'GaoSir', '123321', '13387069970', 'https://ossweb-img.qq.com/images/lol/web201310/skin/big21004.jpg', NULL, 1574058869, NULL, NULL, 999999.00, '');
INSERT INTO `users` VALUES (5, '马爸爸', '123456', '19998888777', 'https://ossweb-img.qq.com/images/lol/web201310/skin/big21009.jpg', NULL, 1590155661, NULL, NULL, 99999.00, '');
INSERT INTO `users` VALUES (17, 'myiszz', '123456', '12312312322', NULL, NULL, 1544233333, NULL, NULL, 99999.00, '');
INSERT INTO `users` VALUES (18, 'myiszz', '8f7a1ad5def509603171f268246f23f1', '12312312311', NULL, NULL, 1574148307, NULL, NULL, 99999.00, '');
INSERT INTO `users` VALUES (19, 'laoban', '8f7a1ad5def509603171f268246f23f1', '123', NULL, NULL, 1231231231, NULL, NULL, 99999.00, NULL);
COMMIT;

-- ----------------------------
-- Table structure for win
-- ----------------------------
DROP TABLE IF EXISTS `win`;
CREATE TABLE `win` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食堂窗口id',
  `win_name` varchar(30) NOT NULL COMMENT '窗口名称',
  `win_start` datetime DEFAULT NULL COMMENT '开放时间',
  `win_end` datetime DEFAULT NULL COMMENT '关闭时间',
  `users_id` int(11) NOT NULL COMMENT '用户id。要求用户的权限为食堂用户',
  `win_inter` varchar(255) DEFAULT NULL COMMENT '窗口的介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of win
-- ----------------------------
BEGIN;
INSERT INTO `win` VALUES (1, '西红柿馆', '2019-11-18 19:52:30', '2019-11-19 19:52:34', 1, '专为西红柿的所有菜品');
INSERT INTO `win` VALUES (2, '土豆馆', '2019-11-25 19:52:41', '2019-11-25 19:52:47', 1, '为土豆打造绝世美味');
INSERT INTO `win` VALUES (3, '黄瓜馆', '2019-11-18 19:52:51', '2019-11-19 19:52:54', 1, '让其为世家珍贵');
INSERT INTO `win` VALUES (4, '肉馆', '2019-11-25 19:52:57', '2019-11-25 19:53:00', 1, '体验人间天堂');
INSERT INTO `win` VALUES (6, '天蚕土豆', '2019-11-25 15:34:19', '2019-11-25 18:36:15', 1, '美味的天蚕土豆让您；飘飘欲醉');
INSERT INTO `win` VALUES (7, '天蚕土豆', '2019-11-25 14:36:36', '2019-11-25 18:36:39', 1, '美味的土豆让您飘飘欲醉');
INSERT INTO `win` VALUES (8, '天蚕土豆馆', '2019-11-25 15:38:32', '2019-11-25 18:38:34', 1, '专门为土豆所做的餐馆');
INSERT INTO `win` VALUES (9, '牛肉馆', '2019-11-25 17:03:07', '2019-11-25 17:03:09', 1, '牛牛的辣椒一定要多加');
INSERT INTO `win` VALUES (10, 'jfasd', '2019-11-25 23:39:10', '2019-11-25 23:45:10', 1, 'djsdj');
INSERT INTO `win` VALUES (11, '老王炒饭', '2019-11-25 01:26:47', '2019-11-25 01:27:51', 1, '至尊炒饭');
INSERT INTO `win` VALUES (12, '一号', '2019-11-25 00:00:00', '2019-11-25 09:09:55', 1, '无');
COMMIT;

-- ----------------------------
-- Table structure for win_menu
-- ----------------------------
DROP TABLE IF EXISTS `win_menu`;
CREATE TABLE `win_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '窗口-菜品id',
  `win_id` int(11) NOT NULL COMMENT '窗口id',
  `stclassify_id` int(11) NOT NULL COMMENT '分类id',
  `menu_id` int(11) NOT NULL COMMENT '菜品id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of win_menu
-- ----------------------------
BEGIN;
INSERT INTO `win_menu` VALUES (1, 1, 1, 1, 1);
INSERT INTO `win_menu` VALUES (2, 1, 1, 2, 1);
INSERT INTO `win_menu` VALUES (3, 1, 3, 3, 1);
INSERT INTO `win_menu` VALUES (4, 2, 5, 3, 2);
INSERT INTO `win_menu` VALUES (5, 2, 4, 3, 2);
INSERT INTO `win_menu` VALUES (6, 2, 1, 3, 2);
INSERT INTO `win_menu` VALUES (7, 3, 3, 1, 3);
INSERT INTO `win_menu` VALUES (8, 3, 2, 2, 3);
INSERT INTO `win_menu` VALUES (9, 3, 4, 3, 3);
INSERT INTO `win_menu` VALUES (10, 5, 2, 13, 1);
INSERT INTO `win_menu` VALUES (11, 2, 2, 14, 1);
INSERT INTO `win_menu` VALUES (12, 8, 4, 15, 1);
INSERT INTO `win_menu` VALUES (13, 4, 1, 16, 1);
INSERT INTO `win_menu` VALUES (14, 2, 1, 17, 1);
INSERT INTO `win_menu` VALUES (15, 1, 1, 25, 1);
INSERT INTO `win_menu` VALUES (16, 5, 7, 4, 1);
INSERT INTO `win_menu` VALUES (17, 5, 8, 6, 1);
INSERT INTO `win_menu` VALUES (18, 4, 5, 4, 1);
INSERT INTO `win_menu` VALUES (19, 1, 1, 26, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
