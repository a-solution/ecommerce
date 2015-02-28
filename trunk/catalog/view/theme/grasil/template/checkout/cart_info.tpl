<div id="cart_info">
    <h1><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
    </h1>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
            <table class="table table-bordered">                
                <tbody>
                    <?php foreach ($products as $product) { ?>
                    <tr>
                        <td class="text-center"><?php if ($product['thumb']) { ?>
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                            <?php } ?></td>
                        <td class="text-left">
                            <a href="<?php echo $product['href']; ?>"><b><?php echo $product['name']; ?></b></a>
                            <?php if (!$product['stock']) { ?>
                            <span class="text-danger">***</span>
                            <?php } ?>
                            <?php if ($product['option']) { ?>
                            <?php foreach ($product['option'] as $option) { ?>
                            <br />
                            <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                            <?php } ?>
                            <?php } ?>
                            <?php if ($product['reward']) { ?>
                            <br />
                            <small><?php echo $product['reward']; ?></small>
                            <?php } ?>
                            <?php if ($product['recurring']) { ?>
                            <br />
                            <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                            <?php } ?>
                            <br />Mã: <?php echo $product['model']; ?>
                            <br />
                        <div class="input-group btn-block">
                            <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                            x <?php echo $product['price']; ?>
                        </div>                                                
                        </td>                        
                    </tr>
                    <?php } ?>            
                </tbody>
            </table>
        </div>
    </form>    
    <div class="row">
        <div class="col-sm-12">
            <table class="table table-bordered">
                <?php foreach ($totals as $total) { ?>
                <tr>
                    <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                    <td class="text-right"><?php echo $total['text']; ?></td>
                </tr>
                <?php } ?>
            </table>
        </div>
    </div>
</div>