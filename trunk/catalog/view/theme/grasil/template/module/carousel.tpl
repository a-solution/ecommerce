<div id="carousel<?php echo $module; ?>" class="flexslider carousel">
    <div class="name"><?php echo $banner_name; ?></div>
  <ul class="slides">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a></li>
    <?php } else { ?>
    <li><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></li>
    <?php } ?>
    <?php } ?>
  </ul>
</div>
<script type="text/javascript"><!--
$(window).load(function() {
$('#carousel<?php echo $module; ?>').flexslider({
	animation: 'slide',
        animationLoop: false,
	itemMargin: 5,
        itemWidth: <?php echo $width; ?>,
        
});});
--></script>