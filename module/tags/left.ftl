<#--存档界面左边ok-->
<#include "tag_item.ftl">
<div class="pr-lg-5 mt-lg-2 mt-3">
    <@tagTag method="list">
        <#if tags?? && tags?size gt 0>
            <#list tags as tag>
                <@tagItem tag=tag/>
            </#list>
        </#if>
    </@tagTag>
</div>