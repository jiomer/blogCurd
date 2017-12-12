/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-12-13 00:03:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blogid` int(20) NOT NULL AUTO_INCREMENT,
  `blogtitle` varchar(50) DEFAULT NULL,
  `article` varchar(10000) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('11', 'Hello World!', '<p>带上耳机..</p>\r\n\r\n<p>迎着这有点干燥的秋风...</p>\r\n\r\n<p>渐渐地喜欢独自一人带着这疲惫的身躯...</p>\r\n\r\n<p>逛着只剩2个月的校园...</p>\r\n\r\n<p>感叹着时间的匆匆...</p>\r\n\r\n<p>回忆着过去的往事...</p>\r\n\r\n<p>而我的身影也会越来越消极?</p>\r\n\r\n<hr />\r\n<p>人生应该就像一段编程...</p>\r\n\r\n<p>因为不同的人生经历...</p>\r\n\r\n<p>程序也会存在各种的bug...</p>\r\n\r\n<p>需要我们不断优化自身算法、除去身边的bug、不断添加函数的过程...</p>\r\n\r\n<p>我们刚出生那一刻，上天只给了我们一个程序的入口----主函数(人生的类)</p>\r\n\r\n<p>同时为我们定义了两个自带的方法一个是哭()，以及一个是活着()</p>\r\n\r\n<p>而有的人却因为缺少程序入口而夭折...</p>\r\n\r\n<p>小时候我们不断的使用哭这一方法，返回值却是js的var型或是php的$</p>\r\n\r\n<p>因为我们的哭，会给我们带来各种各样的结果，每个结果，都会对我们产生不同的影响。</p>\r\n\r\n<p>每个人都有自己的生活轨迹，每个人，也都有自己独特的方。</p>\r\n\r\n<p>有时候，我们会去ctrl+c别人的生活方式，再 ctrl+v 到自己的主体中来，却发现，在别人那运行好好的代码，来到自己身上却存在n个bug...</p>\r\n\r\n<p>也难怪，对象都不同，变量又怎么能通用呢</p>\r\n\r\n<p>我们不断往自己的主体中添加各种各样的方法，却从不管自身的稳定性。</p>\r\n\r\n<p>有时候，并不是知道越多越好</p>\r\n\r\n<p>相反，拥有得越少，人生运行得反而更快</p>\r\n\r\n<p>因为程序存在这很多种分支，正如人生有很多十字路口...</p>\r\n\r\n<p>小学时 if（you are clever）{获得老师赞赏，同学亲近}else{缺少朋友}</p>\r\n\r\n<p>高考时刻 &nbsp;if（得到好的成绩）{上大学} else{去打工}</p>\r\n\r\n<p>当然了，并不是说就一定去打工，只不过这里讨论的是大多数而已</p>\r\n\r\n<p>时间一年一年流逝，程序一行一行执行，期间必然会遇到各种各样的问题...</p>\r\n\r\n<p>有的人，走偏了，还能回来，而有的人，却进入了个无限递归的死循环</p>\r\n\r\n<p>最终以爆栈结束了整个程序，也结束了整个人生。</p>\r\n\r\n<p>每个人都有自己的计划，人们用广搜决定了自己的人生，再用深搜去过着每一天</p>\r\n\r\n<p>但并不是每个人都是算法高手，有的人深搜能回来，有的人却没能定义好自己的回溯条件。</p>\r\n\r\n<p>生活就像boolean，并每道题都能一个true/false的结果，如果返回了false对你的人生也并不是一件坏事。</p>\r\n\r\n<p>面对考试，我们为自己定义了一系列封装好的类，里面有考试作弊技巧，或者是自己的所有复习知识点等等，遇到考试时，便直接调用</p>\r\n\r\n<p>遇到面试，我们已将面试官要问的各种问题都AI式的准备好了关键词自动回答</p>\r\n\r\n<p>我们生活的每一天，仿佛都是在for循环过一天()这样的方法而已，日服一日，年复一年，永远不知道循环什么时候结束，也永远不知道程序什么时候崩溃。</p>\r\n\r\n<p>大部分人都认为程序员很难找到对象，却不知道我们每天都得花十几个小时在某个对象身上，毕竟自己new出来的对象，跪着也要把bug找出来</p>\r\n\r\n<p>我们就这样一直生活着，直到某一天我们遇到了另一段程序，彼此间互相调用其内部的方法，不分彼此。</p>\r\n\r\n<p>为对方提供着自己的interface，但并不是每个interface都是稳定的，或许她会看上别的object，最终离你而去。</p>\r\n\r\n<p>并不是每个函数都会抛出exception，也并不是你的每一个决定都会有人提示你是好是坏</p>\r\n\r\n<p>最终的结果，也只有你最后执行junit中的@Test方法，实行了单元测试后你才会知道结果是否报错</p>\r\n\r\n<p>我们人生不断的运行着，好似每天的任务都规定死了...</p>\r\n\r\n<p>学生就是:吃饭，睡觉，学习...</p>\r\n\r\n<p>工作者就是:吃饭,睡觉，工作...</p>\r\n\r\n<p>吃饭和睡觉这两大方法，我们从我们祖先那继承得倒是挺不错的</p>\r\n\r\n<p>不仅仅继承了，还扩展了各式各样的吃法，以及各式各样的睡法。</p>\r\n\r\n<p>有少部分人想要强行hack别人的主体，于是乎，便衍生了犯罪</p>\r\n\r\n<p>人人都想自己的程序稳定运行，因为这个程序，只有你自己才能好好调试，别人的代码，永远只是适合来参考</p>\r\n\r\n<p>我们的吃喝拉撒都是循环着进行的</p>\r\n\r\n<p>若某天的突发状况，不正是中断处理程序吗?</p>\r\n\r\n<p>有时候，同一时间段，你会进行着各式各样的工作，多个线程的运行，会让你不堪重负，你想删掉其中某个</p>\r\n\r\n<p>却发现它们之间有着千丝万缕的关系</p>\r\n\r\n<p>但你却不知道，有时候放弃，也是一直用收获。</p>\r\n\r\n<p>自己的程序是由自己一步一歩调试运维而来的</p>\r\n\r\n<p>自己设计的算法，需要自己的不断剪枝与修改来完善的</p>\r\n\r\n<p>适当的回溯，才不会让你陷入死循环，重新回到自己的主体，做回自己。</p>\r\n\r\n<p>随着时间的推移，我们越来越少的调用哭泣这一方法</p>\r\n\r\n<p>更多的，我们擅长于伪装，谎言，以及猜测</p>\r\n\r\n<p>这也许也是人生多姿多彩的地方吧</p>\r\n\r\n<p>若人生只是一段程序，我们应该写出自己的curd</p>\r\n\r\n<p>若人生只是一段程序，我们更应该自己完善好自己</p>\r\n\r\n<p>若人生只是一段程序，我们则要时时警醒自己，防止病毒的入侵，以及深搜的无止境...</p>\r\n\r\n<p><a href=\"http://qn.199604.com/wp-content/uploads/2017/10/you3-277x300.jpg\" target=\"_blank\"><img alt=\"\" src=\"http://qn.199604.com/wp-content/uploads/2017/10/you3-277x300.jpg\" style=\"height:300px; width:277px\" /></a></p>\r\n', '2017-11-12');
INSERT INTO `blog` VALUES ('12', 'xxx', 'xxxx', '2017-11-05');
INSERT INTO `blog` VALUES ('13', 'test13-update', '<p>test13-updatetime</p>\r\n', '	2017-11-15');
INSERT INTO `blog` VALUES ('14', 'test', 'test', '2017-11-05');
INSERT INTO `blog` VALUES ('15', 'test', 'test', '2017-11-05');
INSERT INTO `blog` VALUES ('16', 'test', 'test', '2017-11-05');
INSERT INTO `blog` VALUES ('17', 'test', 'test', '2017-11-05');
INSERT INTO `blog` VALUES ('18', 'test', 'test', '2017-11-05');
INSERT INTO `blog` VALUES ('19', 'test', 'test', '2017-11-05');
INSERT INTO `blog` VALUES ('20', 'test', 'test', '2017-11-05');
INSERT INTO `blog` VALUES ('21', 'test', 'test', '2017-11-05');
INSERT INTO `blog` VALUES ('25', 'Hello World!-update', '<p>Hello World!-update</p>\r\n', '2017-11-15');
INSERT INTO `blog` VALUES ('34', 'ss', '<p>ss</p>\r\n', '2017-11-15');
INSERT INTO `blog` VALUES ('35', '代码', '<p><!--?xml version=\"1.0\" encoding=\"UTF-8\"?--><br />\r\n&nbsp; &nbsp; sss<br />\r\n&nbsp; &nbsp; <!-- 配置数据源 <br />\r\n    <bean id=\"dataSource\"<br />\r\n        class=\"org.springframework.jdbc.datasource.DriverManagerDataSource\"><br />\r\n        <property name=\"driverClassName\" value=\"com.mysql.jdbc.Driver\" /><br />\r\n        <property name=\"url\" value=\"jdbc:mysql://localhost:3306/blog?useUnicode=true&amp;characterEncoding=UTF-8\" /><br />\r\n        <property name=\"username\" value=\"root\" /><br />\r\n        <property name=\"password\" value=\"root\" /><br />\r\n    </bean> --><br />\r\n&nbsp; &nbsp; <!-- Druid连接池 --><br />\r\n&nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; <!-- 基本属性 url、user、password --><br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; <!-- MyBatis 的 SqlSession 的工厂，并引用数据源，扫描 MyBatis 的配置文件 --><br />\r\n&nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; <!-- 别名 --><br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; <!-- 指定mybatis全局配置文件的位置 --><br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; <!-- 指定mybatis，mapper文件的位置 --><br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; <!-- MyBatis 自动扫描加载 Sql 映射文件/接口 --> &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; <!-- JDBC 事务管理器 --><br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; class=&quot;org.springframework.jdbc.datasource.DataSourceTransactionManager&quot;&gt;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; <!-- 启用支持 annotation 注解方式事务管理 --><br />\r\n&nbsp; &nbsp;</p>\r\n', '2017-11-27');
INSERT INTO `blog` VALUES ('37', '2317', '<p>Hello World!</p>\r\n', '2017-12-05');
INSERT INTO `blog` VALUES ('38', '2121', '<p>Hello World!</p>\r\n', '2017-12-05');
INSERT INTO `blog` VALUES ('40', 'ojbk', '<p>Hello World!</p>\r\n', '2017-12-12');

-- ----------------------------
-- Table structure for diary
-- ----------------------------
DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary` (
  `diaryid` int(20) NOT NULL AUTO_INCREMENT,
  `diary` varchar(10000) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`diaryid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diary
-- ----------------------------
INSERT INTO `diary` VALUES ('1', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '2017-11-05');
INSERT INTO `diary` VALUES ('2', '心情1', '2017-11-05');
INSERT INTO `diary` VALUES ('3', '心情1', '2017-11-05');
INSERT INTO `diary` VALUES ('4', '心情1', '2017-11-05');
INSERT INTO `diary` VALUES ('5', '心情1', '2017-11-05');
INSERT INTO `diary` VALUES ('6', '\r\n心情1', '2017-11-05');
INSERT INTO `diary` VALUES ('14', 'Hello World!', '2017-11-12');
INSERT INTO `diary` VALUES ('15', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('16', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('17', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('18', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('19', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('20', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('21', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('22', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('23', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('24', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('35', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('36', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('37', 'World!', '2017-11-12');
INSERT INTO `diary` VALUES ('49', '我爱炸鸡', '2017-12-05');
INSERT INTO `diary` VALUES ('50', '有新功能啦', '2017-12-05');
INSERT INTO `diary` VALUES ('51', 'Hello World!111', '2017-12-06');
INSERT INTO `diary` VALUES ('52', '记录一下，今天更新了link的功能', '2017-12-12');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `linkid` int(11) NOT NULL AUTO_INCREMENT,
  `linkName` varchar(255) DEFAULT NULL,
  `linkUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('12', '更新后', 'http://baidu.com');
INSERT INTO `link` VALUES ('10', '记忆角落', 'http://199604.com');
INSERT INTO `link` VALUES ('13', '测试', 'http://199604.com');
INSERT INTO `link` VALUES ('14', '记忆角落', 'http://199604.com');
INSERT INTO `link` VALUES ('15', 'demo', 'http://199604.com');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_roleId` (`roleId`),
  CONSTRAINT `permission_roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'admin:*', '1');
INSERT INTO `permission` VALUES ('2', 'user:*', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`roleName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'user');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `roleId` int(11) DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1');
INSERT INTO `user` VALUES ('3', 'user', 'user', '2');
INSERT INTO `user` VALUES ('14', 'test', 'test', '2');
