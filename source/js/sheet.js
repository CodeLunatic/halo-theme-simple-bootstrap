/**
 * 自定义界面的所有操作
 *  |-不需要阅读进度（阅读进度条，目录高亮）
 *  |-不需要代码前面加入行号
 *  |-不需要生成目录
 *  |-不需要初始化图片点击效果并在图片下面添加上解释说明
 *  |-不需要在代码的右上角显示代码的格式
 *  |-不需要剪切板功能
 *  |-不需要手机端目录
 *  |-链接新窗口打开
 *  |-启用分享插件
 *  Status: OK
 */
$(function () {
    // 初始化处理，在新标签中打开页面
    linkOnBlackPage && $("#content a").each(function () {
        $(this).attr("target", "_blank");
    });
    // 启用分享插件
    let $config = {
        origin: twitterAccountShare,
        description: `我找到一个优秀的地方, 来看一下吧, 更多访问${blogTitle}: ${blogUrl}`,
        disabled: ['tencent', 'google', 'diandian']
    };
    enableShare && socialShare('.social-share-cs', $config);
});