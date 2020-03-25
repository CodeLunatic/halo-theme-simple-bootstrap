<#--文章概况-->
<#include "article_profiles.ftl"/>

<#--主页的一个文章列表项ok-->
<#macro listItem post>

    <#--一个列表项-->
    <div class="list-item border-bottom pt-3">

        <div class="d-flex align-items-center justify-content-between">

            <div class="item-left d-flex flex-column" style="justify-content: space-evenly;">

                <#--文章标题-->
                <a href="${post.fullPath!}" class="text-body">
                    <h4 class="p-0 m-0 font-weight-bold text-break">
                        ${post.title!}
                    </h4>
                </a>

                <#--文章摘要-->
                <div class="d-flex align-items-center">
                    <#--小屏幕缩略图-->
                    <#if (post.thumbnail)?? && post.thumbnail?trim != ''>
                        <i style="background-image: url('${post.thumbnail!}'); background-size: cover; flex: none;" class="mr-3 thumbnail-img-sm shadow-sm rounded-lg"></i>
                    </#if>
                    <#--文章摘要-->
                    <div class="post-summary text-muted text-break">${post.summary!}</div>
                </div>

                <#--文章概况-->
                <@articleProfiles post=post/>
            </div>

            <#--大屏幕缩略图-->
            <#if (post.thumbnail)?? && post.thumbnail?trim != ''>
                <i style="background-image: url('${post.thumbnail!}'); background-size: cover; flex: none;" class="ml-3 thumbnail-img-lg shadow-sm rounded-lg"></i>
            </#if>
        </div>
    </div>
</#macro>