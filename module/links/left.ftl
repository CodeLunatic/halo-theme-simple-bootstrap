<#--链接界面的左边OK-->
<section id="linkCategory">
    <div class="card">
        <div class="card-header">
            <i class="fas fa-link mr-2"></i>链接分类
        </div>
        <ul id="linkCategoryList" class="list-group list-group-flush">
            <@linkTag method="listTeams">
                <#if teams?? && teams?size gt 0>
                    <#list teams as team>
                        <li class="list-group-item">
                            <a id="${team.team!}" class="category-button <#if team?index == 0>text-danger</#if>"
                               href="javascript: void(0)">
                                <i class="fas fa-caret-right mr-3"></i>${team.team!}
                            </a>
                        </li>
                    </#list>
                </#if>
            </@linkTag>
        </ul>
    </div>
</section>
