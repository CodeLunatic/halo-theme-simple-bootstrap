<#--评论功能OK-->
<#macro comment target,type>
    <#if !post.disallowComment!false>
        <script src="${theme_base!}/source/libs/vue/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'https://unpkg.com/halo-comment@latest/dist/halo-comment.min.js'}"></script>
        <halo-comment id="${target.id?c}" type="${type}"/>
    </#if>
</#macro>
