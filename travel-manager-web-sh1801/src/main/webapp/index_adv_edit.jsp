<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center'" style="padding:10px;">
        <form id="indexAdvForm" method="post">
            <input type="hidden" name="id" id="index-adv-id" value="${indexAdv.id}"/>
            <table cellpadding="5">
                <tr>
                    <td>酒店:</td>
                    <td><input id="adv-hotel-id" value="${indexAdv.hotel.id}" name="hotel.id" style="width:400px"/>
                    </td>
                </tr>
                <tr>
                    <td>上架日期:</td>
                    <td><input class="easyui-datebox" type="text" name="startDate" id="adv-startDate"
                               value="${indexAdv.startDate}" data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td>下架日期:</td>
                    <td><input class="easyui-datebox" type="text" name="endDate" id="adv-endDate"
                               value="${indexAdv.endDate}" data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td>类型:</td>
                    <td>
                        <select id="hotel-status" name="type" class="easyui-combobox">
                            <option value="1" ${indexAdv.type==1?'selected':''}>一级</option>
                            <option value="2" ${indexAdv.type==0?'selected':''}>二级</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>排序:</td>
                    <td><input class="easyui-numberbox" type="text" name="sort" id="adv-sort"
                               value="${indexAdv.sort}" data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td>展示图:</td>
                    <td><img src="${indexAdv.hotel.image}" id="showImage"/></td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
           onclick="submitAdvForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
           onclick="$('#indexAdvForm').form('reset')">重填</a>
    </div>
</div>
<script type="text/javascript">
    //去除html标记
    String.prototype.stripHTML = function() {
        var reTag = /<(?:.|\s)*?>/g;
        return this.replace(reTag,"");
    }
    var pn=1;
    var q="";
    function loadData(){
        $.ajax({
            url: '/static/search_hotel.html',
            type: 'POST',
            data: "page="+pn+"&keywords=" + q,
            success: function (data) {
                var items = $.each(data, function (value) {
                    return {"id": value.id, "title": value.title,"image":value.image};
                });
                //下拉框加载数据
                $("#adv-hotel-id").combobox("loadData",items);
                //下拉框赋值
                $("#adv-hotel-id").combobox("setText",q);
            }
        });
    }
    $(function () {
        $("#adv-hotel-id").combobox({
            mode: "remote",
            valueField: "id",
            textField: "title",
            formatter: function (row) {
                //格式化下拉框中的数据
                var s = '<span style="font-weight:bold">[' + row.id +
                    ']</span><span style="color:#888">' + row.title + '</span>';
                return s;
            },
            loader: function (param, success, error) {
                q= param.q || '';
                if (q.length <= 0) {
                    return false;
                }
                loadData();
            },
            icons: [{
                iconCls: 'icon-clear',
                handler: function (e) {//清空
                    $("#adv-hotel-id").combobox('clear');
                    pn=1;
                }
            }, {
                iconCls: 'icon-remove',
                handler: function (e) {//上一页
                    pn=pn>1?--pn:pn;
                    loadData()
                }
            }, {
                iconCls: 'icon-add',
                handler: function (e) {//下一页
                    pn++;
                    loadData()
                }
            }],
            onSelect: function(row){
                //选中之后给文本框赋值，去除高亮的标签
                var title=row.title.stripHTML();
                row.title=title;
                $("#adv-hotel-id").combobox("setText",title);
                $("#showImage").attr("src",row.image);
            }
        });
        //修改的页面里，给文本框赋值
        $("#adv-hotel-id").combobox("setText","${indexAdv.hotel.title}");
    });
    function submitAdvForm(){
        $('#indexAdvForm').form('submit', {
            onSubmit: function () {
                if ($(this).form('enableValidation').form('validate')) {
                    $.ajax({
                        url: "/static/edit.html",
                        data: $('#indexAdvForm').serialize(),
                        method: "post",
                        success: function (data) {
                            if (!data.status) {
                                alert(data.message);
                            } else {
                                //刷新父页面
                                $('#dg_index_adv').datagrid({queryParams: formToJson()});
                                $("#hotelIndexAdvWindow").window("close");//关闭当前窗口
                            }
                        }
                    })
                }
                return false;
            }
        });
    }
</script>
</body>
</html>
