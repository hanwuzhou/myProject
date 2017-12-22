SET NAMES UTF8;
DROP DATABASE IF EXISTS computer;
CREATE DATABASE computer CHARSET=UTF8;
USE computer;


/**电脑型号家族**/
CREATE TABLE pc_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**电脑**/
CREATE TABLE pc_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/颜色

  lname VARCHAR(32),          #商品名称
  os VARCHAR(32),             #操作系统
  memory VARCHAR(32),         #内存容量
  resolution VARCHAR(32),     #分辨率
  video_card VARCHAR(32),     #显卡型号
  cpu VARCHAR(32),            #处理器
  video_memory VARCHAR(32),   #显存容量
  category VARCHAR(32),       #所属分类
  disk VARCHAR(32),           #硬盘容量及类型
  details VARCHAR(1024),      #产品详细说明

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**电脑图片**/
CREATE TABLE pc_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #笔记本电脑编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE pc_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE pc_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE pc_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,      #用户编号
  lid INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE pc_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  aid INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE pc_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  oid INT,           #订单编号
  lid INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE pc_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE pc_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**笔记本电脑型号家族**/
INSERT INTO pc_laptop_family VALUES
(NULL,'惠普(HP)暗影精灵3代'),
(NULL,'戴尔DELL XPS13-9360-R1609'),
(NULL,'华硕(ASUS) 顽石畅玩版R419UR'),
(NULL,'神舟(HASEE)战神Z8-KP7S2 GTX1070'),
(NULL,'海尔（Haier）简爱S11'),
(NULL,'戴尔DELL灵越7570-R1545S'),
(NULL,'宏碁(Acer)暗影骑士3进阶版AN5 GTX1050Ti'),
(NULL,'ThinkPad X1 Carbon 2017（07CD）'),
(NULL,'雷神（ThundeRobot）Dino-X7 GTX 1070'),
(NULL,'外星人Alienware15C-R2738');

/**笔记本电脑**/
INSERT INTO pc_laptop VALUES
(1,1,'A惠普(HP)暗影精灵3代 GTX1050Ti 15.6英寸游戏笔记本电脑（i7-7700HQ 8G 128GSSD+1T 4G独显 120Hz IPS）','【120Hz刷新率 72%色域】4通道NvME PCIe3.0固态硬盘！做工精良的外观！良心的三热管散热！GTX1050ti的4G显存！吃鸡才能更爽！',7999,'*以旧换新，闲置回收','i7/8GB内存/128GB闪存','惠普暗影精灵III代','GTX1050Ti','8G','1920*1080','高性能游戏独立显卡','Intel i7标准电压版','2G','轻薄本','128G+1T固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a4bN9dc6b33c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a46Nebb7e514.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a63Ne210a098.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a6dNfcd1bd7e.jpg"></div></div></div>',150123456789,46951,true),
(2,1,'惠普（HP）暗影精灵III代 15.6英寸游戏笔记本电脑（i5-7300HQ 8G 1T GTX1050 2G独显 IPS FHD）','碳纤维纹理搭配金属拉丝！做工精良！采用26键无冲键盘！减少游戏失误！',5999,'*以旧换新，闲置回收','i5-7300HQ 8G IPS FHD','惠普暗影精灵III代','GTX1050','8G','1920*1080','高性能游戏独立显卡','Intel i5标准电压版','其它','轻薄本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a4bN9dc6b33c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a46Nebb7e514.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a63Ne210a098.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a6dNfcd1bd7e.jpg"></div></div></div>',150123456789,35442,true),
(3,1,'惠普(HP)暗影精灵3代 GTX1050Ti 15.6英寸游戏笔记本电脑（i5-7300HQ 8G 128GSSD+1T 4G独显 120Hz IPS）','【120Hz刷新率 72%色域】4通道NvME PCIe3.0固态硬盘！做工精良的外观！良心的三热管散热！',7299,'*以旧换新，闲置回收','i5-7300HQ 128GSSD+1T IPS','惠普暗影精灵III代','GTX1050Ti','8G','1920*1080','高性能游戏独立显卡','Intel i5标准电压版','4G','轻薄本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a4bN9dc6b33c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a46Nebb7e514.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a63Ne210a098.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a6dNfcd1bd7e.jpg"></div></div></div>',150123456789,35458,true),
(4,1,'惠普(HP)暗影精灵3代Plus GTX1060 17.3英寸游戏笔记本(i7-7700HQ 8G 128GSSD+1T 6G独显 G-sync 120Hz)','【120Hz刷新率 72%色域】6G独显的GTX1060显卡！带G-sync的电竞屏幕！吃鸡才能吃的爽！做工精良，良心散热设计！',9999,'*以旧换新，闲置回收','i7 128GSSD+1T 6G独显 G-sync','惠普暗影精灵III代','GTX1060','8G','1920*1080','高性能游戏独立显卡','Intel i7标准电压版','6G','轻薄本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a4bN9dc6b33c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a46Nebb7e514.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a63Ne210a098.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a6dNfcd1bd7e.jpg"></div></div></div>',150123456789,35685,true),
(5,1,'惠普(HP)暗影精灵3代Plus GTX1070 17.3英寸游戏笔记本(i7-7700HQ 16G 256GSSD+1T 8G独显 G-sync 120Hz)','【120Hz刷新率 72%色域】GTX1070！8G独显！带G-sync的电竞屏幕！吃鸡才能吃的爽！做工精良，良心散热设计！',12999,'*以旧换新，闲置回收','i7 16G 256GSSD+1T 8G独显 G-sync','惠普暗影精灵III代','GTX1070','16G','1920*1080','高性能游戏独立显卡','Intel i7标准电压版','8G','轻薄本','256G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a4bN9dc6b33c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a46Nebb7e514.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a63Ne210a098.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5a056a6dNfcd1bd7e.jpg"></div></div></div>',150123456789,35458,true),


(6,2,'戴尔DELL XPS13-9360-R1609 13.3英寸轻薄窄边框笔记本电脑(i5-7200U 8G 256GSSD FHD Win10)无忌银','【同是好货 买一快的！京东自营 支持价保 】升级全新7代cpu！超窄边框设计！ 尊享2年上门服务 免去你维修烦恼！',7699,'*以旧换新，闲置回收','13.3英寸 8G 256G','戴尔XPS','Windows 10','8G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i5低功耗版','2G','轻薄本，常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59673d41Nbf99d137.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59353251Nd17d2ab9.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159a01N0a8688a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5966d799N4b5a2be5.jpg"></div></div></div>',154123456789,11480,true),
(7,2,'戴尔DELL XPS13-9360-R3705G 13.3英寸轻薄窄边框笔记本电脑(i7-8550U 8G 256GSSD IPS Win10)无忌金','【轻薄窄边框】8代CPU、固态硬盘高端配备、全高清ips显示屏、超长续航无忧体验、轻薄便携优雅不失质感！',8999,'*以旧换新，闲置回收','i7-8550U 8G 256GSSD IPS Win10','戴尔XPS','Windows 10','8G','全高清屏(1920*1080)','集成显卡','Intel i7低功耗版','其它','轻薄本，常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59673d41Nbf99d137.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59353251Nd17d2ab9.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159a01N0a8688a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5966d799N4b5a2be5.jpg"></div></div></div>',154123456789,11450,true),
(8,2,'戴尔DELL XPS13-9360-R1705G 13.3英寸轻薄窄边框笔记本电脑(i7-7500U 8G 256GSSD FHD Win10)无忌金','【轻薄窄边框】七代i7双核CPU、固态硬盘高端配备、全高清显示屏、超长续航无忧体验、全重1.2KG、轻薄便携优雅不失质感！',9099,'*以旧换新，闲置回收','i7-7500U 8G 256GSSD FHD Win10','戴尔XPS','Windows 10','8G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','其它','轻薄本，常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59673d41Nbf99d137.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59353251Nd17d2ab9.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159a01N0a8688a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5966d799N4b5a2be5.jpg"></div></div></div>',154123456789,12450,true),
(9,2,'戴尔DELL XPS13-9360-R1705 13.3英寸轻薄窄边框笔记本电脑(i7-7500U 8G 256GSSD FHD Win10)无忌银','【轻薄窄边框】七代i7双核CPU、固态硬盘高端配备、全高清显示屏、超长续航无忧体验、全重1.2KG、轻薄便携优雅不失质感！',8999,'*以旧换新，闲置回收','i7-7500U 8G 256GSSD FHD Win10','戴尔XPS','Windows 10','8G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','其它','轻薄本，常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59673d41Nbf99d137.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59353251Nd17d2ab9.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159a01N0a8688a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5966d799N4b5a2be5.jpg"></div></div></div>',154123456789,12540,true),

(10,3,'华硕(ASUS) 顽石畅玩版R419UR 14英寸笔记本电脑(i5-8250U 4G 500G 930MX 2G独显 HD)冰金色','【8代CPU强大性能！】适合追求坚实耐用品质的务实人士！只买对的！',4199,' *以旧换新，闲置回收','i5-8250U 4G 500G 930MX 2G独显 HD','华硕R419UR','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59bbad14Nd0893e28.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59cb6e11N65c2dc40.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59b9028fN29dabd03.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/599133e7Nc1ddd8fa.jpg"></div></div></div>',150423456789,38155,true),
(11,3,'华硕(ASUS) 顽石畅玩版R540UP 15.6英寸笔记本电脑(i5-7200U 4G 500GB 2G独显)巧克力黑','【周末华硕享好价！重娱乐学习都合适的i5性能本！注重性价比的就是它了！】',3599,' *以旧换新，闲置回收','i5-7200U 4G 500GB 2G独显','华硕R540UP','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59bbad14Nd0893e28.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59cb6e11N65c2dc40.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59b9028fN29dabd03.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/599133e7Nc1ddd8fa.jpg"></div></div></div>',150423456789,38155,true),
(12,3,'华硕(ASUS) 顽石畅玩版R541UJ 15.6英寸笔记本电脑(i5-7200U 4G 500G 920M 2G独显)白色','【周末华硕享好价！重娱乐学习都合适的i5性能本！注重性价比的就是它了！】',3699,' *以旧换新，闲置回收','i5-7200U 4G 500G 920M 2G独显','华硕R541UJ','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59bbad14Nd0893e28.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59cb6e11N65c2dc40.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59b9028fN29dabd03.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/599133e7Nc1ddd8fa.jpg"></div></div></div>',150423456789,38165,true),


