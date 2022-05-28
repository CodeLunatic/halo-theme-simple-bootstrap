<#--相册界面OK-->
<#include "module/layout.ftl">
<@layout title="个人相册 | ${blog_title!}">
    <link rel="stylesheet" href="${theme_base!}/source/css/photos.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/fancybox/dist/jquery.fancybox.min.css" integrity="sha256-Vzbj7sDDS/woiFS3uNKo8eIuni59rjyNGtXfstRzStA=" crossorigin="anonymous">
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
                        还没有卡片，回<a class="font-weight-bold" href="${blog_url!}">主页</a>看看吧
                    </span>
                </div>
            </div>
        </#if>
    </@photoTag>
</@layout>
<script src="${theme_base!}/source/libs/fancybox/dist/jquery.fancybox.min.js" integrity="sha256-yt2kYMy0w8AbtF89WXb2P1rfjcP/HTHLT7097U8Y5b8=" crossorigin="anonymous"></script>
<script src="${theme_base!}/source/js/photos.js"></script>