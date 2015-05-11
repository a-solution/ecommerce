<div class="col-sm-9 well">
    <div class="box-heading"><h1><?php echo $heading_title; ?></h1></div>
    <div class="list-group">
        <?php  
        foreach($categories as $category){ ?>
            <span class="list-group-item"><?php echo $category['name']; ?></span>
            <input type='hidden' value="<?php echo $category['category_id']; ?>">
        <?php
        }
        ?>
    </div>
</div>