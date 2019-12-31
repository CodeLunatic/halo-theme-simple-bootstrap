<#--文章概况-->
<#include "article_profiles.ftl"/>

<#--主页的一个文章列表项ok-->
<#macro listItem post>

<#--一个列表项-->
    <div class="list-item px-1 py-xl-4 py-3 mt-xl-0 mt-3 border-bottom">

        <div class="d-flex align-items-center">

            <div class="mr-auto">
                <#--文章标题-->
                <div>
                    <#--文章标题-->
                    <a href="/archives/${post.url!}" class="text-body">
                        <h4 class="post-title font-weight-bold text-break">
                            ${post.title!}
                        </h4>
                    </a>
                </div>
                <#--文章摘要-->
                <div class="d-flex align-items-center mt-xl-4 mt-3">
                    <#--小屏幕缩略图-->
                    <#if (post.thumbnail)?? && post.thumbnail?trim != ''>
                        <img src="${post.thumbnail!}" class="mr-3 thumbnail-img thumbnail-img-sm"
                             alt="${post.title!}"/>
                    </#if>
                    <#--文章摘要-->
                    <div class="post-summary d-block text-muted text-break">${post.summary!}</div>
                </div>
                <#--文章概况-->
                <@articleProfiles post=post/>
            </div>

            <#--大屏幕缩略图-->
            <#if (post.thumbnail)?? && post.thumbnail?trim != ''>
                <img src="${post.thumbnail!}" class="ml-3 thumbnail-img thumbnail-img-lg"
                     alt="${post.title!}"/>
            </#if>
        </div>
    </div>
</#macro>