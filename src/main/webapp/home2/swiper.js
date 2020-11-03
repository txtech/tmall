// 轮播图
function swiper(swiperWrap, options) {
  /*
  swiperWrap: 轮播图外层dom,轮播图添加一层div，自定义id，div子层ul添加类名.swiper-inner,li添加类名.item,img添加.item-pic如下：
  <div id="#"><ul class="swiper-inner"><li class="item"></li></ul><div class ="pagination"></div><a class ="swiper-control left-btn" href="javascript:void(0)"></a> <a class="swiper-control right-btn" href= javascript:void(0)"></a></div>
  
  options为配置项，包括如下:
  swiperItemWidth: 轮播图宽度，默认为swiperWrap宽度
  num：左右两边复制的图片数量,默认为1
  isAuto：是否自动轮播，默认为true
  animateTime: 动画时间,单位ms,默认500
  setIntervalTime: 轮播间隔时间,单位ms,默认4000
  verticalOrHorizontal: 水平还是垂直轮播, 默认为horizontal,水平轮播
  */
  var options = options || {};
  var verticalOrHorizontal = options.verticalOrHorizontal || 'horizontal';
  var swiperWrapWidth = verticalOrHorizontal == 'horizontal' ? swiperWrap.width() : swiperWrap.height();
  var swiperItemWidth = options.swiperItemWidth || swiperWrapWidth;
  var num = options.num || 1;
  var isAuto = options.isAuto || options.isAuto == undefined ? true : false;
  var animateTime =  options.animateTime || 500;
  var setIntervalTime = options.setIntervalTime || 4000;
  var $_swiper = swiperWrap.find('.swiper-inner');
  var len = $_swiper.find('.item').length;
  var $_pagination = swiperWrap.find('.pagination');
  var iNow; //索引记录标志
  // 判断视图li的数量
  var viewLiNum = Math.ceil(swiperWrapWidth / swiperItemWidth);
  // 判断宽度，是否觉得启用轮播
  if (swiperWrapWidth < len * swiperItemWidth) {
    window.onresize = function () { //屏幕大小改变时 自适应
      if (verticalOrHorizontal == 'horizontal') {
        $_swiper.css({
          'width': swiperItemWidth * (len + num * 2),
          'left': -swiperItemWidth * num
        });
      } else {
        $_swiper.css({
          'height': swiperItemWidth * (len + num * 2),
          'top': -swiperItemWidth * num
        });
      }
      // $_swiper.find('.item').css('width', swiperItemWidth);
    };

    // 前后各复制num个li
    function copyLi() {
      var item = $_swiper.find('.item');
      for (var j = 0; j < num; j++) {
        var first = item.eq(j).clone();
        var last = item.eq(len - j - 1).clone();
        $_swiper.append(first);
        $_swiper.prepend(last);
      }
    }

    //初始化 轮播图列表宽度和列表项宽度
    function initSwiper() {
      iNow = num;
      if (verticalOrHorizontal == 'horizontal') {
        $_swiper.css({
          'width': swiperItemWidth * (len + num * 2),
          'left': -swiperItemWidth * num
        });
      } else {
        $_swiper.css({
          'height': swiperItemWidth * (len + num * 2),
          'top': -swiperItemWidth * num
        });
      }
      // $_swiper.find('.item').css('width', swiperItemWidth);
    }

    //增加索引圆点
    function indexSwiper() {
      for (var i = 0; i < len; i++) { //自动增加白色索引点击点
        $_pagination.append('<span class="pagination-item"></span>');
      };
      hoverActive(iNow); //初始化状态标记
    }

    var timer; //定时器
    // 点击索引和按钮切换轮播图
    function changePic() {
      swiperWrap.find('.left-btn').click(function () {
        clearInterval(timer);
        iNow--;
        bannerRun();
      });
      swiperWrap.find('.right-btn').click(function () {
        clearInterval(timer);
        iNow++;
        bannerRun();
      });
      $_pagination.find('.pagination-item').click(function () {
        iNow = $(this).index() + 1;
        if (verticalOrHorizontal == 'horizontal') {
          $_swiper.finish().animate({
            'left': -iNow * swiperItemWidth
          }, animateTime);
        } else {
          $_swiper.finish().animate({
            'top': -iNow * swiperItemWidth
          }, animateTime);
        }
        hoverActive(iNow);
      });
    }

    function bannerAutoRun() { //轮播图自动循环播放 间隔4秒
      timer = setInterval(function () {
        iNow++;
        bannerRun();
      }, setIntervalTime)
    };

    //移动上面去停止，移动出来继续轮播
    function hoverChangeRun(ele) {
      ele.hover(function () {
        clearInterval(timer);
      }, function () {
        bannerAutoRun();
      });
    }

    // 初始化
    copyLi();
    initSwiper();
    indexSwiper();
    changePic();
    // 是否开启自动轮播
    if (isAuto) {
      bannerAutoRun();
      hoverChangeRun($_swiper.find('.item'));
      // hoverChangeRun($_swiper.find('.item-pic'));
      hoverChangeRun($_pagination.find('.pagination-item'));
      hoverChangeRun(swiperWrap.find('.swiper-control'));
    }

    function hoverActive(index) { //切换时改变状态
      $_swiper.find('.item').eq(index).addClass('slide-active').siblings().removeClass('slide-active');
      $_pagination.find('.pagination-item').eq(index - 1).addClass('active').siblings().removeClass('active');
    }

    function bannerRun() { //点击切换图片
      if (iNow > len + num * 2 - viewLiNum - 1) {
        if (verticalOrHorizontal == 'horizontal') {
          $_swiper.finish().animate({
            'left': -iNow * swiperItemWidth
          }, animateTime, function () {
            $_swiper.css({
              'left': (Math.abs(num - viewLiNum) - num) * swiperItemWidth
            });
          });
        } else {
          $_swiper.finish().animate({
            'top': -iNow * swiperItemWidth
          }, animateTime, function () {
            $_swiper.css({
              'top': (Math.abs(num - viewLiNum) - num) * swiperItemWidth
            });
          });
        }
        iNow = num - Math.abs(num - viewLiNum);
      } else if (iNow < 1) {
        if (verticalOrHorizontal == 'horizontal') {
          $_swiper.finish().animate({
            'left': -iNow * swiperItemWidth
          }, animateTime, function () {
            $_swiper.css({
              'left': -len * swiperItemWidth
            });
          });
        } else {
          $_swiper.finish().animate({
            'top': -iNow * swiperItemWidth
          }, animateTime, function () {
            $_swiper.css({
              'top': -len * swiperItemWidth
            });
          });
        }
        iNow = len;
      } else {
        if (verticalOrHorizontal == 'horizontal') {
          $_swiper.finish().animate({
            'left': -iNow * swiperItemWidth
          }, animateTime);
        } else {
          $_swiper.finish().animate({
            'top': -iNow * swiperItemWidth
          }, animateTime);
        }
      }
      hoverActive(iNow);
    }
  } else {
    swiperWrap.find('.swiper-control').hide();
  }
};