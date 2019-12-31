<#--用来做HTML大概的框架，和一些重要的css和js文件的引入-->
<#macro layout title,keywords,description>
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
        <#if is_post??>
            <meta name="keywords"
                  content="<#if (post.tags)??><#list post.tags as tag>${tag.name}<#sep>,</#list></#if>"/>
        <#else>
            <meta name="keywords" content="${keywords!}"/>
        </#if>
        <meta name="description" content="${description!}"/>
        <meta name="site" content="${context!}"/>

        <#--BootStrap CSS-->
        <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <#--Font Awesome 图标库-->
        <link href="https://cdn.bootcss.com/font-awesome/5.11.2/css/all.css" rel="stylesheet">
        <#--主页添加的CSS-->
        <#if is_index?? || is_search?? || is_category?? || is_tag?? || is_sheet??>
            <link rel="stylesheet" href="${static!}/source/css/index.css">
            <style>
                /* 列表项中a标签划过样式 */
                .list-item a:hover {
                    color: ${settings.hover_color?default('#dc3545')} !important;
                }

                /* 搜索高亮颜色 */
                .search-highlight {
                    color: ${settings.link_color?default('#007bff')} !important;
                }

                /* 搜索高亮划过色 */
                a:hover .search-highlight {
                    color: ${settings.hover_color?default('#dc3545')} !important;
                }
            </style>
        </#if>
        <#--归档界面添加的CSS-->
        <#if is_archives?? || is_tags?? || is_categories??>
            <link rel="stylesheet" href="${static!}/source/css/time-line.css">
            <style>
                /* 列表盒子中每一个a标签的划过样式 */
                ul.title-list li a:hover {
                    color: ${settings.hover_color?default('#dc3545')} !important;
                }

                /* 导航盒子中的链接划过样式 */
                #navigationList a:hover {
                    color: ${settings.hover_color?default('#dc3545')} !important;
                }
            </style>
        </#if>
        <#if is_category??>
            <link rel="stylesheet" href="${static!}/source/css/category.css">
        </#if>
        <#--文章界面需要引入的CSS-->
        <#if is_post??>
        <#--Github MarkDown的引入-->
            <link rel="stylesheet" href="${static!}/source/css/github-markdown.css">
            <link rel="stylesheet" href="${static!}/source/css/post.css">
        <#--代码高亮用到的CSS-->
            <link href="${settings.code_css_url?default('https://cdn.bootcss.com/highlight.js/9.15.10/styles/github.min.css')}"
                  rel="stylesheet">
            <link href="https://cdn.bootcss.com/fancybox/3.5.7/jquery.fancybox.min.css" rel="stylesheet">
            <link href="https://cdn.bootcss.com/social-share.js/1.0.16/css/share.min.css" rel="stylesheet">
            <style>

                article pre code {
                    font-family: ${settings.code_font_family?default('"SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace')} !important;
                }

                /* 目录链接划过样式 */
                #catalogs p a:hover {
                    color: ${settings.hover_color?default('#dc3545')} !important;
                }

                /* 目录被激活的时候的样式 */
                .catalog-active {
                    color: ${settings.hover_color?default('#dc3545')} !important;
                }

                /* 鼠标滑过复制按钮的时候的颜色 */
                .btn-clipboard:hover {
                    opacity: 1;
                    background: ${settings.link_color?default('#007bff')} !important;
                }

                /* 文章中的标题标签划过的颜色 */
                #content article h1:hover, h2:hover, h3:hover, h4:hover, h5:hover, h6:hover {
                    cursor: pointer;
                    color: ${settings.hover_color?default('#dc3545')} !important;
                }

                /* 阅读进度的进度条颜色 */
                #readProgress .read-progress-bar {
                    background: ${settings.progress_color?default('#dc3545')} !important;
                    height: 0.1875rem;
                }
            </style>
        </#if>
        <#--日志界面的样式-->
        <#if is_journal??>
            <link href="https://cdn.bootcss.com/fancybox/3.5.7/jquery.fancybox.min.css" rel="stylesheet">
            <link rel="stylesheet" href="${static!}/source/css/journals.css">
            <style>
                /*用户的操作链接划过颜色*/
                .journals .journal-item .journal-operation a:hover {
                    color: ${settings.hover_color?default('#dc3545')} !important;
                }
            </style>
        </#if>
        <#if is_sheet??>
            <link rel="stylesheet" href="${static!}/source/css/sheet.css">
            <link href="https://cdn.bootcss.com/social-share.js/1.0.16/css/share.min.css" rel="stylesheet">
        </#if>
        <#--页面公用的CSS-->
        <link rel="stylesheet" href="${static!}/source/css/style.css">

        <style>
            /* 定义滚动条滑块颜色 */
            ::-webkit-scrollbar-thumb {
                background-color: ${settings.scrollbar_background_color?default('#6c757d')} !important;
            }

            /* 全局a标签的颜色 */
            a {
                color: ${settings.link_color?default('#007bff')};
                text-decoration: none !important;
            }

            /* 全局a标签划过的样式 */
            a:hover {
                color: ${settings.hover_color?default('#dc3545')};
                text-decoration: none !important;
            }

            /* 面包屑里面的链接划过的样式 */
            .breadcrumb a:hover {
                color: ${settings.hover_color?default('#dc3545')} !important;
                text-decoration: none !important;
            }

            /* 页面footer的链接划过样式 */
            footer .link-info a:hover {
                color: ${settings.hover_color?default('#dc3545')} !important;
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
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <#-- 公共底部代码，包含：统计代码，底部信息 -->
    <#include "footer.ftl">

    <#--全局的JavaScript脚本-->
    <script type="text/javascript" src="${static!}/source/js/index.js"></script>
    <script type="text/javascript" src="${static!}/source/js/navbar.js"></script>
    <#if is_archives?? || is_tags?? || is_categories??>
        <script type="text/javascript" src="${static!}/source/js/navigation.js"></script>
    </#if>
    <#if is_search??>
        <script type="text/javascript" src="${static!}/source/js/search.js"></script>
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
            var blogTitle = `${options.blog_title!}`;
            var blogUrl = `${context!}`;
        </script>
        <script>
            // 为了提速，写在这里
            // pre默认背景色，
            $("article pre").addClass("hljs");
            // 表格响应式
            $("table").wrap(`<div class="table-responsive"></div>`);
        </script>
        <script src="https://cdn.bootcss.com/social-share.js/1.0.16/js/social-share.min.js"></script>
    </#if>
    <#if is_post??>
        <script src="https://cdn.bootcss.com/clipboard.js/2.0.4/clipboard.min.js"></script>
        <script src="https://cdn.bootcss.com/fancybox/3.5.7/jquery.fancybox.min.js"></script>
        <script type="text/javascript" src="${static!}/source/js/post.js"></script>
    <#--代码高亮库-->
    <#--官方库的语言种类目前有185种
    1c、abnf、accesslog、actionscript、ada、angelscript、apache、applescript、arcade、arduino、armasm、
    asciidoc、aspectj、autohotkey、autoit、avrasm、awk、axapta、bash、basic、bnf、brainfuck、cal、capnproto、
    ceylon、clean、clojure-repl、clojure、cmake、coffeescript、coq、cos、cpp、crmsh、crystal、cs、csp、css、
    d、dart、delphi、diff、django、dns、dockerfile、dos、dsconfig、dts、dust、ebnf、elixir、elm、erb、erlang-repl、
    erlang、excel、fix、flix、fortran、fsharp、gams、gauss、gcode、gherkin、glsl、gml、go、golo、gradle、groovy、
    haml、handlebars、haskell、haxe、hsp、htmlbars、http、hy、inform7、ini、irpf90、isbl、java、javascript、
    jboss-cli、json、julia-repl、julia、kotlin、lasso、ldif、leaf、less、lisp、livecodeserver、livescript、
    llvm、lsl、lua、makefile、markdown、mathematica、matlab、maxima、mel、mercury、mipsasm、mizar、mojolicious、
    monkey、moonscript、n1ql、nginx、nimrod、nix、nsis、objectivec、ocaml、openscad、oxygene、parser3、perl、pf、
    pgsql、php、plaintext、pony、powershell、processing、profile、prolog、properties、protobuf、puppet、purebasic、
    python、q、qml、r、reasonml、rib、roboconf、routeros、rsl、ruby、ruleslanguage、rust、sas、scala、scheme、scilab、
    scss、shell、smali、smalltalk、sml、sqf、sql、stan、stata、step21、stylus、subunit、swift、taggerscript、tap、
    tcl、tex、thrift、tp、twig、typescript、vala、vbnet、vbscript-html、vbscript、verilog、vhdl、vim、x86asm、xl、
    xml、xquery、yaml、zephir
    -->
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/highlight.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/accesslog.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/actionscript.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/apache.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/aspectj.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/awk.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/bash.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/basic.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/coffeescript.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/cpp.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/css.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/dart.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/delphi.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/django.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/dns.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/dockerfile.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/dos.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/erlang-repl.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/erlang.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/go.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/gradle.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/groovy.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/http.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/ini.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/java.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/javascript.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/json.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/kotlin.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/less.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/lua.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/markdown.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/nginx.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/objectivec.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/perl.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/php.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/plaintext.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/powershell.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/properties.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/python.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/ruby.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/scala.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/scheme.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/scss.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/shell.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/smali.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/sql.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/swift.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/typescript.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/vbscript.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/vim.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/xml.min.js"></script>
        <script src="https://cdn.bootcss.com/highlight.js/9.15.10/languages/yaml.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
    </#if>
    <#if is_journal??>
        <script src="https://cdn.bootcss.com/fancybox/3.5.7/jquery.fancybox.min.js"></script>
        <script type="text/javascript" src="${static!}/source/js/journals.js"></script>
    </#if>
    <#if is_sheet??>
        <script type="text/javascript" src="${static!}/source/js/sheet.js"></script>
    </#if>
    <div id="backTop" class="back-top">
        <span><i class="fas fa-caret-up"></i></span>
    </div>
    </body>
    </html>
</#macro>