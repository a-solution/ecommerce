// Cart add remove functions
var cart = {
    'add': function (product_id, checkout, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof (quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function () {                
                _asaca.loadingWindow();
            },
            success: function (json) {
                $('.alert, .text-danger').remove();                                

                if (json['redirect']) {
                    location = json['redirect'];
                    _asaca.reset();
                    return;
                }

                if (json['success']) {
                    if(checkout===true)
                    {                        
                        paymentCartCallback(json);
                        return;
                    }
                    else
                    {
                        $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');                        
                        $('html, body').animate({scrollTop: 0}, 'slow');                        
                        cart.load(json['count']);
                    }
                }
                _asaca.reset();
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
                
            },
            success: function (json) {                
                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    cart.load(json['count']);
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
                
            },
            success: function (json) {                          
                $(".alert").remove();

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    cart.load(json['count']);
                }
            }
        });
    },
    addProduct: function(callback)
    {
        if ($("#input-quantity").val() == '')
        {
            $("#input-quantity").val(1);
        }
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-cart-checkout').button('loading');
            },
            complete: function () {
                //$('#button-cart-checkout').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');
                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));
                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    // find object
                    var fn = window[callback];
                    var fnparams = [json];
                    // is object a function?
                    if (typeof fn === "function")
                    {
                        fn.apply(null, fnparams);
                    }
                    else
                    {
                        //call string statement
                        eval(callback);
                    }                                                           
                }
            }
        });
    },
    addIntoCart: function() {
        cart.addProduct('addToCartCallback');
    },
    paymentCart: function() {
        //cart.addProduct('window.location = "index.php?route=checkout/checkout"');
        cart.addProduct('paymentCartCallback');
    },
    checkout: function(json) {
        if(typeof (LOGGED) != 'undefined')
        {            
            window.location = LINK_CHECKOUT;
            return;
        }
        else {
            _asaca.modalAjax('index.php?route=checkout/login', 'Đăng nhập để mua hàng');
        }
    },
    load: function(count) {
        $.ajax({
            url: 'index.php?route=common/cart/info',            
            dataType: 'html',
            beforeSend: function () {
                $('#mycart .bag').removeClass('zoomIn animated');
            },
            success: function (data) {                
                $('#mycart .bag').html(count);
                $('#mycart .bag').addClass('zoomIn animated');
                $("#mini-cart").html(data);                
            }
        });        
    }
};

function addToCartCallback(json) {
    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');    
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    cart.load(json['count']);
}
function paymentCartCallback(json) {
    cart.checkout(json);    
    setTimeout( function() {
        $('#modal-body').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    }, 500);
    cart.load(json['count']);
}

var voucher = {
    'add': function () {

    },
    'remove': function (key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('loading');
            },
            complete: function () {
                $('#cart > button').button('reset');
            },
            success: function (json) {
                $('#cart-total').html(json['total']);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    }
}

var wishlist = {
    'add': function (product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                if (json['info']) {
                    $('#content').parent().before('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                $('#wishlist-total').html(json['total']);

                $('html, body').animate({scrollTop: 0}, 'slow');
            }
        });
    },
    'remove': function () {

    }
}
//------------------------------------------------

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
    plusOne: function(obj)
    {
        if($(obj).val()==='')
        {
           $(obj).val(1);
        }
        else if(parseInt($(obj).val()) < 99)
        {
            $(obj).val(parseInt($(obj).val())+1);
        }
    },
    minusOne: function(obj)
    {
        if($(obj).val()=='' || $(obj).val()==0)
        {
           $(obj).val(1);
        }
        else if(parseInt($(obj).val()) > 1)
        {
            $(obj).val(parseInt($(obj).val()) - 1);
        }
    },
    modal: function(msg, title) {
        
        if(title===undefined)
        {
            title = 'ASACA.VN';
        }
        
        $('#asaca-modal').remove();
        
        html = '<div id="asaca-modal" class="modal">';
        html += '  <div class="modal-dialog">';
        html += '    <div class="modal-content">';
        html += '      <div class="modal-header">';
        html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
        html += '        <h4 class="modal-title" id="modal-title">' + title + '</h4>';
        html += '      </div>';
        html += '      <div class="modal-body" id="modal-body">' + msg + '</div>';
        html += '      <div class="modal-footer" id="modal-footer" style="display:none">';
        html += '        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
        html += '      </div>';
        html += '    </div';
        html += '  </div>';
        html += '</div>';

        $('body').append(html);

        $('#asaca-modal').modal({show:true, backdrop:'static'});
    },
    modalAjax: function(url, title, callback) {        
        $.ajax({
            url: url,
            type: 'get',
            dataType: 'json',
            cache: false,
            success: function (json, callback) {                
                if (json['redirect']) {
                    window.location = json['redirect'];
                    return;
                }
                _asaca.modal(json['data'], title);                
                _asaca.reset();
            }
        });
    },
    modalUpdate: function(message)
    {
        $('#modal-body').html(message);
    },
    popup: function(message)
    {
        $('#myModalHeader').html('ASACA.VN');
        $('#myModalBody').html(message);        
        
        $('#myModal').modal({show:true, backdrop:'static'});
    },
    popupChange: function(message)
    {
        $('#myModalBody').html(message);
    },
    scrollTo: function(obj)
    {
        var offset = $(obj).offset();
        var top = offset.top - 10;
        $('html, body').animate({ scrollTop: top }, 'slow');
    },
    loadingObject: function(obj)
    {
        if($('#wa-mask').length === 0)
        {
            oheight = $(obj).height();
            div = '<div id="wa-mask" class="wa-mask" style="height:'+oheight+'px"></div>';
            div+= '<img id="wa-loading" class="wa-loading" src="'+BASE_URL+'/catalog/view/theme/grasil/images/loading64.gif" />';                        
            $(div).appendTo($(obj));
        }        
    },
    loadingWindow: function()
    {
        if($('#wa-mask').length === 0)
        {            
            oh = $(document).height();
            var top = $(document).scrollTop() + $(window).height()/2;            
            div = '<div id="wa-mask" class="wa-mask" style="height:'+oh+'px"></div>';            
            div+= '<img id="wa-loading" class="wa-loading" style="top:'+top+'px" src="'+BASE_URL+'/catalog/view/theme/grasil/images/loading64.gif" />';                        
            $(div).appendTo($('html body'));            
        }        
    },
    reset: function()
    {        
        if($('#wa-mask, #wa-loading').length > 0) {
            $('#wa-mask, #wa-loading').remove();
        }
    }
};

$(document).ready(function () {
    $(document).delegate('.button-checkout', 'click', function(){
        cart.checkout();
    });
    $(document).delegate('.prd-btn-buy', 'click', function() {    
        if($(this).attr('prdid'))
        {
            cart.add($(this).attr('prdid'), true);
        }
    });
    $(window).scroll(function(){
        if($(document).scrollTop() > 100)
        {
            $('.move-to-top').show();
        }
        else
        {
            $('.move-to-top').hide();
        }
    });
    $('.move-to-top').click(function(){
        $('html, body').animate({ scrollTop: 0 }, 'slow');
    });
});