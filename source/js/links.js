/**
 * 链接界面的所有操作
 * Status: OK
 */
$(function () {
    // 获取所有的link
    let links = $("#hideList .hide-list-item");
    // 判断是否要显示链接为空的盒子
    links.length && $("#linkBox").show() || $("#emptyBox").show();
    // 创建一个操作次数变量
    let operationCount = 0;
    // 分类按钮
    let categoryButton = $(".category-button");

    /**
     * 根据分类的名字过滤链接显示到链接盒子中
     * @param categoryName 分类的名字
     */
    function filterLinks(categoryName) {
        // 如果是刷新进入，获取上次的状态
        if (!operationCount) categoryName = history.state && history.state.categoryName || categoryName;
        // 存入本次的状态
        history.replaceState({categoryName: categoryName}, null, null);
        // 去除所有的样式
        categoryButton.removeClass("text-danger");
        // 为当前分类添加样式
        $(`#${categoryName}`).addClass("text-danger");
        // 显示分类的名称
        $("#categoryName").text(categoryName);

        let linkItems = links.filter(function () { // 过滤分类
            return $(this).find(".hide-link-team").val() === categoryName;
        }).map(function () { // 映射最终数组
            let name = $(this).find(".hide-link-name").val();
            let url = $(this).find(".hide-link-url").val();
            let description = $(this).find(".hide-link-description").val();
            return `<span class='border-bottom pt-3 pb-2'>
                <a class="link" target="_blank" href="${url}" data-toggle="popover" data-placement="bottom" data-content="${description || name}">${name}</a>
            </span>`;
        }).get().join('');

        $("#linkList .link-grid").html(linkItems);

        // 每次为新生成的链接标签添加popover
        $('[data-toggle="popover"]').popover({
            trigger: 'hover'
        });
    }

    // 页面初始化的时候就要过滤链接
    filterLinks($(".category-button:eq(0)").attr("id"));
    // 分类按钮点击事件
    categoryButton.on('click', function () {
        operationCount++;
        // 当前点击的分类名称
        filterLinks($(this).attr("id"));
    });
});