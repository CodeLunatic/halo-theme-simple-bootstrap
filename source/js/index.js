/**
 * 所有的页面公用的JS
 * Status: OK
 */
$(function () {
    /**
     * 返回顶部按钮
     */
    let backTopButton = () => {
        // 获取顶部按钮
        let $backTop = $("#backTop");
        // 窗口滚动的监听
        $(window).scroll(function () {
            ($(this).scrollTop() > window.innerHeight / 2) && $backTop.css({
                "display": "block" // 显示返回顶部按钮
            }) || $backTop.css({
                "display": "none" // 隐藏返回顶部按钮
            });
        });
        // 返回顶部动画效果
        $backTop.on('click', function () {
            $("html,body").animate({scrollTop: 0}, 300);
        });
    };

    /**
     * 处理所有界面的视频Iframe高度
     */
    let autoResizeIframe = () => {
        // 获取所有非音乐的iframe
        let videoIframes = $('iframe').filter(function () {
            return !$(this).attr('src').includes('music');
        });
        // 重新计算iframe的高度
        let resizeIframe = () => {
            videoIframes.each(function () {
                $(this).height($(this).width() * 9 / 16);
            });
        };
        // 页面加载重新计算高度
        resizeIframe();
        $("iframe").show();
        // 窗口缩放，重新计算高度
        $(window).resize(function () {
            resizeIframe();
        });
    };
    // 返回最顶部
    backTopButton();
    // 处理所有界面的视频Iframe高度
    autoResizeIframe();
    // 加入媒体控制
    $("video, audio").prop('controls', true);
});