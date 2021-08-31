﻿<%@ page language="java"
         import="com.zhuozhengsoft.pageoffice.OpenModeType,com.zhuozhengsoft.pageoffice.PageOfficeCtrl"
         pageEncoding="utf-8" %>
<%
    PageOfficeCtrl pocCtrl = new PageOfficeCtrl(request);
    //设置服务器页面
    pocCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
    //添加自定义按钮
    pocCtrl.addCustomToolButton("保存", "Save()", 1);
    pocCtrl.addCustomToolButton("全屏", "SetFullScreen()", 4);
    pocCtrl.addCustomToolButton("关闭", "Close()", 21);
    //设置保存页面
    pocCtrl.setSaveFilePage("SaveFile.jsp?id=1");
    //打开文件
    pocCtrl.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "张佚名");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <script type="text/javascript">
        function Save() {
            document.getElementById("PageOfficeCtrl1").WebSave();
        }

        function SetFullScreen() {
            document.getElementById("PageOfficeCtrl1").FullScreen = !document.getElementById("PageOfficeCtrl1").FullScreen;
        }

        function Close() {
            window.external.close();
        }
    </script>
</head>
<body>
<form id="form1">
    <div style="font-size: 14px;">
        <div style="border:1px solid black;">PageOffice给保存页面传值的三种方式：</br>
            <span style="color: Red;">1.通过设置保存页面的url中的?给保存页面传递参数：</span></br>
            &nbsp;&nbsp;&nbsp;例:pocCtrl.setSaveFilePage("SaveFile.jsp?id=1");</br>
            &nbsp;&nbsp;&nbsp;保存页面获取参数的方法：</br>
            &nbsp;&nbsp;&nbsp;String value=request.getParameter("id");</br>

            <span style="color: Red;">2.通过input隐藏域给保存页面传递参数：</span></br>
            &nbsp;&nbsp;&nbsp;例:
            <xmp><input id="age" name="age" type="hidden" value="25"/></xmp>
            </br>
            &nbsp;&nbsp;&nbsp;保存页面获取参数的方法：</br>
            &nbsp;&nbsp;&nbsp;String age=fs.getFormField("age");</br>
            &nbsp;&nbsp;&nbsp;注意：获取Form控件传递过来的参数值，fs.getFormField("参数名")方法中的参数名是当前控件的id，更多详细代码请查看SaveFile.jsp。<br>

            <span style="color: Red;">3.通过Form控件给保存页面传递参数(这里的Form控件包括输入框、下拉框、单选框、复选框、TextArea等类型的控件)：</span></br>
            &nbsp;&nbsp;&nbsp;例:
            <xmp><input id="userName" name="userName" type="text" value="张三"/></xmp>
            </br>
            &nbsp;&nbsp;&nbsp;保存页面获取参数的方法：</br>
            &nbsp;&nbsp;&nbsp;String name=fs.getFormField("userName");</br>
            &nbsp;&nbsp;&nbsp;注意：获取Form控件传递过来的参数值，fs.getFormField("参数名")方法中的参数名是当前控件的id，更多详细代码请查看SaveFile.jsp。<br>
        </div>
        <span style="color: Red;">更新人员信息：</span><br/>
        <input id="age" name="age" type="hidden" value="25"/>
        <span style="color: Red;">姓名：</span><input id="userName" name="userName" type="text" value="张三"/><br/>
        <span style="color: Red;">性别：</span><select id="selSex" name="selSex">
        <option value="男">男</option>
        <option value="女">女</option>
    </select>
    </div>
    <div style="width: auto; height: 700px;">
        <%=pocCtrl.getHtmlCode("PageOfficeCtrl1")%>
    </div>
</form>
</body>
</html>
