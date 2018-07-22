<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>千锋旅游后台管理系统</title>
    <!--引入easyUI的插件和样式-->
    <link rel="stylesheet" type="text/css" href="/media/easyUI/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="/media/easyUI/themes/icon.css"/>
    <script type="text/javascript" src="/media/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/media/js/jquery.easyui.min.js"></script>
</head>
<!--指定使用easyui布局-->
<body class="easyui-layout">
<!--左边菜单-->
<div data-options="region:'west',title:'菜单',split:true" style="width:180px;">
    <!--easyui-tree树状菜单-->
    <ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
        <li>
            <span>城市管理</span>
            <ul>
                <li data-options="attributes:{'url':'/city_list.jsp'}">城市管理</li>
            </ul>
        </li>
        <li>
            <span>酒店管理</span>
            <ul>
                <li data-options="attributes:{'url':'/hotel/go_list.html'}">酒店管理</li>
            </ul>
        </li>
        <li>
            <span>主站管理</span>
            <ul>
                <li data-options="attributes:{'url':'/import-index.html'}">导入索引库</li>
                <li data-options="attributes:{'url':'/index_adv_list.jsp'}">首页广告位</li>
            </ul>
        </li>
        <li>
            <span>订单管理</span>
            <ul>
                <li data-options="attributes:{'url':'/import-index.html'}">用户订单</li>
                <li data-options="attributes:{'url':'/import-index.html'}">退款管理</li>
            </ul>
        </li>
        <li>
            <span>运营数据</span>
            <ul>
                <li data-options="attributes:{'url':'/import-index.html'}">支付统计</li>
            </ul>
        </li>
    </ul>
</div>
<!--页面主体，每个模块打开的时候是选项卡形式-->
<div data-options="region:'center',title:''">
    <div id="tabs" class="easyui-tabs">
        <div title="首页" style="padding:20px;">
            <H1>欢迎光临</H1>
        </div>
    </div>
</div>

<script type="text/javascript">
    //初始化属性菜单
    $(function () {
        $('#menu').tree({
            onClick: function (node) {
                if ($('#menu').tree("isLeaf", node.target)) {
                    var tabs = $("#tabs");
                    var tab = tabs.tabs("getTab", node.text);
                    if (tab) {//已经打开的选项卡不重复打开
                        //切换到点击的选项卡
                        tabs.tabs("select", node.text);
                    } else {
                        //没打开的选项卡在主体部分打开
                        tabs.tabs('add', {
                            title: node.text,
                            href: node.attributes.url,
                            closable: true,
                            bodyCls: "content"
                        });
                    }
                }
            }
        });
    });
</script>
</body>
</html>