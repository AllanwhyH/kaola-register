SET NAMES UTF8;

DROP DATABASE IF EXISTS kl;

CREATE DATABASE kl CHARSET=UTF8;

USE kl;


/*#1.用户信息表kl_user*/
CREATE TABLE kl_user(
	uid INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	email VARCHAR(64),
	phone VARCHAR(16)  /*NOT NULL UNIQUE*/,
	avatar VARCHAR(128),
	user_name VARCHAR(32),
	gender INT
);
INSERT INTO kl_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/**购物车条目**/
CREATE TABLE kl_shoppingcart_item(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,      /*#用户编号*/
  shop_id INT,   /*#商品编号*/
  count INT,        /*#购买数量*/
  is_checked BOOLEAN /*#是否已勾选，确定购买*/
);
INSERT INTO kl_shoppingcart_item VALUES
(NULL,1,1,4,0),
(NULL,1,1,4,1);

/*商品的列表页：kl_products*/
CREATE TABLE kl_products(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,  #商品编号
  img VARCHAR(128),
  youhui VARCHAR(64),
  title VARCHAR(128),
  details VARCHAR(128),
  price DECIMAL(10,2),
  price_del DECIMAL(10,2)
);
INSERT INTO kl_products VALUES
(NULL,1,"img/lg-app-1.jpg","自营","Apple 苹果 iPhone X 64GB 移动联通电信4G手机 国内行货","未来已来，说声Hello",7099,8310),
(NULL,2,"img/lg-huawei-1.jpg","特价","【赠荣耀原装耳机】华为 HUAWEI nova3全面屏高清四摄游戏手机 6GB+128GB 全网通 双卡双待","未来已来，说声Hello",2399,3999),
(NULL,3,"img/lg-bread-1.jpg","特价","Smeg 烤面包机 烤吐司机 2格设计 粉色 快捷烘烤，享受早餐的乐趣。6种温度等级，享受精致生活","美在智慧，科技魅力",899,1299),
(NULL,4,"img/p-4.jpg","2件减20|特价","【同价双11】考拉工厂店 苹果快充数据线（MFI认证）","让美更久一点",49,80),
(NULL,5,"img/p-5.jpg","赠","考拉工厂店 进口液态硅胶防摔苹果手机壳","岂止于大，处处不同",35,45),
(NULL,6,"img/p-6.jpg","自营","考拉工厂店 苹果快充编织数据线（MFI认证）","白菜价，适合送长辈",59,99),
(NULL,7,"img/p-7.jpg","赠","Apple 苹果 iPhone X 64GB 移动联通电信4G手机 国内行货","岂止于大，处处不同",6999,8316),
(NULL,8,"img/p-8.jpg","白条免息","【现货发售】Apple 苹果 iPhone Xs(A2100) 64G 金色 移动联通电信4G手机 国内行货","哪一面都是亮点",7999,8699),
(NULL,9,"img/p-9.jpg","自营","Apple 苹果 MacBook Air 13.3英寸 2017新款 128G(i5/8GB/MQD32CH/A)","颜值已然碾压偏偏还有才华",6488,6928),
(NULL,10,"img/p-10.jpg","自营","考拉工厂店 稳定快充Type-C数据线 1米","数据线不是一般的强",25,49),
(NULL,11,"img/p-11.jpg","特价","Apple 苹果 iPhone8 Plus (A1864) 64GB 移动联通电信4G手机 国内行货","特别版",5799,5999),
(NULL,12,"img/p-12.jpg","自营","【同价双11】考拉工厂店 超薄磨砂苹果手机壳","柔滑手感，全方位呵护手机",25,40),
(NULL,13,"img/p-13.jpg","券满100减10","Momax摩米士 苹果8MFi认证快充数据线Lightning充电线1米iPhone6/7/8/X通用","苹果官方认证数据线",38,159),
(NULL,14,"img/p-14.jpg","自营","Apple 苹果 iPhone X 256GB移动联通电信4G手机 国内行货","轻松照亮你的美",8288,9605),
(NULL,15,"img/p-15.jpg","特价","【原装】苹果（Apple） AirPods 蓝牙无线耳机 iPhoneX/8/7手机耳机","轻松照亮你的美",999,1028),
(NULL,16,"img/p-16.jpg","赠","Apple 苹果 iPhone Xs (A2100) 256G 移动联通电信4G手机 国内行货","女友不嫌弃我的拍照技术了",9999,10999),
(NULL,17,"img/p-17.jpg","自营","【黑卡96折】苹果 iPad 平板电脑 2018新款 9.7英寸（128G WLAN/A10/Retina屏/MR7K2CH/A)银色","哪一面都是亮点",3299,3359),
(NULL,18,"img/p-18.jpg","特价","Apple 苹果 iPhone6s plus 手机 全网通 原装国行正品 全国联保","轻松照亮你的美",2828,2858),
(NULL,19,"img/p-11.jpg","特价","Apple 苹果 iPhone8 Plus (A1864) 64GB 移动联通电信4G手机 国内行货","特别版",5799,5999),
(NULL,20,"img/p-12.jpg","自营","【同价双11】考拉工厂店 超薄磨砂苹果手机壳","柔滑手感，全方位呵护手机",25,40),
(NULL,21,"img/p-15.jpg","特价","【原装】苹果（Apple） AirPods 蓝牙无线耳机 iPhoneX/8/7手机耳机","轻松照亮你的美",999,1028),
(NULL,22,"img/p-16.jpg","赠","Apple 苹果 iPhone Xs (A2100) 256G 移动联通电信4G手机 国内行货","女友不嫌弃我的拍照技术了",9999,10999),
(NULL,23,"img/p-6.jpg","自营","考拉工厂店 苹果快充编织数据线（MFI认证）","白菜价，适合送长辈",59,99),
(NULL,24,"img/p-7.jpg","赠","Apple 苹果 iPhone X 64GB 移动联通电信4G手机 国内行货","岂止于大，处处不同",6999,8316),
(NULL,25,"img/p-2.jpg","特价","Apple 苹果 iPhone Xs Max (A2104) 256G 金色 移动联通电信4G手机 双卡双待","未来已来，说声Hello",9999,10000),
(NULL,26,"img/p-3.jpg","特价","【黑卡96折】苹果 iPad 平板电脑 2018新款 9.7英寸（128G WLAN/A10/Retina屏/MRJP2CH/A)金色","美在智慧，科技魅力",2999,3388),
(NULL,27,"img/p-4.jpg","2件减20|特价","【同价双11】考拉工厂店 苹果快充数据线（MFI认证）","让美更久一点",49,80),
(NULL,28,"img/p-5.jpg","赠","考拉工厂店 进口液态硅胶防摔苹果手机壳","岂止于大，处处不同",35,45),
(NULL,29,"img/p-6.jpg","自营","考拉工厂店 苹果快充编织数据线（MFI认证）","白菜价，适合送长辈",59,99),
(NULL,30,"img/p-7.jpg","赠","Apple 苹果 iPhone X 64GB 移动联通电信4G手机 国内行货","岂止于大，处处不同",6999,8316);

