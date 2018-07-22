/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-07-16 09:37:45 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_005fadv_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Title</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<!--工具栏-->\n");
      out.write("<div id=\"tb_index_adv\" style=\"height:auto\">\n");
      out.write("    <div style=\"padding:2px 5px;\">\n");
      out.write("        <form id=\"searchIndexAdvForm\">\n");
      out.write("            类型: <select id=\"search-adv-type\">\n");
      out.write("            <option value=\"\">请选择</option>\n");
      out.write("            <option value=\"1\">一级</option>\n");
      out.write("            <option value=\"2\">二级</option>\n");
      out.write("        </select>\n");
      out.write("            状态：<select id=\"search-adv-status\">\n");
      out.write("            <option value=\"\">请选择</option>\n");
      out.write("            <option value=\"1\">显示中</option>\n");
      out.write("            <option value=\"0\">未上架</option>\n");
      out.write("            <option value=\"-1\">已过期</option>\n");
      out.write("        </select>\n");
      out.write("            <a href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-search\"\n");
      out.write("               onclick=\"doAdvSearch()\">搜索</a>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("    <a href=\"#\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-add' \"\n");
      out.write("       onclick=\"doIndexAdvAdd(0)\">添加</a>\n");
      out.write("    <a href=\"#\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-save' \"\n");
      out.write("       onclick=\"doIndexAdvAdd(1)\">修改</a>\n");
      out.write("    <a href=\"#\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-cancel' \"\n");
      out.write("       onclick=\"doIndexAdvDelete()\">下架</a>\n");
      out.write("    <a href=\"#\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-redo' \"\n");
      out.write("       onclick=\"doExport()\">导出静态页</a>\n");
      out.write("</div>\n");
      out.write("<!--表格主体，注意设置工具栏引用-->\n");
      out.write("<table id=\"dg_index_adv\" data-options=\"toolbar: '#tb_index_adv'\">\n");
      out.write("</table>\n");
      out.write("<div id=\"hotelIndexAdvWindow\" class=\"easyui-window\" title=\"编辑广告位\"\n");
      out.write("     data-options=\"modal:true,closed:true,iconCls:'icon-save',collapsible:false,minimizable:false\"\n");
      out.write("     style=\"width:30%;height:60%;padding:10px;\">\n");
      out.write("</div>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    $(function () {\n");
      out.write("        $(\"#dg_index_adv\").datagrid({//初始化表格\n");
      out.write("            url: \"/static/list.html\",//获取数据的地址\n");
      out.write("            singleSelect: true,//每次只能选中一行\n");
      out.write("            pagination: true,//分页\n");
      out.write("            pageSize: 5,//每页几条\n");
      out.write("            pageList: [5, 10, 15, 20],//选择每页几条的下拉列表\n");
      out.write("            nowrap: false,//超出宽度后换行，主要是标题栏文字比较多\n");
      out.write("            queryParams: formToJson(),//获取数据时的参数列表，翻页带参数\n");
      out.write("            columns: [[\n");
      out.write("                {field: 'id', title: 'ID', width: 80},\n");
      out.write("                {\n");
      out.write("                    field: 'hotelImg', title: '图片', width: 310, formatter: function (val, row) {\n");
      out.write("                    return '<img src=\"' + row.hotel.image + '\"/>';\n");
      out.write("                }\n");
      out.write("                },\n");
      out.write("                {\n");
      out.write("                    field: 'hotelTitle', title: '标题', width: 280, formatter: function (val, row) {\n");
      out.write("                    return row.hotel.title;\n");
      out.write("                }\n");
      out.write("                },\n");
      out.write("                {\n");
      out.write("                    field: 'type', title: '类型', width: 100, formatter: function (val, row) {\n");
      out.write("                    return val == 1 ? '一级' : '二级';\n");
      out.write("                }\n");
      out.write("                },\n");
      out.write("                {field: 'sort', title: '排序', width: 100},\n");
      out.write("                {\n");
      out.write("                    field: 'startDate', title: '上架时间', width: 170, formatter: function (val, row) {\n");
      out.write("                    return formatDate(val, row);\n");
      out.write("                }\n");
      out.write("                },\n");
      out.write("                {\n");
      out.write("                    field: 'endDate', title: '过期时间', width: 170, formatter: function (val, row) {\n");
      out.write("                    return formatDate(val, row);\n");
      out.write("                }\n");
      out.write("                },\n");
      out.write("                {\n");
      out.write("                    field: 'updateTime', title: '更新时间', width: 170, formatter: function (val, row) {\n");
      out.write("                    return formatDate(val, row);\n");
      out.write("                }\n");
      out.write("                },\n");
      out.write("                {\n");
      out.write("                    field: 'createdDate', title: '创建时间', width: 170, formatter: function (val, row) {\n");
      out.write("                    return formatDate(val, row);\n");
      out.write("                }\n");
      out.write("                },\n");
      out.write("                {\n");
      out.write("                    field: 'status', title: '状态', width: 170, formatter: function (val, row) {\n");
      out.write("                    switch (val) {\n");
      out.write("                        case 0:\n");
      out.write("                            return '<span style=\"color:#00cf4d;\">新建</span>';\n");
      out.write("                        case 1:\n");
      out.write("                            return '<span style=\"color:#ff0200;\">展示中</span>';\n");
      out.write("                        case -1:\n");
      out.write("                            return '<span style=\"color:#9d7e87;\">已过期</span>';\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("                }\n");
      out.write("            ]]\n");
      out.write("        });\n");
      out.write("    });\n");
      out.write("\n");
      out.write("    function doIndexAdvAdd(type) {\n");
      out.write("        var id = \"\";\n");
      out.write("        var row = $('#dg_index_adv').datagrid('getSelected');//获取当前选中的行\n");
      out.write("        type == 1 ? id = row.id : id = \"\";\n");
      out.write("        $(\"#hotelIndexAdvWindow\").window({href: \"/static/go_edit.html?id=\" + id}).window('open');\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function formatDate(date, row) {\n");
      out.write("        if (date == \"\" || date == null) return \"\";\n");
      out.write("        var time = new Date(date);\n");
      out.write("        var year = time.getFullYear();\n");
      out.write("        var mo = time.getMonth() + 1;\n");
      out.write("        if (mo < 10) mo = \"0\" + mo;\n");
      out.write("        var d = time.getDate();\n");
      out.write("        if (d < 10) d = \"0\" + d;\n");
      out.write("        var h = time.getHours();\n");
      out.write("        if (h < 10) h = \"0\" + h;\n");
      out.write("        var m = time.getMinutes();\n");
      out.write("        if (m < 10) m = \"0\" + m;\n");
      out.write("        var s = time.getSeconds();\n");
      out.write("        if (s < 10) s = \"0\" + s;\n");
      out.write("        return year + \"-\" + mo + \"-\" + d + \" \" + h + \":\" + m + \":\" + s;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function formToJson() {\n");
      out.write("        var param = {};\n");
      out.write("        param.status = $(\"#search-adv-status\").val();\n");
      out.write("        param.type = $(\"#search-adv-type\").val();\n");
      out.write("        return param;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function doAdvSearch() {\n");
      out.write("        $('#dg_index_adv').datagrid({queryParams: formToJson()});\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function doIndexAdvDelete() {\n");
      out.write("        var row = $('#dg_index_adv').datagrid('getSelected');//获取当前选中的行\n");
      out.write("        if (row != null) {\n");
      out.write("            if (confirm(\"确定要下架么？\")) {\n");
      out.write("                $.ajax({\n");
      out.write("                    url: \"/static/del.html\",\n");
      out.write("                    method: \"post\",\n");
      out.write("                    data: \"id=\" + row.id,\n");
      out.write("                    success: function (data) {\n");
      out.write("                        if (!data.status) {\n");
      out.write("                            alert(data.message);\n");
      out.write("                        } else {\n");
      out.write("                            $('#dg_index_adv').datagrid({queryParams: formToJson()});\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function doExport() {\n");
      out.write("        var row = $('#dg_index_adv').datagrid('getSelected');//获取当前选中的行\n");
      out.write("        if (row != null) {\n");
      out.write("            $.ajax({\n");
      out.write("                url: \"/static/export.html\",\n");
      out.write("                method: \"post\",\n");
      out.write("                data: \"id=\" + row.hotel.id,\n");
      out.write("                success: function (data) {\n");
      out.write("                    alert(data.msg);\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
