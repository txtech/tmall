<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<script>
    var msg = "${msg}";
    if(msg !== ""){
        alert(msg);
    }
    $(function () {
        $("#refer").val(window.location.href ===""?"/":window.location.href);
        $("#form").submit(function () {
            if($("#password").val() == "" || $("#name").val() == ""){
                alert("用户名或密码为空");
                return false;
            }
            return true;
        });
        //购物指南
        $("#gw").click(function(){
            window.open("js/notice.html");
        });
        //退换货说明
        $("#return").click(function(){
            window.open("js/return.html");
        });
        //配送范围及时间配送方式
        $("#pssj").click(function(){
            window.open("js/psfs.html");
        });
        //配送方式
        $("#ps").click(function(){
            window.open("js/ps.html");
        });
        //常见问题
        $("#wt").click(function(){
            window.open("js/problem.html");
        });
    });
</script>
<div class="modal" tabindex="-1" role="dialog" id="loginModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <section class="login-modal">
                <div class="login-content">
                    <form method="post" action="loginIn" id="form">
                        <div class="login-frame">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <div class="login-tip">密码登录</div>
                            <div class="login-input">
                    <span class="login-input-icon">
                                <span class=" glyphicon glyphicon-user"></span>
                            </span>
                                <input type="text" placeholder="手机/会员名/邮箱" name="name" id="name" autofocus>
                            </div>
                            <div class="login-input">
                    <span class="login-input-icon ">
                                <span class=" glyphicon glyphicon-lock"></span>
                            </span>
                                <input type="password" placeholder="密码" name="password" id="password">
                                <input type="hidden" name="refer" id="refer" value="/">
                            </div>
                            <div class="login-button">
                                <button type="submit" class="login-button">登 录</button>
                            </div>
                            <div class="login-bottom">
                                <a href="#nowhere">忘记登录密码</a>
                                <a class="" href="register">免费注册</a>
                            </div>

                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</div>
<footer class="footer-top clear">
     <div class="footer-content">
        <div class="footer-ensure">
            <a href="#nowhere1"></a>
            <a href="#nowhere2"></a>
            <a href="#nowhere3"></a>
            <a href="#nowhere4"></a>
        </div>
</footer>

<footer class="footer-bottom">
    <div class="foot-image"></div>
    <div class="foot-content">
        <div class="copyright" id="copyright">
            <div class="license" style="text-align: center;">
                <a target="_blank" href="https://beian.miit.gov.cn/"><span>网络文化经营许可证： ${(empty SEOCode)?code:SEOCode}-1</span></a>
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=35021202000344"><img src="img/beian.png"> 35021202000344</a>
                <br>
                <span>${(empty websiteAddress)?'安徽省芜湖市二环南路室':websiteAddress}</span>
                <div class="copy-right-year">Copyright© 20020-2025 ${(empty SEOTitle)?title:SEOTitle} 版权所有</div>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