/**商品详情 kl_laptop_pic**/
CREATE TABLE kl_laptop_pic(
  id INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,  #商品
  sm VARCHAR(128),
  md VARCHAR(128),
  lg VARCHAR(128)
);
INSERT INTO kl_laptop_pic VALUES
/*苹果手机*/
(NULL,1,"img/sm-app-1.jpg","img/lg-app-1.jpg","img/lg-app-1.jpg"),
(NULL,1,"img/sm-app-2.jpg","img/lg-app-2.jpg","img/lg-app-2.jpg"),
(NULL,1,"img/sm-app-3.jpg","img/lg-app-3.jpg","img/lg-app-3.jpg"),
(NULL,1,"img/sm-app-4.jpg","img/lg-app-4.jpg","img/lg-app-4.jpg"),
(NULL,1,"img/sm-app-5.jpg","img/lg-app-5.jpg","img/lg-app-5.jpg"),
(NULL,1,"img/sm-app-6.jpg","img/lg-app-6.jpg","img/lg-app-6.jpg"),
(NULL,1,"img/sm-app-7.jpg","img/lg-app-7.jpg","img/lg-app-7.jpg"),
/*华为*/
(NULL,2,"img/sm-huawei-1.jpg","img/lg-huawei-1.jpg","img/lg-huawei-1.jpg"),
(NULL,2,"img/sm-huawei-2.jpg","img/lg-huawei-2.jpg","img/lg-huawei-2.jpg"),
(NULL,2,"img/sm-huawei-3.jpg","img/lg-huawei-3.jpg","img/lg-huawei-3.jpg"),
(NULL,2,"img/sm-huawei-4.jpg","img/lg-huawei-4.jpg","img/lg-huawei-4.jpg"),
(NULL,2,"img/sm-huawei-5.jpg","img/lg-huawei-5.jpg","img/lg-huawei-5.jpg"),
/*烤面包机*/
(NULL,3,"img/sm-bread-1.jpg","img/lg-bread-1.jpg","img/lg-bread-1.jpg"),
(NULL,3,"img/sm-bread-2.png","img/lg-bread-2.png","img/lg-bread-2.png"),
(NULL,3,"img/sm-bread-3.png","img/lg-bread-3.png","img/lg-bread-3.png"),
(NULL,3,"img/sm-bread-4.png","img/lg-bread-4.png","img/lg-bread-4.png");

/**商品详情的图片介绍一堆大图 kl_laptop_pic_list**/
CREATE TABLE kl_laptop_pic_list(
  id INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,  #商品
  imglist VARCHAR(1024)
);
INSERT INTO kl_laptop_pic_list VALUES
/*苹果手机*/
(NULL,1,"img/apple.mp4?img/detail-apple-video.jpg?img/detail-apple-2.jpg?img/detail-apple-3.jpg?img/detail-apple-4.jpg?img/detail-apple-5.jpg?img/detail-apple-6.jpg?img/detail-apple-7.jpg?img/detail-apple-8.jpg?img/detail-apple-9.jpg?img/detail-apple-10.jpg?img/detail-apple-11.jpg?img/detail-apple-12.jpg?img/detail-apple-13.jpg?img/detail-apple-14.jpg?img/detail-apple-15.jpg?img/detail-apple-16.jpg?img/detail-apple-17.jpg?img/detail-apple-18.jpg?img/detail-apple-19.jpg?img/detail-apple-20.jpg?img/detail-apple-21.jpg?img/detail-apple-22.jpg?img/detail-apple-23.jpg?img/detail-apple-24.jpg?img/detail-apple-25.jpg?img/detail-apple-26.jpg?img/detail-apple-27.jpg?img/detail-apple-28.jpg?img/detail-apple-29.jpg?img/detail-apple-30.jpg?img/detail-apple-31.jpg?img/detail-apple-32.jpg?img/detail-apple-33.jpg?img/detail-kaola-1.png?img/detail-kaola-2.png?img/detail-kaola-3.jpg?img/detail-apple-kaola.jpg?img/kaola.mp4"),
(NULL,2,"img/detail-huawei-1.jpg?img/detail-huawei-2.jpg?img/detail-huawei-3.jpg?img/detail-huawei-4.jpg?img/detail-huawei-5.jpg?img/detail-huawei-6.jpg?img/detail-huawei-7.jpg?img/detail-huawei-8.jpg?img/detail-huawei-9.jpg?img/detail-huawei-10.jpg?img/detail-kaola-1.png?img/detail-kaola-2.png?img/detail-kaola-3.jpg?img/detail-apple-kaola.jpg?img/kaola.mp4"),
(NULL,3,"img/detail-smeg-1.jpg?img/detail-smeg-2.png?img/detail-smeg-3.png?img/detail-smeg-4.png?img/detail-smeg-5.png?img/detail-smeg-6.png?img/detail-smeg-7.png?img/detail-smeg-8.png?img/detail-smeg-9.png?img/detail-smeg-10.png?img/detail-smeg-11.png?img/detail-smeg-12.png?img/detail-smeg-13.png?img/detail-smeg-14.png?img/detail-smeg-15.png?img/detail-smeg-16.png?img/detail-smeg-17.png?img/detail-smeg-18.png?img/detail-smeg-19.png?img/detail-kaola-1.png?img/detail-kaola-2.png?img/detail-kaola-3.jpg?img/detail-apple-kaola.jpg?img/kaola.mp4");


