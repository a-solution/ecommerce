// Cart add remove functions
var cart = {
    'add': function (product_id, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof (quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function () {
                $('#cart .mybag').addClass('spin');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('#cart .mybag').removeClass('spin');

                if (json['redirect']) {
                    location = json['redirect'];
                }

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart .mybag').html(json['count']);

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $("#cart > ul").load('index.php?route=common/cart/info ul li');
                }
            }
        });
    },
    'update': function (key, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key + '&quantity=' + (typeof (quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function () {
                $('#cart .mybag').addClass('spin');
            },
            success: function (json) {
                $('#cart .mybag').removeClass('spin');

                $('#cart .mybag').html(json['count']);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    },
    'remove': function (key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function () {
                $('#cart .mybag').addClass('spin');
            },
            success: function (json) {
                $('#cart .mybag').removeClass('spin');
                $('#cart .mybag').html(json['count']);
                $(".alert").remove();

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    }
};

var sort = {
    'setType': function(obj) {
        window.location.href = $(obj).attr('href');
    }
};

// Asaca Script
var _asaca = {
    addNewsletter: function () {
        $email = $('#nl-form .tnl').val();
        if($email === '' || !_asaca.isEmail($email))
        {
            $('#nl-form .tnl').addClass('error');            
        }
        else
        {
            $.ajax({
                url: 'index.php?route=common/newsletter',
                type: 'post',
                data: {
                    'email': $('#nl-form .tnl').val()
                },
                dataType: 'json',
                beforeSend: function () {                    
                    _asaca.popup('Đang xử lý, vui lòng chờ trong giây lát...')
                },
                success: function (json) {
                    if (json['redirect']) {
                        location = json['redirect'];
                    }

                    if (json['success']) {
                        _asaca.popupChange('<p>Cám ơn quý khách đã ủng hộ dịch vụ của chúng tôi.</p><p>Khi có thông tin mới chúng tôi sẽ thông báo đến Quý khách.</p>');
                        $('#nl-form .tnl').val('');
                    }
                }
            });
        }
    },
    isEmail: function(emailAddress) {
        var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);        
        return pattern.test(emailAddress);
    },
    isNumber: function(value) {
        return (/\D/g.test($(value).val()));
    },
    handleNumber: function(obj) {
        if (_asaca.isNumber($(obj).val()))
        {
            $(obj).val($(obj).val().replace(/\D/g,''));
        }
    },
    popup: function(message)
    {
        $('#myModalHeader').html('ASACA.VN');
        $('#myModalBody').html(message);
        //$('#myModalFooter').html();
        
        $('#myModal').modal({show:true, backdrop:'static'});
    },
    popupChange: function(message)
    {
        $('#myModalBody').html(message);
    }
};