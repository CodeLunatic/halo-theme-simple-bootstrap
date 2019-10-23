<#--标签界面左侧ok-->
<#if posts.content?size lte 0>
<#--无结果-->
    <div class="alert alert-danger mt-4" role="alert">
        <i class="far fa-tired mr-2"></i>
        "${tag.name!}"标签下啥都没有
    </div>
<#--图标提示-->
    <div class="d-flex flex-column align-items-center mt-5 pt-5">
        <span class="text-muted"><i class="fas fa-inbox fa-7x"></i></span>
        <span class="text-muted mt-4 mb-5">
            "${tag.name!}"标签下啥都没有，回<a class="font-weight-bold" href="${context!}">主页</a>看看吧
        </span>
    </div>
<#else>
<#--用户位置-->
    <div class="alert alert-secondary mt-4 mb-2" role="alert">
        <i class="fa fa-location-arrow mr-2" aria-hidden="true"></i>
        当前位于"${tag.name!}"标签下
    </div>
<#--左边的文章列表-->
    <#include "../index/list_item.ftl"/>
<#--列表项-->
    <#list posts.content as post>
        <@listItem post=post />
    </#list>
<#--分页-->
    <#include "pagination.ftl">
    <@pagination posts=posts rainbow=rainbow slugName=tag.slugName/>
</#if>



