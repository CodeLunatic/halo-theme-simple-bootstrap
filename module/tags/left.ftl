<#--存档界面左边ok-->
<#include "tag_item.ftl">
<div class="pr-lg-5 mt-lg-2 mt-3">
    <@tagTag method="list">
        <#if tags?? && tags?size gt 0>
            <#list tags as tag>
                <@tagItem tag=tag/>
            </#list>
        <#else>
            <div>
                <div class="d-flex flex-column align-items-center mt-2 pt-5">
                    <span class="text-muted"><i class="fas fa-inbox fa-7x"></i></span>
                    <span class="text-muted mt-4 mb-5">
                        还没有添加任何标签，回<a class="font-weight-bold" href="${context!}">主页</a>看看吧
                    </span>
                </div>
            </div>
        </#if>
    </@tagTag>
</div>