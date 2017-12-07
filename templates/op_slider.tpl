<div class="img-container">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-wrap="true" data-pause="false">
        <div class="carousel-inner">
            {foreach $allslide as $slider} {assign var="cover" value="uploads/cover_`$slider.sn`.png"} {if file_exists($cover)}
            <div class="carousel-item img-container" style="background-image:url({$cover})">
                {else}
                <div class="carousel-item img-container" style="background-image:url(images/pic2.jpg)">
                    {/if}
                    <div class="carousel-caption d-none d-md-block">
                        <h2>
                            <a href="index.php?sn={$slider.sn}" style="text-decoration:none;">{$slider.title}
                            </a>
                        </h2>
                        <p>{$slider.summary}</p>
                    </div>
                </div>
                <!--end .carousel-item-->
                {foreachelse}
                <div class="carousel-item img-container" style="background-image:url(images/pic2.jpg)">
                    {/foreach}
                    <!-- <div class="carousel-item img-container" style="background:url(images/pic2.jpg)">
                <div class="carousel-caption d-none d-md-block" style="margin-bottom:50px;">
                    <h2>棒棒的恩亨</h2>
                    <p>...</p>
                </div>
            </div> -->
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">上一則</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">下一則</span>
                </a>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $(".carousel-item:first").addClass("active");
            });
        </script>