<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>
<body class="not-front page-pages page-hotels">
<div id="main">
    <jsp:include page="common_header.jsp"/>
    <div id="google_map2_wrapper">
        <div id="google_map2"></div>
    </div>

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
                        <c:forEach items="${hotels.list}" var="hotel" varStatus="status">
                            <div class="col-sm-4">
                                <div class="thumb5">
                                    <div class="thumbnail clearfix">
                                        <figure>
                                            <img src="${hotel.image}" alt="" class="img-responsive"
                                                 style="height: 200px">
                                            <div class="over">
                                                <div class="v2">${hotel.title}
                                                </div>
                                            </div>
                                        </figure>
                                        <div class="caption">
                                            <div class="txt1">${hotel.cityName}</div>
                                            <div class="txt2"
                                                 style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">${hotel.title}</div>
                                            <div class="txt3 clearfix">
                                                <div class="left_side">
                                                    <div class="price">￥${hotel.price}</div>
                                                    <div class="stars2">
                                                        <img src="media/images/star1.png" alt="">
                                                        <img src="media/images/star1.png" alt="">
                                                        <img src="media/images/star1.png" alt="">
                                                        <img src="media/images/star1.png" alt="">
                                                        <img src="media/images/star3.png" alt="">
                                                    </div>
                                                </div>
                                                <div class="right_side"><a href="/detail.html?id=${hotel.id}"
                                                                           class="btn-default btn1">Details</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${(status.index+1)%3==0}">
                                <div class="col-sm-12">
                                    <div class="hl1"></div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <fmt:formatNumber type="number" value="${hotels.count/6}" maxFractionDigits="0"
                                      var="totalPage"/>

                    <jsp:include page="common_page.jsp">
                        <jsp:param name="navNum" value="10"/>
                        <jsp:param name="pageNum" value="${empty param.page?1:param.page}"/>
                        <jsp:param name="totalPage" value="${totalPage}"/>
                    </jsp:include>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="common_footer.jsp"/>
</div>
</body>
</html>
