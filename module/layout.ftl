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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y=" crossorigin="anonymous">
        <#--Font Awesome 图标库-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous">
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
        <#--代码高亮用到的CSS-->
            <link href="${settings.code_css_url!'https://cdn.staticfile.org/highlight.js/9.18.1/styles/github.min.css'}"
                  rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" integrity="sha256-Vzbj7sDDS/woiFS3uNKo8eIuni59rjyNGtXfstRzStA=" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/css/share.min.css" integrity="sha256-0EDwznjUTDEicOuZhOL03fpflUqzhkByvhwol8YGkp4=" crossorigin="anonymous">
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
            </style>
        </#if>
        <#--日志界面的样式-->
        <#if is_journal?? || is_journals??>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" integrity="sha256-Vzbj7sDDS/woiFS3uNKo8eIuni59rjyNGtXfstRzStA=" crossorigin="anonymous">
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
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/css/share.min.css" integrity="sha256-0EDwznjUTDEicOuZhOL03fpflUqzhkByvhwol8YGkp4=" crossorigin="anonymous">
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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha256-/ijcOLwFf26xEYAjW75FizKVo5tnTYiQddPZoLUHHZ8=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha256-WqU1JavFxSAMcLP2WIOI+GB2zWmShMI82mTpLDcqFUg=" crossorigin="anonymous"></script>

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
        <script src="https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/js/social-share.min.js" integrity="sha256-fGPu+icKh985TLPhO2v68U7i0CW0dE4kiR06RN4O6jo=" crossorigin="anonymous"></script>
    </#if>
    <#if is_post??>
        <script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.4/dist/clipboard.min.js" integrity="sha256-FiZwavyI2V6+EXO1U+xzLG3IKldpiTFf3153ea9zikQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js" integrity="sha256-yt2kYMy0w8AbtF89WXb2P1rfjcP/HTHLT7097U8Y5b8=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="${theme_base!}/source/js/post.js"></script>
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
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/highlight.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/accesslog.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/actionscript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/apache.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/aspectj.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/awk.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/bash.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/basic.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/coffeescript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/cpp.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/css.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/dart.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/delphi.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/django.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/dns.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/dockerfile.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/dos.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/erlang-repl.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/erlang.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/go.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/gradle.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/groovy.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/http.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/ini.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/java.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/javascript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/json.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/kotlin.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/less.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/lua.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/markdown.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/nginx.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/objectivec.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/perl.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/php.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/plaintext.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/powershell.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/properties.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/python.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/ruby.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/scala.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/scheme.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/scss.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/shell.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/smali.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/sql.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/swift.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/typescript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/vbscript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/vim.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/xml.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/yaml.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
    </#if>
    <#if is_journal?? || is_journals??>
        <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js" integrity="sha256-yt2kYMy0w8AbtF89WXb2P1rfjcP/HTHLT7097U8Y5b8=" crossorigin="anonymous"></script>
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