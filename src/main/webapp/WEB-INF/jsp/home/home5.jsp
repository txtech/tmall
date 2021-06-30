<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<c:set var="title" value="首页 - ${website_name}" />
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>首页-${website_name}</title>
	<meta name="keywords" content="${website_name}">
	<meta name="description" content="${website_name}">
	<link rel="stylesheet" type="text/css" href="${contextPath}/home2/base.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/home2/index.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/home2/layui.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/home2/base.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/home2/footer.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/home2/layer.css" id="layui_layer_skinlayercss" style="">

	<script src="${contextPath}/home2/swiper.js"></script>
	<script src="${contextPath}/home2/global.js"></script>
	<script src="${contextPath}/home2/jquery-2.js"></script>
	<script src="${contextPath}/home2/velocity.js"></script>
	<script src="${contextPath}/home2/pc_common.js"></script>
	<script src="${contextPath}/home2/layer-min.js"></script>
	<script src="${contextPath}/home2/velocity_002.js"></script>
	<script src="${contextPath}/home2/ellipsisMore.js"></script>
	<script src="${contextPath}/home2/getBrowerInfo.js"></script>
	<script src="${contextPath}/home2/jquery-1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${contextPath}/home2/common.js" type="text/javascript" charset="utf-8"></script>
</head>

<%@include file="../include/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>${website_name}</title>
	<link rel="stylesheet" href="http://mall.newbee.ltd/mall/css/swiper-bundle.min.css">
	<link rel="stylesheet" href="http://mall.newbee.ltd/mall/css/iconfont.css">
	<link rel="stylesheet" href="http://mall.newbee.ltd/mall/css/common.css">
	<link rel="stylesheet" href="http://mall.newbee.ltd/mall/styles/header.css">
	<link rel="stylesheet" href="http://mall.newbee.ltd/mall/styles/index.css">
	<link rel="stylesheet" href="http://mall.newbee.ltd/admin/plugins/sweetalert/sweetalert.css"/>
	<meta name="keywords" content="${website_name}" />
	<meta name="description" content="${website_name}"/>
</head>
<body>
<header id="header">
	<div class="center">
		<ul class="fl">
			<li><a href="${contextPath}">${website_name}</a></li>
			<li><a href="admin/">后台管理系统</a></li>
		</ul>
	</div>
</header>

