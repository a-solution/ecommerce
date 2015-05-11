<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="radio">
  <label>
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <?php echo $payment_method['title']; ?>
    <?php if ($payment_method['terms']) { ?>
    (<?php echo $payment_method['terms']; ?>)
    <?php } ?>
  </label>
</div>
<?php } ?>
<?php } ?>
<div class="agree-sec">
    <div class="row">
        <div class="col-md-8">
            <textarea name="comment" rows="8" class="form-control" placeholder="<?php echo $text_comments; ?>"><?php echo $comment; ?></textarea>
        </div>
        <div class="col-md-4">
            <div class="as-btn">
                <input type="checkbox" name="agree" value="1" checked="checked" style="display: none" />
                <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
            </div>
        </div>
    </div>
    <div class="as-desc">        
        <?php if ($text_agree) { ?>
        <?php echo $text_agree; ?>
        <?php } ?>
    </div>
</div>
