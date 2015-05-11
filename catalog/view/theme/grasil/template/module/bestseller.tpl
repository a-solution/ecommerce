<?php if(count($categories) > 1) : ?>
<script src="catalog/view/theme/grasil/js/tabs/tabs.js" type="text/javascript"></script>
<link href="catalog/view/theme/grasil/js/tabs/style.css" rel="stylesheet">
<script type="text/javascript">
    $(document).ready(function(){
        $('#tabwrap').basicTabs();
    });
</script>
<div id="tabwrap" class="hidden-xs">    
    <ul class="tabs">        
        <?php foreach ($categories as $category) { ?>    
        <li><a href="#tab<?php echo $category['category_id'];?>"><?php echo $category['category_name'];?></a></li>            
        <?php }  ?>
    </ul>
    <div class="tab_content">
        <?php foreach ($categories as $category) { ?>    
        <div id="tab<?php echo $category['category_id'];?>">
            <?php if($category['type'] == 'Carousel'): ?>
            <div class="carousel-bestseller-tab-<?php echo $category['category_id'];?>">                
                <ul class="bxslider list-unstyled">
                    <?php foreach ($category['products'] as $product) { ?>        
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
                                    <!--span class="orderred" data-toggle="tooltip" title="Đã có <?php echo isset($product['purchased'])?$product['purchased']:'0'; ?> lượt mua"><i class="fa fa-tags"></i> <?php echo isset($product['purchased'])?$product['purchased']:'0'; ?></span>
                                    <span class="viewed" data-toggle="tooltip" title="Đã có <?php echo isset($product['viewed'])?$product['viewed']:'0'; ?> lượt xem"><i class="fa fa-eye"></i> <?php echo isset($product['viewed'])?$product['viewed']:'0'; ?></span-->
                                </div>
                                <?php if ($product['price']) { ?>
                                <p class="price">
                                    <?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                    <?php } else { ?>
                                    <span class="price-new"><?php echo $product['special']; ?></span> <!--span class="price-old"><?php echo $product['price']; ?></span-->
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
            <?php else: ?>            
            <div class="row product-layout">
                <?php foreach ($category['products'] as $product) { ?>
                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
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
        </div>
        <?php }  ?>
    </div>   
</div>
<?php else: ?>
<?php $category = array_shift($categories);?>
<?php if($category['type'] == 'Carousel'): ?>
<div class="carousel-bestseller-<?php echo $category['category_id']?>">
    <?php if($category['category_name']=='All') : ?>
    <h3 class="heading-title"><span><?php echo $heading_title; ?></span></h3>
    <?php else: ?>
    <h3 class="heading-title"><span>TOP <?php echo $category['category_name']; ?></span>
        <div class="goto hidden-xs">
            <span><a href="<?php echo $category['category_link']?>?sort=purchased&order=desc">Bán chạy</a></span>
            <span><a href="<?php echo $category['category_link']?>?sort=p.price&order=asc">Giá tốt</a></span>
            <span><a href="<?php echo $category['category_link']?>?sort=p.viewed&order=desc">Xem nhiều nhất</a></span>
            <span><a href="<?php echo $category['category_link']?>">Mới</a></span>
        </div>
    </h3>
    <?php endif; ?>
    <ul class="bxslider list-unstyled">
        <?php foreach ($category['products'] as $product) { ?>        
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
    $('.carousel-bestseller-<?php echo $category['category_id']?> .bxslider').bxSlider({
        minSlides: 2,
        maxSlides: 5,        
        slideWidth: 224,
        slideMargin: 5,
        pager: false,
        auto: true,        
        stopAuto: false
    });
</script>
<?php else: ?>

<?php if($category['category_name']=='All') : ?>
<h3 class="heading-title"><span><?php echo $heading_title; ?></span></h3>
<?php else: ?>
<h3 class="heading-title"><span>TOP <?php echo $category['category_name']; ?></span></h3>
<?php endif; ?>
<div class="row product-layout">
    <?php foreach ($category['products'] as $product) { ?>
    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
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
<?php endif; ?>