<content id="content">
	<nav id="nav">
		<div class="banner_x center">
			<a href="/index" class="logo"><h1>新蜂商城</h1></a>
			<div class="fr">
				<div class="search">
					<input class="text" type="text" id="keyword" autocomplete="off">
					<div class="search_hot">
					</div>
				</div>
				<div class="button iconfont icon-search" onclick="search()"></div>
			</div>
		</div>
	</nav>
	<div id="banner">
		<div class="all-sort-list">

			<div class="item">
				<h3><span>·</span><a href="##">家电 数码 手机</a></h3>
				<div class="item-list clearfix">
					<div class="subitem">

						<dl class="fore1">
							<dt><a href="#">家电</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=20">
									生活电器
								</a></em>

								<em><a href="/search?goodsCategoryId=110">
									wer
								</a></em>

								<em><a href="/search?goodsCategoryId=21">
									厨房电器
								</a></em>

								<em><a href="/search?goodsCategoryId=22">
									扫地机器人
								</a></em>

								<em><a href="/search?goodsCategoryId=23">
									吸尘器
								</a></em>

								<em><a href="/search?goodsCategoryId=24">
									取暖器
								</a></em>

								<em><a href="/search?goodsCategoryId=25">
									豆浆机
								</a></em>

								<em><a href="/search?goodsCategoryId=26">
									暖风机
								</a></em>

								<em><a href="/search?goodsCategoryId=27">
									加湿器
								</a></em>

								<em><a href="/search?goodsCategoryId=28">
									蓝牙音箱
								</a></em>

								<em><a href="/search?goodsCategoryId=29">
									烤箱
								</a></em>

								<em><a href="/search?goodsCategoryId=30">
									卷发器
								</a></em>

								<em><a href="/search?goodsCategoryId=31">
									空气净化器
								</a></em>

							</dd>
						</dl>

						<dl class="fore1">
							<dt><a href="#">数码</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=32">
									游戏主机
								</a></em>

								<em><a href="/search?goodsCategoryId=43">
									二手手机
								</a></em>

								<em><a href="/search?goodsCategoryId=33">
									数码精选
								</a></em>

								<em><a href="/search?goodsCategoryId=34">
									平板电脑
								</a></em>

								<em><a href="/search?goodsCategoryId=35">
									苹果 Apple
								</a></em>

								<em><a href="/search?goodsCategoryId=36">
									电脑主机
								</a></em>

								<em><a href="/search?goodsCategoryId=37">
									数码相机
								</a></em>

								<em><a href="/search?goodsCategoryId=38">
									电玩动漫
								</a></em>

								<em><a href="/search?goodsCategoryId=39">
									单反相机
								</a></em>

								<em><a href="/search?goodsCategoryId=40">
									键盘鼠标
								</a></em>

								<em><a href="/search?goodsCategoryId=41">
									无人机
								</a></em>

								<em><a href="/search?goodsCategoryId=42">
									二手电脑
								</a></em>

							</dd>
						</dl>

						<dl class="fore1">
							<dt><a href="#">手机</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=45">
									荣耀手机
								</a></em>

								<em><a href="/search?goodsCategoryId=46">
									华为手机
								</a></em>

								<em><a href="/search?goodsCategoryId=49">
									华为 P30
								</a></em>

								<em><a href="/search?goodsCategoryId=44">
									iPhone 11
								</a></em>

								<em><a href="/search?goodsCategoryId=47">
									苹果 iPhone
								</a></em>

								<em><a href="/search?goodsCategoryId=48">
									华为 Mate 20
								</a></em>

								<em><a href="/search?goodsCategoryId=51">
									小米手机
								</a></em>

								<em><a href="/search?goodsCategoryId=53">
									OPPO
								</a></em>

								<em><a href="/search?goodsCategoryId=54">
									一加
								</a></em>

								<em><a href="/search?goodsCategoryId=55">
									小米 MIX
								</a></em>

								<em><a href="/search?goodsCategoryId=56">
									Reno
								</a></em>

								<em><a href="/search?goodsCategoryId=57">
									vivo
								</a></em>

								<em><a href="/search?goodsCategoryId=58">
									手机以旧换新
								</a></em>

							</dd>
						</dl>

					</div>
				</div>
			</div>

			<div class="item">
				<h3><span>·</span><a href="##">女装 男装 穿搭</a></h3>
				<div class="item-list clearfix">
					<div class="subitem">

						<dl class="fore1">
							<dt><a href="#">女装</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=76">
									外套
								</a></em>

							</dd>
						</dl>

					</div>
				</div>
			</div>

			<div class="item">
				<h3><span>·</span><a href="##">家具 家饰 家纺</a></h3>
				<div class="item-list clearfix">
					<div class="subitem">

						<dl class="fore1">
							<dt><a href="#">家具</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=77">
									沙发
								</a></em>

							</dd>
						</dl>

					</div>
				</div>
			</div>

			<div class="item">
				<h3><span>·</span><a href="##">运动 户外 乐器</a></h3>
				<div class="item-list clearfix">
					<div class="subitem">

						<dl class="fore1">
							<dt><a href="#">运动</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=78">
									跑鞋
								</a></em>

							</dd>
						</dl>

					</div>
				</div>
			</div>

			<div class="item">
				<h3><span>·</span><a href="##">游戏 动漫 影视</a></h3>
				<div class="item-list clearfix">
					<div class="subitem">

						<dl class="fore1">
							<dt><a href="#">游戏</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=82">
									LOL
								</a></em>

							</dd>
						</dl>

					</div>
				</div>
			</div>

			<div class="item">
				<h3><span>·</span><a href="##">美妆 清洁 宠物</a></h3>
				<div class="item-list clearfix">
					<div class="subitem">

						<dl class="fore1">
							<dt><a href="#">美妆</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=86">
									口红
								</a></em>

								<em><a href="/search?goodsCategoryId=104">
									睫毛膏
								</a></em>

								<em><a href="/search?goodsCategoryId=103">
									腮红
								</a></em>

								<em><a href="/search?goodsCategoryId=102">
									粉底
								</a></em>

								<em><a href="/search?goodsCategoryId=101">
									隔离霜
								</a></em>

								<em><a href="/search?goodsCategoryId=100">
									美白
								</a></em>

								<em><a href="/search?goodsCategoryId=99">
									气垫
								</a></em>

							</dd>
						</dl>

					</div>
				</div>
			</div>

			<div class="item">
				<h3><span>·</span><a href="##">工具 装修 建材</a></h3>
				<div class="item-list clearfix">
					<div class="subitem">

						<dl class="fore1">
							<dt><a href="#">工具</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=90">
									转换器
								</a></em>

							</dd>
						</dl>

					</div>
				</div>
			</div>

			<div class="item">
				<h3><span>·</span><a href="##">鞋靴 箱包 配件</a></h3>
				<div class="item-list clearfix">
					<div class="subitem">

						<dl class="fore1">
							<dt><a href="#">鞋靴</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=98">
									休闲鞋
								</a></em>

							</dd>
						</dl>

					</div>
				</div>
			</div>

			<div class="item">
				<h3><span>·</span><a href="##">玩具 孕产 用品</a></h3>
				<div class="item-list clearfix">
					<div class="subitem">

						<dl class="fore1">
							<dt><a href="#">玩具</a></dt>
							<dd>

								<em><a href="/search?goodsCategoryId=116">
									机器人
								</a></em>

							</dd>
						</dl>

					</div>
				</div>
			</div>

		</div>
		<div class="swiper-container fl">
			<div class="swiper-wrapper">
				<!-- 配置了轮播图则显示后台配置的轮播图 -->


				<div class="swiper-slide">
					<a href="https://juejin.im/book/5da2f9d4f265da5b81794d48/section/5da2f9d6f265da5b794f2189">
						<img src="https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner-mate40.png" alt="">
					</a>
				</div>

				<div class="swiper-slide">
					<a href="https://juejin.im/book/5da2f9d4f265da5b81794d48/section/5da2f9d6f265da5b794f2189">
						<img src="https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner2.png" alt="">
					</a>
				</div>


				<!-- 未配置轮播图则显示默认的三张轮播图 -->

			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>

	<div id="sub_banner">
		<div class="hot-image">
			<a href="/goods/detail/10894">
				<img src="http://mall.newbee.ltd/goods-img/mate30p3.png" alt="HUAWEI Mate 30 Pro">
			</a>
		</div>

		<div class="hot-image">
			<a href="/goods/detail/10284">
				<img src="http://mall.newbee.ltd/goods-img/23ac3107-6309-40c8-bd28-164eb1186b62.jpg" alt="Apple iPhone XR (A2108)">
			</a>
		</div>

		<div class="hot-image">
			<a href="/goods/detail/10250">
				<img src="http://mall.newbee.ltd/goods-img/465936e0-40ad-4968-b868-4bea20c7beec.jpg" alt="Apple 2019款 Macbook Pro 13.3">
			</a>
		</div>

		<div class="hot-image">
			<a href="/goods/detail/10159">
				<img src="http://mall.newbee.ltd/goods-img/53c9f268-7cd4-4fac-909c-2dc066625655.jpg" alt="Apple AirPods 配充电盒">
			</a>
		</div>
	</div>

	<div id="flash">
		<h2>新品上线</h2>
		<ul>
			<li>
				<a href="/goods/detail/10909">
					<img src="https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/mate40pro%2B.png" alt="华为 HUAWEI Mate 40 Pro+ 5G 全网通 ...">
					<p class="name">华为 HUAWEI Mate 40 Pro+ 5G 全网通 ...</p>
					<p class="discount">5nm麒麟9000旗舰芯片 | 超感光徕卡电...</p>
					<p class="item_price">7988</p>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10908">
					<img src="https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/mate40-white.png" alt="华为 HUAWEI Mate 40 Pro 全网通5G手机 ...">
					<p class="name">华为 HUAWEI Mate 40 Pro 全网通5G手机 ...</p>
					<p class="discount">5nm麒麟9000旗舰芯片 | 超感光徕卡电...</p>
					<p class="item_price">6488</p>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10903">
					<img src="https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p40-silver.png" alt="华为 HUAWEI P40 冰霜银 全网通5G手机">
					<p class="name">华为 HUAWEI P40 冰霜银 全网通5G手机</p>
					<p class="discount">麒麟990 5G SoC芯片 5000万超感...</p>
					<p class="item_price">4399</p>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10902">
					<img src="http://mall.newbee.ltd/upload/20210413_12350358.jpg" alt="小米10至尊纪念版">
					<p class="name">小米10至尊纪念版</p>
					<p class="discount">120X 超远变焦 / 120W 秒充科技 ...</p>
					<p class="item_price">5099</p>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10906">
					<img src="http://mall.newbee.ltd/upload/20210413_12433527.jpg" alt="Apple iPhone12 Pro (A2408) 128...">
					<p class="name">Apple iPhone12 Pro (A2408) 128...</p>
					<p class="discount">A14仿生芯片，6.1英寸超视网膜XDR显示...</p>
					<p class="item_price">8499</p>
				</a>
			</li>
		</ul>
	</div>

	<div id="recommend">
		<h2>为你推荐</h2>
		<a href="##" class="more">查看更多>></a>
		<ul>
			<li>
				<a href="/goods/detail/10233">
					<div class="info discount">雾面哑光 持久锁色</div>
					<img src="/goods-img/04949c0e-87df-445b-96dd-29e7fc69f734.jpg" alt="纪梵希高定香榭天鹅绒唇膏306#">
					<p class="name">纪梵希高定香榭天鹅绒唇膏306#</p>
					<p class="item_price">355</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10195">
					<div class="info discount">智能降噪 长久续航</div>
					<img src="/goods-img/0dc503b2-90a2-4971-9723-c085a1844b76.jpg" alt="索尼 WH-1000XM3 头戴式耳机">
					<p class="name">索尼 WH-1000XM3 头戴式耳机</p>
					<p class="item_price">2599</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10180">
					<div class="info discount">妙出新境界</div>
					<img src="/goods-img/64768a8d-0664-4b29-88c9-2626578ffbd1.jpg" alt="Apple AirPods 配充电盒">
					<p class="name">Apple AirPods 配充电盒</p>
					<p class="item_price">1246</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10894">
					<div class="info discount">重构想象</div>
					<img src="/goods-img/mate30p3.png" alt="HUAWEI Mate 30 Pro">
					<p class="name">HUAWEI Mate 30 Pro</p>
					<p class="item_price">5399</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10237">
					<div class="info discount">雾面丝绒哑光</div>
					<img src="/goods-img/1930d79b-88bd-4c5c-8510-0697c9ad2578.jpg" alt="MAC 雾面丝绒哑光子弹头口红">
					<p class="name">MAC 雾面丝绒哑光子弹头口红</p>
					<p class="item_price">165</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10907">
					<div class="info discount">跃见非凡</div>
					<img src="https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/mate40-silver.png" alt="华为 HUAWEI Mate 40 Pro 全网通5G手机 ...">
					<p class="name">华为 HUAWEI Mate 40 Pro 全网通5G手机 ...</p>
					<p class="item_price">6488</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10254">
					<div class="info discount">再次倾心</div>
					<img src="/goods-img/7810bc9d-236f-4386-a0ef-45a831b49bf2.jpg" alt="Apple 2019款 MacBook Air 13.3">
					<p class="name">Apple 2019款 MacBook Air 13.3</p>
					<p class="item_price">8499</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10154">
					<div class="info discount">无印良品</div>
					<img src="/goods-img/15395057-94e9-4545-a8ee-8aee025f40c5.jpg" alt="无印良品 MUJI 塑料浴室座椅">
					<p class="name">无印良品 MUJI 塑料浴室座椅</p>
					<p class="item_price">85</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10147">
					<div class="info discount">悠享惬意</div>
					<img src="/goods-img/0f701215-b782-40c7-8bbd-97b51be56461.jpg" alt="MUJI 羽毛 靠垫">
					<p class="name">MUJI 羽毛 靠垫</p>
					<p class="item_price">65</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>

			<li>
				<a href="/goods/detail/10158">
					<div class="info discount">无印良品</div>
					<img src="/goods-img/5488564b-8335-4b0c-a5a4-52f3f03ee728.jpg" alt="无印良品 女式粗棉线条纹长袖T恤">
					<p class="name">无印良品 女式粗棉线条纹长袖T恤</p>
					<p class="item_price">70</p>
					<p class="counter">猜你喜欢</p>
					<div class="comment">
						<p>新蜂精选</p>
						<p>好物也可以不贵</p>
					</div>
				</a>
			</li>
		</ul>
	</div>
