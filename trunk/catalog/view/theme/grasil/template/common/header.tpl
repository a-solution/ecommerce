<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />        
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />        
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
                
        <meta property="og:title" content="<?php echo $title; ?>" />
        <meta property="og:site_name" content="<?php echo $name; ?>" />                
        <?php foreach ($images as $image) { ?>
        <meta property="og:image" content="<?php echo $image['src']; ?>" />        
        <?php } ?>
        <meta property="og:description" content="<?php echo $description; ?>" />
        <meta property="fb:app_id" content="357643941100377" />
        <meta property="og:type" content="website" />
        
        <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        
        <script type="text/javascript">
            BASE_URL = '<?php echo $base; ?>';
            HOLINE = '<?php echo $telephone;?>';
            <?php if($logged):?>
            LOGGED = true;
            LINK_CHECKOUT = '<?php echo $checkout; ?>';            
            <?php endif;?>
        </script>
        
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        
        <link rel="apple-touch-icon-precomposed" href="<?php echo $base; ?>catalog/view/theme/grasil/images/apple-touch-icon-precomposed.png">
        <link rel="apple-touch-icon" href="<?php echo $base; ?>catalog/view/theme/grasil/images/apple-touch-icon.png">
        
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />                    
        <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />        
        <link href="catalog/view/theme/grasil/css/main.css" rel="stylesheet">
        <link href="catalog/view/theme/grasil/css/animation.css" rel="stylesheet">        
        <link href="catalog/view/theme/grasil/css/responsive.css" rel="stylesheet">
        <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
        <script src="catalog/view/theme/grasil/js/common.js" type="text/javascript"></script>        	        
        
        <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>
                
        <!-- bxSlider Javascript file -->
        <script src="catalog/view/theme/grasil/js/bxslider/jquery.bxslider.js"></script>
        <!-- bxSlider CSS file -->
        <link href="catalog/view/theme/grasil/js/bxslider/jquery.bxslider.css" rel="stylesheet" />
        
        <?php echo $google_analytics; ?>
    </head>
    <body class="<?php echo $class; ?>" ontouchstart="">
        <header class="hidden-xs">
            <div id="top-line">
                <div class="container">
                    <div class="left">
                        <ul>                            
                            <li><a href="">Hỗ trợ khách hàng</a> <span class="hotline"><script>document.write(HOLINE);</script></span></li>
                            <li class="sep visible-lg"><a href="/huong-dan-mua-hang">Hướng dẫn mua hàng</a></li>
                            <li class="sep hidden-sm hidden-xs"><a href="">Giao hàng toàn quốc</a></li>                            
                            <li class="sep hidden-sm hidden-xs"><a href="">Giao hàng miễn phí</a></li>
                            <li class="sep hidden-sm hidden-xs"><a href="">Thanh toán khi nhận hàng</a></li>
                        </ul>
                    </div>
                    <div class="right">                                                    
                        <?php if ($logged) { ?>
                        <div class="logged-menu">
                            <div href="<?php echo $account; ?>" title="<?php echo $text_account; ?>">
                                <i class="fa fa-user"></i>
                                <span class="customer-name"><?php echo $customer_name; ?></span>
                                <span class="caret"></span>
                            </div>
                            <ul>
                                <li><a href="<?php echo $account; ?>"><i class="fa fa-lock"></i> <?php echo $text_account; ?></a></li>
                                <li><a href="<?php echo $order; ?>"><i class="fa fa-history"></i> <?php echo $text_order; ?></a></li>
                                <li><a href="<?php echo $transaction; ?>"><i class="fa fa-folder-open"></i> <?php echo $text_transaction; ?></a></li>
                                <li><a href="<?php echo $download; ?>"><i class="fa fa-cloud-download"></i> <?php echo $text_download; ?></a></li>
                                <li class="logout"><a href="<?php echo $logout; ?>"><i class="fa fa-sign-out"></i> <?php echo $text_logout; ?></a></li>                            
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <?php } else { ?>
                        <ul>
                            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                        </ul>
                        <?php } ?>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div id="top">
                <div class="container">
                    <div class="clogo">
                        <a href="<?php echo $home; ?>" class="logo"></a>                    
                        <div class="slogan">Hướng tới mua hàng trực tuyến đơn giản nhất</div>
                    </div>
                    <div class="csearch hidden-sm hidden-xs">
                        <div class="ctb">
                            <?php echo $search; ?>
                        </div>
                        <div class="ckw">
                            Xu hướng tìm kiếm:
                            <a href="/thoi-trang-nam/phu-kien-nu/dong-ho">Đồng hồ nam</a>
                            <a href="/thoi-trang-nu/dam-vay">Đầm váy</a>
                            <a href="/thoi-trang-nam/ao-khoac">Áo khoác</a>
                            <a href="/thoi-trang-nu/phu-kien-nu/dong-ho">Đồng hồ nữ</a>
                            <a href="/my-pham/nuoc-hoa">Nước hoa</a>                            
                        </div>
                    </div>
                    <div class="cbutton">
                        <ul>                                                        
                            <li id="mycart" class="has-bag">
                                <a class="cart" href="javascript:void(0);"><?php echo $text_shopping_cart;?></a>
                                <span class="bag"><?php echo $text_cart_items; ?></span>
                                <div id="mini-cart">
                                    <?php echo $cart; ?>
                                </div>
                            </li>                            
                            <li id="favorite" class="has-bag visible-lg">
                                <a class="favorite" href=""><?php echo $text_wishlist; ?></a>
                                <span id="wishlist-total" class="bag"><?php echo $text_wishlist_items; ?></span>
                            </li>
                            <li class="visible-lg"><a class="tip" href="/huong-dan-mua-hang"><?php echo $text_tip; ?></a></li>                            
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>            
        </header>
        <div id="nav-controller" class="visible-xs">
            <div class="touch-menu menu-btn" id="touch-menu"><i class="fa fa-bars"></i></div>
            <div class="touch-logo"><a href="<?php echo $home; ?>"></a></div>
            <div class="touch-user">
                <?php if ($logged) { ?>
                <div class="logged-menu">
                    <div href="<?php echo $account; ?>" title="<?php echo $text_account; ?>">
                        <i class="fa fa-user"></i>                        
                        <span class="caret"></span>
                    </div>
                    <ul>
                        <li><a href="<?php echo $account; ?>"><i class="fa fa-lock"></i> <?php echo $text_account; ?></a></li>
                        <li><a href="<?php echo $order; ?>"><i class="fa fa-history"></i> <?php echo $text_order; ?></a></li>
                        <li><a href="<?php echo $transaction; ?>"><i class="fa fa-folder-open"></i> <?php echo $text_transaction; ?></a></li>
                        <li><a href="<?php echo $download; ?>"><i class="fa fa-cloud-download"></i> <?php echo $text_download; ?></a></li>
                        <li class="logout"><a href="<?php echo $logout; ?>"><i class="fa fa-sign-out"></i> <?php echo $text_logout; ?></a></li>                            
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <?php } else { ?>
                <a href="<?php echo $login;?>"><i class="fa fa-user"></i></a>
                <?php } ?>
            </div>
            <div class="touch-search" id="touch-search"><i class="fa fa-search"></i></div>
            <div class="touch-cart"><a href="<?php echo $shopping_cart;?>"><i class="fa fa-shopping-cart"></i></a></div>
            <script type="text/javascript">
                $('#touch-search').click(function(){
                    if($('#xs-search').css('display') == 'none')
                    {
                        $('#xs-search').show('slow');
                        $('#xs-search .stxt').focus();
                    }
                    else
                    {
                        $('#xs-search').hide();
                    }
                });
                $('#touch-menu').click(function(){
                    if($('.pushy .main-nav').length === 0) {
                       $('.main-nav').clone().appendTo(".pushy");                       
                    }                    
                });
            </script>            
        </div>
        <!-- Pushy Menu -->
        <div class="visible-xs">
            <link rel="stylesheet" href="catalog/view/theme/grasil/js/pushy/pushy.css">        
            <script src="catalog/view/theme/grasil/js/pushy/pushy.min.js"></script>        
            <nav class="pushy pushy-left">
                <div class="lbl-category"><?php echo $text_category; ?></div>
            </nav>        
            <div class="site-overlay"></div>
            <!-- End Pushy Menu -->
        </div>        
        <div id="xs-search" style="display: none;">
            <?php echo $search; ?>
            <div class="clearfix"></div>            
        </div>
        <div id="top-nav" class="hidden-xs">
            <div class="container">
                <div id="main-nav">
                    <div class="btn-category"><?php echo $text_category; ?></div>
                    <ul class="main-nav">
                        <?php if($categories): ?>
                        <?php
                            function asasort($array)
                            {
                                $group = array();
                                foreach ( $array as $value ) {
                                    $group[$value['column']][] = $value;
                                }
                                return ($group);
                            }
                        ?>
                        <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
                        <li class="<?php echo ($category['image']) ? 'has-extend-pic' : '';?>">
                            <a href="<?php echo $category['href']; ?>" id="nav-<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></a>
                            <div class="subnav">
                                <?php foreach(asasort($category['children']) as $children) { ?>
                                <ul class="list-unstyled">                                        
                                    <?php foreach ( $children as $child) { ?>
                                    <li class="level1"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                    <?php foreach ($child['sister'] as $sister) { ?>
                                    <li class="level2"><a href="<?php echo $sister['href']; ?>"><?php echo $sister['name']; ?></a></li>
                                    <?php } ?>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                                <div class="clearfix"></div>
                                <div class="extend-pic hidden-xs" style="background-image: url('<?php echo $category["image"]; ?>')"><a href="<?php echo $category['href']; ?>"></a></div>                                
                            </div>                            
                        </li>
                        <?php } else { ?>
                        <li><a id="nav-<?php echo $category['category_id']; ?>" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                        <?php } ?>
                        <?php endif;?>
                    </ul>
                    <script type="text/javascript">
                        $('#main-nav').mouseenter(function() {
                            if($('#mask-main-content').length === 0)
                            {
                                var cSize = $('#main-content');
                                $('#main-content').append('<div id="mask-main-content" style="width:'+cSize.width()+'px;height:'+cSize.height()+'px;"></div>');
                                $('#mask-main-content').animate({"opacity": "0.3"},"fast");
                            }
                        });
                        $('#main-nav').mouseleave(function() {
                            if($('#mask-main-content').length > 0)
                            {
                                $('#mask-main-content').animate({"opacity": "0"},"fast", function(){
                                    $(this).remove();
                                });                                
                            }
                        });
                    </script>
                </div>
            </div>
        </div>
        <div id="main-content">            
