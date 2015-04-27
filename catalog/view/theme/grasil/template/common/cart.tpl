<?php if ($products || $vouchers) { ?>        
    <table>
        <?php foreach ($products as $product) { ?>
        <tr>
            <td class="text-center"><?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                <?php } ?></td>
            <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php if ($product['option']) { ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                <?php } ?>
                <?php } ?>
                <?php if ($product['recurring']) { ?>
                <br />
                - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
                <?php } ?></td>
            <td class="text-right" style="width: 60px">x <?php echo $product['quantity']; ?></td>
            <td class="text-right" style="width: 100px"><?php echo $product['total']; ?></td>
            <td class="text-center">
                <i class="fa fa-times-circle" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>"></i>
            </td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
            <td class="text-center"></td>
            <td class="text-left"><?php echo $voucher['description']; ?></td>
            <td class="text-right">x&nbsp;1</td>
            <td class="text-right"><?php echo $voucher['amount']; ?></td>
            <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
    </table>                
    <table class="order-total">
        <?php foreach ($totals as $total) { ?>
        <tr>
            <td class="method"><?php echo $total['title']; ?>:</td>                    
            <td class="total <?php echo $total['class']; ?>">
                <span><?php echo ($total['text']=='0đ')?"Miễn phí":$total['text']; ?></span>                        
            </td>
        </tr>
        <?php } ?>
    </table>
    <table class="c-cart-btn">
        <tr>
            <td><a href="<?php echo $cart; ?>" class="viewcart"><strong><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong></a></td>
            <td><a href="javascript:void(0);" action="<?php echo $checkout; ?>" class="checkout button-checkout"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></td>
        </tr>
    </table>        
<?php } else { ?>
<p class="text-center"><?php echo $text_empty; ?></p>
<?php } ?>