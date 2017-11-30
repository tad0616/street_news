<table class="table table-bordered table-hover table-striped">
    <thead>
        <tr class="info">
            <th>類別編號</th>
            <th>類別或主題名稱</th>
            <th>種類</th>
            <th>說明</th>
            <th>預設</th>
            <th><a href=topic.php?op=add_topic class="btn btn-primary">新增</a></th>
        </tr>
    </thead>
    <tbody>
        {foreach $all as $topic}
        <tr>
            <td>
                {$topic.topic_sn}
            </td>
            <td>
                <!-- <a href="index.php?receipt_id={$receipt.receipt_id}">{$receipt.title}</a> -->
                {$topic.topic_title}
            </td>
            <td>{$topic.topic_type}</td>
            <td>{$topic.topic_description}</td>
            <td>{$topic.topic_default}</td>
            {if isset($smarty.session.username) }
            <td><a href="topic.php?op=modify_topic&sn={$topic.topic_sn}" class="btn btn-warning">編輯</a><a href="topic.php?op=delete_topic&sn={$topic.topic_sn}" class="btn btn-danger">刪除</a></td>
            {else}
            <td colspan=3></td>
            {/if}

        </tr>
        {foreachelse}
        <tr>
            <td colspan=7>暫無資料</td>
        </tr>
        {/foreach} 
       
    </tbody>
</table>