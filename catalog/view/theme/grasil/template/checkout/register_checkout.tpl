<div class="row">
  <div class="col-sm-6">
    <fieldset id="account">
      <legend><?php echo $text_your_details; ?></legend>            
      <div class="form-group required">
        <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
        <input type="text" name="lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />
      </div>
      <div class="form-group required">
        <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
        <input type="text" name="firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
      </div>      
      <div class="form-group required">
        <label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
        <input type="text" name="address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" class="form-control" />
        <input type="hidden" name="address_2" value="" />
        <input type="hidden" name="fax" value="" />
        <input type="hidden" name="city" value="" />
        <input type="hidden" name="postcode" value="" />
        <input type="hidden" name="company" value="" />
      </div>
      <div class="form-group required" style="display: none">
        <label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
        <select name="country_id" id="input-payment-country" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($countries as $country) { ?>
          <?php if ($country['country_id'] == $country_id) { ?>
          <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>
      <div class="form-group required">
        <label class="control-label" for="input-payment-zone"><?php echo $entry_zone;; ?></label>
        <select name="zone_id" id="input-payment-zone" class="form-control">
        </select>
      </div>
    </fieldset>    
  </div>
  <div class="col-sm-6">
      <fieldset>
          <legend>Thông tin tài khoản</legend>
          <div class="form-group required">
            <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
            <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-payment-email" class="form-control" />
          </div>
          <div class="form-group required">
            <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
            <input type="text" name="telephone" value="" placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone" class="form-control" />
          </div>
          <div class="form-group required">
              <label class="control-label" for="input-payment-password"><?php echo $entry_password; ?></label>
              <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-payment-password" class="form-control" />
          </div>
          <div class="form-group required">
              <label class="control-label" for="input-payment-confirm"><?php echo $entry_confirm; ?></label>
              <input type="password" name="confirm" value="" placeholder="<?php echo $entry_confirm; ?>" id="input-payment-confirm" class="form-control" />
          </div>
      </fieldset>
      <fieldset style="display: none">          
          <div class="checkbox">
              <label for="newsletter">
                  <input type="checkbox" name="newsletter" value="1" id="newsletter" checked="checked" />
                  <?php echo $entry_newsletter; ?></label>
          </div>
          <?php if ($shipping_required) { ?>
          <div class="checkbox" style="display: none">
              <label>
                  <input type="checkbox" name="shipping_address" value="1" checked="checked" />
                  <?php echo $entry_shipping; ?></label>
          </div>
          <?php } ?>
      </fieldset>
  </div>
</div>

<script type="text/javascript"><!--
$('.checkout-group select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('.checkout-group select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('.checkout-group input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('.checkout-group input[name=\'postcode\']').parent().parent().removeClass('required');
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone']) {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';
			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}
			
					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('.checkout-group select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('.checkout-group select[name=\'country_id\']').trigger('change');
//--></script>