<#--文章界面的评论部分ok-->
<section id="comment" class="mb-5">
    <#if !post.disallowComment>
        <div>
            <#include "../comment.ftl">
            <@comment target=post type="post" />
        </div>
    </#if>
</section>