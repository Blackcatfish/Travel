<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center'" style="padding:10px;">
        <form id="hotelForm" method="post">
            <input type="hidden" name="id" id="hotel-id" value="${hotel.id}"/>
            <table cellpadding="5">
                <tr>
                    <td style="width: 60px">城市:</td>
                    <td>
                        <select id="hotel-cityId" name="cityId"
                                onchange="$('#hotel-cityName').val($(this).find('option:selected').text())">
                            <c:forEach items="${cityList}" var="city">
                                <option value="${city.id}" ${city.id==hotel.cityId?'selected':''}>${city.name}</option>
                            </c:forEach>
                        </select>
                        <input type="hidden" name="cityName" id="hotel-cityName" value="${hotel.cityName}"/>
                    </td>
                </tr>
                <tr>
                    <td>标题:</td>
                    <td><input class="easyui-textbox" type="text" name="title" id="hotel-title" value="${hotel.title}"
                               data-options="required:true,multiline:true" style="width:300px;height:100px"/>
                    </td>
                </tr>
                <tr>
                    <td>价格:</td>
                    <td><input class="easyui-numberbox" type="text" name="price" id="hotel-price"
                               value="${hotel.price}" data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td>床位:</td>
                    <td><input class="easyui-numberbox" type="text" name="bedNum" id="hotel-bedNum"
                               data-options="required:true" precision="0" value="${hotel.bedNum}"/>
                    </td>
                </tr>
                <tr>
                    <td>首页图:</td>
                    <td>
                        <input name="image" id="hotel-image" value="${hotel.image}" type="hidden"/>
                        <img src="${hotel.image}" style="max-height: 200px"/>
                        <a href="javascript:void(0)" class="easyui-linkbutton" id="upload-btn">图片上传</a>
                    </td>
                </tr>
                <tr>
                    <td>内容:</td>
                    <td>
                        <textarea name="content" id="hotel-content">${hotel.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <td>状态:</td>
                    <td>
                        <select id="hotel-status" name="status" class="easyui-combobox">
                            <option value="1" ${hotel.status==1?'selected':''}>发布</option>
                            <option value="0" ${hotel.status==0?'selected':''}>下架</option>
                        </select>
                    </td>
                </tr>
                <tr>
                <td>位置：</td>
                <td>
                    <div style="width:500px;height:400px">
                        <input id="loc-text" size="100"/>
                        <input id="longitude" type="hidden" name="longitude" value="${hotel.longitude}"/>
                        <input id="latitude" type="hidden" name="latitude" value="${hotel.latitude}"/>
                        <div id="r-result" style="position: relative;top:35px;left:310px;z-index:10"><input
                                type="text" id="suggestId" size="20" placeholder="请输入关键字" style="width:150px;"/>
                        </div>
                        <div id="searchResultPanel"
                             style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
                        <div id="l-map"></div>
                    </div>
                </td>
            </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
           onclick="submitHotelForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
           onclick="$('#hotelForm').form('clear')">重填</a>
    </div>
</div>

<style type="text/css">
    #l-map {
        height: 90%;
        width: 100%;
    }

    #r-result {
        width: 100%;
    }

    .tangram-suggestion {
        z-index: 9999;
    }
</style>
<script type="text/javascript">
    $(function () {
        $("#upload-btn").click(function () {
            //使用KindEditor的上传插件
            KindEditor.editor(kingEditorParams).loadPlugin('image', function () {
                this.plugin.imageDialog({
                    showRemote: false,
                    clickFn: function (url, title, width, height, border, align) {
                        var input = $("#hotel-image");
                        input.parent().find("img").remove();
                        input.val(url);
                        input.after("<a href='" + url + "' target='_blank'><img src='" + url + "' width='80' height='50'/></a>");
                        this.hideDialog();
                    }
                });
            });
        });
        loadJScript();
    })

    //保存
    function submitHotelForm() {
        editor.sync();
        $('#hotelForm').form('submit', {
            onSubmit: function () {
                if ($(this).form('enableValidation').form('validate')) {
                    $.ajax({
                        url: "/hotel/edit.html",
                        data: $('#hotelForm').serialize(),
                        method: "post",
                        success: function (data) {
                            if (!data.status) {
                                alert(data.message);
                            } else {
                                //刷新父页面
                                $('#dg_hotel').datagrid({queryParams: formToJson()});
                                $("#hotelEditWindow").dialog("close");
                            }
                        }
                    })
                }
                return false;
            }
        });
    }

    var map;
    //百度地图API功能，延迟加载，否则与easyUI结合会报错
    function loadJScript() {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "http://api.map.baidu.com/api?v=2.0&ak=NtvDfyzDMDOQoYlZG6u9G2WsheQLqnkQ&callback=init";
        document.body.appendChild(script);
    }

    var myValue;
    function init() {
        map = new BMap.Map("l-map");// 创建Map实例，1-map是地图div的id
        if ($("#longitude").val() && $("#latitude").val()) {//如果是修改酒店，定位到原来的位置
            var point = new BMap.Point($("#longitude").val(), $("#latitude").val()); // 创建点坐标
            map.centerAndZoom(point, 100);//初始化坐标，放大100倍
            map.addOverlay(new BMap.Marker(point));//加小气球
        } else {
            map.centerAndZoom("北京", 12);//如果没设定过为位置就定位到北京
        }
        //map.enableScrollWheelZoom();                 //启用滚轮放大缩小
        map.enableInertialDragging();
        map.enableContinuousZoom();
        //添加城市列表，地图div的高度不能太小，否则显示不出来
        map.addControl(new BMap.CityListControl({}));
        var geoc = new BMap.Geocoder();
        //单击获取点击的经纬度
        map.addEventListener("click", function (e) {
            $("#longitude").val(e.point.lng);
            $("#latitude").val(e.point.lat);
            map.clearOverlays();//清空其它标注
            map.addOverlay(new BMap.Marker(e.point));//加小气球
            geoc.getLocation(e.point, function(rs){
                var addComp = rs.addressComponents;
                $("#loc-text").val(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
            });
        });

        //添加控件和比例尺
        map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}));// 左下角，添加比例尺
        map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}));//左下角，添加默认缩放平移控件
        //搜索提示
        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {
                "input": "suggestId"//搜索框的id
                , "location": map
            });

        ac.addEventListener("onhighlight", function (e) {  //鼠标放在下拉列表上的事件
            var str = "";
            var _value = e.fromitem.value;
            var value = "";
            if (e.fromitem.index > -1) {
                value = _value.province + _value.city + _value.district + _value.street + _value.business;
            }
            str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
            value = "";
            if (e.toitem.index > -1) {
                _value = e.toitem.value;
                value = _value.province + _value.city + _value.district + _value.street + _value.business;
            }
            str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
            G("searchResultPanel").innerHTML = str;
        });

        ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
            var _value = e.item.value;
            myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
            G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
            setPlace();
        });
    }

    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    function setPlace() {
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun() {
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注
            $("#longitude").val(pp.lng);
            $("#latitude").val(pp.lat)
        }

        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }
</script>