(13,4,'神舟(HASEE)战神Z8-KP7S2 GTX1070 8G独显 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+240G SSD 1080P)黑色','七代四核i7+双硬盘，iPS屏+RGB背光键盘，超级战神~GTX1070嗨爆全场！',9499,' *以旧换新，闲置回收','i7-7700HQ/8G独显/1T+240G SSD 1080P','神舟战神Z8-KP7S2','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i7标准电压版','8G','游戏本','240+1TG固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59311da8N2f1f6cda.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59311da5N223bdf7c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598c1243Nedb802a0.jpg"></div></div></div>',151123456789,39545,true),
(14,4,'神舟（HASEE）战神Z7M-KP7GT 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+128G SSD GTX1050Ti 1080P)IPS屏','超高可视角度IPS屏，GTX1050Ti性能爆表！七代i7加SSD，兄弟，有了这个，你好几年不用换电脑了！分享有礼得京豆，更有专属优惠券等',6499,' *以旧换新，闲置回收','i7-7700HQ 8G 1T+128G SSD GTX1050Ti 1080P','神舟战神Z7M-KP7GT','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59311da8N2f1f6cda.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59311da5N223bdf7c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598c1243Nedb802a0.jpg"></div></div></div>',151123456789,39125,true),
(15,4,'神舟（HASEE）战神Z6-KP7GT 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+128G SSD GTX1050 1080P)黑色','【128G SSD+1T HDD】双硬盘，春风“十”里，期待是你！',5799,' *以旧换新，闲置回收','i7-7700HQ 8G 1T+128G SSD GTX1050 1080P','神舟战神Z6-KP7GT','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i7标准电压版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59311da8N2f1f6cda.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59311da5N223bdf7c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598c1243Nedb802a0.jpg"></div></div></div>',151123456789,33545,true),
(16,4,'神舟(HASEE)战神Z7-SP5D1 GTX1060 6G 15.6英寸游戏本笔记本电脑(i5-6300HQ 8G 1T 1080P)黑色','酷睿四核CPU，三风扇五铜管散热。并且我们的1060是6G的，比别人的更具性价比！分享有礼得京豆，更有专属优惠券等待你的好友认领哦！',6199,' *以旧换新，闲置回收','i5-6300HQ 8G 1T 1080P','神舟战神Z7','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5标准电压版','6G','游戏本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59311da8N2f1f6cda.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59311da5N223bdf7c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598c1243Nedb802a0.jpg"></div></div></div>',151123456789,36345,true),

(17,5,'海尔（Haier）简爱S11 11.6英寸轻薄便携二合一触控笔记本电脑(Intel四核 4G 64G 360°翻转 1080P Win10)金','轻薄便携二合一】360°随时随地随意玩，轻薄时尚外观！精致优雅，颜值担当，持久续航！',1799,' *以旧换新，闲置回收','Intel四核 4G 64G 360°翻转 1080P Win10','海尔简爱S11','Windows 10','4G','分辨率：全高清屏(1920×1080)','集成显卡','Intel 其他','4G','轻薄本，二合一笔记本，常规笔记本，其它　','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58b7758eN2485a356.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58b77590Ne29d0a39.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/599d4678Na05887f6.jpg"></div></div></div>',149123456789,3485,true),
(18,5,'海尔（Haier）凌越5000 15.6英寸轻薄游戏笔记本电脑（Intel 7代 4G 500G MX150 2G独显 全高清 Win10）','【强劲动力 大屏大视野】奔腾双核+ MX150 2G独显+15.6英寸轻薄便携',3099,' *以旧换新，闲置回收','Intel 7代 4G 500G MX150 2G独显 全高清 Win10','海尔凌越5000','Windows 10','4G','分辨率：全高清屏(1920×1080)','入门级游戏独立显卡','Intel 其他','2G','游戏本，轻薄本，常规笔记本　','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58b7758eN2485a356.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58b77590Ne29d0a39.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/599d4678Na05887f6.jpg"></div></div></div>',149123456789,3585,true),
(19,5,'海尔（Haier）凌越5000 15.6英寸轻薄游戏笔记本电脑（I7-8550U 8G 1TB MX150 2G独显 全高清 Win10）','【酷睿八代，火力全开！】15.6英寸轻薄便携+ MX150 2G独显+1T硬盘！',5299,' *以旧换新，闲置回收','I7-8550U 8G 1TB MX150 2G独显 全高清 Win10','海尔凌越5000','Windows 10','8G','分辨率：全高清屏(1920×1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本，轻薄本，常规笔记本，其它　　','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58b7758eN2485a356.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58b77590Ne29d0a39.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/599d4678Na05887f6.jpg"></div></div></div>',149123456789,3645,true),
(20,5,'海尔（Haier）凌越S4 13.3英寸金属轻薄学生商务笔记本(Intel 7代 4G 500G 72%色域 广视角 无亮点 Win10)','17.8mm轻盈便携+72%色域高清视觉享受+背光键盘，商务精英、学生推荐之选！',3199,' *以旧换新，闲置回收','Intel 7代 4G 500G 72%色域 广视角 无亮点 Win10','海尔凌越S4','Windows 10','4G','分辨率：全高清屏(1920×1080)','集成显卡','Intel 其他','其它','轻薄本，常规笔记本，其它　　','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58b7758eN2485a356.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58b77590Ne29d0a39.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/599d4678Na05887f6.jpg"></div></div></div>',149123456789,3569,true),


(21,6,'戴尔DELL灵越7570-R1545S 15.6英寸轻薄笔记本电脑(i5-8250U 4G 1T 940MX 4G独显 IPS Win10)银','【三面金属微边框轻薄本、80% 屏占比】八代四核处理器、全高清IPS屏、双天线网卡，上网看电影玩游戏，都更快一点点！',5599,' *以旧换新，闲置回收','i5-8250U 4G 1T 940MX 4G独显 IPS Win10','戴尔灵越','Windows 10','4G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版','4G','轻薄本，常规笔记本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5a056f32N7a6316b3.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5996c2c6Nbcb9a2f4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59af52a4N98732335.jpg"></div></div></div>',151923456789,25425,false),
(22,6,'戴尔DELL灵越7570-R1745S 15.6英寸轻薄笔记本电脑(i7-8550U 8G 256GSSD+1T 940MX 4G独显 IPS Win10)银','【三面金属微边框轻薄本、80% 屏占比】八代四核处理器、全高清IPS屏、双天线网卡，上网看电影玩游戏，都更快一点点！',7199,' *以旧换新，闲置回收','i7-8550U 8G 256GSSD+1T 940MX 4G独显 IPS Win10','戴尔灵越','Windows 10','8G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i7低功耗版','4G','轻薄本，常规笔记本','混合硬盘','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5a056f32N7a6316b3.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5996c2c6Nbcb9a2f4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59af52a4N98732335.jpg"></div></div></div>',151923456789,23225,false),
(23,6,'戴尔DELL灵越7570-R2645P 15.6英寸轻薄笔记本电脑(i5-8250U 8G 128GSSD+1T 940MX 4G独显 IPS Win10)粉','【三面金属微边框轻薄本、80% 屏占比】八代四核处理器、全高清IPS屏、双天线网卡，上网看电影玩游戏，都更快一点点！',6299,' *以旧换新，闲置回收','i5-8250U 8G 128GSSD+1T 940MX 4G独显 IPS Win10','戴尔灵越','Windows 10','8G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版','4G','轻薄本，常规笔记本','混合硬盘','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5a056f32N7a6316b3.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5996c2c6Nbcb9a2f4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59af52a4N98732335.jpg"></div></div></div>',151923456789,25366,false),
(24,6,'戴尔DELL灵越燃7000 R1525S 14.0英寸轻薄窄边框笔记本电脑(i5-7200U 4G 128GSSD+500G 940MX 2G独显 FHD)银','【三边全景7mm微边框、77% 超高屏占比、金属材质】七代i5双核CPU、IPS全高清显示屏、视野通透性更好玩游戏看电影性能更澎湃！',4999,' *以旧换新，闲置回收','i5-7200U 4G 128GSSD+500G 940MX 2G独显 FHD','戴尔燃7000','Windows 10','4G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版','2G','轻薄本，常规笔记本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5a056f32N7a6316b3.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5996c2c6Nbcb9a2f4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59af52a4N98732335.jpg"></div></div></div>',151923456789,25425,false),