</content>

<div class="site-footer">
	<div class="footer-related">
		<div class="footer-article w1100">
			<dl class="contact clearfix">
				<dt class="fl">
					<i class="iconfont"></i>
				</dt>
				<dd class="fl">
					<p class="text">人工客服</p>
					<p class="tel">400-xxx-xx13</p>
					<a href="//shang.qq.com/wpa/qunwpa?idkey=dc0e028f177932aee2c212a2dd60e0b8342042ac205305803ea801c4eea6727c">在线咨询</a>
				</dd>
			</dl>
			<dl class="col-article">
				<dt>帮助中心</dt>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">账户管理</a></dd>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">购物指南</a></dd>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">订单操作</a></dd>
			</dl>
			<dl class="col-article">
				<dt>关注我们</dt>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">新浪微博</a></dd>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">官方微信</a></dd>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">联系我们</a></dd>
			</dl>
			<dl class="col-article">
				<dt>线下门店</dt>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">NEWBEE TOWN</a>
				</dd>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">服务网点</a></dd>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">授权体验店</a></dd>
			</dl>
			<dl class="col-article">
				<dt>关于新蜂</dt>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">了解新蜂</a>
				</dd>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">加入新蜂</a>
				</dd>
				<dd><a rel="nofollow" href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">捐赠维护</a>
				</dd>
			</dl>
			<dl class="wx">
				<dt>newbee-mall</dt>
				<dd>
					<img src="/mall/image/pay/wxpay_qrcode.png">
				</dd>
				<dd class="other">
					<span>分公司：</span>
					<a href="//shang.qq.com/wpa/qunwpa?idkey=dc0e028f177932aee2c212a2dd60e0b8342042ac205305803ea801c4eea6727c">北京</a>
					<a href="//shang.qq.com/wpa/qunwpa?idkey=dc0e028f177932aee2c212a2dd60e0b8342042ac205305803ea801c4eea6727c">上海</a>
					<a href="//shang.qq.com/wpa/qunwpa?idkey=dc0e028f177932aee2c212a2dd60e0b8342042ac205305803ea801c4eea6727c">广州</a>
					<a href="//shang.qq.com/wpa/qunwpa?idkey=dc0e028f177932aee2c212a2dd60e0b8342042ac205305803ea801c4eea6727c">深圳</a>
					<a href="//shang.qq.com/wpa/qunwpa?idkey=dc0e028f177932aee2c212a2dd60e0b8342042ac205305803ea801c4eea6727c">杭州</a>
				</dd>
			</dl>
		</div>
		<div class="footer-links w1100">
			<p>友情链接：</p>
			<div class="clearfix">
				<a href="/index">新蜂商城</a>
				<a href="/admin">后台管理系统</a>
				<a href="https://edu.csdn.net/course/detail/26258">课程视频</a>
				<a href="https://juejin.im/book/5da2f9d4f265da5b81794d48?referrer=59199e22a22b9d0058279886">课程文档</a>
				<a href="https://gitee.com/newbee-ltd/newbee-donate">捐赠</a>
				<a href="https://github.com/newbee-ltd/newbee-mall/issues">问题反馈</a>
				<a href="https://github.com/newbee-ltd/newbee-mall">GitHub 地址</a>
				<a href="https://gitee.com/newbee-ltd/newbee-mall">码云Gitee 地址</a>
			</div>
		</div>
		<div class="footer-info w1100">
			<div class="info-text w1100">
				<p><a href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">新蜂商城 &nbsp; | &nbsp;
					Powered by 十三&nbsp;
					| &nbsp;</a>
					&nbsp;QQ交流群：796794009&nbsp;&nbsp; <a
							href="//shang.qq.com/wpa/qunwpa?idkey=dc0e028f177932aee2c212a2dd60e0b8342042ac205305803ea801c4eea6727c"><img
							border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="SpringBoot技术交流"
							title="SpringBoot技术交流"></a>
				</p>
				<p><a href="https://gitee.com/newbee-ltd/newbee-mall" target="_blank">Copyright © 2019-2020 十三  All
					Rights
					Reserved.&nbsp; | &nbsp; 浙ICP备17008806号-5 </a></p>
			</div>
		</div>

	</div>
