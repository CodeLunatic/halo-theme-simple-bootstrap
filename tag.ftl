<#--标签界面ok-->
<#--界面，间距，颜色，功能，逻辑-->
<#include "module/layout.ftl">
<@layout title="${tag.name!} | ${options.blog_title!}"
keywords="${options.seo_keywords!}"
description="${options.seo_description!}">
    <div class="container px-lg-2 pb-3 bg-white">
        <#--左右两列盒子-->
        <div class="row mb-3">
            <#--左边盒子-->
            <div id="left" class="col-xl-8 pr-xl-5 pt-3">
                <#include "module/tag/left.ftl">
            </div>
            <#--右边的信息-->
            <div id="right" class="col-xl-4 pt-3">
                <#include "module/index/right.ftl">
            </div>
        </div>
    </div>
    <span id="keyword" class="d-none">${keyword!}</span>
</@layout>