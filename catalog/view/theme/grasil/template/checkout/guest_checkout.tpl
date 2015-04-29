<div class="row">
  <div class="col-sm-6">
    <fieldset id="account">            
      <div class="form-group required">
        <label class="control-label hidden-xs" for="input-payment-email"><?php echo $entry_email; ?></label>
        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-payment-email" class="form-control" />
      </div>
      
      <div class="form-group required">
        <label class="control-label hidden-xs" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
        <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />
      </div>
      
      <div class="form-group required">
        <label class="control-label hidden-xs" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
        <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
      </div>                  
    </fieldset>    
  </div>
    <div class="col-sm-6">
        <fieldset id="address">
            <!--legend><?php echo $text_your_address; ?></legend-->            
            <div class="form-group required">
                <label class="control-label hidden-xs" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
                <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone" class="form-control" />
            </div>
            
            <div class="form-group required">
                <label class="control-label hidden-xs" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
                <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" class="form-control" />
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
                <label class="control-label hidden-xs" for="input-payment-zone"><?php echo $entry_zone; ?></label>
                <select name="zone_id" id="input-payment-zone" class="form-control">
                </select>
            </div>            
            <div class="form-group" style="display: none">
                <label class="control-label" for="input-payment-fax"><?php echo $entry_fax; ?></label>
                <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-payment-fax" class="form-control" />
            </div>
            <div class="form-group" style="display: none">
                <label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
                <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-payment-company" class="form-control" />
            </div>

            <div class="form-group" style="display: none">
                <label class="control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
                <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-payment-address-2" class="form-control" />
            </div>
            <div class="form-group" style="display: none">
                <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
                <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" class="form-control" />
            </div>
            <div class="form-group" style="display: none">
                <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
                <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control" />
            </div>   
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