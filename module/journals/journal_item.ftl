<#--日志界面的一项 OK-->
<#macro journalItem journal>
    <div class="journal-item bg-white my-2 px-3 py-3">
        <#--日志项的头部-->
        <div class="journal-header d-flex py-3">
            <#--用户的头像-->
            <div>
                <i class="user-avatar d-block rounded-circle"
                   style="background-image: url('${user.avatar!}');"></i>
            </div>
            <#--用户名和想对时间-->
            <div class="d-flex flex-column justify-content-center ml-3">
                <span class="font-weight-bold">${user.nickname!}</span>
                <small class="text-muted"><@global.timeline datetime=journal.createTime/></small>
            </div>
        </div>
        <#--日志项内容-->
        <div class="journal-content text-muted pb-3 border-bottom px-2">
            ${journal.content}
        </div>
        <#--日志项操作-->
        <div class="journal-operation text-muted py-2 px-3 mt-3 d-md-block d-flex justify-content-between">
            <#include "journal_operation.ftl"/>
        </div>
    </div>
</#macro>