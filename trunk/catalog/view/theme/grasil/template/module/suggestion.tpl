<?php if($suggestion) : ?>
<div class="carousel-suggestion">
    <h3 class="heading-title"><span>Có thể bạn quan tâm</span></h3>    
    <ul class="bxslider list-unstyled">
        <?php foreach ($suggestion as $product) { ?>        
        <li class="product-thumb">
            <div class="image">
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                <div class="prd-btn-buy" prdid="<?php echo $product['product_id']; ?>"><?php echo $button_cart; ?></div>
                <div class="prd-btn-others">                        
                    <i class="fa fa-heart favorite" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></i>
                    <i class="fa fa-exchange compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></i>
                </div>
                <div class="prd-viewed">
                    <span class="orderred" data-toggle="tooltip" title="Đã có <?php echo isset($product['purchased'])?$product['purchased']:'0'; ?> lượt mua"><i class="fa fa-tags"></i> <?php echo isset($product['purchased'])?$product['purchased']:'0'; ?></span>
                    <span class="viewed" data-toggle="tooltip" title="Đã có <?php echo isset($product['viewed'])?$product['viewed']:'0'; ?> lượt xem"><i class="fa fa-eye"></i> <?php echo isset($product['viewed'])?$product['viewed']:'0'; ?></span>
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
        <li class="product-thumb">
            <div class="image">
                <a href="http://localhost/asaca/ao-khoac-blazer-cach-dieu"><img class="img-responsive" title="Áo khoác Blazer Cách Điệu" alt="Áo khoác Blazer Cách Điệu" src="http://localhost/asaca/image/cache/catalog/product/item-211x287.jpg"></a>
                <div prdid="30" class="prd-btn-buy">Mua Ngay</div>
                <div class="prd-btn-others">                        
                    <i onclick="wishlist.add('30');" title="" data-toggle="tooltip" class="fa fa-heart favorite" data-original-title="Thêm vào yêu thích"></i>
                    <i onclick="compare.add('30');" title="" data-toggle="tooltip" class="fa fa-exchange compare" data-original-title="So sánh giá"></i>
                </div>
                <div class="prd-viewed">
                    <span title="" data-toggle="tooltip" class="orderred" data-original-title="Đã có 3 lượt mua"><i class="fa fa-tags"></i> 3</span>
                    <span title="" data-toggle="tooltip" class="viewed" data-original-title="Đã có 252 lượt xem"><i class="fa fa-eye"></i> 252</span>
                </div>
            </div>                    
            <div class="caption">
                <h4><a href="http://localhost/asaca/ao-khoac-blazer-cach-dieu" title="" data-toggle="tooltip" data-original-title="Áo khoác Blazer Cách Điệu">Áo khoác Blazer Cách Điệu</a></h4>        
                <div class="rating hidden-xs">
                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                        
                </div>
                                <p class="price">
                                        <span class="price-new">80,000đ</span> <span class="price-old hidden-xs">100,000đ</span>
                    <span class="saleoff">20%</span>
                              
                </p>
                            </div>
        </li>
    </ul>    
</div>
<script type="text/javascript">
    $('.carousel-suggestion .bxslider').bxSlider({
        minSlides: 2,
        maxSlides: 6,
        moveSlides: 1,
        slideWidth: 188,
        slideMargin: 0,
        pager: false,
        controls: true,
		auto: true,
        infiniteLoop: true,
		hideControlOnEnd: true
    });
</script>
<?php endif; ?>