(25,7,'宏碁(Acer)暗影骑士3进阶版AN5 GTX1050Ti 15.6英寸游戏笔记本(i5-7300HQ 8G 1T+128G SSD 4G独显 IPS)','【晒单返50元E卡】【宏碁实惠返场 尖货捡漏！】买新品轻薄本炫6送双肩包，超多福利等你来撩！详情猛戳！',6199,' *以旧换新，闲置回收','i5-7300HQ 8G 1T+128G SSD 4G独显 IPS','宏碁AN515','Windows 10','8G','全高清屏(1920×1080)','GTX1050Ti','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59fbffffNebbcdba0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59fbfffeN09cb3ee3.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5938ba78Nc95f3b26.jpg"></div></div></div>',148123456789,8454,true),
(26,7,'宏碁(Acer)暗影骑士3进阶版AN5 15.6英寸游戏笔记本(i5-7300HQ 8G 1T+128G SSD GTX1050 4G独显 IPS背光键盘)','【晒单返50元E卡】【宏碁实惠返场 尖货捡漏！】买新品轻薄本炫6送双肩包，超多福利等你来撩！详情猛戳！',5699,' *以旧换新，闲置回收','i5-7300HQ 8G 1T+128G SSD GTX1050 4G独显 IPS背光键盘','宏碁AN515','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59fbffffNebbcdba0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59fbfffeN09cb3ee3.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5938ba78Nc95f3b26.jpg"></div></div></div>',148123456789,8564,true),
(27,7,'宏碁(Acer)暗影骑士3进阶版AN5 15.6英寸游戏笔记本(i7-7700HQ 8G 1T+128G SSD GTX1050Ti 4G独显 IPS)','【晒单返50元E卡】【宏碁实惠返场 尖货捡漏！】买新品轻薄本炫6送双肩包，超多福利等你来撩！详情猛戳！',7099,' *以旧换新，闲置回收','i7-7700HQ 8G 1T+128G SSD GTX1050Ti 4G独显 IPS','宏碁AN515','Windows 10','8G','全高清屏(1920×1080)','GTX1050Ti','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59fbffffNebbcdba0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59fbfffeN09cb3ee3.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5938ba78Nc95f3b26.jpg"></div></div></div>',148123456789,8864,true),
(28,7,'宏碁(Acer)威武骑士 A715 15.6英寸游戏笔记本(i5-7300HQ 4G 1T GTX1050 2G独显 Win10 IPS背光键盘)','【晒单返50元E卡】【宏碁实惠返场 尖货捡漏！】买新品轻薄本炫6送双肩包，超多福利等你来撩！详情猛戳！',4999,' *以旧换新，闲置回收','i5-7300HQ 4G 1T GTX1050 2G独显 Win10 IPS背光键盘','宏碁威武骑士','Windows 10','4G','全高清屏(1920×1080)','GTX1050','Intel i5标准电压版','2G','游戏本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59fbffffNebbcdba0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59fbfffeN09cb3ee3.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5938ba78Nc95f3b26.jpg"></div></div></div>',148123456789,8596,true),

(29,8,'ThinkPad X1 Carbon 2017（07CD）14英寸轻薄笔记本电脑（i5-7200U 8G 256GSSD 背光键盘FHD Win10）','2017 X1 Carbon男神本再升级！轻薄奢品！【ThinkPad】引领高品质生活~白条6期免息~价保详情》',9999,'*以旧换新，闲置回收','i5-7200U 8G 256GSSD 背光键盘FHD Win10','ThinkPadX1 Carbon 2017','Windows 10','8G','全高清屏（1920×1080）','集成显卡','Intel i5低功耗版','2G','轻薄本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dNfb64dc45.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dN57a2e6d2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5993ae15N35429a29.jpg"></div></div></div>',150123456789,3200,true),
(30,8,'ThinkPad X1 Carbon（20FBA085CD）14英寸笔记本电脑（i5-6200U 8G 180GSSD FHD IPS Win10）','2X1 Carbon男神本再升级！轻薄奢品！本该如此【ThinkPad】引领高品质生活~白条6期免息~价保详情》',8499,'*以旧换新，闲置回收','i5-6200U 8G 180GSSD FHD IPS Win10','ThinkPadX1 Carbon（20FBA085CD）','Windows 10','8G','全高清屏（1920×1080）','集成显卡','Intel i5低功耗版','其它','轻薄本','其它','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dNfb64dc45.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dN57a2e6d2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5993ae15N35429a29.jpg"></div></div></div>',150123456789,3300,true),
(31,8,'ThinkPad X1 Carbon 2017（1ECD）14英寸轻薄笔记本电脑（i7-7500U 8G 512GSSD 背光键盘FHD Win10）','2017 X1 Carbon男神本再升级！轻薄奢品！【ThinkPad】引领高品质生活~白条6期免息~价保详情》',14999,'*以旧换新，闲置回收','i7-7500U 8G 512GSSD 背光键盘FHD Win10','ThinkPadX1 Carbon 2017','Windows 10','8G','全高清屏（1920×1080）','集成显卡','Intel i7低功耗版','2G','轻薄本','512G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dNfb64dc45.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dN57a2e6d2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5993ae15N35429a29.jpg"></div></div></div>',150123456789,3200,true),
(32,8,'ThinkPad X1 Carbon 2017（1ECD）14英寸轻薄笔记本电脑（i7-7500U 8G 512GSSD 背光键盘FHD Win10）','2017 X1 Carbon男神本再升级！轻薄奢品！【ThinkPad】引领高品质生活~白条6期免息~价保详情》',9999,'*以旧换新，闲置回收','i7-7500U 8G 512GSSD 背光键盘FHD Win10','ThinkPadX1 Carbon 2017','Windows 10','8G','全高清屏（1920×1080）','集成显卡','Intel i7低功耗版','2G','轻薄本','512G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dNfb64dc45.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dN57a2e6d2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5993ae15N35429a29.jpg"></div></div></div>',150123456789,3356,true),
(33,8,'ThinkPad X1 Carbon 2017（07CD）14英寸轻薄笔记本电脑（i5-7200U 8G 256GSSD 背光键盘FHD Win10）','2017 X1 Carbon男神本再升级！轻薄奢品！【ThinkPad】引领高品质生活~白条6期免息~价保详情》',9999,'*以旧换新，闲置回收','i5-7200U 8G 256GSSD 背光键盘FHD Win10','ThinkPadX1 Carbon 2017','Windows 10','8G','全高清屏（1920×1080）','集成显卡','Intel i5低功耗版','2G','轻薄本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dNfb64dc45.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58f0902dN57a2e6d2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5993ae15N35429a29.jpg"></div></div></div>',150123456789,3358,true),

