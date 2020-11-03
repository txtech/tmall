function ellipsisMore (dom, num) {
  /**
   * dom为需要添加多行超出省略号的元素
   * num为最大的行数，即超过num行则显示省略号
   */
  dom.each(function (i, obj) {
    var lineHeight = parseInt($(this).css("line-height"));
    var height = parseInt($(this).height());
    var showHeight = lineHeight * num + 'px'; //显示的高度，超过则hidden
    if ((height / lineHeight) > num) {
      $(this).addClass("ellipsis-more");
      $(this).css("height", showHeight);
    } else {
      $(this).removeClass("ellipsis-more");
    }
  });
}