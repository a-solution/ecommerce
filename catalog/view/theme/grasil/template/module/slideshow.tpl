<div id="slideshow<?php echo $module; ?>" class="slideshow">
  <ul class="bxslider">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a></li>
    <?php } else { ?>
    <li><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></li>
    <?php } ?>
    <?php } ?>
  </ul>
</div>

<script type="text/javascript">
    $('#slideshow<?php echo $module; ?> .bxslider').bxSlider({
        minSlides: 1,
        maxSlides: 1,
        slideWidth: <?php echo $width; ?>,
        pager: false,
        auto: true,
        infiniteLoop: true,
        stopAuto: false
    });
</script>