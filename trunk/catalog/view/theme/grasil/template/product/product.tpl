<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb hidden-xs">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="row basic-info">
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-5'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <?php if ($thumb || $images) { ?>
                    <div class="row prd-media-box hidden-xs">                                                
                        <div class="col-sm-2 prd-more-image">
                            <div id="prd-other-image">
                                <?php if ($images) { ?>
                                <a href="#" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>">
                                    <img src="<?php echo $thumb; ?>" alt="" />
                                </a>
                                <?php foreach ($images as $image) { ?>
                                <a href="#" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="" /></a>
                                <?php } ?>
                                <?php } else { ?>
                                <a href="#" style="display: none" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>">
                                    <img src="<?php echo $thumb; ?>" alt="" />
                                </a>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="col-sm-10">
                            <div class="prd-image">
                                <img id="prd-single-image" data-image="<?php echo $thumb; ?>" src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" />
                            </div>
                        </div>
                        <!-- Add fancyBox main JS and CSS files -->
                        <script type="text/javascript" src="catalog/view/theme/grasil/js/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
                        <link rel="stylesheet" type="text/css" href="catalog/view/theme/grasil/js/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
                        <script src="catalog/view/theme/grasil/js/jquery.elevatezoom.js" type="text/javascript"></script>
                        <script type="text/javascript">
                            //initiate the plugin and pass the id of the div containing gallery images
                            $("#prd-single-image").elevateZoom
                                    ({
                                    gallery:'prd-other-image',
                                            cursor: 'pointer',
                                            galleryActiveClass: 'active',
                                            imageCrossfade: true,
                                            loadingIcon: 'catalog/view/theme/grasil/images/loading64.gif',
                                            zoomType: 'window',
                                            zoomWindowHeight: 420,
                                            zoomWindowWidth: 500,
                                            zoomWindowOffetx: 8,
                                            zoomWindowOffety: - 1,
                                            borderSize: 1,
                                            borderColour: '#ccc',
                                            zoomWindowFadeIn: 100,
                                            zoomWindowFadeOut: 100,
                                            lensFadeIn: true,
                                            lensFadeOut: true
                                    });
                                    //pass the images to Fancybox
                                    $("#prd-single-image").bind("click", function(e) {
                            var ez = $('#prd-single-image').data('elevateZoom');
                                    $.fancybox(ez.getGalleryList());
                                    return false;
                            });</script>
                    </div>
                    <div class="row hidden-md hidden-sm hidden-lg">
                        <div class="col-xs-12">
                            <ul class="thumbnails">
                                <?php if ($thumb) { ?>
                                <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                                <?php } ?>
                                <?php if ($images) { ?>
                                <?php foreach ($images as $image) { ?>
                                <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                                <?php } ?>
                                <?php } ?>
                            </ul>
                            <script type="text/javascript">
                                        $(document).ready(function() {
                                $('.thumbnails').magnificPopup({
                                type:'image',
                                        delegate: 'a',
                                        gallery: {
                                        enabled:true
                                        }
                                });
                                });</script>
                        </div>
                    </div>                    
                    <?php } ?>          
                </div>
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-5'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">                    
                    <h1><?php echo $heading_title; ?></h1>
                    <div class="viewed">
                        <span><?php echo $orderred; ?></span> lượt mua | <span><?php echo $viewed; ?></span> lượt xem
                        <div class="fb-like" data-href="<?php echo 'http://' . $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']; ?>" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
                    </div>
                    <ul class="list-unstyled">                        
                        <?php if ($manufacturer) { ?>
                        <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                        <?php } ?>
                        <li><?php echo $text_model; ?> <?php echo $model; ?></li>
                        <?php if ($reward) { ?>
                        <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
                        <?php } ?>
                        <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
                        <?php foreach ($options as $option) { ?>
                        <?php if ($option['type'] == 'text' && !$option['required']) { ?>
                        <li><?php echo $option['name']; ?>: <?php echo $option['value']; ?></li>
                        <?php }?>
                        <?php }?>
                    </ul>
                    <?php if ($price) { ?>
                    <ul class="list-unstyled price">
                        <?php if (!$special) { ?>
                        <li class="price-new">
                            <?php echo $price; ?>
                        </li>
                        <?php } else { ?>
                        <li class="price-old"><span style="text-decoration: line-through;">Giá cũ: <?php echo $price; ?></span> - <span class="saleoff">Giảm: <?php echo $saleoff ?>%</span></li>
                        <li class="price-new">
                            <?php echo $special; ?>
                        </li>
                        <?php } ?>                        
                        <?php //if ($tax) { ?>
                        <!--li><?php echo $text_tax; ?> <?php echo $tax; ?></li-->
                        <?php //} ?>
                        <?php if ($points) { ?>
                        <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                        <?php } ?>
                        <?php if ($discounts) { ?>
                        <li>
                            <hr>
                        </li>
                        <?php foreach ($discounts as $discount) { ?>
                        <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                    <hr>
                    <?php } ?>                    
                    <div id="product">
                        <?php if ($options) { ?>                        
                        <!--h3><?php echo $text_option; ?></h3-->
                        <?php foreach ($options as $option) { ?>
                        <?php if ($option['type'] == 'select') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                    <?php } ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                        <hr>
                        <?php } ?>
                        <?php if ($option['type'] == 'radio') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="radio border">
                                    <label onclick="selectBorder(this)">
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                        <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                        <hr>
                        <?php } ?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                        <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <hr>
                        <?php } ?>
                        <?php if ($option['type'] == 'image') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="radio image">
                                    <label>
                                        <input style="display: none" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                        <img onclick="selectItem(this)" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php //echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                        <hr>
                        <?php } ?>
                        <?php if ($option['type'] == 'text') {
                        if($option['required'])
                        {
                        ?>
                        <div class="form-group required">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                        </div>
                        <?php
                        }
                        ?>
                        <?php } ?>
                        <?php if ($option['type'] == 'textarea') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                        </div>
                        <hr>
                        <?php } ?>
                        <?php if ($option['type'] == 'file') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                        </div>
                        <hr>
                        <?php } ?>
                        <?php if ($option['type'] == 'date') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group date">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                </span></div>
                        </div>
                        <hr>
                        <?php } ?>
                        <?php if ($option['type'] == 'datetime') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group datetime">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                </span></div>
                        </div>
                        <hr>
                        <?php } ?>
                        <?php if ($option['type'] == 'time') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group time">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                </span></div>
                        </div>
                        <hr>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($recurrings) { ?>                        
                        <h3><?php echo $text_payment_recurring ?></h3>
                        <div class="form-group required">
                            <select name="recurring_id" class="form-control">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($recurrings as $recurring) { ?>
                                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                                <?php } ?>
                            </select>
                            <div class="help-block" id="recurring-description"></div>
                        </div>
                        <hr>
                        <?php } ?>  
                        <div class="qu-btn">
                            <div class="form-group quantity">
                                <ul class="list-unstyled">                                
                                    <li>Số Lượng: </li>
                                    <li>                                                                        
                                        <i class="fa fa-minus-square-o btn-step" onclick="_asaca.minusOne('#input-quantity');"></i>
                                        <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" maxlength="2" id="input-quantity" class="form-control" onkeyup="_asaca.handleNumber(this);" onmouseout="_asaca.handleNumber(this);" style="text-align: center" />                                    
                                        <i class="fa fa-plus-square-o btn-step plus" onclick="_asaca.plusOne('#input-quantity');"></i>
                                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                                    </li>
                                </ul>
                            </div>
                            <div class="form-group cbtn-buy">
                                <ul class="list-unstyled">                                
                                    <li>
                                        <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </li>
                                    <li>
                                        <button type="button" id="button-cart-checkout" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><i class="fa fa-check-square"></i> <?php echo $button_cart; ?></button>
                                    </li>                                
                                </ul>
                            </div>
                        </div>
                        <?php if ($minimum > 1) { ?>
                        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                        <?php } ?>
                    </div>                    
                    
                </div>
                <div class="col-sm-2 col-xs-12">
                    <div class="support-buy">
                        <div class="sb-title">Hỗ trợ đặt hàng</div>
                        <div class="sb-info">
                            <div class="hl"><i class="fa fa-phone"></i> <script>document.write(HOLINE);</script></div>
                            <div class="code">Mã Sp: <?php echo $model; ?></div>
                        </div>
                    </div>
                    <div class="btn-group addto-box">
                        <button type="button" class="btn" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i> <?php echo $button_wishlist; ?></button>
                        <button type="button" class="btn" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i> <?php echo $button_compare; ?></button>
                        <button type="button" class="btn" onclick="$('a[href=\'#tab-faq\']').trigger('click'); _asaca.scrollTo('#tab-faq h2');"><i class="fa fa-support"></i> Đặt câu hỏi</button>
                        <button type="button" class="btn" onclick="$('a[href=\'#tab-review\']').trigger('click'); _asaca.scrollTo('#tab-review h2');"><i class="fa fa-quote-left"></i> <?php echo $text_write; ?></button>                        
                    </div>
                    <?php if ($review_status) { ?>
                    <div class="rating">
                        <p>
                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                            <?php if ($rating < $i) { ?>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                            <?php } else { ?>
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                            <?php } ?>
                            <?php } ?>
                        </p>
                        <p><a href="#" onclick="$('a[href=\'#tab-review\']').trigger('click'); _asaca.scrollTo('#tab-review'); return false;"><?php echo $reviews; ?></a></p>
                    </div>
                    <?php } ?>                    
                </div>
            </div>
            <div class="row more-info">
                <div class="col-lg-9">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
                        <?php if ($attribute_groups) { ?>
                        <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                        <?php } ?>
                        <?php if ($review_status) { ?>
                        <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                        <?php } ?>
                        <li><a href="#tab-faq" data-toggle="tab">Hỏi đáp</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-description">
                            <?php echo $description; ?>
                        </div>
                        <?php if ($attribute_groups) { ?>
                        <div class="tab-pane" id="tab-specification">                            
                            <table class="table table-bordered">
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                <thead>
                                    <tr>
                                        <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                    <tr>
                                        <td><?php echo $attribute['name']; ?></td>
                                        <td><?php echo $attribute['text']; ?></td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                                <?php } ?>
                            </table>
                        </div>
                        <?php } ?>
                        <?php if ($review_status) { ?>
                        <div class="tab-pane" id="tab-review">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <form class="form-horizontal">                                
                                        <h2><?php echo $text_write; ?></h2>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                                <input type="text" name="name" value="" id="input-name" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                                <textarea name="text" rows="2" id="input-review" class="form-control"></textarea>
                                                <div class="help-block"><?php echo $text_note; ?></div>
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"><?php echo $entry_rating; ?></label>
                                                &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                                <input type="radio" name="rating" value="1" />
                                                &nbsp;
                                                <input type="radio" name="rating" value="2" />
                                                &nbsp;
                                                <input type="radio" name="rating" value="3" />
                                                &nbsp;
                                                <input type="radio" name="rating" value="4" />
                                                &nbsp;
                                                <input type="radio" name="rating" value="5" />
                                                &nbsp;<?php echo $entry_good; ?></div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                                                <input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12"> <img src="index.php?route=tool/captcha" alt="" id="captcha" /> </div>
                                        </div>
                                        <div class="buttons">
                                            <div class="pull-right">
                                                <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <h2>Nhận xét về sản phẩm</h2>
                                    <div id="review"></div>
                                </div>
                            </div>                            
                        </div>
                        <?php } ?>
                        <div class="tab-pane" id="tab-faq">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <form class="form-horizontal">                                
                                        <h2>Bạn có thể đặt câu hỏi tại đây</h2>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label" for="input-name-faq"><?php echo $entry_name; ?></label>
                                                <input type="text" name="name-faq" value="" id="input-name-faq" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label" for="input-review-faq">Câu hỏi</label>
                                                <textarea name="text-faq" rows="2" id="input-review-faq" class="form-control"></textarea>
                                                <div class="help-block"><?php echo $text_note; ?></div>
                                            </div>
                                        </div>                                
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label" for="input-captcha-faq"><?php echo $entry_captcha; ?></label>
                                                <input type="text" name="captcha-faq" value="" id="input-captcha-faq" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12"> <img src="index.php?route=tool/captcha" alt="" id="captcha-faq" /> </div>
                                        </div>
                                        <div class="buttons">
                                            <div class="pull-right">
                                                <button type="button" id="button-faq" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <h2>Hỏi & Đáp về sản phẩm</h2>
                                    <div id="faq"></div>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 visible-lg">
                    <div id="short-info">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="support-buy">
                                    <div class="sb-title">Hỗ trợ đặt hàng</div>
                                    <div class="sb-info">
                                        <div class="hl"><i class="fa fa-phone"></i> <script>document.write(HOLINE);</script></div>
                                        <div class="code">Mã Sp: <?php echo $model; ?></div>
                                    </div>
                                </div>
                                <h4 class="si-title">Bạn muốn mua sản phẩm</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <img src="<?php echo $thumb; ?>" class="img-responsive" alt="" />
                            </div>
                            <div class="col-lg-9">
                                <div class="pname"><?php echo $heading_title; ?></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <hr>
                                <?php if ($price) { ?>                                    
                                    <?php if (!$special) { ?>
                                    <h4 class="si-price">
                                        <?php echo $price; ?>
                                    </h4>                                        
                                    <?php } else { ?>
                                    <div class="si-price-has-saleoff">                                        
                                        <span class="si-price-old"><?php echo $price; ?></span>
                                        <span class="si-price-off">Giảm: <?php echo $saleoff ?>%</span>
                                    </div>
                                    <h4 class="si-price">
                                        <?php echo $special; ?>
                                    </h4>                                    
                                    <?php } ?>                                                                        
                                <?php } ?>                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="button" class="button-cart btn btn-block"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                <button type="button" class="button-cart-checkout btn btn-block"><i class="fa fa-check-square"></i> <?php echo $button_cart; ?></button>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php if ($products) { ?>            
            <h3 class="heading-title"><span><?php echo $text_related; ?></span></h3>
            <div class="row">
                <?php $i = 0; ?>
                <?php foreach ($products as $product) { ?>
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
                <?php } else { ?>
                <?php $class = 'col-lg-2 col-md-3 col-sm-6 col-xs-6'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <div class="product-thumb transition">
                        <div class="image">
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                            <div class="prd-btn-buy" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></div>
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
                                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                <?php } ?>
                                <?php if ($product['tax']) { ?>
                                <!--span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span-->
                                <?php } ?>
                            </p>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
                <div class="clearfix visible-md visible-sm"></div>
                <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
                <div class="clearfix visible-md"></div>
                <?php } elseif ($i % 4 == 0) { ?>
                <div class="clearfix visible-md"></div>
                <?php } ?>
                <?php $i++; ?>
                <?php } ?>
            </div>
            <?php } ?>
            <?php if ($tags) { ?>
            <p class="tags"><?php echo $text_tags; ?>
                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                <?php if ($i < (count($tags) - 1)) { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                <?php } else { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                <?php } ?>
                <?php } ?>
            </p>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
    $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function() {
            $('#recurring-description').html('');
            },
            success: function(json) {
            $('.alert, .text-danger').remove();
                    if (json['success']) {
            $('#recurring-description').html(json['success']);
            }
            }
    });
    });
