<#--分类界面左边ok-->
<#include "category_item.ftl">
<div class="pr-lg-5 mt-lg-2 mt-3">
    <@categoryTag method="list">
        <#if categories?? && categories?size gt 0>
            <#list categories as category>
                <@categoryItem category=category/>
            </#list>
        </#if>
    </@categoryTag>
</div>