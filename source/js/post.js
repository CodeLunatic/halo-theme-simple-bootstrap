/**
 * 文章界面的所有操作
 *  |-阅读进度（阅读进度条，目录高亮）
 *  |-代码前面加入行号
 *  |-生成目录
 *  |-初始化图片点击效果并在图片下面添加上解释说明
 *  |-在代码的右上角显示代码的格式
 *  |-剪切板功能
 *  |-手机端目录
 *  |-链接新窗口打开
 *  |-启用分享插件
 *  Status: OK
 */
$(function () {

    /**
     * 阅读进度（阅读进度条和目录高亮功能）
     */
    function readProgress() {

        // 文章内容
        let $content = $("#content");
        // 阅读进度条
        let $readProgressBar = $("#readProgress .read-progress-bar");
        // 文章标题
        let articleTitles = $("article h1[id],h2[id],h3[id],h4[id],h5[id],h6[id]");
        // 正在阅读的标题下标
        let readTitleIndex = 0;
        // 上次正在阅读的标题下标
        let lastReadTitleIndex = -1;
        /**
         * 目录的进度（高亮）
         */
        let changeCatalogProgress = () => {
            // 获取每个标题距离最上面的尺寸
            let articleTitleOffsetTops = articleTitles.map(function () {
                return $(this).offset().top;
            }).get();
            // 获取当前位置距离最上面的尺寸 （+24）目的是去除偏差
            let currentPageYOffset = window.pageYOffset + 24;
            // 当前正在阅读的标题的下标（以0开始）
            readTitleIndex = articleTitleOffsetTops.findIndex((value, index, arr) => {
                return (value <= currentPageYOffset && currentPageYOffset <= arr[index + 1]) ||
                    (index === arr.length - 1 && currentPageYOffset >= arr[arr.length - 1]) ||
                    (index === 0 && currentPageYOffset <= arr[0]);
            });
            // 如果上次阅读标题下标和本次阅读标题下标相等，或者标题的下标小于0跳过
            if (readTitleIndex === lastReadTitleIndex || readTitleIndex < 0) return;
            // 处理高亮样式
            $("#catalogs .catalog-item").each(function (index) {
                // 取到所有的目录中的a标签
                let link = $(this).find('a');
                if (index === readTitleIndex) {
                    // 当然激活目录元素相对于父元素（目录盒子.card-body）顶部的偏移量
                    let positionTop = $(this).position().top - $("#catalogBox .card-header").outerHeight();
                    // 目录盒子
                    let $catalogs = $("#catalogs");
                    // 目录盒子的高度
                    let catalogsContainerHeight = $catalogs.outerHeight();
                    // 如果被激活的目录已经不在盒子（在盒子外面隐藏了）中做如下操作
                    positionTop <= 0 && $catalogs.animate({ // 向上滚动滚动条
                        scrollTop: $catalogs.scrollTop() - catalogsContainerHeight
                    }, 300);
                    positionTop >= catalogsContainerHeight && $catalogs.animate({ // 向下滚动滚动条
                        scrollTop: $catalogs.scrollTop() + catalogsContainerHeight
                    }, 300);
                    link.addClass("catalog-active");
                    return;
                }
                link.removeClass("catalog-active");
            });
            lastReadTitleIndex = readTitleIndex;
        };

        /**
         * 改变阅读进度条
         */
        let changeReadProgress = () => {
            // contentHeight 实际总阅读高度 = 内容的高度 - 窗口的可视高度
            let contentHeight = $content.height() - window.innerHeight;
            if (contentHeight <= 0) return;
            // readHeight 已经阅读的高度 = 当前页面的垂直偏移量 - 内容元素上边的多余部分
            let readHeight = window.pageYOffset - $content.offset().top;
            // 进度条的宽度
            $readProgressBar.width(`${readHeight / contentHeight * 100}%`);
        };

        // 改变阅读进度条
        displayReadProgress && changeReadProgress();
        // 目录的进度（高亮）
        changeCatalogProgress();

        $(window).on('scroll', function () {
            // 改变阅读进度条
            displayReadProgress && changeReadProgress();
            // 目录的进度（高亮）
            changeCatalogProgress();
        });
    }

    /**
     * 代码前面加入行号 Todo 效率有点低
     */
    let addLineNumber = (codeSelector) => {
        $(codeSelector).each(function () {
            let lis = $(this).html().trimRight().split("\n")
                .map((value, index, array) => {
                    let lineDigit = String(array.length).length;
                    if (lineDigit === 1) lineDigit = 2;
                    // 修复复制时没有空行的问题
                    return `<li class="line-number" data-line-number="${String(index + 1).padStart(lineDigit, 0)}">${(value && value.trim()) ? value : '<br>'}</li>`
                }).join('');
            $(this).html(`<ol>${lis}</ol>`);
        });
    };

    /**
     * 改变URL中的锚点
     * @param anchorId 锚点ID
     */
    let changeUrlAnchor = (anchorId) => {
        let location = window.location;
        let origin = location.origin;
        let pathname = location.pathname;
        let baseUrl = origin + pathname;
        window.history.replaceState(null, null, baseUrl + anchorId);
    };

    /**
     * 添加锚点
     * @param where 添加到哪里
     */
    let addAnchorPoint = (where) => {
        // 获取所有的标题
        let titles = $(`${where} h1[id],h2[id],h3[id],h4[id],h5[id],h6[id]`);
        titles.each(function () {
            // 要添加到界面上的a标签
            let a = $(`<a id="user-content-${$(this).attr('id')}" class="anchor" aria-hidden="true" href="#${$(this).attr('id')}"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>`);
            // 在Title上添加a标签
            $(this).prepend(a);
            // 为a标签添加点击事件
            a.on('click', function (event) {
                let titleId = $(this).attr("href");
                changeUrlAnchor(titleId);
                let offsetTop = $(titleId).offset().top - 20;
                $("html,body").animate({scrollTop: offsetTop}, 300);
                event.preventDefault(); // 阻止默认事件
            });
        });
        // 为每个title绑定点击事件
        titles.on('click', function (event) {
            changeUrlAnchor(`#${$(this).attr("id")}`);
            let offsetTop = $(this).offset().top - 20;
            $("html,body").animate({scrollTop: offsetTop}, 300);
            event.preventDefault();
        });
    };

    /**
     * 生成文章的目录
     * @param from 从哪里寻找目录
     * @param to 添加目录到哪里
     * @param marginSpace 不同等级的标题错开多少距离
     * @param success 成功后调用的方法
     */
    let generateCatalogs = (from, to, marginSpace, success) => {
        // 获取所有的标题
        let titles = $(`${from} h1[id],h2[id],h3[id],h4[id],h5[id],h6[id]`);
        // 得到标题数字的最小数字，用来计算每个标题的margin-left间距，例如["h2", "h3"]则返回2
        let minTitleNumber = Math.min.apply(null, [...new Set(titles.get().map(value => value.tagName[1]))]);
        // 如果没有title的话返回0
        minTitleNumber = minTitleNumber === Infinity ? 0 : minTitleNumber;
        // 创建一个目录盒子
        let catalogs = $("<div class='pl-4 pt-4 pb-2 text-truncate'></div>");
        minTitleNumber && (() => {
            // 开始生成目录
            titles.each(function () {
                // 得到标题等级，用来做margin-left处理
                let titleLevel = parseInt($(this).prop("tagName")[1]) - minTitleNumber;
                catalogs.append(
                    `<p class='catalog-item'>
                        <a href="javascript:void(0)" style="margin-left: ${titleLevel * marginSpace}rem;" data-catalog-target="${$(this).attr('id')}">${$(this).text()}</a>
                    </p>`
                );
            });
            // 添加目录到目标盒子中
            $(to).append(catalogs);
            // 为目录中每个链接添加一个点击事件
            $(`${to} a[data-catalog-target]`).on('click', function (event) {
                let titleId = `#${$(this).attr("data-catalog-target")}`;
                changeUrlAnchor(titleId);
                let offsetTop = $(titleId).offset().top - 20;
                $("html,body").animate({scrollTop: offsetTop}, 300);
                event.preventDefault();
            });
            // 调用用户自定义的成功添加目录后的方法
            success();
        })();
    };

    /**
     * 初始化图片点击效果并在图片下面添加上解释说明，需要配合fancybox.js使用
     */
    let zoomImages = (imageSelector) => {
        $(imageSelector).each(function () {
            $(this).wrap( // 为图片包裹一个链接，使得fancybox.js可以使用
                `<a href="${$(this).prop('src')}" data-fancybox="images" data-caption="${$(this).prop("alt")}"></a>`
            ).after( // 在图片下面添加一个解释说明
                () => {
                    return $(this).prop("alt").trim() !== "" ? `<p class='text-center text-muted pt-3'>${$(this).prop("alt")}</p>` : ``;
                }
            );
        });
        // 为fancybox.js做配置
        $("[data-fancybox='images']").fancybox({
            buttons: ['zoom', 'download', 'close', 'thumbs']
        });
    };

    /**
     * 在代码的右上角显示代码的格式，方法需要配合CSS的支持
     */
    let displayCodeFormat = (codeSelector) => {
        $(codeSelector).each(function () {
            let languages = $(this).attr("class").split(' ').filter((value) => value && value.trim() && value.startsWith("language"));
            let language = languages.length && languages[0].substring(9) || '';
            language = language && `${language[0].toUpperCase()}${language.slice(1)}`;
            $(this).parent().wrap(
                `<div class='code-format' data-code-format="${language}"></div>`
            );
        });
    };

    /**
     * 剪切板功能
     */
    let clipBoardSupport = () => {
        $("pre").each(function (index) {
            // 在当前pre中加入id
            $(this).attr("id", `codeBlock${index}`);
            // 如果用户关闭了code-format功能，需要这一步
            ($(this).parent().attr("class") || "").includes("code-format") || $(this).wrap($("<div class='code-format'></div>"));
            // 复制按钮
            let clipButton = $(`<button type='button' class='btn-clipboard' data-toggle="tooltip" data-placement="top" title="复制代码" data-clipboard-target='#codeBlock${index}'>
                    <i class="fas fa-clipboard"></i>
                </button>`
            );
            // 添加复制按钮到页面上
            $(this).parent(".code-format").append(clipButton);
            // 复位tooltip
            let hideClipButtonToolTip = () => {
                clipButton.tooltip('hide');
                clipButton.attr("data-original-title", "复制代码");
            };
            // 在每个pre上添加鼠标放上后的操作
            $(this).hover(function () {
                // ignore
            }, function () {
                hideClipButtonToolTip();
            });
            // 在每个复制按钮上加入鼠标放上后的操作
            clipButton.hover(function () {
                // ignore
            }, function () {
                hideClipButtonToolTip();
            });
        });

        // 开启ToolTip
        $('[data-toggle="tooltip"]').tooltip();

        let clipboard = new ClipboardJS('.btn-clipboard');
        clipboard.on('success', function (e) {
            e.clearSelection();
            e.trigger && $(e.trigger).attr("data-original-title", "已复制到剪切板").tooltip('show');
        });
        clipboard.on('error', function (e) {
            e.clearSelection();
            e.trigger && $(e.trigger).attr("data-original-title", "您的浏览器不支持复制").tooltip('show');
        });
    };

    /**
     * 手机目录触摸隐藏
     * @param catalogContainer 手机目录容器
     */
    let mobileCatalogTouchMove = (catalogContainer) => {

        let startPageX; // 记录用户横向滑动目录时的开始位置
        let startPageY; // 记录用户纵向滑动目录时的开始位置
        let moveXRatio; // X方向移动的长度占屏幕长度的比例

        // 开始触摸
        catalogContainer.on("touchstart", function (event) {
            startPageX = event.touches[0].pageX; // 记录X开始的位置
            startPageY = event.touches[0].pageY; // 记录Y开始的位置
        });

        // 正在触摸
        catalogContainer.on("touchmove", function (event) {
            let moveXLength = event.touches[0].pageX - startPageX; // X相对于开始的位置移动了多少
            let moveYLength = event.touches[0].pageY - startPageY; // Y相对于开始的位置移动了多少
            moveXRatio = moveXLength / window.innerWidth; // X移动的长度占屏幕多少
            if (moveXLength >= 0 && moveXLength > Math.abs(moveYLength)) { // 目录跟随用户触屏横向移动的条件
                $(this).css({
                    "right": -moveXRatio * 100 + "%"
                })
            }
        });

        // 触摸结束
        catalogContainer.on("touchend", function (event) {
            let time = 100;
            if (moveXRatio < 0.25) { // 如果移动的比例小于30%
                $(this).animate({
                    "right": 0 // 目录归位（照常显示）
                }, time)
            } else {
                $('html').removeClass('no-scroll');
                $(this).animate({
                    "right": "-85%" // 目录隐藏
                }, time, () => $("#catalogOverBox").hide());
            }
        });
    };

    /**
     * 处理手机端目录
     */
    let mobileCatalogControl = () => {
        let time = 300;
        // 目录按钮
        let catalogButton = $("#catalogButton");
        // 目录链接
        let link = $("[data-catalog-target]");
        // 目录后的蒙版
        let catalogOverBox = $("#catalogOverBox");
        // 目录按钮
        catalogButton.on("click", function () {
            $('html').addClass('no-scroll');
            $("#catalogBox").animate({right: "0"}, time);
            $("#catalogOverBox").show();
            return false;
        });
        // 目录中的链接
        link.on("click", function () {
            $('html').removeClass('no-scroll');
            $("#catalogBox").css({right: "-85%"});
            $("#catalogOverBox").hide();
        });
        // 点击目录后的蒙版
        catalogOverBox.on('click', function () {
            $('html').removeClass('no-scroll');
            $("#catalogBox").animate({right: "-85%"}, time, () => {
                $(this).hide();
            });
            return false;
        });
        // 禁止蒙版触摸滑动
        catalogOverBox.on('touchmove', function (event) {
            event.preventDefault();
        });
        // 禁止蒙版鼠标滚轮
        catalogOverBox.on('mousewheel', function (event) {
            event.preventDefault();
        });
        mobileCatalogTouchMove($("#catalogBox"));
    };

    // 初始化处理，在新标签中打开页面
    linkOnBlackPage && $("#content a").filter(function () {
        let isLinkToCurrentPage = $(this).attr("href").startsWith("#");
        // 给每个链接到当前页面的链接一个点击事件，通过动画滚动到目标位置
        isLinkToCurrentPage && $(this).on('click', function (event) {
            let titleId = $(this).attr("href");
            changeUrlAnchor(titleId);
            let offsetTop = $(titleId).offset().top - 20;
            $("html,body").animate({scrollTop: offsetTop}, 300);
            event.preventDefault();
        });
        return !isLinkToCurrentPage;
    }).each(function () {
        $(this).attr("target", "_blank");
    });

    // 1、代码前面加入行号
    displayLineNumber && addLineNumber("pre code");
    // 2、生成文章的目录
    generateCatalogs("article", "#catalogs", 1.125, () => {
        $("#catalogBox").addClass("d-block");
        $("#catalogButton").addClass("d-block");
    });
    // 3、初始化图片点击效果，并在图片下面添加上解释说明
    zoomImages("article img");
    // 4、在代码的右上角显示代码的格式
    displayCodeType && displayCodeFormat("pre > code");
    // 5、代码可复制
    enableCodeCopy && clipBoardSupport();
    // 6、点击目录按钮的时候
    displayMobileCatalog && mobileCatalogControl();
    // 7、启用分享插件
    let $config = {
        origin: twitterAccountShare,
        description: `我看到了一篇好文章《${postTitle}》, 来看一下吧, 更多文章访问${blogTitle}: ${blogUrl}`,
        disabled: ['tencent', 'google', 'diandian']
    };
    enableShare && socialShare('.social-share-cs', $config);
    // 8、搞一个阅读进度，为了提高准确度，数据都要实时获取
    readProgress();
    // 9、为文章中每一个标题都添加一个点击事件，方便锚点分享
    addAnchorPoint("article");
});