<#--自定义界面OK-->
<#include "module/layout.ftl">
<@layout title="${sheet.title!} | ${options.blog_title!}"
keywords="${options.seo_keywords!}"
description="${options.seo_description!}">

    <div class="container px-lg-2 py-3 bg-white">

        <div class="row">
            <#--左侧-->
            <div id="left" class="col-lg-8 pr-xl-5 px-lg-3 px-4 pt-4">
                <#include "module/sheet/left.ftl">
            </div>
            <#-- 右侧 -->
            <div id="right" class="col-lg-4">
                <#include "module/index/right.ftl">
            </div>
        </div>
    </div>
</@layout>
