/**
 * 导航栏的操作
 * Status: OK
 */
$(function () {

    // 启用ToolTip
    $('[data-toggle="tooltip"]').tooltip();

    // 导航栏选中添加选中样式
    $(Array.prototype.slice.call($(`#navBar a:gt(0)`)).find(
        value => value.pathname === window.location.pathname
    )).addClass('font-weight-bold')
        .append(`<span class="sr-only">(current)</span>`)
        .parent(".nav-item")
        .addClass("active");

    /**
     * 表单验证方法
     */
    let validateForm = () => {
        let $keywordBox = $("[name=keyword]");
        // 用户提交表单的时候进行一波验证
        $("#search").on('submit', function () {
            let isNotEmpty = Boolean($keywordBox.val().trim());
            if (!isNotEmpty) {
                $keywordBox.val('');
                $keywordBox.attr("placeholder", "搜索内容不能为空");
                $keywordBox.css({"border": "1px solid #dc3545"});
                return false;
            }
        });
        // 用户输入的时候取出红色错误提示边框
        $keywordBox.on("keydown", function () {
            $keywordBox.tooltip('hide');
            $keywordBox.attr("style") && $keywordBox.attr("style", "");
        });
    };
    // 验证表单
    validateForm();
});