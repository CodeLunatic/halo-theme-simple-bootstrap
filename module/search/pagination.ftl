<#--搜索界面分页ok-->
<#macro pagination posts keyword=''>
    <#if posts.getTotalPages() gt 0>
        <@paginationTag method="search" page="${posts.number}" total="${posts.totalPages}" display="3" keyword="${keyword!}">
            <section id="pagination" class="mt-5 mb-lg-3 d-flex justify-content-center">
                <nav aria-label="切换上下页">
                    <ul class="pagination">
                        <#--上一页部分-->
                        <li class="page-item <#if !pagination.hasPrev>disabled</#if>">
                            <#if !pagination.hasPrev>
                                <a class="page-link" tabindex="-1"
                                   aria-disabled="true">&laquo;</a>
                            <#else>
                                <a class="page-link"
                                   href="${pagination.prevPageFullPath!}"
                                   aria-label="上一页">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </#if>
                        </li>
                        <#--页码部分-->
                        <#list pagination.rainbowPages as number>
                            <#if number.isCurrent>
                                <li class="page-item active" aria-current="page">
                                    <a class="page-link" href="javascript:void(0)">
                                        ${number.page!}
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                            <#else>
                                <li class="page-item">
                                    <a class="page-link" href="${number.fullPath!}">${number.page!}</a>
                                </li>
                            </#if>
                        </#list>
                        <#--下一页部分-->
                        <li class="page-item <#if !pagination.hasNext>disabled</#if>">
                            <#if !pagination.hasNext>
                                <a class="page-link" href="javascript:void(0)" tabindex="-1"
                                   aria-disabled="true">&raquo;</a>
                            <#else>
                                <a class="page-link" href="${pagination.nextPageFullPath!}"
                                   aria-label="下一页">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </#if>
                        </li>
                    </ul>
                </nav>
            </section>
        </@paginationTag>
    </#if>
</#macro>