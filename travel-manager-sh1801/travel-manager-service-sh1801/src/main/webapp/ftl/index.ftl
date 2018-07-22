<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
    <meta charset="UTF-8">
<#include "common/css.ftl">
</head>
<body class="front">
<div id="main">
<#include "common/header.ftl">
    <div id="slider_wrapper">
        <div class="container">
            <div id="slider_inner">
                <div class="">
                    <div id="slider">

                        <div class="">
                            <div class="carousel-box">
                                <div class="inner">
                                    <div class="carousel main">
                                        <ul>
                                            <li>
                                                <div class="slider">
                                                    <div class="slider_inner">
                                                        <div class="txt1"><span>欢迎光临</span></div>
                                                        <div class="txt2"><span>旅游攻略</span></div>
                                                        <div class="txt3"><span>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod.</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="slider">
                                                    <div class="slider_inner">
                                                        <div class="txt1"><span>7天旅游</span></div>
                                                        <div class="txt2"><span>美妙的普罗旺斯</span></div>
                                                        <div class="txt3"><span>Lorem ipsum dolor eleifend option congue nihil imperdiet doming id quod.</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="slider">
                                                    <div class="slider_inner">
                                                        <div class="txt1"><span>5天游</span></div>
                                                        <div class="txt2"><span>巴黎(世界之都)</span></div>
                                                        <div class="txt3"><span>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod.</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="slider_pagination"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="popular_cruises1">
        <div class="container">
            <h2 class="animated">热门推荐</h2>
            <br>
            <div id="popular_wrapper" class="animated" data-animation="fadeIn" data-animation-delay="300">
                <div id="popular_inner">
                    <div class="">
                        <div id="popular">
                            <div class="">
                                <div class="carousel-box">
                                    <div class="inner">
                                        <div class="carousel main">
                                            <ul>
                                            <#list firstAdvList as adv>
                                                <li>
                                                    <div class="popular">
                                                        <div class="popular_inner">
                                                            <figure>
                                                                <img src="${adv.hotel.image}" alt=""
                                                                     class="img-responsive">
                                                                <div class="over">
                                                                    <div class="v1">${adv.hotel.cityName}
                                                                        <span>￥${adv.hotel.price}</span>
                                                                    </div>
                                                                    <div class="v2">Lorem ipsum dolor sit amet,
                                                                        concateus.
                                                                    </div>
                                                                </div>
                                                            </figure>
                                                            <div class="caption">
                                                                <div class="txt1"><span>${adv.hotel.cityName}</span>
                                                                    ￥${adv.hotel.price}
                                                                </div>
                                                                <div class="txt2">${adv.hotel.title}
                                                                </div>
                                                                <div class="txt3 clearfix">
                                                                    <div class="left_side">
                                                                        <div class="stars1">
                                                                            <img src="images/star1.png" alt="">
                                                                            <img src="images/star1.png" alt="">
                                                                            <img src="images/star1.png" alt="">
                                                                            <img src="images/star1.png" alt="">
                                                                            <img src="images/star2.png" alt="">
                                                                        </div>
                                                                        <div class="nums">- 18 Reviews</div>
                                                                    </div>
                                                                    <div class="right_side"><a href="http://www.vm.com/hotel/static/hotel-detail-${adv.hotel.id}.html"
                                                                                               class="btn-default btn1">See
                                                                        All</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </#list>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="popular_pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <h2 class="animated">本季畅销</h2>
            <br>
            <div class="row">
            <#list secondAdvList as adv>
                <div class="col-sm-4">
                    <div class="thumb5">
                        <div class="thumbnail clearfix">
                            <figure>
                                <img src="images/hotels01.jpg" alt="" class="img-responsive">
                                <div class="over">
                                    <div class="v1">${adv.hotel.cityName}
                                    </div>
                                    <div class="v2">${adv.hotel.title}</div>
                                </div>
                            </figure>
                            <div class="caption">
                                <div class="txt2">${adv.hotel.title}</div>
                                <div class="txt3 clearfix">
                                    <div class="left_side">
                                        <div class="price">￥${adv.hotel.price}</div>
                                        <div class="stars2">
                                            <img src="images/star1.png" alt="">
                                            <img src="images/star1.png" alt="">
                                            <img src="images/star1.png" alt="">
                                            <img src="images/star1.png" alt="">
                                            <img src="images/star3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="right_side"><a href="http://www.vm.com/hotel/static/hotel-detail-${adv.hotel.id}.html"
                                                               class="btn-default btn1">Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <#if (adv_index+1) % 3 == 0>
                    <div class="col-sm-12">
                        <div class="hl1"></div>
                    </div>
                </#if>
            </#list>
            </div>
        </div>
    </div>
    <div id="parallax1" class="parallax">
        <div class="bg1 parallax-bg"></div>
        <div class="overlay"></div>
        <div class="parallax-content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-10 animated">
                        <div class="txt1">热门推荐</div>
                        <div class="txt2">今年最热门的去处！！！
                        </div>
                        <div class="txt3">From: Khazbegi (Goergia) <strong>$159.00</strong><span>person</span></div>
                    </div>
                    <div class="col-sm-2 animated">
                        <a href="#" class="btn-default btn0">Details</a>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div id="partners">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-md-2 col-xs-6">
                    <div class="thumb1 animated">
                        <div class="thumbnail clearfix">
                            <a href="#">
                                <figure>
                                    <img src="images/partner1.jpg" alt="" class="img1 img-responsive">
                                    <img src="images/partner1_hover.jpg" alt="" class="img2 img-responsive">
                                </figure>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-2 col-xs-6">
                    <div class="thumb1 animated">
                        <div class="thumbnail clearfix">
                            <a href="#">
                                <figure>
                                    <img src="images/partner2.jpg" alt="" class="img1 img-responsive">
                                    <img src="images/partner2_hover.jpg" alt="" class="img2 img-responsive">
                                </figure>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-2 col-xs-6">
                    <div class="thumb1 animated">
                        <div class="thumbnail clearfix">
                            <a href="#">
                                <figure>
                                    <img src="images/partner3.jpg" alt="" class="img1 img-responsive">
                                    <img src="images/partner3_hover.jpg" alt="" class="img2 img-responsive">
                                </figure>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-2 col-xs-6">
                    <div class="thumb1 animated">
                        <div class="thumbnail clearfix">
                            <a href="#">
                                <figure>
                                    <img src="images/partner4.jpg" alt="" class="img1 img-responsive">
                                    <img src="images/partner4_hover.jpg" alt="" class="img2 img-responsive">
                                </figure>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-2 col-xs-6">
                    <div class="thumb1 animated">
                        <div class="thumbnail clearfix">
                            <a href="#">
                                <figure>
                                    <img src="images/partner5.jpg" alt="" class="img1 img-responsive">
                                    <img src="images/partner5_hover.jpg" alt="" class="img2 img-responsive">
                                </figure>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-2 col-xs-6">
                    <div class="thumb1 animated">
                        <div class="thumbnail clearfix">
                            <a href="#">
                                <figure>
                                    <img src="images/partner6.jpg" alt="" class="img1 img-responsive">
                                    <img src="images/partner6_hover.jpg" alt="" class="img2 img-responsive">
                                </figure>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
<#include "common/footer.ftl">
</div>
</body>
</html>
