<!doctype html>
<html>
    <head>
        <#-- freemaeker模板中设置编码格式，否则中文可能乱码 -->
        <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    </head>
    <body>
        <#-- 新闻标题 -->
        <h2 align="center">${title}</h2>
        <#-- 新闻来源  和 发布时间 -->
        <p align="center">
            新闻来源：${source} &nbsp;&nbsp;
            发布时间：${pubTime}
        </p>
        <#-- 新闻内容 -->
        <p style="text-indent: 2em">
            ${content}
        </p>
    </body>
</html>