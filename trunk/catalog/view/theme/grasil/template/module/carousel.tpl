<div id="carousel<?php echo $module; ?>" class="carousel">
    <div class="name"><?php echo $banner_name; ?></div>
    <ul class="bxslider list-unstyled">
        <?php foreach ($banners as $banner) { ?>
        <?php if ($banner['link']) { ?>
        <li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a></li>
        <?php } else { ?>
        <li><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></li>
        <?php } ?>
        <?php } ?>
        <li style="float: left; list-style: outside none none; position: relative; width: 130px; margin-right: 5px;"><img class="img-responsive" alt="Dell" src="http://asaca.vn/image/cache/catalog/manufacturer/dell-130x100.png"></li>
        <li style="float: left; list-style: outside none none; position: relative; width: 130px; margin-right: 5px;"><img class="img-responsive" alt="Dell" src="http://asaca.vn/image/cache/catalog/manufacturer/dell-130x100.png"></li>
        <li style="float: left; list-style: outside none none; position: relative; width: 130px; margin-right: 5px;"><img class="img-responsive" alt="Dell" src="http://asaca.vn/image/cache/catalog/manufacturer/dell-130x100.png"></li>
    </ul>
    <div class="clearfix"></div>
</div>
<script type="text/javascript">
    var slideWidth = <?php echo $width; ?>;
    $('#carousel<?php echo $module; ?> .bxslider').bxSlider({
        minSlides: 1,
        maxSlides: 7,
        slideWidth: 150,
        slideMargin: 15,
        pager: false,
        auto: false,
        infiniteLoop: true,
        stopAuto: false
    });
</script>