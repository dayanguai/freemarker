<h4>FreeMarker 数据类型</h4>
<#--
    FreeMarker 数据类型
        布尔类型
            在freemarker页面中不能直接输出，如果要输出需要转换成字符串
            方式一： ?c
            方式二： ?string 或 ?string('为true时显示的内容','为false时显示的内容')
-->
<h5>布尔类型</h5>
${flag?c} <br>
${flag?string} <br>
${flag?string('yes','no')} <br>
${flag?string('喜欢','不喜欢')} <br>
<#--
     FreeMarker 数据类型
        日期类型
            在freemarker中日期类型不能直接输出，需要转换成日期型或字符串
            1. 年月日  ?date
            2. 时分秒  ?time
            3. 年月日时分秒   ?datetime
            4. 自定义格式     ?string("自定义")
                              y：年   M：月  d：日
                              H：时   m：分  s：秒
-->
<hr>
<h5>日期类型</h5>
${createDate?date} <br>
${createDate?time} <br>
${createDate?datetime} <br>
${createDate?string("yyyy/MM/dd HH:mm:ss")} <br>


<hr>
<#--
     FreeMarker 数据类型
        数值类型
            在freemarker中数值类型可以直接输出；
            1. 转字符串
                普通字符串   ?c
                货币型字符串   ?string.currency
                百分比型字符串 ?string.percent
            2. 浮点型的数值转换成指定小数位输出 (#表示小数位)
                ?string["0.##"] (保留两位)
-->
<h5>数值类型</h5>
${age} <br>
${num} <br>
${avg} <br>
<#-- 将数值转换成字符串类型 -->
${num?c} <br>
<#-- 将数值转换成货币类型字符串 -->
${num?string.currency} <br>
<#-- 将数值转换成百分比类型的字符串 -->
${avg?string.percent} <br>
<#-- 将浮点型的数值转换成指定小数位输出 -->
${avg?string["0.##"]}<br>
<hr>
<#--
     FreeMarker 数据类型
        字符串类型
            在freemarker中字符串类型可以直接输出；
            1. 截取字符串（左闭右开） ?substring(start,end)
            2. 首字母小写输出  ?uncap_first
            3. 首字母大写输出  ?cap_first
            4. 字母转小写输出  ?lower_case
            5. 字母转大写输出  ?upper_case
            6. 获取字符串长度  ?length
            7. 是否以指定字符开头（boolean类型） ?starts_with("xx")?string
            8. 是否以指定字符结尾（boolean类型） ?ends_with("xx")?string
            9. 获取指定字符的索引  ?index_of("xx")
            10. 去除字符串前后空格 ?trim
            11. 替换指定字符串  ?replace("xx","xx")
-->
<h5>字符串类型</h5>
${msg} -- ${msg2} <br>
${msg?string} -- ${msg2?string} <br>
<#-- 1. 截取字符串（左闭右开） ?substring(start,end) -->
${msg?substring(0,2)} <br>
<#-- 2. 首字母小写输出  ?uncap_first -->
${msg?uncap_first} <br>
<#-- 3. 首字母大写输出  ?cap_first -->
${msg2?cap_first} <br>
<#-- 4. 字母转小写输出  ?lower_case  -->
${msg?lower_case} <br>
<#-- 5. 字母转大写输出  ?upper_case -->
${msg2?upper_case} <br>
<#--6. 获取字符串长度  ?length-->
${msg?length} <br>
<#--7. 是否以指定字符开头（boolean类型） ?starts_with("xx")?string-->
${msg?starts_with("a")?string} <br>
<#--8. 是否以指定字符结尾（boolean类型） ?ends_with("xx")?string-->
${msg?ends_with("o")?string} <br>
<#--9. 获取指定字符的索引  ?index_of("xx")-->
${msg2?index_of("m")} <br>
<#--10. 去除字符串前后空格 ?trim-->
${msg2?trim}<br>
<#--11. 替换指定字符串  ?replace("xx","xx")-->
${msg?replace("He","We")}<br>
<hr>
<#--
    空值处理
        FreeMarker 提供两个运算符来避免空值：

​		① !  ：指定缺失变量的默认值

​			${value!}：如果value值为空，则默认值是空字符串

​			${value!"默认值"}：如果value值为空，则默认值是字符串"默认值"

​		② ?? ：判断变量是否存在

​			如果变量存在，返回 true，否则返回 false

​			${(value??)?string}
-->
<#-- 不存在的值，报错 -->
<#--${aa}-->
<#-- 值为null的数据 -->
<#--${str1} <br>-->
<#-- 值为空字符串的数据 -->
${str2} <br>
<#-- ① !  ：指定缺失变量的默认值 -->
${str1!}  <br> <#--如果value值为空，则默认值是空字符串-->
${str1!"str1的数据不存在"}  <br> <#--如果value值为空，则默认值是字符串"默认值"-->
<#-- ② ?? ：判断变量是否存在  -->
${(str1??)?c}
<hr>

<#--
    FreeMarker 数据类型
        序列类型（数组、List、Set）
            通过list指令输出序列
            <#list 序列名 as 元素名>
                ${元素名}
            </#list>

            获取序列的长度        ${序列名?size}
            获取序列元素的下标     ${元素名?index}
            获取第一个元素        ${序列名?first}
            获取最后一个元素      ${序列名?last}

            倒序输出    	 序列名?reverse
            升序输出    	 序列名?sort
            降序输出    	 序列名?sort?reverse
            指定字段名排序    序列名?sort_by("字段名")
                注：一般是JavaBean集合，对应的字段名需要提供get方法

-->
<#-- 数组操作 -->
<#list stars as star>
  下标：${star?index} - 姓名：${star} <br>
</#list>
获取序列的长度：${stars?size} <br>
获取第一个元素：${stars?first} <br>
获取最后一个元素： ${stars?last} <br>
<hr>
<#-- List操作 -->
<#list cityList as city>
    ${city} -
</#list>
<br>
<#--倒序输出    	 序列名?reverse-->
<#list cityList?reverse as city>
    ${city} -
</#list>
<br>
<#--升序输出    	 序列名?sort-->
<#list cityList?sort as city>
    ${city} -
</#list>
<br>
<#--降序输出    	 序列名?sort?reverse-->
<#list cityList?sort?reverse as city>
    ${city} -
</#list>
<br>
<hr>
<#list userList as user >
    编号：${user.userId} &nbsp; 姓名：${user.uname} &nbsp; ${user.uage} <br>
</#list>
<br>
<#list userList?sort_by("uage") as user >
编号：${user.userId} &nbsp; 姓名：${user.uname} &nbsp; ${user.uage} <br>
</#list>
<br>
<hr>
<#--
    FreeMarker 数据类型
        hash类型
            通过list指令输出
            获取map的key及key对应的value
            <#list hash?keys as key>
                ${key} - ${hash[key]}
            </#list>
            获取map的value
             <#list hash?values as value>
                ${value}
            </#list>
-->
<#list cityMap?keys as key>
    ${key} - ${cityMap[key]} <br>
</#list>
<br>
<#list cityMap?values as value>
    ${value} --
</#list>