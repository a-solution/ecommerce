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
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        
        <link rel="apple-touch-icon-precomposed" href="<?php echo $base; ?>catalog/view/theme/grasil/image/apple-touch-icon-precomposed.png">
        <link rel="apple-touch-icon" href="<?php echo $base; ?>catalog/view/theme/grasil/image/apple-touch-icon.png">
        
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />                    
        <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />        
        <link href="catalog/view/theme/grasil/stylesheet/stylesheet.css" rel="stylesheet">
        <link href="catalog/view/theme/grasil/stylesheet/animation.css" rel="stylesheet">        
        <link href="catalog/view/theme/grasil/stylesheet/responsive.css" rel="stylesheet">
        <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
        <script src="catalog/view/theme/grasil/js/common.js" type="text/javascript"></script>        	        
        
        <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>
        <?php echo $google_analytics; ?>
    </head>
    <body class="<?php echo $class; ?>" ontouchstart="">        
        <nav id="topnav">
            <div class="container">
                <div class="pull-left hidden-xs">
                    <div class="pull-left div-icon top-ship">
                        Giao hàng miễn phí
                    </div>
                    <div class="pull-left div-icon top-money">
                        Thanh toán khi nhận hàng
                    </div>
                    <div class="pull-left div-icon top-hotline">
                        Hotline: <?php echo $telephone; ?>
                    </div>
                </div>                
                <div class="nav pull-right myaccount">                                                     
                    <div class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm"><?php echo $customer_name; ?></span> <span class="caret"></span></a>                        
                        <ul class="dropdown-menu dropdown-menu-right">
                            <?php if ($logged) { ?>
                            <li><a href="<?php echo $account; ?>"><i class="fa fa-lock"></i> <?php echo $text_account; ?></a></li>
                            <li><a href="<?php echo $order; ?>"><i class="fa fa-history"></i> <?php echo $text_order; ?></a></li>
                            <li><a href="<?php echo $transaction; ?>"><i class="fa fa-folder-open"></i> <?php echo $text_transaction; ?></a></li>
                            <li><a href="<?php echo $download; ?>"><i class="fa fa-cloud-download"></i> <?php echo $text_download; ?></a></li>
                            <li class="logout"><a href="<?php echo $logout; ?>"><i class="fa fa-sign-out"></i> <?php echo $text_logout; ?></a></li>
                            <?php } else { ?>
                            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>                                   
                </div>
                <div class="pull-right hidden-lg hidden-md hidden-sm bsear">
                    <i class="fa fa-search"></i>                    
                </div>
                <div class="pull-right hidden-lg hidden-md hidden-sm ccart">
                    <a href="<?php echo $shopping_cart; ?>"></a>
                </div>                
                <div class="pull-left hidden-lg hidden-md hidden-sm" id="sidebar-menu" href="#sidr-left">                    
                    <i class="fa fa-bars"></i>                    
                </div>
                <div class="pull-left hidden-lg hidden-md hidden-sm">                    
                    <a href="<?php echo $home; ?>" class="logo">ASACA.VN</a>
                </div>
            </div>
        </nav>    
        <header class="hidden-xs">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 col-xs-12 hidden-xs">
                        <div id="logo">
                            <a href="<?php echo $home; ?>" class="logo"></a>
                        </div>
                    </div>
                    <div class="col-sm-5 col-xs-12 con-search">
                        <?php echo $search; ?>
                    </div>
                    <div class="col-sm-2 col-xs-6 hidden-xs con-wishlist">
                        <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="">
                            <?php echo $text_wishlist; ?>
                        </a>
                    </div>
                    <div class="col-sm-2 col-xs-6 hidden-xs con-cart">
                        <?php echo $cart; ?>
                    </div>                    
                </div>
            </div>
        </header>
        <?php if ($categories) { ?>
        <div class="container">
            <nav id="menu" class="navbar">
                <div class="navbar-header">
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                    <span id="category" class="visible-xs"><?php echo $text_category; ?></span>                    
                </div>
                <div id="sidr-left">
                    <div class="sidebar-header visible-xs">                        
                        <?php echo $text_category; ?>
                    </div>
                    <ul class="nav navbar-nav">                        
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
                        <li class="dropdown<?php echo ($category['image']) ? ' has-extend-pic' : '';?>" id="sub-cat-<?php echo $category['category_id']; ?>"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                            <div class="dropdown-menu extend-pic">
                                <div class="dropdown-inner">                                    
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
                                    <div class="extend-pic" style="background-image: url('<?php echo $category["image"]; ?>')"><a href="<?php echo $category['href']; ?>"></a></div>
                                    <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
                                </div>                                                                
                            </div>                            
                        </li>
                        <?php } else { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
                <script src="catalog/view/theme/grasil/js/jquery.sidr.min.js" type="text/javascript"></script>                
                <script type="text/javascript">
                    $(document).ready(function() {
                        $('#sidebar-menu').sidr({
                            name: 'sidr-left',
                            side: 'left',
                            onOpen: function() {
                                $('html,body').css({
                                    height: '100%',
                                    overflow: 'hidden'
                                });
                            }
                        }); 
                        
                        /*$(window).resize(function(){
                            $.sidr('close', 'sidr-left');
                            $("#sidr-left").show('slow');
                        });*/
                        
                        $('.bsear').click(function(){
                            var header = $('header');
                            if(header.hasClass('hidden-xs') || header.css('display')=='none')
                            {
                                header.fadeIn('slow');                    
                                header.removeClass('hidden-xs');
                                $('#search input.input-lg').focus();
                            }
                            else
                            {
                                header.fadeOut('fast');                                
                            }
                        });
                    });                    
                </script> 
            </nav>
        </div>
        <?php } ?>
