<#--自定义界面的左边OK-->
<#--自定义页面标题-->
<h1>${sheet.title!}</h1>
<#--内容-->
<div id="content" class="mt-4">${sheet.formatContent!}</div>
<#--评论-->
<div class="my-5">
    <#include "../comment.ftl">
    <@comment post=sheet type="sheet"/>
</div>