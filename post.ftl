<#--全文展示界面 ok-->
<#include "module/layout.ftl">
<@layout title="${post.title!} | ${blog_title!}">

<#--阅读进度-->
    <#if (settings.open_read_progress)?? && settings.open_read_progress?c == 'true'>
        <div id="readProgress">
            <div class="read-progress-bar" role="progressbar" style="width: 0"></div>
        </div>
    </#if>

<#-- 主容器 -->
    <div class="container px-lg-2 pb-3 bg-white">
        <#-- 面包屑 -->
        <#include "module/post/breadcrumb.ftl">

        <div class="row">
            <#--左侧-->
            <div id="left" class="col-lg-8 pr-xl-5 px-lg-3 px-4">
                <#include "module/post/left.ftl">
            </div>
            <#-- 右侧 -->
            <div id="right" class="col-lg-4">
                <#include "module/post/right.ftl">
            </div>
        </div>
    </div>

<#--手机目录按钮-->
    <#if (settings.mobile_catalog)?? && settings.mobile_catalog?c == 'true'>
        <div id="catalogButton" class="d-lg-none d-none">
            <span><i class="fas fa-bars"></i></span>
        </div>
    <#--手机上文章目录后面的蒙版-->
        <div id="catalogOverBox" class="d-lg-none"></div>
    </#if>

</@layout>