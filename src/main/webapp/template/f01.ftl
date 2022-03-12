<!--
    html注释
        在浏览器中可以看到的注释
-->
<#--
    freemarker注释
        在浏览器中不能看到的注释
    freemarker的语法
        1. html所有的标签都适用
        2. js与css的使用，与html中语法一致
-->
<#-- css的使用 -->
<style>
    h2{
        font-family: 楷体;
    }
</style>

<#-- 获取数据 -->
<h2>${msg}</h2>

<#-- js的使用 -->
<script>
    // alert("freemarker");
</script>