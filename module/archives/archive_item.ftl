<#--一个存档列表项ok-->
<#macro archiveItem archive>
<#--对话框-->
    <div class="title-list-item">
        <div class="d-flex mb-3">
            <i class="user-avatar rounded-circle"
               style="display: block;
                       width: 2.5rem; height: 2.5rem;
                       background-image: url('${user.avatar!}');
                       background-size: cover;"></i>
            <div class="dialogue-box rounded">
                <h3 id="${archive.year?c}年${archive.month?c}月" class="section-title">
                    <span>${archive.year?c}年${archive.month?c}月</span> 归档
                </h3>
            </div>
        </div>
        <#--列表项-->
        <ul class="title-list">
            <#list archive.posts?sort_by("createTime")?reverse as post>
                <li class="d-flex flex-sm-row flex-column justify-content-between pr-3">
                    <a href="${post.fullPath!}">${post.title!}</a>
                    <small class="text-muted">${post.createTime?string["yyyy年MM月dd日"]!}</small>
                </li>
            </#list>
        </ul>
    </div>
</#macro>