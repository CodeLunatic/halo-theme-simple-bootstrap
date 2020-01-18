/**
 * 用于archives，tags，categories界面的导航工作
 * Status: OK
 */
$(function () {
    /**
     * 生成导航列表
     * @param from 从哪里获取列表
     * @param to 填充列表到哪里
     * @param success 成功后调用什么方法
     */
    let generateArchivesNavigationList = (from, to, success) => {
        let titles = $(from); // 获取所有的标题
        let navigationBox = $(to); // 导航盒子
        // 开始生成目录
        titles.each(function () {
            navigationBox.append(
                `<li class="list-group-item">
                    <a href="javascript:void(0)" data-catalog-target="${$(this).attr('id')}">${$(this).text()}</a>
                </li>`
            );
        });
        // 为目录中每个链接添加一个点击事件
        $(`${to} a[data-catalog-target]`).on('click', function () {
            let title = $(this).attr("data-catalog-target");
            let offsetTop = $(`#${title}`).offset().top - 15;
            $("html,body").animate({scrollTop: offsetTop}, 300);
        });
        titles.length && success();
    };
    // 生成归档导航列表
    generateArchivesNavigationList("h3.section-title", "#navigationList", () => $("#navigation").show());
});