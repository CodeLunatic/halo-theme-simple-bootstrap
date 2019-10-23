<#--一个分类列表项ok-->
<#macro categoryItem category>
<#--对话框-->
    <div class="title-list-item">
        <div class="d-flex mb-3">
            <i class="user-avatar rounded-circle"
               style="display: block;
                       width: 2.5rem; height: 2.5rem;
                       background-image: url('${user.avatar!}');
                       background-size: cover;"></i>
            <div class="dialogue-box rounded">
                <h3 id="${category.name}" class="section-title">
                    <span>${category.name}</span>
                </h3>
            </div>
        </div>
        <#--列表项-->
        <ul class="title-list">
            <@postTag method="listByCategoryId" categoryId="${category.id}">
                <#list posts?sort_by("createTime") as post>
                    <li class="d-flex flex-sm-row flex-column justify-content-between pr-3">
                        <a href="${context!}/archives/${post.url!}">${post.title!}</a>
                        <small class="text-muted">${post.createTime?string["yyyy年MM月dd日"]!}</small>
                    </li>
                </#list>
            </@postTag>
        </ul>
    </div>
</#macro>