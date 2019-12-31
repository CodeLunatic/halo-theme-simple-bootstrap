<#--自定义界面的左边OK-->
<#--自定义页面标题-->
<h1>${sheet.title!}</h1>
<#--内容-->
<div id="content" class="mt-4">${sheet.formatContent!}</div>
<#--分享-->
<div class="social-share-cs my-4"></div>
<#--评论-->
<div class="my-4">
    <#include "../comment.ftl">
    <@comment post=sheet type="sheet"/>
</div>