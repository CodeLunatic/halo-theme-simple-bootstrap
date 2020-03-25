<#--归档界面ok-->
<#--界面，间距，颜色，功能，逻辑-->
<#include "module/layout.ftl">
<@layout title="归档 | ${blog_title!}">
    <section id="archives" class="container px-lg-2 pt-3 pb-5 bg-white">
        <div class="row">
            <div id="left" class="col-lg-8 pr-lg-5 pl-lg-4 mt-lg-4">
                <#include "module/archives/left.ftl">
            </div>
            <div id="right" class="col-lg-4">
                <#include "module/archives/right.ftl">
            </div>
        </div>
    </section>
</@layout>
