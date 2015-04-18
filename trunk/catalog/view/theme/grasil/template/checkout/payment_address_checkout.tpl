<?php if ($addresses) { ?>
<div class="radio">
  <label>
    <input type="radio" name="payment_address" value="existing" checked="checked" />
    <?php echo $text_address_existing; ?></label>
</div>
<div id="payment-existing">
  <select name="address_id" class="form-control">
    <?php foreach ($addresses as $address) { ?>
    <?php if ($address['address_id'] == $address_id) { ?>
    <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
    <?php } else { ?>
    <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
    <?php } ?>
    <?php } ?>
  </select>
</div>
<div class="radio">
  <label>
    <input type="radio" name="payment_address" value="new" />
    <?php echo $text_address_new; ?></label>
</div>
<?php } ?>
<br />  
  <div class="row" id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
      <div class="col-md-6">
          <fieldset>
        <div class="form-group required">
            <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
            <input type="text" name="lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />                
        </div>
        <div class="form-group required">
            <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
            <input type="text" name="firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
        </div>
              </fieldset>
      </div>
      <div class="col-md-6">
          <fieldset>
          <div class="form-group required">
            <label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>                
              <input type="text" name="address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" class="form-control" />                
          </div>              
          <div class="form-group" style="display: none">
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
            <label class="control-label" for="input-payment-zone"><?php echo $entry_zone; ?></label>                
            <select name="zone_id" id="input-payment-zone" class="form-control"></select>                
          </div>
          <input type="hidden" name="company" value="" />
          <input type="hidden" name="city" value="" />
          <input type="hidden" name="address_2" value="" />
          <input type="hidden" name="company" value="" />
          <input type="hidden" name="fax" value="" />
          </fieldset>
      </div>
      <div class="col-md-12">
          <div class="buttons clearfix">
              <div class="pull-right">
                  <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-address" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
              </div>
          </div>
      </div>
  </div>
<script type="text/javascript"><!--
$('input[name=\'payment_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
	} else {
		$('#payment-existing').show();
		$('#payment-new').hide();
	}
});
//--></script>

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
			$('.fa-spin').remove();

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