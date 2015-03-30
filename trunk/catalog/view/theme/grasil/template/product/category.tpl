<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb hidden-xs">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php if(isset($breadcrumb['child']) && count($breadcrumb['child'])) { ?>
        <li class="has-sub">
            <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?> <i class="fa fa-angle-down"></i></a>          
            <ul class="dropdown-menu list-unstyled">                
                <?php foreach ($breadcrumb['child'] as $bchild) { ?>
                <li><a href="<?php echo $bchild['href']; ?>"><?php echo $bchild['text']; ?></a></li>
                <?php } ?>
            </ul>            
        </li>
        <?php } else { ?>        
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
        <?php } ?>
    </ul>
    <div class="row category-info"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>            
            <?php if ($thumb) { ?>
            <!--div class="row">
                <div class="col-sm-12"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
            </div-->      
            <?php } ?>
            <div class="row cat-heading">
                <div class="col-sm-12 col-xs-12">
                    <h2 data-toggle="dropdown"><?php echo $heading_title; ?></h2>                    
                </div>                
            </div>
            <?php if ($products) { ?>
            <div class="row filter">
                <div class="col-sm-12">
                    <div class="btn-group">
                        <?php                            
                            foreach($newsorts as $newsorts)
                            {
                                echo '<button type="button" id="order-'.$newsorts['value'].'" class="btn '.($newsorts['value']==strtolower($sort.'-'.$order)?' sort-active':'').'" href="'.$newsorts['href'].'" onclick="sort.setType(this)">'.$newsorts['text']. ' ' .$newsorts['icon'].' </button>';
                            }
                        ?>
                        <!--button type="button" id="list-view" class="btn hidden-xs" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                        <button type="button" id="grid-view" class="btn hidden-xs" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button-->
                        <button type="button" class="btn" id="compare-total" onclick="location='<?php echo $compare;?>'"><?php echo $text_compare; ?></button>
                    </div>
                </div>
            </div>            
            <br />
            <div class="row">
                <?php foreach ($products as $product) { ?>
                <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-6">
                    <div class="product-thumb">
                        <div class="image">
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                            <div class="prd-btn-buy" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></div>
                            <div class="prd-btn-others">                        
                                <i class="fa fa-heart favorite" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></i>
                                <i class="fa fa-exchange compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></i>
                            </div>
                        </div>
                        <div>
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
                                <p class="desc"><?php echo $product['description']; ?></p>
                            </div>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
            <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
            <?php } ?>
            <?php if (!$products) { ?>
            <div class="empty-data">
                <p><?php echo $text_empty; ?></p>
                <div class="buttons">
                    <div><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
            </div>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>