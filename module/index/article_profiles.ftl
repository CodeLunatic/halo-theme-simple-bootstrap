<#macro articleProfiles post>
    <small>
        <#--标签-->
        <#if (post.tags)?? && post.tags?size !=0>
            <span class="mr-3 font-weight-bold d-md-inline d-none">
                    <i class="fas fa-tags mr-1"></i>
                    <#list post.tags as tag>
                        <a class="text-body mr-1"
                           href="${tag.fullPath!}">${tag.name!}</a>
                    </#list>
                </span>
        </#if>

        <#--日期-->
        <span class="mr-3">
            <i class="fas fa-calendar-alt mr-2"></i>${post.createTime?string["yyyy年MM月dd日"]!}
        </span>

        <#--多少次浏览-->
        <span>
            <i class="fas fa-eye mr-2"></i>${post.visits!}次浏览
        </span>
    </small>
</#macro>