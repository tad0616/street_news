<table class="table table-bordered table-hover table-striped">
    <thead>
        <tr class="info">
            <th>縮圖</th>
            <th>類別編號</th>
            <th>類別或專題名稱</th>
            <th>種類</th>
            <!-- <th>說明</th> -->
            <th>專題狀態</th>
            <th>
                <a href=topic.php?op=add_topic class="btn btn-primary">新增</a>
            </th>
        </tr>
    </thead>
    <tbody>
        {foreach $all as $topic}
        <tr>
            <td>
                {assign var="cover" value="uploads/topic_thumb_`$topic.topic_sn`.png"}
                {if file_exists($cover)}
                    <img src="{$cover}" alt="{$article.title}" class="rounded cover img-responsive" style="width:80px;height:80px;">      
                {/if}
            </td>
            <td>
                {$topic.topic_sn}
            </td>
            <td>{$topic.topic_title}</td>
            <td>{$topic.topic_type}</td>
            <!-- <td>{$topic.topic_description}</td> -->
            <td>{if $topic.topic_status!=""} {$topic_status[{$topic.topic_status}]}{/if}</td>
            {if isset($smarty.session.username) }
            <td>
                <a href="topic.php?op=modify_topic&sn={$topic.topic_sn}" class="btn btn-warning">編輯</a>
                <a href="topic.php?op=delete_topic&sn={$topic.topic_sn}" class="btn btn-danger">刪除</a>
            </td>
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