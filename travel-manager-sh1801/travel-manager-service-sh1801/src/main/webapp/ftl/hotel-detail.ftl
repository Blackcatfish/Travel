<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hotels222</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
<#include "common/css.ftl">
</head>
<body class="not-front page-pages page-hotels">

<div id="main">


<#include "common/header.ftl">
    <div class="breadcrumbs1_wrapper">
        <div class="container">
            <div class="breadcrumbs1"><a href="index.html">Home</a><span>/</span><a
                    href="index.html">Pages</a><span>/</span>Hotels
            </div>
        </div>
    </div>


    <div id="content">
        <div class="container">
            <div class="tabs_wrapper tabs1_wrapper">
                <div class="tabs tabs2">
                    <div class="tabs_tabs tabs1_tabs">

                        <ul>
                            <li class="active hotels"><a href="#tabs-2">Hotels</a></li>
                        </ul>

                    </div>
                    <div class="tabs_content tabs1_content">
                        <div id="tabs-2">
                            <form action="javascript:;" class="form1">
                                <div class="row">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="select1_wrapper">
                                            <label>City or Hotel Name:</label>
                                            <div class="select1_inner">
                                                <select class="select2 select" style="width: 100%">
                                                    <option value="1">Enter a destination or hotel name</option>
                                                    <option value="2">Lorem ipsum dolor sit amet</option>
                                                    <option value="3">Duis autem vel eum</option>
                                                    <option value="4">Ut wisi enim ad minim veniam</option>
                                                    <option value="5">Nam liber tempor cum</option>
                                                    <option value="6">At vero eos et accusam et</option>
                                                    <option value="7">Consetetur sadipscing elitr</option>
                                                    <option value="8">Sed diam nonumy</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-md-2">
                                        <div class="input1_wrapper">
                                            <label>Check-In:</label>
                                            <div class="input1_inner">
                                                <input type="text" class="input datepicker" value="Mm/Dd/Yy">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-md-2">
                                        <div class="input1_wrapper">
                                            <label>Check-Out:</label>
                                            <div class="input1_inner">
                                                <input type="text" class="input datepicker" value="Mm/Dd/Yy">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-md-2">
                                        <div class="select1_wrapper">
                                            <label>Adult:</label>
                                            <div class="select1_inner">
                                                <select class="select2 select" style="width: 100%">
                                                    <option value="1">Room for 1 adult</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-md-2">
                                        <div class="button1_wrapper">
                                            <button type="submit" class="btn-default btn-form1-submit">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div id="room">
                                    <!-- details -->
                                    <div class="details">
                                        <div class="container">
                                            <div class="col-md-7 details-left">
                                                <img src="${hotel.image}" class="img-responsive" alt="">
                                            </div>
                                            <div class="col-md-5 details-right">
                                                <span><strong>${hotel.title}</strong></span>
                                                <p><span><strong>￥${hotel.price}</strong></span></p>
                                                <p><img src="images/location.png" width="15"/> 查询地图</p>
                                                <button type="submit" class="btn-default btn-form1-submit"
                                                        style="width: 80%;">预定
                                                </button>
                                            </div>

                                            <div class="clearfix"></div>
                                            <div class="details-top">
                                            ${hotel.content}
                                            </div>
                                            <div class="hl1"></div>
                                            <div class="booking-form">
                                                <span><strong>预定酒店</strong></span>
                                                <form>
                                                    <div class="col-md-6">

                                                        <h5>姓名</h5>
                                                        <input type="text" value="">
                                                        <h5>电话</h5>
                                                        <input type="text" value="">
                                                        <h5>入驻日期</h5>
                                                        <input type="text" value="" class="input datepicker"
                                                               style="width:150px;display:inline-block;"/>
                                                        至 <input type="text" value="" class="input datepicker"
                                                                 style="width:150px;display:inline-block;"/>
                                                        人数 <input min="1" max="3" type="number" id="quantity"
                                                                  name="quantity" value="1"
                                                                  class="form-control input-small"
                                                                  style="display:inline-block;"> 人
                                                        <h5>备注</h5>
                                                        <textarea value=""></textarea>
                                                        <input type="submit" value="预定">
                                                        <input type="reset" value="重填">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="bot1_wrapper">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="logo2_wrapper">
                        <a href="index.html" class="logo2">
                            <img src="images/logo2.png" alt="" class="img-responsive">
                        </a>
                    </div>
                    <p>
                        Nam liber tempor cum soluta nobis option congue nihil imperdiet doming id quod
                        mazim. Lorem
                        ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
                        tincidunt ut
                        laoreet dolore magna.
                    </p>
                    <p>
                        <a href="#" class="btn-default btn2">Read More</a>
                    </p>
                </div>
                <div class="col-sm-3">
                    <div class="bot1_title">Travel Specialists</div>
                    <ul class="ul1">
                        <li><a href="#">First Class Flights</a></li>
                        <li><a href="#">Accessible Travel</a></li>
                        <li><a href="#">Amazing Cruises</a></li>
                    </ul>

                    <div class="social2_wrapper">
                        <ul class="social2 clearfix">
                            <li class="nav1"><a href="#"></a></li>
                            <li class="nav2"><a href="#"></a></li>
                            <li class="nav3"><a href="#"></a></li>
                            <li class="nav4"><a href="#"></a></li>
                            <li class="nav5"><a href="#"></a></li>
                            <li class="nav6"><a href="#"></a></li>
                        </ul>
                    </div>

                </div>
                <div class="col-sm-3">
                    <div class="bot1_title">Our Twitter</div>
                    <div class="twits1">
                        <div class="twit1">
                            <a href="#"> @travel</a> Lorem ipsum dolor sit amet, consectetuer adipiscing
                            elit
                            <div class="date">5 minutes ago</div>
                        </div>
                        <div class="twit1">
                            <a href="#">@leo</a> Nam liber tempor cum soluta nobis option congue nihil
                            imperdiet doming
                            id quod mazim.
                            <div class="date">2 days ago</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="bot1_title">Newsletter</div>
                    <div class="newsletter_block">
                        <div class="txt1">Inspiration, ideas, news and your feedback.</div>
                        <div class="newsletter-wrapper clearfix">
                            <form class="newsletter" action="javascript:;">
                                <input type="text" name="s" value='Email Address'
                                       onBlur="if(this.value=='') this.value='Email Address'"
                                       onFocus="if(this.value =='Email Address' ) this.value=''">
                                <a href="#" class="btn-default btn3">SUBMIT</a>
                            </form>
                        </div>
                    </div>
                    <div class="phone2">1-917-338-6831</div>
                    <div class="support1"><a href="#">support@templates-support.com</a></div>
                </div>
            </div>
        </div>
    </div>

    <div class="bot2_wrapper">
        <div class="container">
            <div class="left_side">
                Copyright &copy; 2017.Company name All rights reserved.
                <a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
            </div>
            <div class="right_side"></div>
        </div>
    </div>
</div>
<script src="js/bootstrap.min.js"></script>
</body>
</html>