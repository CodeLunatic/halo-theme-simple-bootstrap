<#--主页的标签部分ok-->
<section id="tags" class="mt-4 mb-5 bg-white">
    <div class="card">
        <div class="card-header">
            <i class="fas fa-tags mr-2"></i>
            所有标签
        </div>
        <div class="card-body">
            <@tagTag method="list">
                <#list tags as tag>
                    <div class="tag">
                        <a href="/tags/${tag.slugName!}" class="text-muted">
                            <span class="tag-left">${tag.name!}</span>
                            <span class="tag-right">${tag.postCount!}</span>
                        </a>
                    </div>
                </#list>
                <div class="tag">
                    <a href="/tags" class="text-muted">
                        <span class="tag-left">所有标签</span>
                        <span class="tag-right">
                            <@postTag method="count">
                                ${count!}
                            </@postTag>
                        </span>
                    </a>
                </div>
            </@tagTag>
        </div>
    </div>
</section>