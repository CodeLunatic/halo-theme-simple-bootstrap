<#--链接界面的隐藏列表，用来使用JS做过滤操作 OK-->
<div id="hideList" style="display: none;">
    <@linkTag method="list">
        <#if links?? && links?size gt 0>
            <#list links as link>
                <div class="hide-list-item">
                    <input type="hidden" class="hide-link-id" value="${link.id!}"/>
                    <input type="hidden" class="hide-link-name" value="${link.name!}"/>
                    <input type="hidden" class="hide-link-url" value="${link.url!}"/>
                    <input type="hidden" class="hide-link-logo" value="${link.logo!}"/>
                    <input type="hidden" class="hide-link-description" value="${link.description!}"/>
                    <input type="hidden" class="hide-link-team" value="${link.team!}"/>
                    <input type="hidden" class="hide-link-priority" value="${link.priority!}"/>
                </div>
            </#list>
        </#if>
    </@linkTag>
</div>