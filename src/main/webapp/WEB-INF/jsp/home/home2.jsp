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
	<link rel="stylesheet" type="text/css" href="home2/base.css">
	<link rel="stylesheet" type="text/css" href="home2/index.css">
	<link rel="stylesheet" type="text/css" href="home2/layui.css">
	<link rel="stylesheet" type="text/css" href="home2/base.css">
	<link rel="stylesheet" type="text/css" href="home2/footer.css">
	<link rel="stylesheet" type="text/css" href="home2/layer.css" id="layui_layer_skinlayercss" style="">

	<script src="home2/swiper.js"></script>
	<script src="home2/global.js"></script>
	<script src="home2/jquery-2.js"></script>
	<script src="home2/velocity.js"></script>
	<script src="home2/pc_common.js"></script>
	<script src="home2/layer-min.js"></script>
	<script src="home2/velocity_002.js"></script>
	<script src="home2/ellipsisMore.js"></script>
	<script src="home2/getBrowerInfo.js"></script>
	<script src="home2/jquery-1.js" type="text/javascript" charset="utf-8"></script>
	<script src="home2/common.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="gray_f5" style="padding-bottom: 375px; min-height: 550px;">
    <div class="tpshop-tm-hander">
		<div class="top-hander index-top">
		  <div class="w1224 pr clearfix">
			<div class="fl nologin">
				<a href="login" id="login">欢迎登录</a>
				<a class="blue" href="register">免费注册</a>
			</div>
			<ul class="top-ri-header fr ">
			  <li class="top-min-cart border-box" id="hd-my-cart">
				<%--<a target="_blank" href="cart">我的购物车</a>--%>
			  </li>
			  <li class="spacer"></li>
			  <li>
				<a target="_blank" href="myOrder">我的订单</a>
			  </li>
				<li>
					<c:if test="${user.group=='admin' || user.group=='superAdmin'}">
						<a href="../admin">我的后台</a>
					</c:if>
				</li>
			  <li class="spacer"> </li>
			</ul>
		  </div>
		</div>
       <div class="nav-middan-z w1224 clearfix border-box pr">
        <div class="top-right">
          <div class="nav clearfix border-box">
            <div class="categorys home_categorys index-categorys">
              <div class="dt">
                <a class="border-box" href="" target="_blank">全部商品分类</a>
              </div>
              <!-- 全部商品分类-s -->
			  <div class="dd" style="display: block;">
				<div class="cata-nav" id="cata-nav">
					<c:forEach items="${categories}" var="c" varStatus="vs">
						<c:if test="${vs.count>=1}">
							<div class="item">
								<div class="item-left">
									<h3 class="cata-nav-name border-box"><div class="cata-nav-wrap"><a class="ellipsis-1" href="category?id=${c.id}" title="${c.name}">${c.name}</a></div></h3>
								</div>
								<div class="cata-nav-layer">
									<div class="cata-nav-left">
										<div class="subitems">
											<dl class="clearfix">
												<dd>
													<a href="category?id=${c.id}" target="_blank">${c.name} &gt;</a>
													<dl>
														<c:forEach items="${c.products}" var="p" varStatus="vs">
															<a href="product?id=${p.id}" target="_blank">${p.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</c:forEach>
													</dl>
												</dd>
											</dl>
										</div>
									</div>
									<div class="cata-nav-right"></div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			  </div>
			</div>

            <ul class="navitems clearfix border-box" id="navitems">
              <li><a class="border-box" href="">首页</a></li>
			   <c:forEach items="${categories}" var="c" varStatus="vs">
				<c:if test="${vs.count>=1 and vs.count<=4}">
					<li><a class="border-box" href="category?id=${c.id}">${c.name}</a</li>
				</c:if>
			   </c:forEach>
			</ul>
          </div>
          <!-- 搜索框 -->
          <div class="ecsc-search index-search">
            <form id="searchForm" action="search" class="ecsc-search-form index-search-form border-box">
               <input autocomplete="off" name="keyword" id="q" type="text" class="ecsc-search-input index-search-input border-box" placeholder="请输入搜索关键字...">
              <button type="submit" class="ecsc-search-button index-search-button"><i></i></button>
            </form>
          </div>
        </div>
      </div>
    </div>

	<div id="mySwiper" class="swiper clearfix">
		<ul class="swiper-inner banner-inner">
			<li class="item" style="background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 1903px;">
				<a class="item-pic" href="" style="margin-left: 0px;">
					<img class="w-100" src="pictures/banner/1.jpg" title="" alt="">
				</a>
			</li>
		</ul>
		<div class="pagination"></div>
		<a class="swiper-control left-btn t-all" href="javascript:;" style="display: none;"></a>
		<a class="swiper-control right-btn t-all" href="javascript:;" style="display: none;"></a>
	</div>

	<div class="w1224 clearfix">
		<!-- 推荐 -->
		<div class="flash-sale">
			<div class="flash-sale-container">
				<c:forEach items="${categories}" var="c" varStatus="vs">
					<c:if test="${vs.count>=1 and vs.count<=4}">
						<c:forEach items="${c.products}" var="p" varStatus="vs">
							<div class="flash-sale-item animate-scale fl">
								<a href="product?id=${p.id}">
									<div class="goods-pic border-box"><img class="w-100 lazy" src="${productImgDir}${p.image.path}"></div>
								</a>
								<div class="goods-con border-box">
									<div class="goods-name border-box ellipsis-1">${p.name}</div>
									<div class="goods-price clearfix border-box">
										<span class="shop-price ellipsis-1">￥${p.nowPrice}</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<!-- 楼层 -->
		<div class="shop-floor">
			<div class="w1224">
				<c:forEach items="${categories}" var="c" varStatus="cvs">
					<c:if test="${c.recommend > 0}">
					<div class="floor floor1 clearfix">
						<div class="floor-top clearfix border-box">
							<h3 class="floor-title border-box">
								<span class="floor-title-name border-box">${c.name}</span>
							</h3>
							<div class="floor-nav-list border-box fr">
								<a data-id="66095" class="floor-nav-item" href="category?id=${c.id}">
									<span class="border-box">更多</span>
								</a>
							</div>

							<div class="floor-main clearfix">
								<div class="floor-left fl">
									<c:forEach items="${c.products}" var="p" varStatus="vs">
										<c:if test="${vs.index==0}">
											<div class="floor-adv fl">
												<a class="adv-big" href=""><img class="w-100" src="${productImgDir}${p.image.path}" alt=""></a>
											</div>
										</c:if>
										<div class="floor-hotcate">
											<a title="${p.name}" class="floor-hotcate-item border-box fl" href="product?id=${p.id}">
												<span class="ellipsis-1">${p.name}</span>
												<i class="fr"> ></i>
											</a>
										</div>
									</c:forEach>
								</div>

								<div class="floor-goods-list border-box">
									<c:forEach items="${c.products}" var="p" varStatus="vs">
										<c:if test="${vs.index<6}">
										<div class="floor-goods-item animate-scale fl">
											<a href="product?id=${p.id}">
												<div class="goods-pic"><img class="w-100" src="${productImgDir}${p.image.path}" alt=""></div>
											</a>
											<div class="goods-con border-box">
												<div class="goods-name border-box">${p.name}</div>
												<div class="goods-price border-box">
													<span class="shop-price ellipsis-1">${p.nowPrice}</span>
												</div>
											</div>
										</div>
										</c:if>
									</c:forEach>
								</div>

								<div class="floor-recommend fr" id="mySwiper${cvs.index+1}">
									<div class="floor-recommend-wrap swiper-inner" style="height: 896px; top: -112px;">
										<c:forEach items="${c.products}" var="p" varStatus="vs">
											<a class="floor-recommend-item item" href="product?id=${p.id}">
												<div class="goods-pic item-pic">
													<img class="w-100" src="${productImgDir}${p.image.path}" alt=""></div>
												<div class="goods-con border-box">
													<div class="goods-name">${p.name}</div>
													<div class="goods-price ellipsis-1">
														<span class="shop-price">${p.nowPrice}</span>
													</div>
												</div>
											</a>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="tpshop-service">
				<img src="home2/footer.png" alt="" class="w-100">
			</div>
			<div class="w1224 footer-link clearfix">
				<div class="contact-us border-box">
					<div class="right-company clearfix">
						<div class="right-company-top clearfix">
							<div class="phone"><i></i><span class="phone-num">${phone}</span></div>
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
