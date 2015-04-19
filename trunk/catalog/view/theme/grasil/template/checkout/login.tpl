<div id="checkout-option-form" class="row checkout-option">
  <div class="col-sm-6">
    <h2><?php echo $text_new_customer; ?></h2>
    <p><?php echo $text_checkout; ?></p>
    <div class="radio">
      <label>
        <?php if ($account == 'register') { ?>
        <input type="radio" name="account" value="register" checked="checked" />
        <?php } else { ?>
        <input type="radio" name="account" value="register" />
        <?php } ?>
        <?php echo $text_register; ?></label>
    </div>
    <?php if ($checkout_guest) { ?>
    <div class="radio">
      <label>
        <?php if ($account == 'guest') { ?>
        <input type="radio" name="account" value="guest" checked="checked" />
        <?php } else { ?>
        <input type="radio" name="account" value="guest" />
        <?php } ?>
        <?php echo $text_guest; ?></label>
    </div>
    <?php } ?>
    <p><?php echo $text_register_account; ?></p>
    <input type="button" value="<?php echo $button_continue; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
  <div class="col-sm-6">
    <h2><?php echo $text_returning_customer; ?></h2>
    <p><?php echo $text_i_am_returning_customer; ?></p>
    <div class="form-group">
      <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
      <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
    </div>
    <div class="form-group">
      <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
      <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
      <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript">
// Checkout
$(document).delegate('#button-account', 'click', function() {    
    $.ajax({
        url: 'index.php?route=checkout/checkout/option',
        data: {
            option: $('#checkout-option-form input[name=\'account\']:checked').val()
        },
        type: 'post',
        dataType: 'json',
        async: false,
        cache: false,
        beforeSend: function() {
            $('#button-account').button('loading');
        },      
        complete: function() {
            
        },
        success: function(json) {
            window.location = json['redirect'];            
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            $('#button-login').button('reset');
        }
    });
});

// Login
$(document).delegate('#button-login', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/login/save',
        type: 'post',
        data: $('#checkout-option-form :input'),
        dataType: 'json',
        beforeSend: function() {
            $('#button-login').button('loading');
        },  
        complete: function() {
            
        },              
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
			
            if (json['redirect']) {
                location = json['redirect'];                
            } else if (json['error']) {
                $('#modal-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');           
                // Highlight any found errors
                $('#checkout-option-form input[name=\'email\']').parent().addClass('has-error');	
                $('#checkout-option-form input[name=\'password\']').parent().addClass('has-error');	   
                
                $('#button-login').button('reset');
            }            
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            $('#button-login').button('reset');
        }
    }); 
});
</script>