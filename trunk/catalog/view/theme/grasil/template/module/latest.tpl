<?php if($type == 'Carousel'): ?>
<div class="carousel-latest">
    <h3 class="heading-title"><span><?php echo $heading_title; ?></span></h3>    
    <ul class="bxslider list-unstyled">
        <?php foreach ($products as $product) { ?>        
        <li class="product-thumb">
            <div class="image">
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                <div class="prd-btn-buy" prdid="<?php echo $product['product_id']; ?>"><?php echo $button_cart; ?></div>
                <div class="prd-btn-others">                        
                    <i class="fa fa-heart favorite" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></i>
                    <i class="fa fa-exchange compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></i>
                </div>
            </div>                    
            <div class="caption">
                <h4><a data-toggle="tooltip" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>        
                <div class="rating hidden-xs">
                    <?php if ($product['rating']) {        
                    for ($i = 1; $i <= 5; $i++) {
                    if ($product['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php }
                    }
                    } else {
                    for ($i = 1; $i <= 5; $i++) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php }
                    } ?>
                    <span class="orderred" data-toggle="tooltip" title="Đã có <?php echo isset($product['purchased'])?$product['purchased']:'0'; ?> lượt mua"><i class="fa fa-tags"></i> <?php echo isset($product['purchased'])?$product['purchased']:'0'; ?></span>
                    <span class="viewed" data-toggle="tooltip" title="Đã có <?php echo isset($product['viewed'])?$product['viewed']:'0'; ?> lượt xem"><i class="fa fa-eye"></i> <?php echo isset($product['viewed'])?$product['viewed']:'0'; ?></span>
                </div>
                <?php if ($product['price']) { ?>
                <p class="price">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old hidden-xs"><?php echo $product['price']; ?></span>
                    <span class="saleoff"><?php echo $product['saleoff']; ?>%</span>
                    <?php } ?>          
                </p>
                <?php } ?>
            </div>
        </li>        
        <?php } ?>
    </ul>
    <div class="clearfix"></div>
</div>
<script type="text/javascript">
    $('.carousel-latest .bxslider').bxSlider({
        minSlides: 1,
        maxSlides: 5,
        moveSlides: 1,
        slideWidth: 184,
        slideMargin: 5,
        pager: false,        
        auto: true,
        infiniteLoop: true,
        stopAuto: false
    });
</script>
<?php else: ?>
<h3 class="heading-title"><span><?php echo $heading_title; ?></span></h3>
<div class="row product-layout">
    <?php foreach ($products as $product) { ?>
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
        <div class="product-thumb transition">
            <div class="image">
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                <div class="prd-btn-buy" prdid="<?php echo $product['product_id']; ?>"><?php echo $button_cart; ?></div>
                <div class="prd-btn-others">                        
                    <i class="fa fa-heart favorite" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></i>
                    <i class="fa fa-exchange compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></i>
                </div>
            </div>
            <div class="caption">
                <h4><a data-toggle="tooltip" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>        
                <div class="rating hidden-xs">
                    <?php if ($product['rating']) {        
                    for ($i = 1; $i <= 5; $i++) {
                    if ($product['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php }
                    }
                    } else {
                    for ($i = 1; $i <= 5; $i++) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php }
                    } ?>
                    <span class="orderred" data-toggle="tooltip" title="Đã có <?php echo isset($product['purchased'])?$product['purchased']:'0'; ?> lượt mua"><i class="fa fa-tags"></i> <?php echo isset($product['purchased'])?$product['purchased']:'0'; ?></span>
                    <span class="viewed" data-toggle="tooltip" title="Đã có <?php echo isset($product['viewed'])?$product['viewed']:'0'; ?> lượt xem"><i class="fa fa-eye"></i> <?php echo isset($product['viewed'])?$product['viewed']:'0'; ?></span>
                </div>
                <?php if ($product['price']) { ?>
                <p class="price">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>          
                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old hidden-xs"><?php echo $product['price']; ?></span>
                    <span class="saleoff"><?php echo $product['saleoff']; ?>%</span>
                    <?php } ?>
                </p>
                <?php } ?>
            </div>
        </div>
    </div>
    <?php } ?>
</div>
<?php endif; ?>