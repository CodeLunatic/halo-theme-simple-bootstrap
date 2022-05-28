<#--用来做HTML大概的框架，和一些重要的css和js文件的引入-->
<#macro layout title>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <#--防止用户缩放-->
        <meta name="viewport"
              content="width=device-width,
              initial-scale=1,
              minimum-scale=1.0,
              maximum-scale=1.0,
              user-scalable=no,
              shrink-to-fit=no">
        <meta name="keywords" content="${meta_keywords!}"/>
        <meta name="description" content="${meta_description!}"/>
        <meta name="site" content="${blog_url!}"/>

        <#--BootStrap CSS-->
        <link rel="stylesheet" href="${theme_base!}/source/libs/bootstrap/css/bootstrap.min.css">
        <#--Font Awesome 图标库-->
        <link rel="stylesheet" href="${theme_base!}/source/libs/fontawesome/css/all.min.css">
        <#--主页添加的CSS-->
        <#if is_index?? || is_search?? || is_category?? || is_tag?? || is_sheet??>
            <link rel="stylesheet" href="${theme_base!}/source/css/index.css">
            <style>
                /* 列表项中a标签划过样式 */
                .list-item a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 搜索高亮颜色 */
                .search-highlight {
                    color: ${settings.link_color!'#007bff'} !important;
                }

                /* 搜索高亮划过色 */
                a:hover .search-highlight {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }
            </style>
        </#if>
        <#--归档界面添加的CSS-->
        <#if is_archives?? || is_tags?? || is_categories??>
            <link rel="stylesheet" href="${theme_base!}/source/css/time-line.css">
            <style>
                /* 列表盒子中每一个a标签的划过样式 */
                ul.title-list li a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 导航盒子中的链接划过样式 */
                #navigationList a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }
            </style>
        </#if>
        <#if is_category??>
            <link rel="stylesheet" href="${theme_base!}/source/css/category.css">
        </#if>
        <#--文章界面需要引入的CSS-->
        <#if is_post??>
        <#--Github MarkDown的引入-->
            <link rel="stylesheet" href="${theme_base!}/source/css/github-markdown.css">
            <link rel="stylesheet" href="${theme_base!}/source/css/post.css">
            <link rel="stylesheet"
                  href="${theme_base!}/source/libs/fancybox/dist/jquery.fancybox.min.css">
            <link rel="stylesheet" href="${theme_base!}/source/libs/social-share.js/dist/css/share.min.css">
            <style>

                article pre code {
                    font-family: ${settings.code_font_family!'"SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace'} !important;
                }

                /* 目录链接划过样式 */
                #catalogs p a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 目录被激活的时候的样式 */
                .catalog-active {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 鼠标滑过复制按钮的时候的颜色 */
                .btn-clipboard:hover {
                    opacity: 1;
                    background: ${settings.link_color!'#007bff'} !important;
                }

                /* 文章中的标题标签划过的颜色 */
                #content article h1:hover, h2:hover, h3:hover, h4:hover, h5:hover, h6:hover {
                    cursor: pointer;
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 阅读进度的进度条颜色 */
                #readProgress .read-progress-bar {
                    background: ${settings.progress_color!'#dc3545'} !important;
                    height: 0.1875rem;
                }

                pre code.hljs {
                    padding: 0 !important;
                }
            </style>
        </#if>
        <#--日志界面的样式-->
        <#if is_journal?? || is_journals??>
            <link rel="stylesheet"
                  href="${theme_base!}/source/libs/fancybox/dist/jquery.fancybox.min.css">
            <link rel="stylesheet" href="${theme_base!}/source/css/journals.css">
            <style>
                /*用户的操作链接划过颜色*/
                .journals .journal-item .journal-operation a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }
            </style>
        </#if>
        <#if is_sheet??>
            <link rel="stylesheet" href="${theme_base!}/source/css/sheet.css">
            <link rel="stylesheet" href="${theme_base!}/source/libs/social-share.js/dist/css/share.min.css">
        </#if>
        <#--页面公用的CSS-->
        <link rel="stylesheet" href="${theme_base!}/source/css/style.css">

        <style>
            /* 定义滚动条滑块颜色 */
            ::-webkit-scrollbar-thumb {
                background-color: ${settings.scrollbar_background_color!'#6c757d'} !important;
            }

            /* 全局a标签的颜色 */
            a {
                color: ${settings.link_color!'#007bff'};
                text-decoration: none !important;
            }

            /* 全局a标签划过的样式 */
            a:hover {
                color: ${settings.hover_color!'#dc3545'};
                text-decoration: none !important;
            }

            /* 面包屑里面的链接划过的样式 */
            .breadcrumb a:hover {
                color: ${settings.hover_color!'#dc3545'} !important;
                text-decoration: none !important;
            }

            /* 页面footer的链接划过样式 */
            footer .link-info a:hover {
                color: ${settings.hover_color!'#dc3545'} !important;
            }
        </style>

        <#--公共 head 代码，包含：Favicon，站点验证代码-->
        <@global.head />

        <title>${title}</title>

    </head>
    <body>
    <#--  导航栏  -->
    <#include "navbar.ftl">

    <#--主要内容-->
    <#nested>

    <!-- 公共BootStrap支持使用的JavaScript -->
    <script src="${theme_base!}/source/libs/jquery/jquery.min.js"></script>
    <script src="${theme_base!}/source/libs/popper/popper.min.js"></script>
    <script src="${theme_base!}/source/libs/bootstrap/js/bootstrap.min.js"></script>

    <#-- 公共底部代码，包含：统计代码，底部信息 -->
    <#include "footer.ftl">

    <#--全局的JavaScript脚本-->
    <script type="text/javascript" src="${theme_base!}/source/js/index.js"></script>
    <script type="text/javascript" src="${theme_base!}/source/js/navbar.js"></script>
    <#if is_archives?? || is_tags?? || is_categories??>
        <script type="text/javascript" src="${theme_base!}/source/js/navigation.js"></script>
    </#if>
    <#if is_search??>
        <script type="text/javascript" src="${theme_base!}/source/js/search.js"></script>
    </#if>
    <#-- 额外配置功能-->
    <#if is_post?? || is_sheet??>
        <script>
            var displayReadProgress = <#if (settings.open_read_progress)??>${settings.open_read_progress?c}<#else>true</#if>;
            var displayLineNumber = <#if (settings.line_number)??>${settings.line_number?c}<#else>true</#if>;
            var enableCodeCopy = <#if (settings.code_copy)??>${settings.code_copy?c}<#else>true</#if>;
            var displayCodeType = <#if (settings.code_type)??>${settings.code_type?c}<#else>true</#if>;
            var displayMobileCatalog = <#if (settings.mobile_catalog)??>${settings.mobile_catalog?c}<#else>true</#if>;
            var linkOnBlackPage = <#if (settings.link_on_blank_page)??>${settings.link_on_blank_page?c}<#else>true</#if>;
            var enableShare = <#if (settings.open_share)??>${settings.open_share?c}<#else>true</#if>;
            var twitterAccountShare = `${settings.twitter_account_share!}`;
            var postTitle = `${post.title!}`;
            var blogTitle = `${blog_title!}`;
            var blogUrl = `${blog_url!}`;
        </script>
        <script>
            // 为了提速，写在这里
            // pre默认背景色，
            $("article pre").addClass("hljs");
            // 表格响应式
            $("table").wrap(`<div class="table-responsive"></div>`);
        </script>
        <script src="${theme_base!}/source/libs/social-share.js/dist/js/social-share.min.js"></script>
    </#if>
    <#if is_post?? || is_sheet??>
        <script src="${theme_base!}/source/libs/clipboard/clipboard.min.js"></script>
        <script src="${theme_base!}/source/libs/fancybox/dist/jquery.fancybox.min.js"></script>
        <script type="text/javascript" src="${theme_base!}/source/js/post.js"></script>

        <link href="${theme_base!}/source/libs/highlight.js/styles/${settings.highlight_style!'default.min.css'}"
              rel="stylesheet">
        <script src="${theme_base!}/source/libs/highlight.js/highlight.min.js"></script>

        <script>
            (async function () {
                const extraLanguages = "${settings.highlight_extra_languages!''}".split(",").filter(x => x);

                for (let i = 0; i < extraLanguages.length; i++) {
                    const lang = extraLanguages[i];
                    if (lang) {
                        await loadScript("${theme_base!}/source/libs/highlight.js/languages/" + lang + ".min.js");
                    }
                }

                console.log("Extra languages: ", extraLanguages);

                document.querySelectorAll('pre code').forEach((el) => {
                    hljs.highlightElement(el);
                });
                console.log("Loaded languages: ", hljs.listLanguages())
            })()

            function loadScript(url) {
                return new Promise(function (resolve, reject) {
                    const script = document.createElement('script');
                    script.type = "text/javascript";
                    script.src = url;
                    script.onload = resolve;
                    script.onerror = reject;
                    document.head.appendChild(script);
                });
            }

        </script>
    </#if>
    <#if is_journal?? || is_journals??>
        <script src="${theme_base!}/source/libs/fancybox/dist/jquery.fancybox.min.js"></script>
        <script type="text/javascript" src="${theme_base!}/source/js/journals.js"></script>
    </#if>
    <#if is_sheet??>
        <script type="text/javascript" src="${theme_base!}/source/js/sheet.js"></script>
    </#if>
    <div id="backTop" class="back-top">
        <span><i class="fas fa-caret-up"></i></span>
    </div>
    </body>
    </html>
</#macro>