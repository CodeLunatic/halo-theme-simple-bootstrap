<#--链接页面OK-->
<#include "module/layout.ftl">
<@layout title="链接 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">

    <link rel="stylesheet" href="${static!}/source/css/links.css">

<#--这个列表初始化隐藏，用JS来做显示操作-->
    <#include "module/links/hide_list.ftl"/>

<#--主容器-->
    <div class="container px-md-2 px-3 pt-3 bg-white">
        <div id="linkBox" style="display: none;" class="row py-3">
            <#--左边的分类盒子-->
            <div id="left" class="col-md-3 mb-4">
                <#include "module/links/left.ftl">
            </div>
            <div id="right" class="col-md-9 mt-md-0 mt-3">
                <#include "module/links/right.ftl">
            </div>
        </div>
        <div id="emptyBox" style="display: none;">
            <div>
                <div class="d-flex flex-column align-items-center mt-2 pt-5">
                    <span class="text-muted"><i class="fas fa-inbox fa-7x"></i></span>
                    <span class="text-muted mt-4 mb-5">
                        还没有链接，回<a class="font-weight-bold" href="${context!}">主页</a>看看吧
                    </span>
                </div>
            </div>
        </div>
    </div>
</@layout>
<script src="${static!}/source/js/links.js"></script>