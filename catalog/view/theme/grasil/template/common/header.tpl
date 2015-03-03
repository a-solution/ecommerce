<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!--link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" /-->
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
            </div>
        </nav>    
        <header>
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
                    <div class="col-sm-2 col-xs-6 con-wishlist">
                        <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="">
                            <?php echo $text_wishlist; ?>
                        </a>
                    </div>
                    <div class="col-sm-2 col-xs-6 con-cart">
                        <?php echo $cart; ?>
                    </div>
                </div>
            </div>
        </header>
        <?php if ($categories) { ?>
        <div class="container">
            <nav id="menu" class="navbar">
                <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
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
            </nav>
        </div>
        <?php } ?>
