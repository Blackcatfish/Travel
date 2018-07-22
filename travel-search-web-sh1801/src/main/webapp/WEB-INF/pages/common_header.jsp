<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top1_wrapper">
    <div class="container">
        <div class="top1 clearfix">
            <div class="email1"><a href="#" id="header-email"></a></div>
            <div class="phone1">+917 3386831</div>
            <div class="social_wrapper">
                <ul class="social clearfix hide" id="logout-ul">
                    <li><a href="#" id="logout-btn">退出</a>
                    </li>
                </ul>
                <ul class="social clearfix" id="login-ul">
                    <li><a href="#" data-toggle="modal" data-target="#loginModalbox">登录</a>
                        <!-- Modal -->
                        <div class="modal fade kd-loginbox" id="loginModalbox" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <a href="#" class="close" data-dismiss="modal" aria-label="Close"><span
                                                aria-hidden="true">&times;</span></a>
                                        <div class="kd-login-title">
                                            <div class="kd-login-sepratore"><span>登录</span></div>
                                        </div>
                                        <form id="loginForm">
                                            <p><i class="fa fa-envelope-o"></i> <input type="text" placeholder="邮箱"
                                                                                       name="email"/>
                                            </p>
                                            <p><i class="fa fa-lock"></i> <input type="password" placeholder="密码"
                                                                                 name="password">
                                            </p>
                                            <p><input type="submit" value="马上登录" class="thbg-color"></p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#registerModalbox">注册</a>
                        <div class="modal fade kd-loginbox" id="registerModalbox" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <a href="#" class="close" data-dismiss="modal" aria-label="Close"><span
                                                aria-hidden="true">&times;</span></a>
                                        <div class="kd-login-title">
                                            <div class="kd-login-sepratore"><span>注册</span></div>
                                        </div>
                                        <form id="registForm">
                                            <p><i class="fa fa-envelope-o"></i> <input type="text" placeholder="邮箱"
                                                                                       name="email"/>
                                            </p>
                                            <p><i class="fa fa-lock"></i> <input type="password" placeholder="密码"
                                                                                 name="password"/>
                                            </p>
                                            <p><i class="fa fa-lock"></i> <input type="password" placeholder="确认密码"
                                                                                 name="repwd"/>
                                            </p>
                                            <p><input type="submit" value="立即注册" class="thbg-color"></p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="lang1">
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">简体中文<span
                            class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a class="ge" href="#">German</a></li>
                        <li><a class="en" href="#">English</a></li>
                        <li><a class="ru" href="#">Russian</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="top2_wrapper">
    <div class="container">
        <div class="top2 clearfix">
            <header>
                <div class="logo_wrapper">
                    <a href="index.html" class="logo">
                        <img src="<%=request.getContextPath()%>/media/images/logo.png" alt="" class="img-responsive">
                    </a>
                </div>
            </header>
            <div class="navbar navbar_ navbar-default">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-collapse navbar-collapse_ collapse">
                    <ul class="nav navbar-nav sf-menu clearfix">
                        <li><a href="index.html">首页</a></li>
                        <li><a href="hotels.html">酒店</a>
                        <li><a href="about.html">关于我们</a></li>
                        <li><a href="contacts.html">联系我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

