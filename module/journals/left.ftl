<#--日志界面的左边OK-->
<#if (journals.content)?? && journals.content?size gt 0>
    <#include "journal_item.ftl"/>
    <#list journals.content as journal>
        <@journalItem journal=journal/>
    </#list>
    <#include "pagination.ftl"/>
    <@pagination journals=journals/>
<#else>
    <div class="bg-white">
        <div class="d-flex flex-column align-items-center mt-2 pt-5">
            <span class="text-muted"><i class="fas fa-inbox fa-7x"></i></span>
            <span class="text-muted mt-4 mb-5">
                还没有发布过日志，回<a class="font-weight-bold" href="${blog_url!}">主页</a>看看吧
            </span>
        </div>
    </div>
</#if>