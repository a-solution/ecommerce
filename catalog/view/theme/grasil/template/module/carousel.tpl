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
        auto: true,
        stopAuto: false
    });
</script>