//--></script> 
<script type="text/javascript">
    $(document).delegate('#button-cart, .button-cart', 'click', function() {
        cart.addIntoCart();
    });
    $(document).delegate('#button-cart-checkout, .button-cart-checkout', 'click', function() {
        cart.paymentCart();
    });</script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();
            $('#review').fadeOut('slow');
            $('#review').load(this.href);
            $('#review').fadeIn('slow');
    });
            $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
            $('#button-review').on('click', function() {
    $.ajax({
    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
            beforeSend: function() {
            $('#button-review').button('loading');
            },
            complete: function() {
            _asaca.scrollTo('#tab-review .alert');
                    $('#button-review').button('reset');
                    $('#captcha').attr('src', 'index.php?route=tool/captcha#' + new Date().getTime());
                    $('input[name=\'captcha\']').val('');
            },
            success: function(json) {
            $('.alert-success, .alert-danger').remove();
                    if (json['error']) {
            $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
            }

            if (json['success']) {
            $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                    $('input[name=\'captcha\']').val('');
            }
            }
    });
    });
            $('#faq').load('index.php?route=product/product/faqs&product_id=<?php echo $product_id; ?>');
            $('#button-faq').on('click', function() {
    $.ajax({
    url: 'index.php?route=product/product/faq&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name-faq\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text-faq\']').val()) + '&rating=5&captcha=' + encodeURIComponent($('input[name=\'captcha-faq\']').val()),
            beforeSend: function() {
            $('#button-faq').button('loading');
            },
            complete: function() {
            _asaca.scrollTo('#tab-faq .alert');
                    $('#button-faq').button('reset');
                    $('#captcha-faq').attr('src', 'index.php?route=tool/captcha#' + new Date().getTime());
                    $('input[name=\'captcha-faq\']').val('');
            },
            success: function(json) {
            $('.alert-success, .alert-danger').remove();
                    if (json['error']) {
            $('#faq').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
            }

            if (json['success']) {
            $('#faq').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
                    $('input[name=\'name-faq\']').val('');
                    $('textarea[name=\'text-faq\']').val('');
                    $('input[name=\'captcha-faq\']').val('');
            }
            }
    });
    });
//--></script> 
<script type="text/javascript">
            function selectItem(obj)
            {
            $(obj).parent().parent().parent().find('.radio').each(function(){
            $(this).find('.img-thumbnail').removeClass('selected');
            });
                    $(obj).addClass('selected');
                    $(obj).parent().find('input[type=radio]').prop('checked', true);
            }
    function selectBorder(obj)
    {
    $(obj).parent().parent().find('.radio').each(function(){
    $(this).find('label').removeClass('selected');
    });
            $(obj).addClass('selected');
            $(obj).find('input[type=radio]').prop('checked', true);
    }
    $(document).ready(function(){
    $('.form-group.required').each(function(){
    if ($(this).find('.border').length == 1)
    {
    selectBorder($(this).find('label'));
    }
    if ($(this).find('.image').length == 1)
    {
    selectItem($(this).find('.image').find('.img-thumbnail'));
    }
    });
    });
</script>
<?php echo $footer; ?>