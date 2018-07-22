<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hotels</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    <jsp:include page="common_css.jsp"/>
    <link href="<%=request.getContextPath()%>/media/css/detail.css" rel="stylesheet">
</head>
<body class="not-front page-pages page-hotels">

<div id="main">

    <jsp:include page="common_header.jsp"/>


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
                    <jsp:include page="common_search.jsp"/>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="room">
                                <!-- details -->
                                <div class="details">
                                    <div class="container">
                                        <div class="col-md-7 details-left">
                                            <img src="${hotel.image}" class="img-responsive" alt="" width="600">
                                        </div>
                                        <div class="col-md-5 details-right">
                                            <span><strong>${hotel.title}</strong></span>
                                            <p><span><strong>￥${hotel.price}</strong></span></p>
                                            <p><img src="/images/location.png" width="15"/> 查询地图</p>
                                            <button type="submit" class="btn-default btn-form1-submit"
                                                    style="width: 80%;">预定
                                            </button>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="details-top">
                                            <!--内容开始-->
                                            <div class="hl1"></div>
                                            <span><strong>产品介绍</strong></span>
                                            ${hotel.content}
                                            <!-- details -->
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
    <jsp:include page="common_footer.jsp"/>
</div>
</body>
</html>
