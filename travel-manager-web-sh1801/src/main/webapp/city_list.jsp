<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--工具栏-->
<div id="tb_city" style="height:auto">
    <div style="padding:2px 5px;">
        <form id="searchCityForm">
            id: <input class="easyui-textbox" name="id" id="search-city-id"/>
            名称: <input class="easyui-textbox" name="name" id="search-city-name">
            <a href="#" class="easyui-linkbutton" iconCls="icon-search"
               onclick="doCitySearch()">搜索</a>
        </form>
    </div>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add' "
       onclick="doCityAdd()">添加</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save' "
       onclick="doCityUpdate()">修改</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove' "
       onclick="doCityDelete()">删除</a>
</div>
<!--表格主体，注意设置工具栏引用-->
<table id="dg_city" data-options="toolbar: '#tb_city'">
    <thead>
    <tr>
        <!--field是Controller返回的数据列表中每个对象的属性名-->
        <!--datagrid会自动将属性值写到表格中-->
        <th data-options="field:'id',width:130">ID</th>
        <th data-options="field:'name',width:130">城市</th>
    </tr>
    </thead>
</table>
<!--编辑城市的弹窗界面，默认是关闭的-->
<div id="editCityDialog" class="easyui-dialog" modal="true" title="编辑城市"
     closed="true">
    <div style="padding:10px 60px 20px 60px">
        <form id="cityForm" method="post">
            <input type="hidden" name="id" id="city-id">
            <table cellpadding="5">
                <tr>
                    <td>名称:</td>
                    <td><input class="easyui-textbox" type="text" name="name" id="city-name"
                               data-options="required:true"/>
                    </td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitCityForm()">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#cityForm').form('clear')">重填</a>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $("#dg_city").datagrid({//初始化表格
            url: "/city/list.html",//获取数据的地址
            singleSelect: true,//每次只能选中一行
            pagination: true,//分页
            pageSize: 5,//每页几条
            pageList: [5, 10, 15, 20],//选择每页几条的下拉列表
            queryParams: formToJson()//获取数据时的参数列表，翻页带参数
        })
    });

    /**
     * datagrid查询数据的时候，参数必须是json对象
     * 不可以直接把搜索框searchCityForm直接serialize，
     * 否则会datagrid把每个字符都当成参数发出去
     * 所以这里把form表单中的每个字段都获取出来封装成json
     */
    function formToJson() {
        var param = {};
        param.id = $("#search-city-id").val();
        param.name = $("#search-city-name").val();
        return param;
    }

    //点击搜索按钮
    function doCitySearch() {
        $('#dg_city').datagrid({queryParams: formToJson()});
    }

    //打开编辑的弹窗
    function doCityAdd() {
        $('#cityForm').form('clear');
        $("#editCityDialog").dialog("open");
    }

    //修改城市
    function doCityUpdate() {
        var row = $('#dg_city').datagrid('getSelected');
        if (row==null){
            alert("请选择要修改的数据！");
            return;
        }//获取当前选中的行
        $('#cityForm').form('clear');//清空原来的表单
        //在表单中显示出原来的数据
        $("#city-id").val(row.id);//输入框赋值
        //给输入框赋值，因为input使用了easyUI封装，class="easyui-textbox"
        //所以不能直接使用.val()赋值了
        $("#city-name").textbox("setValue", row.name);
        $("#editCityDialog").dialog("open");//打开冉闯
    }
    function doCityDelete() {
        var row = $('#dg_city').datagrid('getSelected');//获取当前选中的行
        if (row==null){
            alert("请选择要删除的数据！");
            return;
        }
        $.ajax({
            url:'<%=request.getContextPath()%>/city/delete.html',
            data:{"id":row.id},
            method:"post",
            success:function (result) {
                if (result.success) {
                    $("#dg_city").datagrid('reload')
                }else{
                    alert(result.message)
                }
            }

        })
    }
    //保存
    function submitCityForm() {
        $('#cityForm').form('submit', {
            onSubmit: function () {
                if ($(this).form('enableValidation').form('validate')) {
                    $.ajax({
                        url: "/city/edit.html",
                        data: $('#cityForm').serialize(),
                        method: "post",
                        success: function (data) {
                            if (!data.status) {
                                alert(data.message);
                            } else {
                                $("#editCityDialog").dialog("close");
                                $('#dg_city').datagrid({queryParams: formToJson()});
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