<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--工具栏-->
<div id="tb_hotel" style="height:auto">
    <div style="padding:2px 5px;">
        <form id="searchHotelForm">
            id: <input class="easyui-textbox" id="search-hotel-id"/>
            名称: <input class="easyui-textbox" id="search-hotel-title">
            城市：<select id="search-hotel-cityId" style="width:150px;">
            <option value="">请选择</option>
            <c:forEach items="${cityList}" var="city">
                <option value="${city.id}">${city.name}</option>
            </c:forEach>
        </select>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search"
               onclick="doHotelSearch()">搜索</a>
        </form>
    </div>
    <!--添加和修改打开的是一个窗口，通过参数区分具体操作-->
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add' "
       onclick="doHotelEdit(0)">添加</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save' "
       onclick="doHotelEdit(1)">修改</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove' "
       onclick="doHotelDelete()">删除</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload' "
       onclick="doUpdateSolr()">更新索引</a>
</div>

<!--表格主体，注意设置工具栏引用-->
<table id="dg_hotel" data-options="toolbar: '#tb_hotel'">
    <thead>
    <tr>
        <!--field是Controller返回的数据列表中每个对象的属性名-->
        <!--datagrid会自动将属性值写到表格中-->
        <th data-options="field:'id',width:130">ID</th>
        <!--图片不能直接显示url的文字，需要转换成<img>标签。使用formatter-->
        <th data-options="field:'image',width:310,formatter:formatImage">图片</th>
        <th data-options="field:'title',width:170">标题</th>
        <th data-options="field:'cityName',width:130">城市</th>
        <th data-options="field:'price',width:130">价格</th>
        <th data-options="field:'status',width:130,formatter:formatStatus">状态</th>
    </tr>
    </thead>
</table>
<!--这个是编辑酒店的弹窗，因为编辑的内容多，所以代码写到另一个jsp中，这里以window的形式打开-->
<div id="hotelEditWindow" class="easyui-window" title="编辑酒店"
     data-options="modal:true,closed:true,iconCls:'icon-save',collapsible:false,minimizable:false"
     style="width:60%;height:80%;padding:10px;">
</div>
<!--设置表格的行高，不然图片没加载之前，datagrid就初始化了，页面的高度不对-->
<style>
    #dg_hotel tr {
        height: 200px;
    }
</style>
<!--富文本编辑器-->
<link href="/media/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/media/kindeditor-4.1.10/kindeditor-all.js"></script>
<script type="text/javascript" charset="utf-8" src="/media/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script type="text/javascript">
    $(function () {
        //要先初始化一下这个下拉框，否则控件没有初始化完成，datagrid就去调用了
        $("#search-hotel-cityId").combobox({
            filter: function (q, row) {//自动补全，不过要多敲一个空格
                var opts = $(this).combobox('options');
                return row[opts.textField].indexOf(q) > -1;
            }
        });
        $("#dg_hotel").datagrid({//初始化表格
            url: "/hotel/list.html",//获取数据的地址
            singleSelect: true,//每次只能选中一行
            pagination: true,//分页
            pageSize: 5,//每页几条
            pageList: [5, 10, 15, 20],//选择每页几条的下拉列表
            nowrap: false,//超出宽度后换行，主要是标题栏文字比较多
            queryParams: formToJson()//获取数据时的参数列表，翻页带参数
        });
    });

    //格式化table中的数据，添加html样式
    function formatStatus(val, row) {
        if (val == 0) {
            return '<span style="color:#ff0200;">无效</span>';
        } else {
            return '<span style="color:#00cf4d;">有效</span>';
        }
    }
function doHotelDelete() {
    var row = $('#dg_hotel').datagrid('getSelected')
    if (row==null){
        alert("请选择要删除的数据！");
        return;
    }
    $.ajax({
        url:'<%=request.getContextPath()%>/hotel/delete.html',
        data:{"id":row.id},
        method:"post",
        success:function (result) {
            if (result.success) {
                $("#dg_hotel").datagrid('reload')
                alert("删除成功！")
            }else{
                alert(result.message)
            }
        }

    })
}
    //将图片的url转换成<img>标签
    function formatImage(val, row) {
        return '<img src="' + val + '" style="max-height: 200px"/>';
    }

    /**
     * datagrid查询数据的时候，参数必须是json对象
     * 不可以直接把搜索框searcHhotelForm直接serialize，
     * 否则会datagrid把每个字符都当成参数发出去
     * 所以这里把form表单中的每个字段都获取出来封装成json
     */
    function formToJson() {
        var param = {};
        param.id = $("#search-hotel-id").val();
        param.title = $("#search-hotel-title").val();
        param.cityId = $("#search-hotel-cityId").combobox("getValue");
        return param;
    }

    //点击搜索按钮
    function doHotelSearch() {
        $('#dg_hotel').datagrid({queryParams: formToJson()});
    }

    var kingEditorParams = {
        filePostName: "file",//指定上传文件参数名称
        uploadJson: '/hotel/upload.html',//指定上传文件请求的url。
        dir: "image"//上传类型，分别为image、flash、media、file,
    }
    var editor;

    //打开编辑的弹窗
    function doHotelEdit(type) {
        var id = "";
        var row = $('#dg_hotel').datagrid('getSelected');//获取当前选中的行
        type == 1 ? id = row.id : id = "";
        //KindEditor和easyUI有冲突
        //必须在父页面中初始化KindEditor,否则上传图片无法插入到编辑器
        $("#hotelEditWindow").window({
            href: "/hotel/go_edit.html?id=" + id,
            onLoad: function () {
                editor = KindEditor.create($("#hotel-content"), kingEditorParams);
            },
            onBeforeDestroy: function () {
                KindEditor.remove("#hotel-content");
            }
        }).window('open');
    }
    function doUpdateSolr(){
        var row = $('#dg_hotel').datagrid('getSelected');//获取当前选中的行
        if(row==null){
            alert("请选择要更新的数据");
            return;
        }
        $.ajax({
            url: "/hotel/solr.html",
            data: "hotelId="+row.id,
            method: "post",
            success: function (data) {
                if (!data.status) {
                    alert(data.message);
                } else {
                    alert(data.msg);
                }
            }
        })
    }
</script>
</body>
</html>