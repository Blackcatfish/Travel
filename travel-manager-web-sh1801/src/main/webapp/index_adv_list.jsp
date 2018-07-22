<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--工具栏-->
<div id="tb_index_adv" style="height:auto">
    <div style="padding:2px 5px;">
        <form id="searchIndexAdvForm">
            类型: <select id="search-adv-type">
            <option value="">请选择</option>
            <option value="1">一级</option>
            <option value="2">二级</option>
        </select>
            状态：<select id="search-adv-status">
            <option value="">请选择</option>
            <option value="1">显示中</option>
            <option value="0">未上架</option>
            <option value="-1">已过期</option>
        </select>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search"
               onclick="doAdvSearch()">搜索</a>
        </form>
    </div>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add' "
       onclick="doIndexAdvAdd(0)">添加</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save' "
       onclick="doIndexAdvAdd(1)">修改</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel' "
       onclick="doIndexAdvDelete()">下架</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-redo' "
       onclick="doExport()">导出静态页</a>
</div>
<!--表格主体，注意设置工具栏引用-->
<table id="dg_index_adv" data-options="toolbar: '#tb_index_adv'">
</table>
<div id="hotelIndexAdvWindow" class="easyui-window" title="编辑广告位"
     data-options="modal:true,closed:true,iconCls:'icon-save',collapsible:false,minimizable:false"
     style="width:30%;height:60%;padding:10px;">
</div>
<script type="text/javascript">
    $(function () {
        $("#dg_index_adv").datagrid({//初始化表格
            url: "/static/list.html",//获取数据的地址
            singleSelect: true,//每次只能选中一行
            pagination: true,//分页
            pageSize: 5,//每页几条
            pageList: [5, 10, 15, 20],//选择每页几条的下拉列表
            nowrap: false,//超出宽度后换行，主要是标题栏文字比较多
            queryParams: formToJson(),//获取数据时的参数列表，翻页带参数
            columns: [[
                {field: 'id', title: 'ID', width: 80},
                {
                    field: 'hotelImg', title: '图片', width: 310, formatter: function (val, row) {
                    return '<img src="' + row.hotel.image + '"/>';
                }
                },
                {
                    field: 'hotelTitle', title: '标题', width: 280, formatter: function (val, row) {
                    return row.hotel.title;
                }
                },
                {
                    field: 'type', title: '类型', width: 100, formatter: function (val, row) {
                    return val == 1 ? '一级' : '二级';
                }
                },
                {field: 'sort', title: '排序', width: 100},
                {
                    field: 'startDate', title: '上架时间', width: 170, formatter: function (val, row) {
                    return formatDate(val, row);
                }
                },
                {
                    field: 'endDate', title: '过期时间', width: 170, formatter: function (val, row) {
                    return formatDate(val, row);
                }
                },
                {
                    field: 'updateTime', title: '更新时间', width: 170, formatter: function (val, row) {
                    return formatDate(val, row);
                }
                },
                {
                    field: 'createdDate', title: '创建时间', width: 170, formatter: function (val, row) {
                    return formatDate(val, row);
                }
                },
                {
                    field: 'status', title: '状态', width: 170, formatter: function (val, row) {
                    switch (val) {
                        case 0:
                            return '<span style="color:#00cf4d;">新建</span>';
                        case 1:
                            return '<span style="color:#ff0200;">展示中</span>';
                        case -1:
                            return '<span style="color:#9d7e87;">已过期</span>';
                    }
                }
                }
            ]]
        });
    });

    function doIndexAdvAdd(type) {
        var id = "";
        var row = $('#dg_index_adv').datagrid('getSelected');//获取当前选中的行
        type == 1 ? id = row.id : id = "";
        $("#hotelIndexAdvWindow").window({href: "/static/go_edit.html?id=" + id}).window('open');
    }

    function formatDate(date, row) {
        if (date == "" || date == null) return "";
        var time = new Date(date);
        var year = time.getFullYear();
        var mo = time.getMonth() + 1;
        if (mo < 10) mo = "0" + mo;
        var d = time.getDate();
        if (d < 10) d = "0" + d;
        var h = time.getHours();
        if (h < 10) h = "0" + h;
        var m = time.getMinutes();
        if (m < 10) m = "0" + m;
        var s = time.getSeconds();
        if (s < 10) s = "0" + s;
        return year + "-" + mo + "-" + d + " " + h + ":" + m + ":" + s;
    }

    function formToJson() {
        var param = {};
        param.status = $("#search-adv-status").val();
        param.type = $("#search-adv-type").val();
        return param;
    }

    function doAdvSearch() {
        $('#dg_index_adv').datagrid({queryParams: formToJson()});
    }

    function doIndexAdvDelete() {
        var row = $('#dg_index_adv').datagrid('getSelected');//获取当前选中的行
        if (row != null) {
            if (confirm("确定要下架么？")) {
                $.ajax({
                    url: "/static/del.html",
                    method: "post",
                    data: "id=" + row.id,
                    success: function (data) {
                        if (!data.status) {
                            alert(data.message);
                        } else {
                            $('#dg_index_adv').datagrid({queryParams: formToJson()});
                        }
                    }
                });
            }
        }
    }

    function doExport() {
        var row = $('#dg_index_adv').datagrid('getSelected');//获取当前选中的行
        if (row != null) {
            $.ajax({
                url: "/static/export.html",
                method: "post",
                data: "id=" + row.hotel.id,
                success: function (data) {
                    alert(data.msg);
                }
            });
        }
    }
</script>
</body>
</html>
