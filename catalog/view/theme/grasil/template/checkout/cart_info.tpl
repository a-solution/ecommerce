<div id="cart_info">
    <h2><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
    </h2>    
    <form action="<?php echo $action; ?>" method="post">
        <div class="table-responsive">
            <table class="table table-bordered order-list">                
                <tbody>
                    <?php foreach ($products as $product) { ?>
                    <tr>
                        <td class="text-center"><?php if ($product['thumb']) { ?>
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                            <?php } ?></td>
                        <td class="text-left">
                            <div class="ptitle">
                            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                            <?php if (!$product['stock']) { ?>
                                <span class="text-danger">***</span>
                            <?php } ?>
                            </div>
                            <?php if ($product['option']) { ?>
                            <?php foreach ($product['option'] as $option) { ?>                            
                                <div><?php echo $option['name']; ?>: <?php echo $option['value']; ?></div>
                            <?php } ?>
                            <?php } ?>
                            <?php if ($product['reward']) { ?>                            
                                <div><?php echo $product['reward']; ?></div>
                            <?php } ?>
                            <?php if ($product['recurring']) { ?>
                                <div><span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small></div>
                            <?php } ?>
                            <div>Mã: <?php echo $product['model']; ?></div>                            
                            <div class="input-group btn-block">
                                <!--input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control txt-quantity" disabled="disabled" /-->
                                <span><?php echo $product['quantity']; ?></span>
                                x <span class="product-price"><?php echo $product['price']; ?></span>
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
            <table class="table table-bordered order-total">
                <?php foreach ($totals as $total) { ?>
                <tr>
                    <td class="method"><?php echo $total['title']; ?>:</td>                    
                    <td class="total <?php echo $total['class']; ?>">
                        <span><?php echo ($total['text']=='0đ')?"Miễn phí":$total['text']; ?></span>
                        <input type="hidden" value="<?php echo $total['text']; ?>" />
                    </td>
                </tr>
                <?php } ?>
                <tr>
                    <td colspan="2" class="cart-update">
                        <a href="<?php echo $data['cart_link']?>">Cập nhật giỏ hàng</a></td>
                </tr>
            </table>
        </div>
    </div>
</div>