<div class="container">
    <h1>{$article.title}</h1>
    <p>{$article.content}</p>

    {if isset($smarty.session.username) and $smarty.session.username==$article.username}
        <div class="alert alert-info text-center">
            <a href="admin.php?op=delete_article&sn={$article.sn}" class="btn btn-danger">刪除</a>
            <a href="admin.php?op=modify_article&sn={$article.sn}" class="btn btn-warning">編輯</a>
        </div>
    {/if}
</div>