/*商品 kl_laptop*/
CREATE TABLE kl_laptop(
  kid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,
  img_country VARCHAR(128),
  country VARCHAR(64),
  name VARCHAR(64),
  title VARCHAR(64),
  details VARCHAR(128),
  img1 VARCHAR(128),
  img2 VARCHAR(128),
  price DECIMAL(10,2),
  price_del DECIMAL(10,2),  /*#商品编号*/
  p_text VARCHAR(64)
  /*FOREIGN KEY(lid) REFERENCES kl_laptop_family(lid)*/
);
INSERT INTO kl_laptop VALUES
(NULL,1,"img/cri-usa.png","美国","Apple 苹果","Apple 苹果 iPhone X 64GB 移动联通电信4G手机 国内行货","【开封不支持退货，请确认需求再开封】【未来已来】iPhone X 全面屏，全面绽放。","img/yanse-app-1.jpg","img/yanse-app-2.jpg",7099,8310,NULL),
(NULL,1,NULL,NULL,NULL,"Apple 苹果 iPhone8 Plus (A1864) 64GB 移动联通电信4G手机 国内行货",NULL,"img/xgtj-1.jpg",NULL,1499,2288,"920 人已评价"),
(NULL,1,NULL,NULL,NULL,"Apple 苹果 iPhone8(A1863) 64GB 移动联通电信4G手机 国内行货",NULL,"img/xgtj-2.jpg",NULL,5999,5999,"1570 人已评价"),
(NULL,1,NULL,NULL,NULL,"Apple 苹果 iPhone8 Plus (A1864) 64GB 移动联通电信4G手机 国内行货",NULL,"img/xgtj-3.jpg",NULL,4999,5088,"1728 人已评价"),
(NULL,1,NULL,NULL,NULL,"Apple 苹果 iPhone8 Plus (A1864) 64GB 移动联通电信4G手机 国内行货",NULL,"img/xgtj-4.jpg",NULL,6899,9288,"1920 人已评价"),
(NULL,1,NULL,NULL,NULL,"Apple 苹果 iPhone X 256GB移动联通电信4G手机 国内行货",NULL,"img/xgtj-5.jpg",NULL,8388,9605,"734 人已评价"),
(NULL,1,NULL,NULL,NULL,"Apple 苹果 iPhone X 64GB 移动联通4G手机 港版",NULL,"img/xgtj-6.jpg",NULL,6699,7399,"542 人已评价"),
/*华为*/
(NULL,2,"img/cri-china.png","中国","HUAWEI 华为","【赠荣耀原装耳机】华为 HUAWEI nova3全面屏高清四摄游戏手机 6GB+128GB 全网通 双卡双待","新品首发","img/yanse-huawei-1.jpg","img/yanse-huawei-2.jpg",2399,3999,NULL),
(NULL,2,NULL,NULL,NULL,"Apple 苹果 iPhone 7  移动联通电信 全网通4G手机 国内行货",NULL,"img/xgtj-huawei-1.jpg",NULL,3998,5388,"28 人已评价"),
(NULL,2,NULL,NULL,NULL,"华为 HUAWEI 荣耀9青春版 移动联通电信4G全面屏手机  双卡双待",NULL,"img/xgtj-huawei-2.jpg",NULL,958,1299,"1028 人已评价"),
(NULL,2,NULL,NULL,NULL,"Apple 苹果 iPhone8 plus    手机  全网通手机 全国联保  国行正品",NULL,"img/xgtj-huawei-3.jpg",NULL,5899,6688,"15 人已评价"),
(NULL,2,NULL,NULL,NULL,"【新品现货发售】Apple 苹果 iPhoneXs  64G移动联通电信全网通4G手机  国内行货",NULL,"img/xgtj-huawei-4.jpg",NULL,8088,10699,"0 人已评价"),
(NULL,2,NULL,NULL,NULL,"Apple 苹果 iPhone6s plus 手机 全网通 原装国行正品 全国联保",NULL,"img/xgtj-huawei-5.jpg",NULL,2858,4099,"79 人已评价"),
(NULL,2,NULL,NULL,NULL,"Apple 苹果 iPhone X  移动联通电信4G手机 国内行货 苹果X手机",NULL,"img/xgtj-huawei-6.jpg",NULL,6928,8388,"31 人已评价"),
/*Smeg面包机*/
(NULL,3,"img/cri-italy.png","意大利","Smeg","Smeg 烤面包机 烤吐司机 2格设计 粉色","快捷烘烤，享受早餐的乐趣。6种温度等级，享受精致生活","img/yanse-bread-1.jpg","img/sm-bread-3.png",899,1299,NULL),
(NULL,3,NULL,NULL,NULL,"Braun博朗家用多士炉烤面包机HT400 ",NULL,"img/xgtj-bread-1.jpg",NULL,299,369,"70 人已评价"),
(NULL,3,NULL,NULL,NULL,"Smeg ECF01 Espresso 咖啡机可打奶泡",NULL,"img/xgtj-bread-2.jpg",NULL,1899,3999,"28 人已评价"),
(NULL,3,NULL,NULL,NULL,"BRAUN 博朗 家用全自动早餐多士炉吐司机烤面包机 HT450 全国联保两年",NULL,"img/xgtj-bread-3.jpg",NULL,299,399,"194 人已评价"),
(NULL,3,NULL,NULL,NULL,"Kalorik 可控温烤面包机 2槽 奶白色",NULL,"img/xgtj-bread-4.jpg",NULL,399,499,"2 人已评价"),
(NULL,3,NULL,NULL,NULL,"【带防尘盖 正品行货 全国联保 赠贴心好礼】DeLonghi 德龙 复古系列高颜值全自动烤面包机多士炉 CTO2003",NULL,"img/xgtj-bread-5.jpg",NULL,489,720,"241 人已评价"),
(NULL,3,NULL,NULL,NULL,"Smeg烤面包机 烤吐司机 2格设计 粉绿色",NULL,"img/xgtj-bread-6.jpg",NULL,899,1599,"29 人已评价");



/*1.首页轮播图表kl_index_carousel*/
CREATE TABLE kl_index_carousel(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64)
);
INSERT INTO kl_index_carousel VALUES
(NULL, 'img/lb-1.jpg','轮播广告商品1'),
(NULL, 'img/lb-2.jpg','轮播广告商品2'),
(NULL, 'img/lb-3.jpg','轮播广告商品3'),
(NULL, 'img/lb-4.jpg','轮播广告商品4'),
(NULL, 'img/lb-5.jpg','轮播广告商品4');