</div>
<!-- jQuery -->
<script src="/admin/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/mall/js/swiper-bundle.min.js" type="text/javascript"></script>
<script src="/admin/plugins/sweetalert/sweetalert.min.js"></script>
<script src="/mall/js/index.js" type="text/javascript"></script>
<script src="/mall/js/search.js" type="text/javascript"></script>
</body>
</html>

<div class="w1224 clearfix">
	<div class="footer-bottom">
		<div class="tpshop-service">
			<img src="home2/footer.png" alt="" class="w-100">
		</div>
		<div class="w1224 footer-link clearfix">
			<div class="contact-us border-box">
				<div class="right-company clearfix">
					<div class="right-company-top clearfix">
						<div class="phone"><i></i><span class="phone-num">联系方式：${phone}</span></div>
					</div>
				</div>
			</div>
			<div class="left-help-list">
				<div class="help-list-wrap clearfix">
					<dl>
						<dt>帮助</dt>
						<dd><a onclick="openHelp(1)">常见问题</a></dd>
						<dd><a onclick="openHelp(5)">发票制度</a></dd>
						<dd><a onclick="openHelp(6)">找回密码</a></dd>
					</dl>
					<dl>
						<dt>配送服务</dt>
						<dd><a onclick="openHelp(2)">配送范围及时间</a></dd>
						<dd><a onclick="openHelp(2)">配送方式</a></dd>
					</dl>
					<dl>
						<dt>售后服务</dt>
						<dd><a onclick="openHelp(3)">退换货说明</a></dd>
					</dl>
					<dl>
						<dt>新手指南</dt>
						<dd><a onclick="openHelp(4)">购物须知</a></dd>
					</dl>
				</div>
			</div>
			<div class="w1224 clearfix">
				<div class="company-name">
					<span class="company-name-title">公司名称：</span>
					<span>${website_name}</span>
				</div>
				<div class="company-address">
					<span class="company-address-title">联系地址：</span>
					<span> ${(empty websiteAddress)?'安徽省芜湖市':websiteAddress}</span>
				</div>
			</div>
		</div>

		<div class="mod_copyright p">
			<p>Copyright © 20020-2025 ${website_name} 版权所有 保留一切权利<a href="http://beian.miit.gov.cn/" target="_blank">   备案号:${(empty SEOCode)?code:SEOCode}-1</a></p>
			<div style="text-align: center;line-height: 30px;"></div>
		</div>
	</div>

	<!--楼层导航-s-->
	<ul class="floor-nav" id="floor-nav" style="margin-top: -61px; display: none;">
		<c:forEach items="${categories}" var="c" varStatus="vs">
			<li class="border-box">
				<span>${c.name}</span>
			</li>
		</c:forEach>
		<div class="floor-nav-last" title="返回顶部" style="display: none;">
			<span>顶部</span>
		</div>
	</ul>
