<#--链接页面OK-->
<#include "module/layout.ftl">
<@layout title="链接 | ${blog_title!}">

    <link rel="stylesheet" href="${theme_base!}/source/css/links.css">
    <style>
        /* 链接分类、链接鼠标划过字体颜色 */
        #linkCategory .category-button:hover, .link-grid .link:hover {
            color: ${settings.hover_color!'#dc3545'} !important;
        }

        /* 链接分类被激活的时候 */
        .category-active {
            color: ${settings.hover_color!'#dc3545'} !important;
        }
    </style>

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
                        还没有链接，回<a class="font-weight-bold" href="${blog_url!}">主页</a>看看吧
                    </span>
                </div>
            </div>
        </div>
    </div>
</@layout>
<script src="${theme_base!}/source/js/links.js"></script>