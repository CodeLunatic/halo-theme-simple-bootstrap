<#--日志界面分页ok-->
<#macro pagination journals rainbow>
    <#if journals.getTotalPages() gt 0>
        <section id="pagination" class="pt-3 d-flex justify-content-center bg-white">
            <nav aria-label="切换上下页">
                <ul class="pagination">
                    <#--上一页部分-->
                    <li class="page-item <#if journals.number lte 0>disabled</#if>">
                        <#if journals.number lte 0>
                            <a class="page-link" href="${context!}/journals/page/1" tabindex="-1"
                               aria-disabled="true">&laquo;</a>
                        <#else>
                            <a class="page-link"
                               href="${context!}/journals/page/${journals.number}"
                               aria-label="上一页">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </#if>
                    </li>
                    <#--页码部分-->
                    <#list rainbow as r>
                        <#if r == journals.number + 1>
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="javascript:void(0)">${journals.number + 1} <span
                                            class="sr-only">(current)</span></a>
                            </li>
                        <#else>
                            <li class="page-item">
                                <a href="${context!}/journals/page/${r}"
                                   class="page-link">${r}
                                </a>
                            </li>
                        </#if>
                    </#list>
                    <#--下一页部分-->
                    <li class="page-item <#if journals.getTotalPages() lte journals.number + 1>disabled</#if>">
                        <#if journals.getTotalPages() lte journals.number + 1>
                            <a class="page-link" href="javascript:void(0)" tabindex="-1"
                               aria-disabled="true">&raquo;</a>
                        <#else>
                            <a class="page-link"
                               href="${context!}/journals/page/${journals.number + 2}"
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