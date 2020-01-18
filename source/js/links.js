/**
 * 链接界面的所有操作
 * Status: OK
 */
$(function () {
    // 获取所有的link
    let links = $("#hideList .hide-list-item");
    // 判断是否要显示链接为空提示
    links.length && $("#linkBox").show() || $("#emptyBox").show();
    if (!links.length) return;
    // 默认分类名字
    let defaultCategoryName = "友情链接";
    /**
     * 链接对象，对象格式
     * {"分类名称1": ["HTML链接标签", "HTML链接标签"], "分类名称2": ["HTML链接标签", "HTML链接标签"]}
     */
    let linkObj = {};
    links.each(function () {
        let name = $(this).find(".hide-link-name").val();
        let url = $(this).find(".hide-link-url").val();
        let description = $(this).find(".hide-link-description").val();
        let team = $(this).find(".hide-link-team").val();
        team = team && team.trim() || defaultCategoryName;
        !(team in linkObj) && (linkObj[team] = []); // 数组赋初值
        linkObj[team].push(
            `<span class='border-bottom pt-3 pb-2'>
                <a class="link" target="_blank" href="${url}" 
                data-toggle="popover" 
                data-placement="bottom" 
                data-content="${description || name}">${name}</a>
            </span>`
        );
    });
    // 分类列表
    let categoryList = Object.keys(linkObj);
    // 分类列表Element集合
    let categoryListElement = categoryList.map(function (value, index) {
        return `<li class="list-group-item">
                    <a id="${value}" class="category-button${index ? "" : " category-active"}"
                       href="javascript: void(0)"><i class="fas fa-caret-right mr-3"></i>${value}
                    </a>
                </li>`;
    });
    // 显示分类列表
    $("#linkCategoryList").append(categoryListElement.join(""));

    // 分类按钮
    let categoryButton = $(".category-button");
    // 创建一个操作次数变量
    let operationCount = 0;
    /**
     * 过滤链接，显示到页面上
     * @param categoryName
     */
    let filterLinks = (categoryName) => {
        // 如果是刷新进入，获取上次的状态
        if (!operationCount) categoryName = history.state && history.state.categoryName || categoryName;
        // 存入本次的状态
        history.replaceState({categoryName: categoryName}, null, null);
        // 点击样式
        categoryButton.removeClass("category-active");
        $(`#${categoryName}`).addClass("category-active");
        // 显示分类的名称
        $("#categoryName").text(categoryName);
        // 添加链接到页面中
        $("#linkList .link-grid").html(linkObj[categoryName]);
        // 每次为新生成的链接标签添加popover
        $('[data-toggle="popover"]').popover({
            trigger: 'hover'
        });
    };

    // 页面初始化的时候就要过滤链接
    categoryList.length && filterLinks(categoryList[0]);

    // 分类按钮点击事件
    categoryButton.on('click', function () {
        operationCount++;
        // 当前点击的分类名称
        filterLinks($(this).attr("id"));
    });
});