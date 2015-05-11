<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?> register-account"><?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?></h1>
            <p><?php echo $text_account_already; ?></p>            
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="well col-basic">
                            <h2><?php echo $text_your_details; ?></h2>
                            <div class="form-group required">
                                <label class="control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                                <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                                <?php if ($error_firstname) { ?>
                                <div class="text-danger"><?php echo $error_firstname; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                                <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                                <?php if ($error_lastname) { ?>
                                <div class="text-danger"><?php echo $error_lastname; ?></div>
                                <?php } ?>
                            </div>          
                            <div class="form-group required">

                                <label class="control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                                <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                                <?php if ($error_telephone) { ?>
                                <div class="text-danger"><?php echo $error_telephone; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group" style="display: none;">
                                <label class="control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                                <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />

                            </div>
                            <div class="form-group" style="display: none;">
                                <label class="control-label" for="input-company"><?php echo $entry_company; ?></label>
                                <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />                                
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
                                <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
                                <?php if ($error_address_1) { ?>
                                <div class="text-danger"><?php echo $error_address_1; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group" style="display: none;">
                                <label class="control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
                                <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />                                
                            </div>
                            <div class="form-group" style="display: none;">
                                <label class="control-label" for="input-city"><?php echo $entry_city; ?></label>
                                <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                                <?php if ($error_city) { ?>
                                <div class="text-danger"><?php echo $error_city; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group" style="display: none;">
                                <label class="control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                                <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                                <?php if ($error_postcode) { ?>
                                <div class="text-danger"><?php echo $error_postcode; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group required" style="display: none;">
                                <label class="control-label" for="input-country"><?php echo $entry_country; ?></label>
                                <select name="country_id" id="input-country" class="form-control">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($countries as $country) { ?>
                                    <?php if ($country['country_id'] == $country_id) { ?>
                                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select>
                                <?php if ($error_country) { ?>
                                <div class="text-danger"><?php echo $error_country; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                                <select name="zone_id" id="input-zone" class="form-control">
                                </select>
                                <?php if ($error_zone) { ?>
                                <div class="text-danger"><?php echo $error_zone; ?></div>
                                <?php } ?>
                            </div>                            
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="well col-account">
                            <h2>Thông tin tài khoản</h2>
                            <div class="form-group required">
                                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                                <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                                <?php if ($error_email) { ?>
                                <div class="text-danger"><?php echo $error_email; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                                <?php if ($error_password) { ?>
                                <div class="text-danger"><?php echo $error_password; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                                <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                                <?php if ($error_confirm) { ?>
                                <div class="text-danger"><?php echo $error_confirm; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group">
                                <label class="control-label"><?php echo $entry_newsletter; ?></label>:
                                <?php if ($newsletter) { ?>
                                <label class="radio-inline">
                                    <input type="radio" name="newsletter" value="1" checked="checked" />
                                    <?php echo $text_yes; ?></label>
                                <label class="radio-inline">
                                    <input type="radio" name="newsletter" value="0" />
                                    <?php echo $text_no; ?></label>
                                <?php } else { ?>
                                <label class="radio-inline">
                                    <input type="radio" name="newsletter" value="1" />
                                    <?php echo $text_yes; ?></label>
                                <label class="radio-inline">
                                    <input type="radio" name="newsletter" value="0" checked="checked" />
                                    <?php echo $text_no; ?></label>
                                <?php } ?>
                            </div>

                            <?php if ($text_agree) { ?>
                            <div class="buttons">
                                <div>
                                    <?php if ($agree) { ?>
                                    <input type="checkbox" name="agree" value="1" checked="checked" />
                                    <?php } else { ?>
                                    <input type="checkbox" name="agree" value="1" />
                                    <?php } ?>
                                    <?php echo $text_agree; ?>
                                </div>
                            </div>
                            <?php } ?>
                            <div>
                                <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary btn-register" />
                            </div>
                        </div>
                    </div>
                </div>                
            </form>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div> 
<script type="text/javascript"><!--
// Sort the custom fields
    $('#account .form-group[data-sort]').detach().each(function () {
        if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
            $('#account .form-group').eq($(this).attr('data-sort')).before(this);
        }

        if ($(this).attr('data-sort') > $('#account .form-group').length) {
            $('#account .form-group:last').after(this);
        }

        if ($(this).attr('data-sort') < -$('#account .form-group').length) {
            $('#account .form-group:first').before(this);
        }
    });

    $('#address .form-group[data-sort]').detach().each(function () {
        if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
            $('#address .form-group').eq($(this).attr('data-sort')).before(this);
        }

        if ($(this).attr('data-sort') > $('#address .form-group').length) {
            $('#address .form-group:last').after(this);
        }

        if ($(this).attr('data-sort') < -$('#address .form-group').length) {
            $('#address .form-group:first').before(this);
        }
    });

    $('input[name=\'customer_group_id\']').on('change', function () {
        $.ajax({
            url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
            dataType: 'json',
            success: function (json) {
                $('.custom-field').hide();
                $('.custom-field').removeClass('required');

                for (i = 0; i < json.length; i++) {
                    custom_field = json[i];

                    $('#custom-field' + custom_field['custom_field_id']).show();

                    if (custom_field['required']) {
                        $('#custom-field' + custom_field['custom_field_id']).addClass('required');
                    }
                }


            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        $('#form-upload input[name=\'file\']').on('change', function () {
            $.ajax({
                url: 'index.php?route=tool/upload',
                type: 'post',
                dataType: 'json',
                data: new FormData($(this).parent()[0]),
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $(node).button('loading');
                },
                complete: function () {
                    $(node).button('reset');
                },
                success: function (json) {
                    $('.text-danger').remove();

                    if (json['error']) {
                        $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                    }

                    if (json['success']) {
                        alert(json['success']);

                        $(node).parent().find('input').attr('value', json['file']);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
    });
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
        pickTime: false
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function () {
        $.ajax({
            url: 'index.php?route=account/account/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function () {
                $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function () {
                $('.fa-spin').remove();
            },
            success: function (json) {
                if (json['postcode_required'] == '1') {
                    $('input[name=\'postcode\']').parent().parent().addClass('required');
                } else {
                    $('input[name=\'postcode\']').parent().parent().removeClass('required');
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

                $('select[name=\'zone_id\']').html(html);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>