(34,9,'雷神（ThundeRobot）Dino-X7 GTX 1070 15.6英寸吃鸡游戏本笔记本（I7-7700HQ 16G 256G SSD+1T 8G RGB键盘）','【吃鸡利器】全透极光一体式触摸板，高端游戏本让你赢【白条3期免息】》》请点击《《',12999,' *以旧换新，闲置回收','I7-7700HQ 16G 256G SSD+1T 8G RGB键盘','雷神Dino-X7a','Windows 10','16G','全高清屏(1920*1080)','高性能游戏独立显卡','Intel i7标准电压版','4G','游戏本','256G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59c1cd32Nc11a1ab4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e24Naf7b0096.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e61N13b8d186.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/595b3fe8Nba850740.jpg"></div></div></div>
',1450123456789,1431,false),
(35,9,'雷神（ThundeRobot）Dino-X5 GTX 1050Ti 15.6英寸游戏笔记本电脑（I7-7700HQ 8G 128G SSD+1T 4G RGB键盘）','【吃鸡利器】全透极光一体式触摸板，高端游戏本让你赢【白条3期免息】》》请点击《《',8999,' *以旧换新，闲置回收','I7-7700HQ 8G 128G SSD+1T 4G RGB键盘','雷神Dino-X5Ta','Windows 10','8G','全高清屏(1920*1080)','高性能游戏独立显卡','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59c1cd32Nc11a1ab4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e24Naf7b0096.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e61N13b8d186.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/595b3fe8Nba850740.jpg"></div></div></div>
',1450123456789,1578,false),
(36,9,'雷神（ThundeRobot）Dino-X6电竞版 吃鸡游戏本（I7-7700HQ 8G 128G SSD+1T GTX1060 6G RGB键盘 120Hz IPS）','【吃鸡利器】全透极光一体式触摸板，高端游戏本让你赢【白条3期免息】》》请点击《《',10999,' *以旧换新，闲置回收','I7-7700HQ 8G 128G SSD+1T GTX1060 6G RGB键盘 120Hz IPS','雷神Dino-X7a','Windows 10','8G','全高清屏(1920*1080)','高性能游戏独立显卡','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59c1cd32Nc11a1ab4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e24Naf7b0096.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e61N13b8d186.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/595b3fe8Nba850740.jpg"></div></div></div>
',1450123456789,15699,false),
(37,9,'雷神（ThundeRobot）Dino电竞版 4K屏游戏笔记本电脑（I7-7700HQ 16G 512G SSD+1T GTX1070 8G RGB键盘）','【吃鸡利器】全透极光一体式触摸板，高端游戏本让你赢【白条3期免息】》》请点击《《',14999,' *以旧换新，闲置回收','I7-7700HQ 16G 512G SSD+1T GTX1070 8G RGB键盘','雷神Dino-X7','Windows 10','16G','全高清屏(1920*1080)','高性能游戏独立显卡','Intel i7标准电压版','8G','游戏本','512G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59c1cd32Nc11a1ab4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e24Naf7b0096.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e61N13b8d186.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/595b3fe8Nba850740.jpg"></div></div></div>
',1450123456789,1561,false),
(38,9,'雷神（ThundeRobot）Dino-X7 GTX 1070 15.6英寸吃鸡游戏本笔记本（I7-7700HQ 16G 256G SSD+1T 8G RGB键盘）','【吃鸡利器】全透极光一体式触摸板，高端游戏本让你赢【白条3期免息】》》请点击《《',12999,' *以旧换新，闲置回收','I7-7700HQ 16G 256G SSD+1T 8G RGB键盘','雷神Dino-X7a','Windows 10','16G','全高清屏(1920*1080)','高性能游戏独立显卡','Intel i7标准电压版','4G','游戏本','256G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59c1cd32Nc11a1ab4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e24Naf7b0096.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e61N13b8d186.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/595b3fe8Nba850740.jpg"></div></div></div>
',1450123456789,1425,false),
(39,9,'雷神（ThundeRobot）Dino-X7 GTX 1070 15.6英寸吃鸡游戏本笔记本（I7-7700HQ 16G 256G SSD+1T 8G RGB键盘）','【吃鸡利器】全透极光一体式触摸板，高端游戏本让你赢【白条3期免息】》》请点击《《',12999,' *以旧换新，闲置回收','【I7-7700HQ 16G 256G SSD+1T 8G RGB键盘','雷神Dino-X7a','Windows 10','16G','全高清屏(1920*1080)','高性能游戏独立显卡','Intel i7标准电压版','4G','游戏本','256G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59c1cd32Nc11a1ab4.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e24Naf7b0096.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/598d1e61N13b8d186.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/595b3fe8Nba850740.jpg"></div></div></div>
',1450123456789,1465,false),


(40,10,'外星人Alienware15C-R2738 15.6英寸Gsync屏游戏笔记本电脑(i7-7700HQ 16G 256GSSD+1T GTX1060 6G独显 FHD)','大吉大利,晚上吃鸡!七代CPU,GTX10系独显全面支持VR技术, 2年上门全智服务+意外保护服务解除后顾之忧. 【评论送外星人定制U盘，请咨询咚咚客服',16999,' *以旧换新，闲置回收','i7-7700HQ 16G 256GSSD+1T GTX1060 6G独显 FHD','外星人ALW15C-R2738','Windows 10','16G','全高清屏(1920×1080)','GTX1060','Intel i7标准电压版','6G','游戏本','256G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5915992fN3454527d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N46a0daee.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58cb7c7eN3ec2a25d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N74d5368a.jpg"></div></div></div>',151123456789,1125,false),
(41,10,'外星人Alienware15C-R2858S 15.6英寸Gsync屏游戏笔记本电脑(i7-7820HK 32G 512GSSD+1T GTX1080 8G独显 FHD)','大吉大利,晚上吃鸡!七代CPU,GTX10系独显全面支持VR技术, 2年上门全智服务+意外保护服务解除后顾之忧. 【评论送外星人定制U盘，请咨询咚咚客服',27999,' *以旧换新，闲置回收','i7-7820HK 32G 512GSSD+1T GTX1080 8G独显 FHD','外星人ALW15C-R2858S','Windows 10','32G','全高清屏(1920×1080)','GTX1060','Intel i7标准电压版','8G','游戏本','512G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5915992fN3454527d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N46a0daee.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58cb7c7eN3ec2a25d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N74d5368a.jpg"></div></div></div>',151123456789,1254,false),
(42,10,'外星人Alienware15C-R2748 15.6英寸Gsync屏游戏笔记本电脑(i7-7700HQ 16G 256GSSD+1T GTX1070 8G独显 FHD)','大吉大利,晚上吃鸡!七代CPU,GTX10系独显全面支持VR技术, 2年上门全智服务+意外保护服务解除后顾之忧. 【评论送外星人定制U盘，请咨询咚咚客服',20699,' *以旧换新，闲置回收','i7-7700HQ 16G 256GSSD+1T GTX1070 8G独显 FHD','外星人ALW15C-R2748','Windows 10','16G','全高清屏(1920×1080)','GTX1060','Intel i7标准电压版','8G','游戏本','256G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5915992fN3454527d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N46a0daee.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58cb7c7eN3ec2a25d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N74d5368a.jpg"></div></div></div>',151123456789,1365,false),
(43,10,'外星人Alienware15C-R2738 15.6英寸Gsync屏游戏笔记本电脑(i7-7700HQ 16G 256GSSD+1T GTX1060 6G独显 FHD)','大吉大利,晚上吃鸡!七代CPU,GTX10系独显全面支持VR技术, 2年上门全智服务+意外保护服务解除后顾之忧. 【评论送外星人定制U盘，请咨询咚咚客服',17699,' *以旧换新，闲置回收','i7-7700HQ 16G 256GSSD+1T GTX1060 6G独显 FHD','外星人ALW15C-R2738','Windows 10','16G','全高清屏(1920×1080)','GTX1060','Intel i7标准电压版','6G','游戏本','256G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5915992fN3454527d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N46a0daee.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58cb7c7eN3ec2a25d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N74d5368a.jpg"></div></div></div>',151123456789,1325,false),
(44,10,'外星人Alienware15C-R2508S 15.6英寸Gsync屏游戏笔记本电脑(i5-7300HQ 8G 128G+1T GTX1050Ti 2G独显 Win10)','大吉大利,晚上吃鸡!七代CPU,GTX10系独显全面支持VR技术, 2年上门全智服务+意外保护服务解除后顾之忧. 【评论送外星人定制U盘，请咨询咚咚客服',11999,' *以旧换新，闲置回收','i5-7300HQ 8G 128G+1T GTX1050Ti 2G独显 Win10','外星人ALW15C-R2738','Windows 10','8G','全高清屏(1920×1080)','GTX1050Ti','Intel i5标准电压版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img src="img/product/detail/5915992fN3454527d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N46a0daee.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58cb7c7eN3ec2a25d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/59159930N74d5368a.jpg"></div></div></div>',151123456789,1055,false);

/**笔记本电脑图片**/
INSERT INTO pc_laptop_pic VALUES
(NULL, 1, 'img/product/sm/5929684fNbc2d3f94.jpg','img/product/md/5929684fNbc2d3f94.jpg','img/product/lg/5929684fNbc2d3f94 .jpg'),
(NULL, 1, 'img/product/sm/59296a4dN657be0ef.jpg','img/product/md/59296a4dN657be0ef.jpg','img/product/lg/59296a4dN657be0ef.jpg'),
(NULL, 1, 'img/product/sm/59296a77N5883ebff.jpg','img/product/md/59296a77N5883ebff.jpg','img/product/lg/59296a77N5883ebff.jpg'),
(NULL, 1, 'img/product/sm/59296a72Nb3743940.jpg','img/product/md/59296a72Nb3743940.jpg','img/product/lg/59296a72Nb3743940.jpg'),
(NULL, 1, 'img/product/sm/59296a7aNae47a5c2.jpg','img/product/md/59296a7aNae47a5c2.jpg','img/product/lg/59296a7aNae47a5c2.jpg'),
(NULL, 2, 'img/product/sm/5929684fNbc2d3f94.jpg','img/product/md/5929684fNbc2d3f94.jpg','img/product/lg/5929684fNbc2d3f94 .jpg'),
(NULL, 2, 'img/product/sm/59296a4dN657be0ef.jpg','img/product/md/59296a4dN657be0ef.jpg','img/product/lg/59296a4dN657be0ef.jpg'),
(NULL, 2, 'img/product/sm/59296a77N5883ebff.jpg','img/product/md/59296a77N5883ebff.jpg','img/product/lg/59296a77N5883ebff.jpg'),
(NULL, 2, 'img/product/sm/59296a72Nb3743940.jpg','img/product/md/59296a72Nb3743940.jpg','img/product/lg/59296a72Nb3743940.jpg'),
(NULL, 2, 'img/product/sm/59296a7aNae47a5c2.jpg','img/product/md/59296a7aNae47a5c2.jpg','img/product/lg/59296a7aNae47a5c2.jpg'),
(NULL, 3, 'img/product/sm/5929684fNbc2d3f94.jpg','img/product/md/5929684fNbc2d3f94.jpg','img/product/lg/5929684fNbc2d3f94 .jpg'),
(NULL, 3, 'img/product/sm/59296a4dN657be0ef.jpg','img/product/md/59296a4dN657be0ef.jpg','img/product/lg/59296a4dN657be0ef.jpg'),
(NULL, 3, 'img/product/sm/59296a77N5883ebff.jpg','img/product/md/59296a77N5883ebff.jpg','img/product/lg/59296a77N5883ebff.jpg'),
(NULL, 3, 'img/product/sm/59296a72Nb3743940.jpg','img/product/md/59296a72Nb3743940.jpg','img/product/lg/59296a72Nb3743940.jpg'),
(NULL, 3, 'img/product/sm/59296a7aNae47a5c2.jpg','img/product/md/59296a7aNae47a5c2.jpg','img/product/lg/59296a7aNae47a5c2.jpg'),
(NULL, 4, 'img/product/sm/5929684fNbc2d3f94.jpg','img/product/md/5929684fNbc2d3f94.jpg','img/product/lg/5929684fNbc2d3f94 .jpg'),
(NULL, 4, 'img/product/sm/59296a4dN657be0ef.jpg','img/product/md/59296a4dN657be0ef.jpg','img/product/lg/59296a4dN657be0ef.jpg'),
(NULL, 4, 'img/product/sm/59296a77N5883ebff.jpg','img/product/md/59296a77N5883ebff.jpg','img/product/lg/59296a77N5883ebff.jpg'),
(NULL, 4, 'img/product/sm/59296a72Nb3743940.jpg','img/product/md/59296a72Nb3743940.jpg','img/product/lg/59296a72Nb3743940.jpg'),
(NULL, 4, 'img/product/sm/59296a7aNae47a5c2.jpg','img/product/md/59296a7aNae47a5c2.jpg','img/product/lg/59296a7aNae47a5c2.jpg'),
(NULL, 5, 'img/product/sm/5929684fNbc2d3f94.jpg','img/product/md/5929684fNbc2d3f94.jpg','img/product/lg/5929684fNbc2d3f94 .jpg'),
(NULL, 5, 'img/product/sm/59296a4dN657be0ef.jpg','img/product/md/59296a4dN657be0ef.jpg','img/product/lg/59296a4dN657be0ef.jpg'),
(NULL, 5, 'img/product/sm/59296a77N5883ebff.jpg','img/product/md/59296a77N5883ebff.jpg','img/product/lg/59296a77N5883ebff.jpg'),
(NULL, 5, 'img/product/sm/59296a72Nb3743940.jpg','img/product/md/59296a72Nb3743940.jpg','img/product/lg/59296a72Nb3743940.jpg'),
(NULL, 5, 'img/product/sm/59296a7aNae47a5c2.jpg','img/product/md/59296a7aNae47a5c2.jpg','img/product/lg/59296a7aNae47a5c2.jpg'),

(NULL, 6, 'img/product/sm/59f2f56fN985fd7d4.jpg','img/product/md/59f2f56fN985fd7d4.jpg','img/product/lg/59f2f56fN985fd7d4.jpg'),
(NULL, 6, 'img/product/sm/59647508N4527534a.jpg','img/product/md/59647508N4527534a.jpg','img/product/lg/59647508N4527534a.jpg'),
(NULL, 6, 'img/product/sm/5964750bN09e9913d.jpg','img/product/md/5964750bN09e9913d.jpg','img/product/lg/5964750bN09e9913d.jpg'),
(NULL, 6, 'img/product/sm/59647514N4801e118.jpg','img/product/md/59647514N4801e118.jpg','img/product/lg/59647514N4801e118.jpg'),
(NULL, 7, 'img/product/sm/59f2f56fN985fd7d4.jpg','img/product/md/59f2f56fN985fd7d4.jpg','img/product/lg/59f2f56fN985fd7d4.jpg'),
(NULL, 7, 'img/product/sm/59647508N4527534a.jpg','img/product/md/59647508N4527534a.jpg','img/product/lg/59647508N4527534a.jpg'),
(NULL, 7, 'img/product/sm/5964750bN09e9913d.jpg','img/product/md/5964750bN09e9913d.jpg','img/product/lg/5964750bN09e9913d.jpg'),
(NULL, 7, 'img/product/sm/59647514N4801e118.jpg','img/product/md/59647514N4801e118.jpg','img/product/lg/59647514N4801e118.jpg'),
(NULL, 8, 'img/product/sm/59f2f56fN985fd7d4.jpg','img/product/md/59f2f56fN985fd7d4.jpg','img/product/lg/59f2f56fN985fd7d4.jpg'),
(NULL, 8, 'img/product/sm/59647508N4527534a.jpg','img/product/md/59647508N4527534a.jpg','img/product/lg/59647508N4527534a.jpg'),
(NULL, 8, 'img/product/sm/5964750bN09e9913d.jpg','img/product/md/5964750bN09e9913d.jpg','img/product/lg/5964750bN09e9913d.jpg'),
(NULL, 8, 'img/product/sm/59647514N4801e118.jpg','img/product/md/59647514N4801e118.jpg','img/product/lg/59647514N4801e118.jpg'),
(NULL, 9, 'img/product/sm/59f2f56fN985fd7d4.jpg','img/product/md/59f2f56fN985fd7d4.jpg','img/product/lg/59f2f56fN985fd7d4.jpg'),
(NULL, 9, 'img/product/sm/59647508N4527534a.jpg','img/product/md/59647508N4527534a.jpg','img/product/lg/59647508N4527534a.jpg'),
(NULL, 9, 'img/product/sm/5964750bN09e9913d.jpg','img/product/md/5964750bN09e9913d.jpg','img/product/lg/5964750bN09e9913d.jpg'),
(NULL, 9, 'img/product/sm/59647514N4801e118.jpg','img/product/md/59647514N4801e118.jpg','img/product/lg/59647514N4801e118.jpg'),


(NULL, 10, 'img/product/sm/59f15e87N7f0b0ce9.jpg','img/product/md/59f15e87N7f0b0ce9.jpg','img/product/lg/59f15e87N7f0b0ce9.jpg'),
(NULL, 10, 'img/product/sm/599f7ad4Nbc9ae928.jpg','img/product/md/599f7ad4Nbc9ae928.jpg','img/product/lg/599f7ad4Nbc9ae928.jpg'),
(NULL, 10, 'img/product/sm/59bb56a6N45dc2f0e.jpg','img/product/md/59bb56a6N45dc2f0e.jpg','img/product/lg/59bb56a6N45dc2f0e.jpg'),
(NULL, 11, 'img/product/sm/59f15e87N7f0b0ce9.jpg','img/product/md/59f15e87N7f0b0ce9.jpg','img/product/lg/59f15e87N7f0b0ce9.jpg'),
(NULL, 11, 'img/product/sm/599f7ad4Nbc9ae928.jpg','img/product/md/599f7ad4Nbc9ae928.jpg','img/product/lg/599f7ad4Nbc9ae928.jpg'),
(NULL, 11, 'img/product/sm/59bb56a6N45dc2f0e.jpg','img/product/md/59bb56a6N45dc2f0e.jpg','img/product/lg/59bb56a6N45dc2f0e.jpg'),
(NULL, 12, 'img/product/sm/59f15e87N7f0b0ce9.jpg','img/product/md/59f15e87N7f0b0ce9.jpg','img/product/lg/59f15e87N7f0b0ce9.jpg'),
(NULL, 12, 'img/product/sm/599f7ad4Nbc9ae928.jpg','img/product/md/599f7ad4Nbc9ae928.jpg','img/product/lg/599f7ad4Nbc9ae928.jpg'),
(NULL, 12, 'img/product/sm/59bb56a6N45dc2f0e.jpg','img/product/md/59bb56a6N45dc2f0e.jpg','img/product/lg/59bb56a6N45dc2f0e.jpg'),

(NULL, 13, 'img/product/sm/59fabcf9N869cc588.jpg','img/product/md/59fabcf9N869cc588.jpg','img/product/lg/59fabcf9N869cc588.jpg'),
(NULL, 13, 'img/product/sm/5934cf65Nc2571529.jpg','img/product/md/5934cf65Nc2571529.jpg','img/product/lg/5934cf65Nc2571529.jpg'),
(NULL, 13, 'img/product/sm/5934cf72N6655c557.jpg','img/product/md/5934cf72N6655c557.jpg','img/product/lg/5934cf72N6655c557.jpg'),
(NULL, 13, 'img/product/sm/5934cf79N928f750d.jpg','img/product/md/5934cf79N928f750d.jpg','img/product/lg/5934cf79N928f750d.jpg'),
(NULL, 14, 'img/product/sm/59fabcf9N869cc588.jpg','img/product/md/59fabcf9N869cc588.jpg','img/product/lg/59fabcf9N869cc588.jpg'),
(NULL, 14, 'img/product/sm/5934cf65Nc2571529.jpg','img/product/md/5934cf65Nc2571529.jpg','img/product/lg/5934cf65Nc2571529.jpg'),
(NULL, 14, 'img/product/sm/5934cf72N6655c557.jpg','img/product/md/5934cf72N6655c557.jpg','img/product/lg/5934cf72N6655c557.jpg'),
(NULL, 14, 'img/product/sm/5934cf79N928f750d.jpg','img/product/md/5934cf79N928f750d.jpg','img/product/lg/5934cf79N928f750d.jpg'),
(NULL, 15, 'img/product/sm/59fabcf9N869cc588.jpg','img/product/md/59fabcf9N869cc588.jpg','img/product/lg/59fabcf9N869cc588.jpg'),
(NULL, 15, 'img/product/sm/5934cf65Nc2571529.jpg','img/product/md/5934cf65Nc2571529.jpg','img/product/lg/5934cf65Nc2571529.jpg'),
(NULL, 15, 'img/product/sm/5934cf72N6655c557.jpg','img/product/md/5934cf72N6655c557.jpg','img/product/lg/5934cf72N6655c557.jpg'),
(NULL, 15, 'img/product/sm/5934cf79N928f750d.jpg','img/product/md/5934cf79N928f750d.jpg','img/product/lg/5934cf79N928f750d.jpg'),
(NULL, 16, 'img/product/sm/59fabcf9N869cc588.jpg','img/product/md/59fabcf9N869cc588.jpg','img/product/lg/59fabcf9N869cc588.jpg'),
(NULL, 16, 'img/product/sm/5934cf65Nc2571529.jpg','img/product/md/5934cf65Nc2571529.jpg','img/product/lg/5934cf65Nc2571529.jpg'),
(NULL, 16, 'img/product/sm/5934cf72N6655c557.jpg','img/product/md/5934cf72N6655c557.jpg','img/product/lg/5934cf72N6655c557.jpg'),
(NULL, 16, 'img/product/sm/5934cf79N928f750d.jpg','img/product/md/5934cf79N928f750d.jpg','img/product/lg/5934cf79N928f750d.jpg'),

(NULL, 17, 'img/product/sm/589a7005N6755ee2e.jpg','img/product/md/589a7005N6755ee2e.jpg','img/product/lg/589a7005N6755ee2e.jpg'),
(NULL, 17, 'img/product/sm/589a702fNdf51354c.jpg','img/product/md/589a702fNdf51354c.jpg','img/product/lg/589a702fNdf51354c.jpg'),
(NULL, 17, 'img/product/sm/589a701aN5c2da334.jpg','img/product/md/589a701aN5c2da334.jpg','img/product/lg/589a701aN5c2da334.jpg'),
(NULL, 17, 'img/product/sm/589a7022N6e2642a1.jpg','img/product/md/589a7022N6e2642a1.jpg','img/product/lg/589a7022N6e2642a1.jpg'),
(NULL, 18, 'img/product/sm/589a7005N6755ee2e.jpg','img/product/md/589a7005N6755ee2e.jpg','img/product/lg/589a7005N6755ee2e.jpg'),
(NULL, 18, 'img/product/sm/589a702fNdf51354c.jpg','img/product/md/589a702fNdf51354c.jpg','img/product/lg/589a702fNdf51354c.jpg'),
(NULL, 18, 'img/product/sm/589a701aN5c2da334.jpg','img/product/md/589a701aN5c2da334.jpg','img/product/lg/589a701aN5c2da334.jpg'),
(NULL, 18, 'img/product/sm/589a7022N6e2642a1.jpg','img/product/md/589a7022N6e2642a1.jpg','img/product/lg/589a7022N6e2642a1.jpg'),
(NULL, 19, 'img/product/sm/589a7005N6755ee2e.jpg','img/product/md/589a7005N6755ee2e.jpg','img/product/lg/589a7005N6755ee2e.jpg'),
(NULL, 19, 'img/product/sm/589a702fNdf51354c.jpg','img/product/md/589a702fNdf51354c.jpg','img/product/lg/589a702fNdf51354c.jpg'),
(NULL, 19, 'img/product/sm/589a701aN5c2da334.jpg','img/product/md/589a701aN5c2da334.jpg','img/product/lg/589a701aN5c2da334.jpg'),
(NULL, 19, 'img/product/sm/589a7022N6e2642a1.jpg','img/product/md/589a7022N6e2642a1.jpg','img/product/lg/589a7022N6e2642a1.jpg'),
(NULL, 20, 'img/product/sm/589a7005N6755ee2e.jpg','img/product/md/589a7005N6755ee2e.jpg','img/product/lg/589a7005N6755ee2e.jpg'),
(NULL, 20, 'img/product/sm/589a702fNdf51354c.jpg','img/product/md/589a702fNdf51354c.jpg','img/product/lg/589a702fNdf51354c.jpg'),
(NULL, 20, 'img/product/sm/589a701aN5c2da334.jpg','img/product/md/589a701aN5c2da334.jpg','img/product/lg/589a701aN5c2da334.jpg'),
(NULL, 20, 'img/product/sm/589a7022N6e2642a1.jpg','img/product/md/589a7022N6e2642a1.jpg','img/product/lg/589a7022N6e2642a1.jpg'),

(NULL, 21, 'img/product/sm/59f15e47Ne67fb8aa.jpg','img/product/md/59f15e47Ne67fb8aa.jpg','img/product/lg/59f15e47Ne67fb8aa.jpg'),
(NULL, 21, 'img/product/sm/599b79f6Ncbaee27d.jpg','img/product/md/599b79f6Ncbaee27d.jpg','img/product/lg/599b79f6Ncbaee27d.jpg'),
(NULL, 21, 'img/product/sm/599a8e7bN8ec0f17f.jpg','img/product/md/599a8e7bN8ec0f17f.jpg','img/product/lg/599a8e7bN8ec0f17f.jpg'),
(NULL, 21, 'img/product/sm/599b79f5N33a43655.jpg','img/product/md/599b79f5N33a43655.jpg','img/product/lg/599b79f5N33a43655.jpg'),
(NULL, 22, 'img/product/sm/59f15e47Ne67fb8aa.jpg','img/product/md/59f15e47Ne67fb8aa.jpg','img/product/lg/59f15e47Ne67fb8aa.jpg'),
(NULL, 22, 'img/product/sm/599b79f6Ncbaee27d.jpg','img/product/md/599b79f6Ncbaee27d.jpg','img/product/lg/599b79f6Ncbaee27d.jpg'),
(NULL, 22, 'img/product/sm/599a8e7bN8ec0f17f.jpg','img/product/md/599a8e7bN8ec0f17f.jpg','img/product/lg/599a8e7bN8ec0f17f.jpg'),
(NULL, 22, 'img/product/sm/599b79f5N33a43655.jpg','img/product/md/599b79f5N33a43655.jpg','img/product/lg/599b79f5N33a43655.jpg'),
(NULL, 23, 'img/product/sm/59f15e47Ne67fb8aa.jpg','img/product/md/59f15e47Ne67fb8aa.jpg','img/product/lg/59f15e47Ne67fb8aa.jpg'),
(NULL, 23, 'img/product/sm/599b79f6Ncbaee27d.jpg','img/product/md/599b79f6Ncbaee27d.jpg','img/product/lg/599b79f6Ncbaee27d.jpg'),
(NULL, 23, 'img/product/sm/599a8e7bN8ec0f17f.jpg','img/product/md/599a8e7bN8ec0f17f.jpg','img/product/lg/599a8e7bN8ec0f17f.jpg'),
(NULL, 23, 'img/product/sm/599b79f5N33a43655.jpg','img/product/md/599b79f5N33a43655.jpg','img/product/lg/599b79f5N33a43655.jpg'),
(NULL, 24, 'img/product/sm/59f15e47Ne67fb8aa.jpg','img/product/md/59f15e47Ne67fb8aa.jpg','img/product/lg/59f15e47Ne67fb8aa.jpg'),
(NULL, 24, 'img/product/sm/599b79f6Ncbaee27d.jpg','img/product/md/599b79f6Ncbaee27d.jpg','img/product/lg/599b79f6Ncbaee27d.jpg'),
(NULL, 24, 'img/product/sm/599a8e7bN8ec0f17f.jpg','img/product/md/599a8e7bN8ec0f17f.jpg','img/product/lg/599a8e7bN8ec0f17f.jpg'),
(NULL, 24, 'img/product/sm/599b79f5N33a43655.jpg','img/product/md/599b79f5N33a43655.jpg','img/product/lg/599b79f5N33a43655.jpg'),

(NULL, 25, 'img/product/sm/59f6d76dNc6308905.jpg','img/product/md/59f6d76dNc6308905.jpg','img/product/lg/59f6d76dNc6308905.jpg'),
(NULL, 25, 'img/product/sm/59b257c9N3dd00bf4.jpg','img/product/md/59b257c9N3dd00bf4.jpg','img/product/lg/59b257c9N3dd00bf4.jpg'),
(NULL, 25, 'img/product/sm/59b257cfNccf0b879.jpg','img/product/md/59b257cfNccf0b879.jpg','img/product/lg/59b257cfNccf0b879.jpg'),
(NULL, 25, 'img/product/sm/5967632fN62afe584.jpg','img/product/md/5967632fN62afe584.jpg','img/product/lg/5967632fN62afe584.jpg'),
(NULL, 26, 'img/product/sm/59f6d76dNc6308905.jpg','img/product/md/59f6d76dNc6308905.jpg','img/product/lg/59f6d76dNc6308905.jpg'),
(NULL, 26, 'img/product/sm/59b257c9N3dd00bf4.jpg','img/product/md/59b257c9N3dd00bf4.jpg','img/product/lg/59b257c9N3dd00bf4.jpg'),
(NULL, 26, 'img/product/sm/59b257cfNccf0b879.jpg','img/product/md/59b257cfNccf0b879.jpg','img/product/lg/59b257cfNccf0b879.jpg'),
(NULL, 26, 'img/product/sm/5967632fN62afe584.jpg','img/product/md/5967632fN62afe584.jpg','img/product/lg/5967632fN62afe584.jpg'),
(NULL, 27, 'img/product/sm/59f6d76dNc6308905.jpg','img/product/md/59f6d76dNc6308905.jpg','img/product/lg/59f6d76dNc6308905.jpg'),
(NULL, 27, 'img/product/sm/59b257c9N3dd00bf4.jpg','img/product/md/59b257c9N3dd00bf4.jpg','img/product/lg/59b257c9N3dd00bf4.jpg'),
(NULL, 27, 'img/product/sm/59b257cfNccf0b879.jpg','img/product/md/59b257cfNccf0b879.jpg','img/product/lg/59b257cfNccf0b879.jpg'),
(NULL, 27, 'img/product/sm/5967632fN62afe584.jpg','img/product/md/5967632fN62afe584.jpg','img/product/lg/5967632fN62afe584.jpg'),
(NULL, 28, 'img/product/sm/59f6d76dNc6308905.jpg','img/product/md/59f6d76dNc6308905.jpg','img/product/lg/59f6d76dNc6308905.jpg'),
(NULL, 28, 'img/product/sm/59b257c9N3dd00bf4.jpg','img/product/md/59b257c9N3dd00bf4.jpg','img/product/lg/59b257c9N3dd00bf4.jpg'),
(NULL, 28, 'img/product/sm/59b257cfNccf0b879.jpg','img/product/md/59b257cfNccf0b879.jpg','img/product/lg/59b257cfNccf0b879.jpg'),
(NULL, 28, 'img/product/sm/5967632fN62afe584.jpg','img/product/md/5967632fN62afe584.jpg','img/product/lg/5967632fN62afe584.jpg'),

(NULL, 29, 'img/product/sm/59f7efb3Nfcfb6659.jpg','img/product/md/59f7efb3Nfcfb6659.jpg','img/product/lg/59f7efb3Nfcfb6659.jpg'),
(NULL, 29, 'img/product/sm/58eca3deN1de382a8.jpg','img/product/md/58eca3deN1de382a8.jpg','img/product/lg/58eca3deN1de382a8.jpg'),
(NULL, 29, 'img/product/sm/58eca3e2Nce7a27ce.jpg','img/product/md/58eca3e2Nce7a27ce.jpg','img/product/lg/58eca3e2Nce7a27ce.jpg'),
(NULL, 29, 'img/product/sm/58eca3e6Neced56be.jpg','img/product/md/58eca3e6Neced56be.jpg','img/product/lg/58eca3e6Neced56be.jpg'),
(NULL, 29, 'img/product/sm/58eca3ebN4347e664.jpg','img/product/md/58eca3ebN4347e664.jpg','img/product/lg/58eca3ebN4347e664.jpg'),
(NULL, 30, 'img/product/sm/59f7efb3Nfcfb6659.jpg','img/product/md/59f7efb3Nfcfb6659.jpg','img/product/lg/59f7efb3Nfcfb6659.jpg'),
(NULL, 30, 'img/product/sm/58eca3deN1de382a8.jpg','img/product/md/58eca3deN1de382a8.jpg','img/product/lg/58eca3deN1de382a8.jpg'),
(NULL, 30, 'img/product/sm/58eca3e2Nce7a27ce.jpg','img/product/md/58eca3e2Nce7a27ce.jpg','img/product/lg/58eca3e2Nce7a27ce.jpg'),
(NULL, 30, 'img/product/sm/58eca3e6Neced56be.jpg','img/product/md/58eca3e6Neced56be.jpg','img/product/lg/58eca3e6Neced56be.jpg'),
(NULL, 30, 'img/product/sm/58eca3ebN4347e664.jpg','img/product/md/58eca3ebN4347e664.jpg','img/product/lg/58eca3ebN4347e664.jpg'),
(NULL, 31, 'img/product/sm/59f7efb3Nfcfb6659.jpg','img/product/md/59f7efb3Nfcfb6659.jpg','img/product/lg/59f7efb3Nfcfb6659.jpg'),
(NULL, 31, 'img/product/sm/58eca3deN1de382a8.jpg','img/product/md/58eca3deN1de382a8.jpg','img/product/lg/58eca3deN1de382a8.jpg'),
(NULL, 31, 'img/product/sm/58eca3e2Nce7a27ce.jpg','img/product/md/58eca3e2Nce7a27ce.jpg','img/product/lg/58eca3e2Nce7a27ce.jpg'),
(NULL, 31, 'img/product/sm/58eca3e6Neced56be.jpg','img/product/md/58eca3e6Neced56be.jpg','img/product/lg/58eca3e6Neced56be.jpg'),
(NULL, 31, 'img/product/sm/58eca3ebN4347e664.jpg','img/product/md/58eca3ebN4347e664.jpg','img/product/lg/58eca3ebN4347e664.jpg'),
(NULL, 32, 'img/product/sm/59f7efb3Nfcfb6659.jpg','img/product/md/59f7efb3Nfcfb6659.jpg','img/product/lg/59f7efb3Nfcfb6659.jpg'),
(NULL, 32, 'img/product/sm/58eca3deN1de382a8.jpg','img/product/md/58eca3deN1de382a8.jpg','img/product/lg/58eca3deN1de382a8.jpg'),
(NULL, 32, 'img/product/sm/58eca3e2Nce7a27ce.jpg','img/product/md/58eca3e2Nce7a27ce.jpg','img/product/lg/58eca3e2Nce7a27ce.jpg'),
(NULL, 32, 'img/product/sm/58eca3e6Neced56be.jpg','img/product/md/58eca3e6Neced56be.jpg','img/product/lg/58eca3e6Neced56be.jpg'),
(NULL, 32, 'img/product/sm/58eca3ebN4347e664.jpg','img/product/md/58eca3ebN4347e664.jpg','img/product/lg/58eca3ebN4347e664.jpg'),
(NULL, 33, 'img/product/sm/59f7efb3Nfcfb6659.jpg','img/product/md/59f7efb3Nfcfb6659.jpg','img/product/lg/59f7efb3Nfcfb6659.jpg'),
(NULL, 33, 'img/product/sm/58eca3deN1de382a8.jpg','img/product/md/58eca3deN1de382a8.jpg','img/product/lg/58eca3deN1de382a8.jpg'),
(NULL, 33, 'img/product/sm/58eca3e2Nce7a27ce.jpg','img/product/md/58eca3e2Nce7a27ce.jpg','img/product/lg/58eca3e2Nce7a27ce.jpg'),
(NULL, 33, 'img/product/sm/58eca3e6Neced56be.jpg','img/product/md/58eca3e6Neced56be.jpg','img/product/lg/58eca3e6Neced56be.jpg'),
(NULL, 33, 'img/product/sm/58eca3ebN4347e664.jpg','img/product/md/58eca3ebN4347e664.jpg','img/product/lg/58eca3ebN4347e664.jpg'),

(NULL, 34, 'img/product/sm/5a0a4663N80de26ba.jpg','img/product/md/5a0a4663N80de26ba.jpg','img/product/lg/5a0a4663N80de26ba.jpg'),
(NULL, 34, 'img/product/sm/5983da88Nca1838e9.jpg','img/product/md/5983da88Nca1838e9.jpg','img/product/lg/5983da88Nca1838e9.jpg'),
(NULL, 34, 'img/product/sm/58b8d866Nd8ad8a63.jpg','img/product/md/58b8d866Nd8ad8a63.jpg','img/product/lg/58b8d866Nd8ad8a63.jpg'),
(NULL, 34, 'img/product/sm/58b8d86eN30768397.jpg','img/product/md/58b8d86eN30768397.jpg','img/product/lg/58b8d86eN30768397.jpg'),
(NULL, 34, 'img/product/sm/58b8d874N588b4e9b.jpg','img/product/md/58b8d874N588b4e9b.jpg','img/product/lg/58b8d874N588b4e9b.jpg'),
(NULL, 34, 'img/product/sm/58b8d87bN75c9c15f.jpg','img/product/md/58b8d87bN75c9c15f.jpg','img/product/lg/58b8d87bN75c9c15f.jpg'),
(NULL, 35, 'img/product/sm/5a0a4663N80de26ba.jpg','img/product/md/5a0a4663N80de26ba.jpg','img/product/lg/5a0a4663N80de26ba.jpg'),
(NULL, 35, 'img/product/sm/5983da88Nca1838e9.jpg','img/product/md/5983da88Nca1838e9.jpg','img/product/lg/5983da88Nca1838e9.jpg'),
(NULL, 35, 'img/product/sm/58b8d866Nd8ad8a63.jpg','img/product/md/58b8d866Nd8ad8a63.jpg','img/product/lg/58b8d866Nd8ad8a63.jpg'),
(NULL, 35, 'img/product/sm/58b8d86eN30768397.jpg','img/product/md/58b8d86eN30768397.jpg','img/product/lg/58b8d86eN30768397.jpg'),
(NULL, 35, 'img/product/sm/58b8d874N588b4e9b.jpg','img/product/md/58b8d874N588b4e9b.jpg','img/product/lg/58b8d874N588b4e9b.jpg'),
(NULL, 35, 'img/product/sm/58b8d87bN75c9c15f.jpg','img/product/md/58b8d87bN75c9c15f.jpg','img/product/lg/58b8d87bN75c9c15f.jpg'),
(NULL, 36, 'img/product/sm/5a0a4663N80de26ba.jpg','img/product/md/5a0a4663N80de26ba.jpg','img/product/lg/5a0a4663N80de26ba.jpg'),
(NULL, 36, 'img/product/sm/5983da88Nca1838e9.jpg','img/product/md/5983da88Nca1838e9.jpg','img/product/lg/5983da88Nca1838e9.jpg'),
(NULL, 36, 'img/product/sm/58b8d866Nd8ad8a63.jpg','img/product/md/58b8d866Nd8ad8a63.jpg','img/product/lg/58b8d866Nd8ad8a63.jpg'),
(NULL, 36, 'img/product/sm/58b8d86eN30768397.jpg','img/product/md/58b8d86eN30768397.jpg','img/product/lg/58b8d86eN30768397.jpg'),
(NULL, 36, 'img/product/sm/58b8d874N588b4e9b.jpg','img/product/md/58b8d874N588b4e9b.jpg','img/product/lg/58b8d874N588b4e9b.jpg'),
(NULL, 36, 'img/product/sm/58b8d87bN75c9c15f.jpg','img/product/md/58b8d87bN75c9c15f.jpg','img/product/lg/58b8d87bN75c9c15f.jpg'),
(NULL, 37, 'img/product/sm/5a0a4663N80de26ba.jpg','img/product/md/5a0a4663N80de26ba.jpg','img/product/lg/5a0a4663N80de26ba.jpg'),
(NULL, 37, 'img/product/sm/5983da88Nca1838e9.jpg','img/product/md/5983da88Nca1838e9.jpg','img/product/lg/5983da88Nca1838e9.jpg'),
(NULL, 37, 'img/product/sm/58b8d866Nd8ad8a63.jpg','img/product/md/58b8d866Nd8ad8a63.jpg','img/product/lg/58b8d866Nd8ad8a63.jpg'),
(NULL, 37, 'img/product/sm/58b8d86eN30768397.jpg','img/product/md/58b8d86eN30768397.jpg','img/product/lg/58b8d86eN30768397.jpg'),
(NULL, 37, 'img/product/sm/58b8d874N588b4e9b.jpg','img/product/md/58b8d874N588b4e9b.jpg','img/product/lg/58b8d874N588b4e9b.jpg'),
(NULL, 37, 'img/product/sm/58b8d87bN75c9c15f.jpg','img/product/md/58b8d87bN75c9c15f.jpg','img/product/lg/58b8d87bN75c9c15f.jpg'),
(NULL, 38, 'img/product/sm/5a0a4663N80de26ba.jpg','img/product/md/5a0a4663N80de26ba.jpg','img/product/lg/5a0a4663N80de26ba.jpg'),
(NULL, 38, 'img/product/sm/5983da88Nca1838e9.jpg','img/product/md/5983da88Nca1838e9.jpg','img/product/lg/5983da88Nca1838e9.jpg'),
(NULL, 38, 'img/product/sm/58b8d866Nd8ad8a63.jpg','img/product/md/58b8d866Nd8ad8a63.jpg','img/product/lg/58b8d866Nd8ad8a63.jpg'),
(NULL, 38, 'img/product/sm/58b8d86eN30768397.jpg','img/product/md/58b8d86eN30768397.jpg','img/product/lg/58b8d86eN30768397.jpg'),
(NULL, 38, 'img/product/sm/58b8d874N588b4e9b.jpg','img/product/md/58b8d874N588b4e9b.jpg','img/product/lg/58b8d874N588b4e9b.jpg'),
(NULL, 38, 'img/product/sm/58b8d87bN75c9c15f.jpg','img/product/md/58b8d87bN75c9c15f.jpg','img/product/lg/58b8d87bN75c9c15f.jpg'),
(NULL, 39, 'img/product/sm/5a0a4663N80de26ba.jpg','img/product/md/5a0a4663N80de26ba.jpg','img/product/lg/5a0a4663N80de26ba.jpg'),
(NULL, 39, 'img/product/sm/5983da88Nca1838e9.jpg','img/product/md/5983da88Nca1838e9.jpg','img/product/lg/5983da88Nca1838e9.jpg'),
(NULL, 39, 'img/product/sm/58b8d866Nd8ad8a63.jpg','img/product/md/58b8d866Nd8ad8a63.jpg','img/product/lg/58b8d866Nd8ad8a63.jpg'),
(NULL, 39, 'img/product/sm/58b8d86eN30768397.jpg','img/product/md/58b8d86eN30768397.jpg','img/product/lg/58b8d86eN30768397.jpg'),
(NULL, 39, 'img/product/sm/58b8d874N588b4e9b.jpg','img/product/md/58b8d874N588b4e9b.jpg','img/product/lg/58b8d874N588b4e9b.jpg'),
(NULL, 39, 'img/product/sm/58b8d87bN75c9c15f.jpg','img/product/md/58b8d87bN75c9c15f.jpg','img/product/lg/58b8d87bN75c9c15f.jpg'),

(NULL, 40, 'img/product/sm/596c1c3cNb3ee32ac.jpg','img/product/md/596c1c3cNb3ee32ac.jpg','img/product/lg/596c1c3cNb3ee32ac.jpg'),
(NULL, 40, 'img/product/sm/596c1c39N64079f7d.jpg','img/product/md/596c1c39N64079f7d.jpg','img/product/lg/596c1c39N64079f7d.jpg'),
(NULL, 40, 'img/product/sm/5a0e4bdaN69f19d07.jpg','img/product/md/5a0e4bdaN69f19d07.jpg','img/product/lg/5a0e4bdaN69f19d07.jpg'),
(NULL, 40, 'img/product/sm/596c1c2fNba51dc50.jpg','img/product/md/596c1c2fNba51dc50.jpg','img/product/lg/596c1c2fNba51dc50.jpg'),
(NULL, 40, 'img/product/sm/596c1c35N1a6129b8.jpg','img/product/md/596c1c35N1a6129b8.jpg','img/product/lg/596c1c35N1a6129b8.jpg'),
(NULL, 41, 'img/product/sm/596c1c3cNb3ee32ac.jpg','img/product/md/596c1c3cNb3ee32ac.jpg','img/product/lg/596c1c3cNb3ee32ac.jpg'),
(NULL, 41, 'img/product/sm/596c1c39N64079f7d.jpg','img/product/md/596c1c39N64079f7d.jpg','img/product/lg/596c1c39N64079f7d.jpg'),
(NULL, 41, 'img/product/sm/5a0e4bdaN69f19d07.jpg','img/product/md/5a0e4bdaN69f19d07.jpg','img/product/lg/5a0e4bdaN69f19d07.jpg'),
(NULL, 41, 'img/product/sm/596c1c2fNba51dc50.jpg','img/product/md/596c1c2fNba51dc50.jpg','img/product/lg/596c1c2fNba51dc50.jpg'),
(NULL, 41, 'img/product/sm/596c1c35N1a6129b8.jpg','img/product/md/596c1c35N1a6129b8.jpg','img/product/lg/596c1c35N1a6129b8.jpg'),
(NULL, 42, 'img/product/sm/596c1c3cNb3ee32ac.jpg','img/product/md/596c1c3cNb3ee32ac.jpg','img/product/lg/596c1c3cNb3ee32ac.jpg'),
(NULL, 42, 'img/product/sm/596c1c39N64079f7d.jpg','img/product/md/596c1c39N64079f7d.jpg','img/product/lg/596c1c39N64079f7d.jpg'),
(NULL, 42, 'img/product/sm/5a0e4bdaN69f19d07.jpg','img/product/md/5a0e4bdaN69f19d07.jpg','img/product/lg/5a0e4bdaN69f19d07.jpg'),
(NULL, 42, 'img/product/sm/596c1c2fNba51dc50.jpg','img/product/md/596c1c2fNba51dc50.jpg','img/product/lg/596c1c2fNba51dc50.jpg'),
(NULL, 42, 'img/product/sm/596c1c35N1a6129b8.jpg','img/product/md/596c1c35N1a6129b8.jpg','img/product/lg/596c1c35N1a6129b8.jpg'),
(NULL, 43, 'img/product/sm/596c1c3cNb3ee32ac.jpg','img/product/md/596c1c3cNb3ee32ac.jpg','img/product/lg/596c1c3cNb3ee32ac.jpg'),
(NULL, 43, 'img/product/sm/596c1c39N64079f7d.jpg','img/product/md/596c1c39N64079f7d.jpg','img/product/lg/596c1c39N64079f7d.jpg'),
(NULL, 43, 'img/product/sm/5a0e4bdaN69f19d07.jpg','img/product/md/5a0e4bdaN69f19d07.jpg','img/product/lg/5a0e4bdaN69f19d07.jpg'),
(NULL, 43, 'img/product/sm/596c1c2fNba51dc50.jpg','img/product/md/596c1c2fNba51dc50.jpg','img/product/lg/596c1c2fNba51dc50.jpg'),
(NULL, 43, 'img/product/sm/596c1c35N1a6129b8.jpg','img/product/md/596c1c35N1a6129b8.jpg','img/product/lg/596c1c35N1a6129b8.jpg'),
(NULL, 44, 'img/product/sm/596c1c3cNb3ee32ac.jpg','img/product/md/596c1c3cNb3ee32ac.jpg','img/product/lg/596c1c3cNb3ee32ac.jpg'),
(NULL, 44, 'img/product/sm/596c1c39N64079f7d.jpg','img/product/md/596c1c39N64079f7d.jpg','img/product/lg/596c1c39N64079f7d.jpg'),
(NULL, 44, 'img/product/sm/5a0e4bdaN69f19d07.jpg','img/product/md/5a0e4bdaN69f19d07.jpg','img/product/lg/5a0e4bdaN69f19d07.jpg'),
(NULL, 44, 'img/product/sm/596c1c2fNba51dc50.jpg','img/product/md/596c1c2fNba51dc50.jpg','img/product/lg/596c1c2fNba51dc50.jpg'),
(NULL, 44, 'img/product/sm/596c1c35N1a6129b8.jpg','img/product/md/596c1c35N1a6129b8.jpg','img/product/lg/596c1c35N1a6129b8.jpg');

/**用户信息**/
INSERT INTO pc_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO pc_index_carousel VALUES
(NULL, 'img/index/banner1.jpg','轮播广告商品1','product-details.html?lid=28'),
(NULL, 'img/index/banner2.jpg','轮播广告商品2','product-details.html?lid=19'),
(NULL, 'img/index/banner3.jpg','轮播广告商品3','lookforward.html'),
(NULL, 'img/index/banner4.jpg','轮播广告商品4','lookforward.html'),
(NULL, 'img/index/banner5.jpg','轮播广告商品5','lookforward.html'),
(NULL, 'img/index/banner5.jpg','轮播广告商品6','lookforward.html');

/****首页商品****/
INSERT INTO pc_index_product VALUES
(NULL, 'A惠普(HP)暗影精灵3代系列', 'i7-7700HQ 8G 128GSSD+1T 4G独显 120Hz IPS', 'img/index/study_computer_img1.png', 7999, 'product_details.html?lid=1', 1, 1, 1),
(NULL, '神舟(HASEE)战神Z7-SP5D1', 'i7-7700HQ 8G 128GSSD+1T 4G独显 120Hz IPS', 'img/index/study_computer_img2.png', 6199, 'product_details.html?lid=16', 2, 2, 2),
(NULL, '宏碁(Acer)暗影骑士3进阶版AN5', 'i7-7700HQ 8G 1T+128G SSD GTX1050Ti 4G独显 IPS', 'img/index/study_computer_img3.png', 7099, 'product_details.html?lid=25', 3, 3, 3),
(NULL, '华硕(ASUS) 顽石畅玩版R541UJ', 'i5-7200U 4G 500G 920M 2G独显', 'img/index/study_computer_img4.png', 3699, 'product_details.html?lid=12', 4, 4, 4),
(NULL, '雷神（ThundeRobot）Dino-X7', 'I7-7700HQ 16G 256G SSD+1T 8G RGB键盘', 'img/index/study_computer_img5.png', 12999, 'product_details.html?lid=34', 5, 5, 5),
(NULL, '外星人Alienware15C-R2738', 'i7-7700HQ 16G 256GSSD+1T GTX1060 6G独显 FHD', 'img/index/study_computer_img3.png', 16999, 'product_details.html?lid=40', 6, 6, 6),
(NULL, 'ThinkPad X1 Carbon 2017', 'i7-7500U 8G 512GSSD 背光键盘FHD Win10', 'img/index/study_computer_img3.png', 9999, 'product_details.html?lid=32', 6, 6, 6);



