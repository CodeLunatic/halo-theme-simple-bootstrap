<#--存档界面左边ok-->
<#include "archive_item.ftl">
<div class="pr-lg-5 mt-lg-2 mt-3">
    <@postTag method="archiveMonth">
        <#list archives as archive>
            <@archiveItem archive=archive/>
        </#list>
    </@postTag>
</div>