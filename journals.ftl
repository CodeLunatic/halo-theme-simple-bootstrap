<#--日志界面OK-->
<#include "module/layout.ftl">
<@layout
title="${user.nickname!}的日志 | ${options.blog_title!}"
keywords="${options.seo_keywords!}"
description="${options.seo_description!}">

<#--下方正文部分-->
    <div class="container-fluid" style="background: #f8fafc;">
        <div class="container px-md-2 px-0">
            <div class="row">
                <div id="left" class="journals col-md-8 p-0 pr-md-2" style="opacity: 0;">
                    <#include "module/journals/left.ftl"/>
                </div>
                <div id="right" class="col-md-4 bg-white pt-3 pb-5 text-muted mt-2 d-md-block d-none">
                    <#include "module/journals/right.ftl"/>
                </div>
            </div>
        </div>
    </div>
</@layout>