<#--文章界面的面包屑部分ok-->
<section id="breadcrumb">
    <nav aria-label="breadcrumb" class="pt-4">
        <ol class="breadcrumb bg-transparent pl-lg-1 pl-2">
            <li class="breadcrumb-item">
                <a href="${blog_url!}" class="text-dark font-weight-bold">
                    <i class="fas fa-home"></i> 首页
                </a>
            </li>
            <#if (post.categories)?? && post.categories?size gt 0>
                <li class="breadcrumb-item">
                    <a href="${post.categories[0].fullPath!}"
                       class="text-dark font-weight-bold text-truncate">${post.categories[0].name!}</a>
                </li>
            </#if>
            <li class="breadcrumb-item active text-truncate" aria-current="page">${post.title!}</li>
        </ol>
    </nav>
</section>