/*1.1.首页弹出列表kl_index_indexList*/
CREATE TABLE kl_index_indexList(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64),
	tit1 VARCHAR(128),
	tit2 VARCHAR(128),
	tit3 VARCHAR(128),
	tit4 VARCHAR(128)
);
INSERT INTO kl_index_indexList VALUES
(NULL,'img/list-1.png','母婴儿童','精品女装?外套?连衣裙?针织衫?卫衣?风衣?T恤?呢大衣?牛仔裤?衬衫?皮衣?打底裤?西装?MO&Co.?休闲裤?皮草?毛衣?羽绒服','型格男装?衬衫?牛仔裤?T恤?休闲裤?羽绒服?皮衣?夹克?毛呢外套?正装?风衣?针织衫/毛衣?运动裤?U.S. POLO ASSN.?Calvin Klein?LEE?ARMANI JEANS?Champion?GXG','魅力内衣?文胸?睡衣/家居服套装?女士内裤?男士内裤?文胸套装?少女文胸?短袜?无钢圈文胸?丝袜/打底裤?塑身衣?吊带/背心?抹胸?黛安芬?华歌尔?Calvin Klein?安莉芳?爱慕?Gukoo 果壳','品质鞋靴?单鞋?休闲鞋?高跟鞋?商务鞋?平底鞋?百丽 Belle?SENDA 森达?TATA?kisscat?思加图?莱尔斯丹?Teenmix 天美意?KEDDO?靴子?腰带?帽子'),
(NULL,'img/list-2.png', '手表饰品','腕表?瑞士名表?经典国表?欧美腕表?日韩腕表?钟表配件?欧米茄? 浪琴?天梭?西铁城?EMPORIO ARMANI?ADEXE?Swatch?卡西欧','大牌眼镜?太阳眼镜?Ray·Ban 雷朋?GUCCI?Dior 迪奥?BURBERRY?PRADA?TOM FORD?miu miu?FURLA?BOLON 暴龙?MOLSION 陌森?光学镜架/镜片?烟具/配件','潮流饰品?项链?手链/手镯?耳饰?串珠?时尚戒指?项坠/吊坠?Chocker?施华洛世奇?潘多拉?apm?时尚发饰?胸针?钥匙扣?饰品套装','黄金珠宝?周生生?周大福?六福珠宝?黄金项链?黄金手链?黄金转运珠?黄金耳饰?K金?铂金?钻石?天然珍珠?彩宝?水晶玛瑙?翡翠玉石?银饰'),
(NULL,'img/list-3.png', '美容彩妆','精品女装?外套?连衣裙?针织衫?卫衣?风衣?T恤?呢大衣?牛仔裤?衬衫?皮衣?打底裤?西装?MO&Co.?休闲裤?皮草?毛衣?羽绒服','型格男装?衬衫?牛仔裤?T恤?休闲裤?羽绒服?皮衣?夹克?毛呢外套?正装?风衣?针织衫/毛衣?运动裤?U.S. POLO ASSN.?Calvin Klein?LEE?ARMANI JEANS?Champion?GXG','魅力内衣?文胸?睡衣/家居服套装?女士内裤?男士内裤?文胸套装?少女文胸?短袜?无钢圈文胸?丝袜/打底裤?塑身衣?吊带/背心?抹胸?黛安芬?华歌尔?Calvin Klein?安莉芳?爱慕?Gukoo 果壳','品质鞋靴?单鞋?休闲鞋?高跟鞋?商务鞋?平底鞋?百丽 Belle?SENDA 森达?TATA?kisscat?思加图?莱尔斯丹?Teenmix 天美意?KEDDO?靴子?腰带?帽子'),
(NULL,'img/list-4.png', '轻奢','腕表?瑞士名表?经典国表?欧美腕表?日韩腕表?钟表配件?欧米茄? 浪琴?天梭?西铁城?EMPORIO ARMANI?ADEXE?Swatch?卡西欧','大牌眼镜?太阳眼镜?Ray·Ban 雷朋?GUCCI?Dior 迪奥?BURBERRY?PRADA?TOM FORD?miu miu?FURLA?BOLON 暴龙?MOLSION 陌森?光学镜架/镜片?烟具/配件','潮流饰品?项链?手链/手镯?耳饰?串珠?时尚戒指?项坠/吊坠?Chocker?施华洛世奇?潘多拉?apm?时尚发饰?胸针?钥匙扣?饰品套装','黄金珠宝?周生生?周大福?六福珠宝?黄金项链?黄金手链?黄金转运珠?黄金耳饰?K金?铂金?钻石?天然珍珠?彩宝?水晶玛瑙?翡翠玉石?银饰'),
(NULL,'img/list-5.png', '家居个护','精品女装?外套?连衣裙?针织衫?卫衣?风衣?T恤?呢大衣?牛仔裤?衬衫?皮衣?打底裤?西装?MO&Co.?休闲裤?皮草?毛衣?羽绒服','型格男装?衬衫?牛仔裤?T恤?休闲裤?羽绒服?皮衣?夹克?毛呢外套?正装?风衣?针织衫/毛衣?运动裤?U.S. POLO ASSN.?Calvin Klein?LEE?ARMANI JEANS?Champion?GXG','魅力内衣?文胸?睡衣/家居服套装?女士内裤?男士内裤?文胸套装?少女文胸?短袜?无钢圈文胸?丝袜/打底裤?塑身衣?吊带/背心?抹胸?黛安芬?华歌尔?Calvin Klein?安莉芳?爱慕?Gukoo 果壳','品质鞋靴?单鞋?休闲鞋?高跟鞋?商务鞋?平底鞋?百丽 Belle?SENDA 森达?TATA?kisscat?思加图?莱尔斯丹?Teenmix 天美意?KEDDO?靴子?腰带?帽子'),
(NULL,'img/list-6.png', '营养保健','腕表?瑞士名表?经典国表?欧美腕表?日韩腕表?钟表配件?欧米茄? 浪琴?天梭?西铁城?EMPORIO ARMANI?ADEXE?Swatch?卡西欧','大牌眼镜?太阳眼镜?Ray·Ban 雷朋?GUCCI?Dior 迪奥?BURBERRY?PRADA?TOM FORD?miu miu?FURLA?BOLON 暴龙?MOLSION 陌森?光学镜架/镜片?烟具/配件','潮流饰品?项链?手链/手镯?耳饰?串珠?时尚戒指?项坠/吊坠?Chocker?施华洛世奇?潘多拉?apm?时尚发饰?胸针?钥匙扣?饰品套装','黄金珠宝?周生生?周大福?六福珠宝?黄金项链?黄金手链?黄金转运珠?黄金耳饰?K金?铂金?钻石?天然珍珠?彩宝?水晶玛瑙?翡翠玉石?银饰'),
(NULL,'img/list-7.png', '数码家电','精品女装?外套?连衣裙?针织衫?卫衣?风衣?T恤?呢大衣?牛仔裤?衬衫?皮衣?打底裤?西装?MO&Co.?休闲裤?皮草?毛衣?羽绒服','型格男装?衬衫?牛仔裤?T恤?休闲裤?羽绒服?皮衣?夹克?毛呢外套?正装?风衣?针织衫/毛衣?运动裤?U.S. POLO ASSN.?Calvin Klein?LEE?ARMANI JEANS?Champion?GXG','魅力内衣?文胸?睡衣/家居服套装?女士内裤?男士内裤?文胸套装?少女文胸?短袜?无钢圈文胸?丝袜/打底裤?塑身衣?吊带/背心?抹胸?黛安芬?华歌尔?Calvin Klein?安莉芳?爱慕?Gukoo 果壳','品质鞋靴?单鞋?休闲鞋?高跟鞋?商务鞋?平底鞋?百丽 Belle?SENDA 森达?TATA?kisscat?思加图?莱尔斯丹?Teenmix 天美意?KEDDO?靴子?腰带?帽子'),
(NULL,'img/list-8.png', '环球美食','腕表?瑞士名表?经典国表?欧美腕表?日韩腕表?钟表配件?欧米茄? 浪琴?天梭?西铁城?EMPORIO ARMANI?ADEXE?Swatch?卡西欧','大牌眼镜?太阳眼镜?Ray·Ban 雷朋?GUCCI?Dior 迪奥?BURBERRY?PRADA?TOM FORD?miu miu?FURLA?BOLON 暴龙?MOLSION 陌森?光学镜架/镜片?烟具/配件','潮流饰品?项链?手链/手镯?耳饰?串珠?时尚戒指?项坠/吊坠?Chocker?施华洛世奇?潘多拉?apm?时尚发饰?胸针?钥匙扣?饰品套装','黄金珠宝?周生生?周大福?六福珠宝?黄金项链?黄金手链?黄金转运珠?黄金耳饰?K金?铂金?钻石?天然珍珠?彩宝?水晶玛瑙?翡翠玉石?银饰'),
(NULL,'img/list-9.png', '户外运动','精品女装?外套?连衣裙?针织衫?卫衣?风衣?T恤?呢大衣?牛仔裤?衬衫?皮衣?打底裤?西装?MO&Co.?休闲裤?皮草?毛衣?羽绒服','型格男装?衬衫?牛仔裤?T恤?休闲裤?羽绒服?皮衣?夹克?毛呢外套?正装?风衣?针织衫/毛衣?运动裤?U.S. POLO ASSN.?Calvin Klein?LEE?ARMANI JEANS?Champion?GXG','魅力内衣?文胸?睡衣/家居服套装?女士内裤?男士内裤?文胸套装?少女文胸?短袜?无钢圈文胸?丝袜/打底裤?塑身衣?吊带/背心?抹胸?黛安芬?华歌尔?Calvin Klein?安莉芳?爱慕?Gukoo 果壳','品质鞋靴?单鞋?休闲鞋?高跟鞋?商务鞋?平底鞋?百丽 Belle?SENDA 森达?TATA?kisscat?思加图?莱尔斯丹?Teenmix 天美意?KEDDO?靴子?腰带?帽子'),
(NULL,'img/list-10.png', '服饰鞋靴','腕表?瑞士名表?经典国表?欧美腕表?日韩腕表?钟表配件?欧米茄? 浪琴?天梭?西铁城?EMPORIO ARMANI?ADEXE?Swatch?卡西欧','大牌眼镜?太阳眼镜?Ray·Ban 雷朋?GUCCI?Dior 迪奥?BURBERRY?PRADA?TOM FORD?miu miu?FURLA?BOLON 暴龙?MOLSION 陌森?光学镜架/镜片?烟具/配件','潮流饰品?项链?手链/手镯?耳饰?串珠?时尚戒指?项坠/吊坠?Chocker?施华洛世奇?潘多拉?apm?时尚发饰?胸针?钥匙扣?饰品套装','黄金珠宝?周生生?周大福?六福珠宝?黄金项链?黄金手链?黄金转运珠?黄金耳饰?K金?铂金?钻石?天然珍珠?彩宝?水晶玛瑙?翡翠玉石?银饰');

