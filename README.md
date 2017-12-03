【前端頁面】<br> 
<h3>編輯精選--由編輯群挑選當周一則精選主題，類似頭條新聞，最上一則呈現。</h3>
<p>一、index.tpl >> op_slider.tpl 呈現在首頁輪播圖文</p>
<p>二、index.tpl >> op_show_article.tpl 觀看某篇文章</p>
<p>三、picked.tpl 列出所有精選文章</p>

<h3>街巷故事--由社大師生書寫發表台南有趣或重要的故事或新聞。 </h3>
<p>一、index.tpl >> op_submission.tpl 徵稿頁面，並詳述需要的資料（提供一個投稿的範例內容） </p>
<p>二、admin.tpl 文章編輯頁面表單（op_article_form.tpl 或 op_modify_article.tpl）</p>

<h3>市井觀點--類似評論及專題功能，會有單一主題，多人發表的型式，以呈現不同觀點。</h3> 
<p>一、point.tpl 用來讀出「預設=1」的專題，及其底下前三篇文章，以及其他舊的專題。 </p>
<p>二、point.tpl 點選某一專題（point.php?topic_sn=編號），會按照順序出現完整文章。 </p>
<p>三、admin.tpl 文章編輯頁面表單（op_article_form.tpl 或 op_modify_article.tpl）</p>

<h3>私房知識塾--由社大各學程教師提供本身的課程介紹，類似一周一課。 </h3>
<p>一、class.tpl 找出分類編號屬於「私房知識塾」的文章。</p>