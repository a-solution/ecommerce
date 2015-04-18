<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-8'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <!--h1><?php echo $heading_title; ?></h1-->
      <div class="checkout-group">
        <h4 class="cg-heading"><?php echo $text_checkout_payment_address; ?></h4>
        <div class="cg-content">
          <?php echo $checkout_type; ?>
        </div>
      </div>
      <div class="checkout-group">
        <h4 class="cg-heading"><?php echo $text_checkout_payment_method; ?></h4>
        <div class="cg-content">
          <?php echo $payment_method; ?>
        </div>
      </div>      
      <?php echo $content_bottom; ?></div>
    <div class="col-sm-4">
        <?php echo $cart; ?>
    </div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$(document).on('change', 'input[name=\'account\']', function() {
	if ($('#collapse-payment-address').parent().find('.panel-heading .panel-title > *').is('a')) {	
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
		}
	} else {
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_account; ?>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_address; ?>');
		}	
	}        
});

$(document).delegate('#button-payment-method', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_method_checkout/save', 
        type: 'post',
        data: $('.checkout-group input[type=\'radio\']:checked, .checkout-group input[type=\'checkbox\']:checked, .checkout-group input[type=\'text\'], .checkout-group input[type=\'password\'], .checkout-group input[type=\'hidden\'], .checkout-group select, .checkout-group textarea'),
        dataType: 'json',
        beforeSend: function() {
            _asaca.loadingWindow();
        },  
        complete: function() {
            _asaca.reset();
        },          
        success: function(json) {            
            $('.alert, .text-danger').remove();
            if (json['error']) {
                if (json['error']['warning']) {                    
                    $('.breadcrumb').after('<div class="alert alert-danger">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    $('html, body').animate({ scrollTop: $('.alert-danger').offset().top }, 'slow');
                }
                for (i in json['error']) {
                        var element = $('#input-payment-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                                $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                                $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                }
            } else {
                 if (json['redirect']) {
                    location = json['redirect'];
                 }
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});
$(document).delegate('#input-payment-zone, #payment-existing select[name=address_id]', 'change', function() {
    if($('#payment-existing select[name=address_id]').length > 0) {
        data = 'address_id='+$('#payment-existing select[name=address_id]').val() +'&payment_address='+$('input[name=payment_address]:checked').val()+'&country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val();
    }
    else
    {
        data = 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val());
    }
    $.ajax({
        url: 'index.php?route=checkout/shipping/quote',
        type: 'post',
        data: data,
        dataType: 'json',
        beforeSend: function() {
            //$('#button-quote').button('loading');
        },
        complete: function() {
            //$('#button-quote').button('reset');
        },
        success: function(json) {            
            $.ajax({
		url: 'index.php?route=checkout/shipping/shipping',
		type: 'post',
		data: 'shipping_method=flat.flat&total='+$('.all-total').text().slice(0, -1)+'&ship='+$('.fee').text().slice(0, -1),
		dataType: 'json',
		beforeSend: function() {
                    _asaca.loadingObject($('#cart-ci-main'));
                    $('.fee').removeClass('fc-color');
                    $('.all-total').removeClass('fc-color');
		},
		complete: function() {
                    _asaca.reset($('#cart-ci-main'));
                    $('.fee').addClass('fc-color');
                    $('.all-total').addClass('fc-color');
		},
		success: function(json) {                    
                    if(json['ship']==='0đ')
                    {
                        $('.fee > span').text('Miễn phí');
                    }
                    else
                    {
                        $('.fee > span').text(json['ship']);
                    }
                    $('.fee > input').val(json['ship']);
                    $('.all-total').text(json['total']);
		}
	});
        }
    });
});
//--></script> 
<?php echo $footer; ?>