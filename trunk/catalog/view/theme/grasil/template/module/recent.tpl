<?php if($recent) : ?>
<div class="prd-recent hidden-sm hidden-xs">
    <h3 class="heading-title"><span><?php echo $heading_title; ?></span></h3>
    <div class="pr-content">
        <ul>
        <?php foreach($recent as $r) : ?>        
            <li>
                <a href="<?php echo $r['link'];?>" class="caption" data-toggle="tooltip" title="<?php echo $r['name']; ?>">
                <img src="<?php echo $r['image'];?>">
                <!--div class="caption" data-toggle="tooltip" title="<?php echo $r['name']; ?>"><?php echo $r['name'];?></div-->
                </a>
            </li>     
            
        <?php endforeach; ?>
        </ul>
    </div>
</div>
<?php endif; ?>
