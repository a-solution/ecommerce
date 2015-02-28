<?php if(count($categories) > 1) : ?>
<script src="catalog/view/theme/grasil/js/basicTabs.js" type="text/javascript"></script>
<link href="catalog/view/theme/grasil/stylesheet/tabs.css" rel="stylesheet">
<title>Basic jQuery Tabs</title>
<script type="text/javascript">
$(document).ready(function(){
    $('#tabwrap').basicTabs();
});
</script>
<div id="tabwrap">    
    <ul class="tabs">        
    <?php foreach ($categories as $category) { ?>    
        <li><a href="#tab<?php echo $category['category_id'];?>"><?php echo $category['category_name'];?></a></li>            
    <?php }  ?>
    </ul>
    <div class="tab_content">
    <?php foreach ($categories as $category) { ?>    
        <div id="tab<?php echo $category['category_id'];?>">
            <div class="row product-layout">
                <?php foreach ($category['products'] as $product) { ?>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <div class="product-thumb transition">
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                    <div class="caption">
                      <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>        
                      <?php if ($product['rating']) { ?>
                      <div class="rating">
                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($product['rating'] < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } ?>
                        <?php } ?>
                      </div>
                      <?php } else { ?>
                      <div class="rating">
                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } ?>
                      </div>
                      <?php } ?>
                      <?php if ($product['price']) { ?>
                      <p class="price">
                        <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                        <?php } else { ?>
                        <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                        <span class="saleoff"><?php echo $product['saleoff']; ?>%</span>
                        <?php } ?>          
                      </p>
                      <?php } ?>
                    </div>
                    <div class="button-group">
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
        </div>
    <?php }  ?>
    </div>   
</div>
<?php else: ?>
<?php
    $category = array_shift($categories);
    if($category['category_name']=='All') : ?>
    <h3 class="heading-title"><span><?php echo $heading_title; ?></span></h3>
<?php else: ?>
    <h3 class="heading-title"><span>TOP <?php echo $category['category_name']; ?></span></h3>
<?php endif; ?>
<div class="row product-layout">
  <?php foreach ($category['products'] as $product) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>        
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } else { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <span class="saleoff"><?php echo $product['saleoff']; ?>%</span>
          <?php } ?>          
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<?php endif; ?>