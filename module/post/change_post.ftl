<#--文章界面的上下篇文章部分ok-->
<section id="changePost" class="mb-5">
    <div class="d-flex px-1 flex-md-row flex-column">
        <#if prevPost??>
            <a id="prePost" class="mr-auto font-weight-bold" href="${prevPost.fullPath!}">
                <span class="icon mr-2 d-md-inline d-none">
                    <i class="fas fa-angle-double-left"></i>
                </span>
                <span class="icon mr-2 d-md-none d-inline">
                    上一篇：
                </span>
                ${prevPost.title!}
            </a>
        <#else>
            <a id="prePost" class="mr-auto font-weight-bold text-muted">
                <span class="icon mr-2 d-md-inline d-none">
                    <i class="fas fa-angle-double-left"></i>
                </span>
                <span class="icon mr-2 d-md-none d-inline">
                    上一篇：
                </span>
                前面没有了
            </a>
        </#if>
        <#if nextPost??>
            <a id="nextPost" class="font-weight-bold mt-md-0 mt-3" href="${nextPost.fullPath!}">
                <span class="icon mr-2 d-md-none d-inline">
                    下一篇：
                </span>
                ${nextPost.title!}
                <span class="icon ml-2 d-md-inline d-none">
                    <i class="fas fa-angle-double-right"></i>
                </span>
            </a>
        <#else>
            <a id="nextPost" class="font-weight-bold text-muted mt-md-0 mt-3">
                <span class="icon mr-2 d-md-none d-inline">
                    下一篇：
                </span>
                后面没有了
                <span class="icon ml-2 d-md-inline d-none">
                    <i class="fas fa-angle-double-right"></i>
                </span>
            </a>
        </#if>
    </div>
</section>