</div>

<script>
	function openHelp(id){
		window.open("js/home2help.html?"+ id);
	}
	// 延时加载二维码图片
	jQuery(function($) {
		$('img[img-url]').each(function() {
			var _this = $(this),
					url = _this.attr('img-url');
			_this.attr('src', url);
		});
	});
	$(function() {
		// 保持footer在底部
		$('body').css({
			'padding-bottom': $('.footer-bottom').height(),
			'min-height': $('html').height() - $('.footer-bottom').height()
		});
	})
</script>
<script>
	$(function() {
		$('#mySwiper .item').css('width', $('#mySwiper').width());
		swiper($('#mySwiper'));
		$('#mySwiper .item-pic').css('margin-left', -($('#mySwiper .item-pic').width() - $('#mySwiper').width()) / 2);
	})
</script>
<script>
	function init() {
		//首页商品分类显示
		$('.categorys .dd').show();
		//自动楼层居中设置
		$('#floor-nav').css('margin-top', ( - 41 * $('#floor-nav').find('li').length + 1) / 2);
		//右侧边栏
		rightBar();
		//楼层导航切换
		sidebarRollChange();
	}
	function rightBar() { //右侧边栏
		var $_slidebar4 = $('.floor-nav-last');
		$_slidebar4.click(function() {
			$('html,body').animate({'scrollTop': 0},500)
		});
	}

	function sidebarRollChange() { //楼层切换
		var $_floorList = $('.floor');
		var $_sidebar = $('#floor-nav');
		var floorTop = $('.floor-nav-last');
		// var draw_dot = $('.draw-dot');
		$_sidebar.find('li').click(function() { //点击切换楼层
			$('html,body').animate({'scrollTop': $_floorList.eq($(this).index()).offset().top},500)
		});
		// draw_dot.find('li').click(function () { //点击切换楼层
		// 	$('html,body').animate({
		// 		'scrollTop': $_floorList.eq($(this).index()).offset().top
		// 	}, 500)
		// });
		$(window).scroll(function() {
			var scrollTop = $(window).scrollTop();
			// 返回顶部
			// if (scrollTop < $_floorList.eq(0).offset().top - $(window).height() / 2) {
			// 	$('.shop-top').hide();
			// } else {
			// 	$('.shop-top').show();
			// }
			// 楼层
			if (scrollTop < $_floorList.eq(0).offset().top - $(window).height() / 2) {
				$_sidebar.hide();
				// 返回顶部
				floorTop.hide();
				return;
			}
			$_sidebar.show(); //左边侧边栏显示
			// 返回顶部
			floorTop.show();
			for (var j = 0,k = $_floorList.length; j < k; j++) {
				/*滚动改变侧边栏的状态*/
				if (scrollTop > $_floorList.eq(j).offset().top - $(window).height() / 2) {
					$_sidebar.find('li').eq(j).addClass('floor-nav-ac').siblings().removeClass('floor-nav-ac');
				}
			}
		})
	}

	init();
	$(function() {
		// 楼层轮播
		var cateListLen = '3';
		cateListLen = parseInt(cateListLen);
		for (var i = 1; i <= cateListLen; i++) {
			var swiperDom = '#mySwiper' + i;
			swiper($(swiperDom), {
				swiperItemWidth: $(swiperDom).find('.item').height() + 2,
				setIntervalTime: 5000,
				animateTime: 1000,
				num: 2,
				verticalOrHorizontal: 'vertical'
			});
		}
		var msie = (/msie (\d+\.\d+)/i).test(getBrowserInfo()[0]);
		var numIE = parseInt(getBrowserInfo()[0].replace(/[^0-9.]/ig, ""));
		if (msie && numIE === 8) {
			$('.contact-us .custom-service a:nth-child(2)').css({
				'margin-left': '30px'
			});
		}
	})
</script>
<script>
	// 全部商品分类
	$('#cata-nav').find('.item').hover(function() {
				$(this).addClass('nav-active').siblings().removeClass('nav-active');
			},
			function() {
				$(this).removeClass('nav-active');
			})
</script>
</body>
</html>
