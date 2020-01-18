<#--照片界面的一项OK-->
<#macro photoItem photo>
    <#if (photo.thumbnail)?? && photo.thumbnail != ''>
    <#--一个图片项-->
        <div class="picture-item my-2 bg-white rounded-bottom">
            <a href="${photo.url!}" data-fancybox="images" data-caption="${photo.description!}">
                <#--图片详情-->
                <div class="picture-details">
                    <#--图片-->
                    <img class="picture rounded-top" src="${photo.thumbnail!}" alt="${photo.name!}" loading="lazy">
                    <#--图片描述-->
                    <#if (photo.description)?? && photo.description != ''>
                        <div class="picture-description rounded-top">
                            ${photo.description!}
                        </div>
                    </#if>
                </div>
            </a>
            <#--图片信息-->
            <div class="p-3 picture-bottom">
                <#--图片标题-->
                <b class="picture-title">${photo.name!}</b>
                <#--图片信息-->
                <div class="picture-info mt-2 text-muted">
                    <span>${photo.takeTime?string["yyyy年MM月dd日"]!}</span>
                    <span>${photo.location!}</span>
                </div>
                <#--图片分组-->
                <#if (photo.team)?? && photo.team != ''>
                    <div class="team mt-2">
                        <span class="picture-team px-2 d-inline-block text-muted border border-secondary rounded-pill">
                            ${photo.team!}
                        </span>
                    </div>
                </#if>
                <#--喜欢功能-->
                <div class="like mt-3">
                    <div class="picture-like text-muted d-inline" data-toggle="tooltip" data-placement="bottom"
                         title="喜欢功能暂不可用">
                        <i class="far fa-heart mr-2"></i> 0.00K
                    </div>
                </div>
            </div>
        </div>
    </#if>
</#macro>