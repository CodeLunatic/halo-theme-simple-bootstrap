/**
 * 相册界面的操作
 * Status: OK
 */
$(function () {
    // 页面上所有的图片,反转（目的为了按照相册的添加时间排序）
    let allPictures = $("#pictures .picture-item");
    let pictureNum = allPictures.length;
    allPictures = allPictures.map(function (i) {
        return allPictures[pictureNum - 1 - i];
    });
    // 重构图片一列
    let reBuildPictureColumn = () => {
        if (allPictures.length === 0) return;
        let width = window.innerWidth;
        let pictureContainer = $("#pictureContainer");
        // Great Than MD
        (992 <= width) && (function () {
            pictureContainer.empty();
            let columnNum = 4;
            let column01 = $("<div class='col-lg-3 px-1'></div>");
            let column02 = $("<div class='col-lg-3 px-1'></div>");
            let column03 = $("<div class='col-lg-3 px-1'></div>");
            let column04 = $("<div class='col-lg-3 px-1'></div>");
            allPictures.each(function (index, value) {
                if (index % columnNum === columnNum - 1) {
                    column01.append(value);
                }
                if (index % columnNum === columnNum - 2) {
                    column02.append(value);
                }
                if (index % columnNum === columnNum - 3) {
                    column03.append(value);
                }
                if (index % columnNum === columnNum - 4) {
                    column04.append(value);
                }
            });
            pictureContainer.append(column04).append(column03).append(column02).append(column01);
        })();
        // Less Than MD
        (width < 992) && (function () {
            pictureContainer.empty();
            let columnNum = 2;
            let column01 = $("<div class='col-6 px-0 pl-1'></div>");
            let column02 = $("<div class='col-6 px-0 pr-1'></div>");
            allPictures.each(function (index, value) {
                if (index % columnNum === columnNum - 1) {
                    column01.append(value);
                }
                if (index % columnNum === columnNum - 2) {
                    column02.append(value);
                }
            });
            pictureContainer.append(column02).append(column01);
        })();
    };

    // 初始化页面的时候重构页面
    reBuildPictureColumn();
    // 缩放的时候重构页面
    $(window).on('resize', function () {
        reBuildPictureColumn();
    });

    // 启用ToolTip
    $('[data-toggle="tooltip"]').tooltip();

    // 为fancybox.js做配置
    $("[data-fancybox='images']").fancybox({
        buttons: ['zoom', 'download', 'close', 'thumbs']
    });
});