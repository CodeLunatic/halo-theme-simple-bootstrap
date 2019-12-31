<#--分类界面的左边ok-->
<#if (posts.content)?? && posts.content?size lte 0>
<#--无结果-->
    <div class="alert alert-danger mt-4" role="alert">
        <i class="far fa-tired mr-2"></i>
        "${category.name!}"分类下啥都没有
    </div>
<#--分类描述-->
    <#if (category.description)?? && category.description != ''>
        <div class="category-description mt-4 text-muted">
            分类描述：${category.description!}
        </div>
    </#if>
<#--图标提示-->
    <div class="d-flex flex-column align-items-center mt-5 pt-5">
        <span class="text-muted"><i class="fas fa-inbox fa-7x"></i></span>
        <span class="text-muted mt-4 mb-5">
                "${category.name!}"分类下啥都没有，回<a class="font-weight-bold" href="${context!}">主页</a>看看吧
            </span>
    </div>
<#else>
<#--用户位置-->
    <div class="alert alert-secondary mt-4 mb-2" role="alert">
        <i class="fa fa-location-arrow mr-2" aria-hidden="true"></i>
        当前位于"${category.name!}"分类下
    </div>
<#--分类描述-->
    <#if (category.description)?? && category.description != ''>
        <div class="category-description mt-4 text-muted">
            分类描述：${category.description!}
        </div>
    </#if>
<#--左边的文章列表-->
    <#include "../index/list_item.ftl"/>
<#--列表项-->
    <#list posts.content as post>
        <@listItem post=post />
    </#list>
<#--分页-->
    <#include "pagination.ftl">
    <@pagination posts=posts rainbow=rainbow slugName=category.slugName/>
</#if>



