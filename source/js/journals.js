/**
 * 日志界面的所有操作
 *  |- 初始化fancybox
 *  |- 重新构建图片尺寸
 * Status: OK
 */
$(function () {

    // 启用ToolTip
    $('[data-toggle="tooltip"]').tooltip();

    /**
     * 初始化图片点击查看，需要配合fancybox.js使用
     */
    let zoomImages = (imageSelector) => {
        // 使页面支持fancybox
        $(imageSelector).each(function () {
            $(this).wrap( // 为图片包裹一个链接，使得fancybox.js可以使用
                `<a href="${$(this).prop('src')}" data-fancybox="images" data-caption="${$(this).prop("alt")}"></a>`
            );
        });
        // 为fancybox.js做配置
        $("[data-fancybox='images']").fancybox({
            buttons: ['zoom', 'download', 'close']
        });
    };

    /**
     * 重新构建图片尺寸 TODO 处理的过于复杂
     */
    let reBuildImage = () => {
        // 遍历所有的日志内容盒子
        $(`.journal-content`).each(function () {
            // 找到所有的fancybox图片
            let images = $(this).find(`[data-fancybox="images"]`);
            // 计算每个盒子下面有多少张图片
            let imgLength = images.length;
            if (imgLength === 1) return;
            // 为所有的fancybox图片加上间距和宽度
            images.addClass("pt-1 pr-1").css({'width': `100%`});
            // 遍历里面的所有的图片，替换成背景图
            $(this).find(`img`).each(function () {
                $(this).replaceWith(
                    $(`<i class="picture" style="background-image: url('${$(this).attr('src')}');"></i>`)
                );
            });
            // 如果有4张图片，做特殊处理
            if (imgLength === 4) {
                // 上面两张
                $(this).find(`[data-fancybox="images"]:lt(2)`).wrapAll($("<div class='d-flex'></div>"));
                // 下面两张
                $(this).find(`[data-fancybox="images"]:gt(1)`).wrapAll($("<div class='d-flex'></div>"));
                return;
            }
            // 如果有8张图片，做特殊处理
            if (imgLength === 8) {
                // 上面四张
                $(this).find(`[data-fancybox="images"]:lt(4)`).wrapAll($("<div class='d-flex'></div>"));
                // 下面四张
                $(this).find(`[data-fancybox="images"]:gt(3)`).wrapAll($("<div class='d-flex'></div>"));
                return;
            }
            // 其他情况先给前三张图片先做一下操作
            $(this).find(`[data-fancybox="images"]:lt(3)`).wrapAll($("<div class='d-flex'></div>"));
            // 计算有几行，约去不成一行的
            let rowNumber = ~~(imgLength / 3);
            // 把剩下成一行的做一下处理
            for (let i = 1; i < rowNumber; i++) {
                $(this).find(`[data-fancybox="images"]:gt(${i * 3 - 1}):lt(3)`)
                    .wrapAll($("<div class='d-flex'></div>"));
            }
            // 最后不成一行的图片做一下处理
            if (rowNumber > 0 && imgLength % 3 !== 0) {
                $(this).find(`[data-fancybox="images"]:gt(${rowNumber * 3 - 1})`)
                    .css({'width': `${1 / 3 * 100}%`})
                    .wrapAll($("<div class='d-flex'></div>"));
            }
        });
    };
    // 1、先要为所有的图片注册放大镜
    zoomImages('.journals img');
    // 2、在构建的放大镜的基础上做图片的尺寸缩放
    reBuildImage();
    // 3、处理完成后显示左边的日志盒子
    $("#left").css({'opacity': 1});
});