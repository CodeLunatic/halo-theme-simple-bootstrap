<#--分类列表界面OK-->
<#include "module/layout.ftl">
<@layout title="分类列表 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <section id="archives" class="container px-lg-2 pt-3 pb-5 bg-white">
        <div class="row">
            <div id="left" class="col-lg-8 pr-lg-5 pl-lg-4 mt-lg-4">
                <#include "module/categrories/left.ftl">
            </div>
            <div id="right" class="col-lg-4">
                <#include "module/categrories/right.ftl">
            </div>
        </div>
    </section>
</@layout>
