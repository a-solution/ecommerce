<?php
    $moduleIntro = '';
    $moduleAside = '';
    foreach ($modules as $module) {
        $moduleIntro .= $module;
    }
?>
<?php if($moduleIntro != '') : ?>
<div class="row intro">
    <div class="col-md-9 col-sm-9 col-xs-12 banner">
        <?php echo $moduleIntro; ?>        
    </div>
    <div class="col-sm-3 hidden-xs aside">
        <img src="image/catalog/banner/ban-sm1.png" class="img-responsive" />
        <img src="image/catalog/banner/ban-sm2.png" class="img-responsive" />
    </div>
</div>
<?php else : ?>
<?php
    if($moduleIntro != '')
    {    
        echo $moduleIntro;
    }
    if($moduleAside != '')
    {
        echo $moduleAside;
    }
?>
<?php endif;?>