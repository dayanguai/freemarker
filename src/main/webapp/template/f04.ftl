<#-- 通过import指令引入命名空间 -->
<#--
<#import "f03.ftl" as f3>
<@f3.cfb></@f3.cfb>
<@f3.address></@f3.address>-->
<#import "commons.ftl" as cm>
<@cm.cfb02 num = 5></@cm.cfb02>

<#--包含指令(引入其他页面文件) include-->
<#--html文件-->
<#include "test.html">
<#--freemarker文件-->
<#include "test.ftl">
<#--txt文件-->
<#include "test.txt">