/*2.专区商品kl_index_product*/
CREATE TABLE kl_index_product(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(64), 
	details VARCHAR(128),
	img VARCHAR(128),
	img2 VARCHAR(128),
	price DECIMAL(10,2),
	price_del DECIMAL(10,2),
	xcount VARCHAR(64),
	href VARCHAR(128)
);
INSERT INTO kl_index_product VALUES	
	#会场图片
	(NULL,'会场1',NULL,'img/middle-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'会场2',NULL,'img/middle-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'会场3',NULL,'img/middle-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'会场4',NULL,'img/middle-4.jpg',NULL,NULL,NULL,NULL,NULL),

	#今日限时购
	(NULL,'Apple 苹果 iPhone X 64GB 移动联通电信4G手机','【开封不支持退货，请确认需求再开封】【未来已来】iPhone X', 'img/lg-app-1.jpg',NULL,7099,8310,'限购500件',"details.html?lid=1"),
	(NULL,'华为 HUAWEI nova3全面屏高清四摄游戏手机','HUAWEI nova3全面屏高清四摄游戏手机 6GB+128GB 全网通 双卡双待', 'img/lg-huawei-1.jpg',NULL,2399,3999,'剩余50件',"details.html?lid=2"),
	(NULL,'Smeg 烤面包机 烤吐司机 2格设计 粉色','快捷烘烤，享受早餐的乐趣。6种温度等级，享受精致生活', 'img/lg-bread-3.png',NULL,899,1299,'限量100件',"details.html?lid=3"),
	(NULL,'Pampers 帮宝适','【官方直采】Pampers 帮宝适一级帮 L36片/包 2包装 拉拉裤箱装', 'img/jrxsg-4.jpg',NULL,219,299,'限购100件',"details.html?lid=4"),
	(NULL,NULL,NULL, 'img/jrxsg-5.png',NULL,NULL,NULL,NULL,NULL),

	#今日上新
	(NULL,'元朗荣华',NULL, 'img/jrsx-1.jpg','img/jrsx-1-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,'5分钟商学院·商业篇(市场版)',NULL, 'img/jrsx-2.jpg',null,35.86,49.8,NULL,NULL),
	(NULL,'SunnyHills微热山丘 蜜丰糖脆蛋糕 7.5g*12片 进口蛋糕营养早餐网红零食小吃',NULL, 'img/jrsx-6.jpg',null,80,100,NULL,NULL),
	(NULL,'【 脂肪糖分代谢 肝胆肾健康】life Extension活性复合维生素B族60粒 美国直邮',NULL, 'img/jrsx-4.jpg',null,214,500,NULL,NULL),
	(NULL,'【颜值爆表不怕岁月】BONBACK乌鸡牌 冰糖燕窝45毫升*6瓶',NULL, 'img/jrsx-5.png',null,169,499,NULL,NULL),
	(NULL,'盛香珍  香辣味青豆 休闲旅游零食 240g/袋',NULL, 'img/jrsx-3.jpg',null,17.9,30,NULL,NULL),
	(NULL,'加油卡',NULL, 'img/jrsx-7.jpg',NULL,150,300,NULL,NULL),
	(NULL,'09.15 | 每日上新新品',NULL, 'img/jrsx-8.jpg',NULL,NULL,NULL,NULL,NULL),

	#热门品牌
	(NULL,'SHISEIDO 资生堂','创造美丽生活的文化','img/rmpp-1-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'SHISEIDO 资生堂','创造美丽生活的文化','img/rmpp-1-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'SHISEIDO 资生堂','创造美丽生活的文化','img/rmpp-1-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'网易原创生活类品牌','429590人关注该品牌', 'img/rmpp-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'基因级肌密修复','579093人关注该品牌', 'img/rmpp-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'法兰西的浪漫玫瑰','510519人关注该品牌', 'img/rmpp-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'科学配方 优质原材料','786336人关注该品牌', 'img/rmpp-5.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'全球知名的运动品牌','153068人关注该品牌', 'img/rmpp-6.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'打造健康肌肤','436690人关注该品牌', 'img/rmpp-7.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'高雅与华丽的代名词','452684人关注该品牌', 'img/rmpp-8.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'源自纽约的国际时尚品牌','793162人关注该品牌', 'img/rmpp-9.jpg',NULL,NULL,NULL,NULL,NULL),

	#专区首图
	(NULL,NULL,NULL, 'img/my-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/meir-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/shirt-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/homeju-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/yyang-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/sma-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/sport-1.jpg',NULL,NULL,NULL,NULL,NULL),

	#母婴专区
	(NULL,'辅食N元任选','最多99选9', 'img/my-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'用品N元任选','最多99选8', 'img/my-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'童装童鞋馆','最高188减100', 'img/my-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'玩具N元任选','最多99选10', 'img/my-5.jpg',NULL,NULL,NULL,NULL,NULL),

	#美容彩妆
	(NULL,'美妆热销专场','美妆热点盘点', 'img/meir-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'美容仪器馆','热门美颜新科技', 'img/meir-5.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'美妆面膜馆','人气面膜大搜罗', 'img/meir-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'美妆新品专场','尝新党剁手必看', 'img/meir-3.jpg',NULL,NULL,NULL,NULL,NULL),

	#
	(NULL,'时尚博主教你“型”','亚历山大·王5.0折起', 'img/shirt-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'潮流服饰鞋靴会场','专柜同款 型格上新', 'img/shirt-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'美式轻奢品牌专场','新品包袋低至499元起', 'img/shirt-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'男人也要“千娇百媚”','男士臻品低至3.9折', 'img/shirt-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,'秋季滋养正当时','雅顿身体乳低至75元/瓶', 'img/homeju-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'个人洗护任选专场','99元任选5件起', 'img/homeju-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'一屋不扫何以扫天下','满168立减40元起', 'img/homeju-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'唯有爱与下厨不可辜负','碧然德滤水壶低至119元', 'img/homeju-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,'传统滋补','全场满399减150元', 'img/yyang-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'职场营养','护眼片低至88元', 'img/yyang-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'运动营养专场','美瑞克斯赛霸增肌粉低至288元', 'img/yyang-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'考拉海外分站','参天眼药水香港直邮', 'img/yyang-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,'数码家电热销榜','热门推荐一网打尽', 'img/sma-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'数码NEW货榜','第一时间用上潮流款', 'img/sma-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'历届IF奖大赏','用心种草 为你精选', 'img/sma-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'历届红点奖大赏','以创新 致匠心', 'img/sma-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,'斯凯奇新品上市','热门鞋款低至5.7折', 'img/sport-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'潮流运动焕新','阿迪耐克新品6折起', 'img/sport-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'活力出游季','防晒装备低至39元起', 'img/sport-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,'汽车用品养护专场','机油低至49.9元', 'img/sport-5.jpg',NULL,NULL,NULL,NULL,NULL),

	#专区轮播的图片
	(NULL,'【宝宝肠道护卫队】Culturelle 康萃乐 儿童益生菌粉 30袋/盒 2盒装',NULL,'img/my-lb-1-1.jpg',NULL,278,398,NULL,NULL),
	(NULL,'CALIFORNIA BABY 加州宝宝 桉树精华泡泡浴 384毫升',NULL,'img/my-lb-1-4.jpg',NULL,95,289,NULL,NULL),
	(NULL,'【酸奶口感 不上火】CHILDLIFE 童年时光 钙镁锌成长营养液 474毫升（6个月~12岁）',NULL,'img/my-lb-1-3.jpg',NULL,171,228,NULL,NULL),
	(NULL,'【经典款】MAXI-COSI 迈可适 Pria 70 汽车儿童安全座椅0-7岁',NULL,'img/my-lb-1-2.jpg',NULL,799,998,NULL,NULL),

	(NULL,'BIODERMA 贝德玛 舒妍温和保湿卸妆水 500毫升 粉水 敏感肌用',NULL,'img/meir-lb-1.jpg',NULL,109,225,NULL,NULL),
	(NULL,'DoMeCare 欣兰 黑里透白冻膜 225g+城野医生水 100ml 【拍套餐享优惠】',NULL,'img/meir-lb-2.jpg',NULL,175,395,NULL,NULL),
	(NULL,'贝德玛 舒妍温和卸妆水 500毫升 蓝水 卸妆保养一瓶搞定',NULL,'img/meir-lb-3.jpg',NULL,105,225,NULL,NULL),
	(NULL,'【3件装】MEDIHEAL 美迪恵尔 N.M.F针剂水库保湿面膜 10片/盒【拍套餐享优惠】',NULL,'img/meir-lb-4.jpg',NULL,186,507,NULL,NULL),

	(NULL,'【蜜桃粉!】Fjallraven 瑞典北极狐 Kanken Classic 经典款双肩背包 F23510-319',NULL,'img/shirt-lb-1.jpg',NULL,439,699,NULL,NULL),
	(NULL,'【领券立减80】Ray·Ban 雷朋 非偏光镜片 派对达人系列太阳眼镜 墨绿色 RB3016 W0365 镜片尺寸49毫米',NULL,'img/shirt-lb-2.jpg',NULL,659,998,NULL,NULL),
	(NULL,'【2代短筒靴】UGG  Classic Mini II系列 女士防水防污羊皮短筒雪地靴',NULL,'img/shirt-lb-3.jpg',NULL,699,899,NULL,NULL),
	(NULL,'网易严选 雪丝竹节纹男式隐形袜 5双装',NULL,'img/shirt-lb-4.jpg',NULL,39,39,NULL,NULL),

	(NULL,'SHISEIDO 资生堂旗下 Fino  高效滋润渗透发膜 230克/罐',NULL,'img/homeju-lb-1.jpg',NULL,58,148,NULL,NULL),
	(NULL,'Propolinse 比那氏蜂胶除口臭漱口水600毫升/瓶 2瓶装',NULL,'img/homeju-lb-2.jpg',NULL,79,128,NULL,NULL),
	(NULL,'Lauríer 乐而雅 S系列 超薄瞬吸护翼日用卫生巾 20.5厘米 28片/包',NULL,'img/homeju-lb-3.jpg',NULL,29,48,NULL,NULL),
	(NULL,'熊野油脂 无硅弱酸性马油洗发水 600毫升/瓶 2瓶装',NULL,'img/homeju-lb-4.jpg',NULL,69,129,NULL,NULL),
	
	(NULL,'【祛黄美颜好气色】Salus 莎露斯 Floradix 德国铁元草本营养液补铁养血绿色版500ml 2件',NULL,'img/yyang-lb-1.jpg',NULL,199,598,NULL,NULL),
	(NULL,'【钙质易吸收，不腹胀】Swisse 钙&VD片 150片/罐 2罐',NULL,'img/yyang-lb-2.jpg',NULL,162,378,NULL,NULL),
	(NULL,'【宋钟基同款】KGC 正官庄 everytime高丽参口服液 10ml*30支',NULL,'img/yyang-lb-3.jpg',NULL,668,888,NULL,NULL),
	(NULL,'【吴秀波同款】【日常关节保养】Schiff 维骨力氨糖软骨素片170粒 2瓶',NULL,'img/yyang-lb-4.jpg',NULL,369,369,NULL,NULL),

	(NULL,'nathome 北欧欧慕 NSH0603 可折叠双电压电热水壶 旅行便携 0.6L 白色',NULL,'img/sma-lb-1.jpg',NULL,159,199,NULL,NULL),
	(NULL,'Apple 苹果 AirPods 蓝牙无线耳机（MMEF2CH/A）',NULL,'img/sma-lb-2.jpg',NULL,699,989,NULL,NULL),
	(NULL,'Apple 苹果 iPhone X 64GB 移动联通电信4G手机 国内行货',NULL,'img/sma-lb-3.jpg',NULL,7098,8316,NULL,NULL),
	(NULL,'PHILIPS 飞利浦钻石亮白型声波震动电动牙刷HX9362/67 粉钻',NULL,'img/sma-lb-4.jpg',NULL,869,1699,NULL,NULL),

	(NULL,'【24/7系列】OSPREY Questa 魁星 城市通勤日用双肩背包 27L',NULL,'img/sport-lb-1.jpg',NULL,769,899,NULL,NULL),
	(NULL,'Adidas 三叶草 Superstar 黑白金标贝壳头男女滑板鞋运动板鞋',NULL,'img/sport-lb-2.jpg',NULL,449,799,NULL,NULL),
	(NULL,'SUUNTO 颂拓 TRAVERSE ALPHA 户外运动GPS 多功能腕表 远征阿尔法军表',NULL,'img/sport-lb-3.jpg',NULL,329,499,NULL,NULL),
	(NULL,'【防晒神器】Let s diet 韩国美肤光疗 防晒帽 防晒指数 UPF50+ 均码',NULL,'img/sport-lb-4.jpg',NULL,99,198,NULL,NULL),

	#猜你喜欢
	(NULL,'SHISEIDO 资生堂 安耐晒小金瓶防晒露  60毫升 2018版本 防水防汗',NULL,'img/jrsx-1.jpg',NULL,169,300,NULL,NULL),
	(NULL,'unicharm 尤妮佳 Silcot省1/2化妆水化妆棉 40枚 四盒装',NULL,'img/ylike-2.jpg',NULL,62,99,NULL,NULL),
	(NULL,'【自营 3瓶装】RE:CIPE 水晶防晒喷雾 150毫升/瓶  2018新版【拍套餐享优惠】',NULL,'img/ylike-3.jpg',NULL,162,395,NULL,NULL),
	(NULL,'【10件装】NARIS UP 娜丽丝 UV防晒喷雾 90克',NULL,'img/ylike-4.jpg',NULL,469,999,NULL,NULL),

	#专区商品品牌
	(NULL,NULL,NULL,'img/1-rmai-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/1-rmai-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/1-rmai-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/1-rmai-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/1-rmai-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/2-rmai-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/2-rmai-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/2-rmai-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/2-rmai-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/2-rmai-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/3-rmai-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/3-rmai-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/3-rmai-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/3-rmai-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/3-rmai-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/4-rmai-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/4-rmai-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/4-rmai-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/4-rmai-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/4-rmai-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/5-rmai-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/5-rmai-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/5-rmai-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/5-rmai-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/5-rmai-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/6-rmai-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/6-rmai-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/6-rmai-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/6-rmai-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/6-rmai-5.jpg',NULL,NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/7-rmai-1.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/7-rmai-2.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/7-rmai-3.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/7-rmai-4.jpg',NULL,NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/7-rmai-5.jpg',NULL,NULL,NULL,NULL,NULL);


/**/

/*2.会场图片kl_index_huich
CREATE TABLE kl_index_huich(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64)
);
INSERT INTO kl_index_huich VALUES*/


/*3.今日限时购
CREATE TABLE kl_index_jrxsg(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64),
	details VARCHAR(128),
	price DECIMAL(10,2),
	price_del DECIMAL(10,2)
);
INSERT INTO kl_index_jrxsg VALUES*/


/*4.今日上新kl_index_jrsx
CREATE TABLE kl_index_jrsx(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img1 VARCHAR(128),
	img2 VARCHAR(128),
	title VARCHAR(64),
	price DECIMAL(10,2),
	price_del DECIMAL(10,2)
);
INSERT INTO kl_index_jrsx VALUES*/


/*5.热门品牌kl_index_rmpp
CREATE TABLE kl_index_rmpp(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64),
	details VARCHAR(128)
);
INSERT INTO kl_index_rmpp VALUES*/


/*6.专区首图kl_index_product_first
CREATE TABLE kl_index_product_first(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128)
);
INSERT INTO kl_index_product_first VALUES*/




/*8.专区商品轮播kl_index_product_lb
CREATE TABLE kl_index_product_lb(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(128), 
	price DECIMAL(10,2),
	price_del DECIMAL(10,2)
);
INSERT INTO kl_index_product_lb VALUES*/
	
/**/

/*9.专区商品品牌kl_index_product_pp
CREATE TABLE kl_index_product_pp(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128)
);
INSERT INTO kl_index_product_pp VALUES*/
	

/**/




/**商品图片
CREATE TABLE kl_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #编号
  lg VARCHAR(128)             #图片路径
);
INSERT INTO kl_laptop_pic VALUES
	(NULL,1,img/1-rmai-1.jpg),
	(NULL,1,img/1-rmai-2.jpg),
	(NULL,1,img/1-rmai-3.jpg),
	(NULL,1,img/1-rmai-4.jpg),
	(NULL,1,img/1-rmai-5.jpg),

	(NULL,2,img/2-rmai-1.jpg),
	(NULL,2,img/2-rmai-2.jpg),
	(NULL,2,img/2-rmai-3.jpg),
	(NULL,2,img/2-rmai-4.jpg),
	(NULL,2,img/2-rmai-5.jpg),

	(NULL,3,img/3-rmai-1.jpg),
	(NULL,3,img/3-rmai-2.jpg),
	(NULL,3,img/3-rmai-3.jpg),
	(NULL,3,img/3-rmai-4.jpg),
	(NULL,3,img/3-rmai-5.jpg),

	(NULL,4,img/4-rmai-1.jpg),
	(NULL,4,img/4-rmai-2.jpg),
	(NULL,4,img/4-rmai-3.jpg),
	(NULL,4,img/4-rmai-4.jpg),
	(NULL,4,img/4-rmai-5.jpg),

	(NULL,5,img/5-rmai-1.jpg),
	(NULL,5,img/5-rmai-2.jpg),
	(NULL,5,img/5-rmai-3.jpg),
	(NULL,5,img/5-rmai-4.jpg),
	(NULL,5,img/5-rmai-5.jpg),

	(NULL,6,img/6-rmai-1.jpg),
	(NULL,6,img/6-rmai-2.jpg),
	(NULL,6,img/6-rmai-3.jpg),
	(NULL,6,img/6-rmai-4.jpg),
	(NULL,6,img/6-rmai-5.jpg),
	(NULL,7,img/7-rmai-1.jpg),
	(NULL,7,img/7-rmai-2.jpg),
	(NULL,7,img/7-rmai-3.jpg),
	(NULL,7,img/7-rmai-4.jpg),
	(NULL,7,img/7-rmai-5.jpg),

	(NULL,8,img/aixin.png),
	(NULL,9,img/all-smlogo.png),
	(NULL,10,img/bottom-1.png),
	(NULL,10,img/bottom-2.png),
	(NULL,10,img/bottom-3.png),
	(NULL,10,img/bottom-4.gif),
	(NULL,10,img/bottom-logo.png),
	(NULL,10,img/bottom-phone-erw.png),
	(NULL,10,img/bottom-wb.png),
	(NULL,10,img/bottom-weibo.png),
	(NULL,10,img/bottom-weix.png),
	(NULL,10,img/bottom-wx.png),
	(NULL,10,img/bottom-yix.png),

	(NULL,11,img/fixed-ewm.jpg),

	(NULL,12,img/homeju-1.jpg),
	(NULL,12,img/homeju-2.jpg),
	(NULL,12,img/homeju-3.jpg),
	(NULL,12,img/homeju-4.jpg),
	(NULL,12,img/homeju-5.jpg),
	(NULL,12,img/homeju-lb-1.jpg),
	(NULL,12,img/homeju-lb-2.jpg),
	(NULL,12,img/homeju-lb-3.jpg),
	(NULL,12,img/homeju-lb-4.jpg),

	(NULL,13,img/jrsx-1-1.jpg),
	(NULL,13,img/jrsx-1.jpg),
	(NULL,13,img/jrsx-2.jpg),
	(NULL,13,img/jrsx-3.jpg),
	(NULL,13,img/jrsx-4.jpg),
	(NULL,13,img/jrsx-5.jpg),
	(NULL,13,img/jrsx-6.jpg),
	(NULL,13,img/jrsx-7.jpg),
	(NULL,13,img/jrsx-8.jpg),

	(NULL,14,img/jrxsg-1.jpg),
	(NULL,14,img/jrxsg-2.jpg),
	(NULL,14,img/jrxsg-3.jpg),
	(NULL,14,img/jrxsg-4.jpg),
	(NULL,14,img/jrxsg-5.jpg),

	(NULL,15,img/List-1.jpg),
	(NULL,15,img/list-1.png),
	(NULL,15,img/list-2.png),
	(NULL,15,img/list-3.png),
	(NULL,15,img/list-4.png),
	(NULL,15,img/list-5.png),
	(NULL,15,img/list-6.png),
	(NULL,15,img/list-7.png),
	(NULL,15,img/list-8.png),
	(NULL,15,img/list-9.png),
	(NULL,15,img/list-10.png),

	(NULL,16,img/logo-sousou.png),
	(NULL,17,img/logo.png),
	(NULL,18,img/manjian.jpg),

	(NULL,19,img/meir-1.jpg),
	(NULL,19,img/meir-2.jpg),
	(NULL,19,img/meir-3.jpg),
	(NULL,19,img/meir-4.jpg),
	(NULL,19,img/meir-5.jpg),
	(NULL,19,img/meir-lb-1.jpg),
	(NULL,19,img/meir-lb-2.jpg),
	(NULL,19,img/meir-lb-3.jpg),
	(NULL,19,img/meir-lb-4.jpg),

	(NULL,20,img/middle-1.jpg),
	(NULL,20,img/middle-2.jpg),
	(NULL,20,img/middle-3.jpg),
	(NULL,20,img/middle-4.jpg),

	(NULL,21,img/my-1.jpg),
	(NULL,21,img/my-2.jpg),
	(NULL,21,img/my-3.jpg),
	(NULL,21,img/my-4.jpg),
	(NULL,21,img/my-5.jpg),
	(NULL,21,img/my-lb-1-1.jpg),
	(NULL,21,img/my-lb-1-2.jpg),
	(NULL,21,img/my-lb-1-3.jpg),
	(NULL,21,img/my-lb-1-4.jpg),

	(NULL,22,img/nav-phone.png),

	(NULL,23,img/rmpp-1-1.jpg),
	(NULL,23,img/rmpp-1-2.jpg),
	(NULL,23,img/rmpp-1-3.jpg),
	(NULL,23,img/rmpp-2.jpg),
	(NULL,23,img/rmpp-3.jpg),
	(NULL,23,img/rmpp-4.jpg),
	(NULL,23,img/rmpp-5.jpg),
	(NULL,23,img/rmpp-6.jpg),
	(NULL,23,img/rmpp-7.jpg),
	(NULL,23,img/rmpp-8.jpg),
	(NULL,23,img/rmpp-9.jpg),

	(NULL,24,img/section-mj.jpg),

	(NULL,25,img/shirt-1.jpg),
	(NULL,25,img/shirt-2.jpg),
	(NULL,25,img/shirt-3.jpg),
	(NULL,25,img/shirt-4.jpg),
	(NULL,25,img/shirt-5.jpg),
	(NULL,25,img/shirt-lb-1.jpg),
	(NULL,25,img/shirt-lb-2.jpg),
	(NULL,25,img/shirt-lb-3.jpg),
	(NULL,25,img/shirt-lb-4.jpg),

	(NULL,26,img/sma-1.jpg),
	(NULL,26,img/sma-2.jpg),
	(NULL,26,img/sma-3.jpg),
	(NULL,26,img/sma-4.jpg),
	(NULL,26,img/sma-5.jpg),
	(NULL,26,img/sma-lb-1.jpg),
	(NULL,26,img/sma-lb-2.jpg),
	(NULL,26,img/sma-lb-3.jpg),
	(NULL,26,img/sma-lb-4.jpg),

	(NULL,27,img/sport-1.jpg),
	(NULL,27,img/sport-2.jpg),
	(NULL,27,img/sport-3.jpg),
	(NULL,27,img/sport-4.jpg),
	(NULL,27,img/sport-5.jpg),
	(NULL,27,img/sport-lb-1.jpg),
	(NULL,27,img/sport-lb-2.jpg),
	(NULL,27,img/sport-lb-3.jpg),
	(NULL,27,img/sport-lb-4.jpg),

	(NULL,28,img/top-shoppcart.png),
	(NULL,28,img/top-soso.png),
	(NULL,28,img/top.jpg),

	(NULL,29,img/ylike-1.jpg),
	(NULL,29,img/ylike-2.jpg),
	(NULL,29,img/ylike-3.jpg),
	(NULL,29,img/ylike-4.jpg),

	(NULL,30,img/yyang-1.jpg),
	(NULL,30,img/yyang-2.jpg),
	(NULL,30,img/yyang-3.jpg),
	(NULL,30,img/yyang-4.jpg),
	(NULL,30,img/yyang-5.jpg),
	(NULL,30,img/yyang-lb-1.jpg),
	(NULL,30,img/yyang-lb-2.jpg),
	(NULL,30,img/yyang-lb-3.jpg),
	(NULL,30,img/yyang-lb-4.jpg),*/

	/*login文件夹中的img
	(NULL,31,img/1.png),
	(NULL,32,img/3.jpg),
	(NULL,33,img/all-smlogo.png),
	(NULL,34,img/all.png),
	(NULL,35,img/bg.jpg),
	
	(NULL,36,img/bottom-1.png),
	(NULL,36,img/bottom-3.png),
	(NULL,36,img/bottom-4.gif),
	
	(NULL,37,img/logo.png),
	(NULL,38,img/phone-suo.png),
	(NULL,39,img/scap.png),
	(NULL,40,img/slider.png),*/
	
	/*购物车中的img
	(NULL,41,img/7toe.png),
	(NULL,42,img/all-smlogo.png),

	(NULL,43,img/bottom-1.png),
	(NULL,43,img/bottom-2.png),
	(NULL,43,img/bottom-3.png),
	(NULL,43,img/bottom-4.gif),
	(NULL,43,img/bottom-phone-erw.png),
	(NULL,43,img/bottom-weibo.png),
	(NULL,43,img/bottom-weix.png),
	(NULL,43,img/bottom-yix.png),

	(NULL,44,img/cart-1.jpg),
	(NULL,44,img/cart-2.jpg),
	(NULL,44,img/cart-3.jpg),
	
	(NULL,45,img/guess-1.jpg),
	(NULL,45,img/guess-2.jpg),
	(NULL,45,img/guess-3.jpg),
	(NULL,45,img/guess-4.jpg),
	(NULL,45,img/guess-5.jpg),
	
	(NULL,46,img/lapa.png),
	
	(NULL,47,img/logo-sousou.png),
	(NULL,47,img/logo.png),
	(NULL,48,img/red-gou.png),
	(NULL,49,img/top-shoppcart.png),
	
	(NULL,50,img/we-3.jpg),
	(NULL,50,img/we-4.jpg),
	(NULL,50,img/we-5.jpg),
	
	(NULL,51,img/zj-1.jpg),
	(NULL,51,img/zj-2.jpg),
	(NULL,51,img/zj-3.jpg),
	(NULL,51,img/zj-4.jpg);*/
	
	
/**/


/*#6.商品类别表kl_laptop_family
CREATE TABLE kl_laptop_family(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(32)
);
INSERT INTO kl_laptop_family VALUES
(NULL,'会场商品'),
(NULL,'今日限时购'),
(NULL,'今日上新'),
(NULL,'热门品牌'),
(NULL,'母婴专区'),
(NULL,'美容彩妆'),
(NULL,'服饰鞋包'),
(NULL,'家居个护'),
(NULL,'营养保健'),
(NULL,'数码家电'),
(NULL,'运动户外'),
(NULL,'猜你喜欢');*/




