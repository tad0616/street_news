<div class="loding">
    <img src="images/ajax-loader2.gif" style="display: none" />
</div>
<div class="container">
    <!-- <h1 class="my-3 text-center">精選列表<small>（共 {$total} 篇文章）</small></h1> -->
    <table id = "myTable" class="table table-striped">
        <thead>
            <tr>
                <th>文章標題</th>
                <th>建立時間</th>
                <th>更新時間</th>
                <th>功能</th>
            </tr>
        </thead>
        <tbody>
            {foreach $all as $article}
            <tr>
                <td>{$article.title}</td>
                <td>{$article.create_time}</td>
                <td>{$article.update_time}</td>
                <td>
                    <a href="javascript:void(0)" class="btn btn-info btn-xs" role="button" sn="{$article.sn}">移除精選</a>
                </td>
            </tr>
            {/foreach}
        </tbody>
    </table>
    <!-- {$bar} -->
</div>

<script>
    $('#myTable a').click(function () {
      var sn = $(this).attr("sn");
      var obj1 = $(this).parents('tr');
      $.ajax({ //调用jquery的ajax方法
       type: "POST", 
       url: "picked.php",   
       data: "op=remove_focus&sn="+ sn,
       success: function(msg){ 
        },
        error: function (jqXHR, exception) {
           return "連線錯誤" ;
        },
        beforeSend: function () {
            $(".loding img").css("display", "block");            
        },        
        complete:function(){            
           $(".loding img").css("display", "none");             
           obj1.remove();
           }
       });        

       return false;
    });

</script>