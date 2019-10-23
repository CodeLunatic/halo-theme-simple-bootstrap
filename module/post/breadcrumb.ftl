<#--文章界面的面包屑部分ok-->
<section id="breadcrumb">
    <nav aria-label="breadcrumb" class="pt-4">
        <ol class="breadcrumb bg-transparent pl-2">
            <li class="breadcrumb-item">
                <a href="${context!}" class="text-dark font-weight-bold">
                    <i class="fas fa-home"></i> 首页
                </a>
            </li>
            <#if post.categories?size != 0>
                <li class="breadcrumb-item">
                    <a href="/categories/${post.categories[0].slugName!}"
                       class="text-dark font-weight-bold">${post.categories[0].name!}</a>
                </li>
            </#if>
            <li class="breadcrumb-item active" aria-current="page">${post.title!}</li>
        </ol>
    </nav>
</section>