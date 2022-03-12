  <#--
    FreeMarker 常用指令
        1. assign 自定义变量指令
            语法：
                <#assign 变量名=值>
                <#assign 变量名=值 变量名=值> （定义多个变量）

        2. if, else, elseif 逻辑判断指令
            格式：
                <#if condition>
                  ...
                <#elseif condition2>
                  ...
                <#elseif condition3>
                  ...
                <#else>
                  ...
                </#if>
            注：
                1. condition, condition2等：将被计算成布尔值的表达式。
                2. elseif 和 else 指令 是可选的。

        3. list指令
            格式1：
                <#list sequence as item>

                </#list>
            格式2：
                <#list sequence as item>

                <#else>
                    当没有选项时，执行else指令
                </#list>
            注：
                1. else 部分是可选的
                2. sequence： 想要迭代的项，可以是序列或集合的表达式
                3. item： 循环变量 的名称
                4. 当没有迭代项时，才使用 else 指令， 可以输出一些特殊的内容而不只是空在那里

        4. macro 自定义指令 （宏）
            1. 基本使用
                格式：
                    <#macro 指令名>
                        指令内容
                    </#macro>
                使用：
                    <@指令名></@指令名>
            2. 有参数的自定义指令
                格式：
                     <#macro 指令名 参数名1 参数名2>
                        指令内容
                    </#macro>
                使用：
                    <@指令名 参数名1=参数值1 参数名2=参数值2></@指令名>

            注：
                1. 指令可以被多次使用。
                2. 自定义指令中可以包含字符串，也可包含内置指令

        5. nested 占位指令
            nested 相当于占位符,一般结合macro指令一起使用。
            可以将自定义指令中的内容通过nested指令占位，当使用自定义指令时，会将占位内容显示。

        6. import 导入指令
            在ftl文件中引入命名空间，可以使用引入的空间中定义的宏

        7. include 包含指令
            在模板中包含另外一个模板（html、frrmarker、txt等文件）




-->
<h5>1. assign 自定义变量指令</h5>
<#-- 定义单个变量 -->
<#assign str = "hello">
${str} <br>
<#-- 定义多个变量 -->
<#assign num = 1 names=["张三","李四","王五"]>
${num}<br>
${names?join(",")}<br>
<hr>
<h5> 2. if, else, elseif 逻辑判断指令</h5>
<#assign score = 60>
<#if score lt 60 >
    <h6>你个小渣渣！</h6>
    <#elseif score == 80>
        <h6>分不在高，及格就行！</h6>
    <#elseif score gt 60 && score lt 80 >
        <h6>革命尚未成功，同志仍需努力！</h6>
    <#else >
        <h6>哎哟不错哦！</h6>
</#if>
<#--判断数据是否存在-->
<#assign list="">
<#if list??>
    数据存在
    <#else >
        数据不存在
</#if>
<br>
<#if list2??>
    数据存在
<#else >
    数据不存在
</#if>
<br><hr>
<h5>3. list指令</h5>
<#assign users = ["张三","李四","王五"]>
<#list users as user>
    ${user} |
</#list>
<br>
<#--判断数据不为空，再执行遍历 （如果序列不存在，直接遍历会报错）-->
<#if users2??>
    <#list users2 as user>
        ${user}
    </#list>
</#if>
<br>
<#-- 当序列没有数据项时，使用默认信息 -->
<#assign users3 = []>
<#list users3 as user>
    ${user} |
    <#else >
        用户数据不存在！
</#list>
<hr>
<h5>4. macro 自定义指令</h5>
<#-- 自定义指定 -->
<#macro address>
    © 1999–2015 The FreeMarker Project. All rights reserved.
</#macro>
<#-- 使用自定义指令 -->
<@address></@address>
<#macro address02>
   <h3> © 1999–2015 The FreeMarker Project. All rights reserved.</h3>
</#macro>
<@address02></@address02>
<@address02></@address02>
<@address02></@address02>
<#-- 自定义有参数的指令 -->
<#macro queryUserByName uname>
    通过用户名查询用户对象 - ${uname}
</#macro>
<@queryUserByName uname="admin"></@queryUserByName>
<br>
<#macro queryUserByName02 uname upwd phone>
    多条件查询用户对象 - ${uname} - ${upwd} - ${phone}
</#macro>
<@queryUserByName02 uname="zhangsan" upwd="123456" phone="1587656789"></@queryUserByName02>
<hr>
<#-- 自定义指令中包含内置指令 -->
<#macro cfb>
    <#list 1..9 as i>
        <#list 1..i as j>
            ${j} * ${i} = ${j*i} &nbsp;
        </#list>
        <br>
    </#list>
</#macro>
<@cfb></@cfb>
<@cfb></@cfb>
<hr>
<#macro cfb02 num>
    <#list 1..num as i>
        <#list 1..i as j>
            ${j} * ${i} = ${j*i} &nbsp;
        </#list>
        <br>
    </#list>
</#macro>
<@cfb02 num=5></@cfb02>
<@cfb02 num=7></@cfb02>
<hr>
<#macro test>
    <#nested ><br>
    这是一段文本！
    <#nested >
</#macro>
<@test>xxxxxxx</@test>


