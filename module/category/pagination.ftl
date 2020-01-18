<#--分类界面的分页ok-->
<#macro pagination posts rainbow slugName>
    <#if posts.getTotalPages() gt 0>
        <section id="pagination" class="mt-5 mb-lg-3 d-flex justify-content-center">
            <nav aria-label="切换上下页">
                <ul class="pagination">
                    <#--上一页部分-->
                    <li class="page-item <#if posts.number lte 0>disabled</#if>">
                        <#if posts.number lte 0>
                            <a class="page-link" href="${context!}/categories/${slugName}/page/1" tabindex="-1"
                               aria-disabled="true">&laquo;</a>
                        <#else>
                            <a class="page-link"
                               href="${context!}/categories/${slugName}/page/${posts.number}"
                               aria-label="上一页">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </#if>
                    </li>
                    <#--页码部分-->
                    <#list rainbow as r>
                        <#if r == posts.number + 1>
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="javascript:void(0)">${posts.number + 1} <span
                                            class="sr-only">(current)</span></a>
                            </li>
                        <#else>
                            <li class="page-item">
                                <a href="${context!}/categories/${slugName}/page/${r}"
                                   class="page-link">${r}
                                </a>
                            </li>
                        </#if>
                    </#list>
                    <#--下一页部分-->
                    <li class="page-item <#if posts.getTotalPages() lte posts.number + 1>disabled</#if>">
                        <#if posts.getTotalPages() lte posts.number + 1>
                            <a class="page-link" href="javascript:void(0)" tabindex="-1"
                               aria-disabled="true">&raquo;</a>
                        <#else>
                            <a class="page-link"
                               href="${context!}/categories/${slugName}/page/${posts.number + 2}"
                               aria-label="下一页">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </#if>
                    </li>
                </ul>
            </nav>
        </section>
    </#if>
</#macro>