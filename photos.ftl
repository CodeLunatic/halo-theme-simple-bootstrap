<#--相册界面OK-->
<#include "module/layout.ftl">
<@layout title="个人相册 | ${options.blog_title!}"
keywords="${options.seo_keywords!}"
description="${options.seo_description!}">
    <link rel="stylesheet" href="${static!}/source/css/photos.css">
    <link href="https://cdn.bootcss.com/fancybox/3.5.7/jquery.fancybox.min.css" rel="stylesheet">
<#--所有的图片先加载到这个位置，但是这个位置默认隐藏的-->
    <#include "module/photos/photo_item.ftl"/>
    <@photoTag method="list">
        <div id="pictures">
            <#list photos as photo>
                <@photoItem photo=photo/>
            </#list>
        </div>
        <#if photos?? && photos?size !=0>
            <#include "module/photos/photos.ftl"/>
        <#else>
            <div class="bg-white">
                <div class="d-flex flex-column align-items-center mt-2 pt-5">
                    <span class="text-muted"><i class="fas fa-inbox fa-7x"></i></span>
                    <span class="text-muted mt-4 mb-5">
                        还没有卡片，回<a class="font-weight-bold" href="${context!}">主页</a>看看吧
                    </span>
                </div>
            </div>
        </#if>
    </@photoTag>
</@layout>
<script src="https://cdn.bootcss.com/fancybox/3.5.7/jquery.fancybox.min.js"></script>
<script src="${static!}/source/js/photos.js"></script>