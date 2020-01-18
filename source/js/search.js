/**
 * 处理搜索界面的搜索高亮
 * Status: OK
 */
$(function () {
    // 关键词高亮
    // 参考https://wangdoc.com/javascript/stdlib/regexp.html#stringprototypereplace
    let keywordHighlight = (element, keyword) => {
        keyword && keyword.trim() && element.html(
            element.html().replace(
                new RegExp(`${keyword}`, "gim"),
                `<span class="font-weight-bold search-highlight">$&</span>`
            )
        );
    };

    // 获取关键词
    let keyword = $("#keyword").html();
    // 高亮处理
    keyword && keyword.trim() && $(".list-item").each(function () {
        keywordHighlight($(this).find(".post-title"), keyword);
        keywordHighlight($(this).find(".post-summary"), keyword);
    });
});