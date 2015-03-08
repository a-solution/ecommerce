<footer>
    <div class="container">
        <div class="newsletter">
            <div class="row">
                <div class="col-md-6 col1">
                    Nhận ngay những ưu đãi hấp dẫn từ ASACA
                </div>
                <div class="col-md-4 col2">
                    <div class="form" id="nl-form">
                        <input type="text" class="tnl" placeholder="Địa chỉ Email" />
                        <span class="bnl" onclick="_asaca.addNewsletter();">Nhận</span>
                    </div>
                </div>
                <div class="col-md-2 col3">
                    <a href="<?php echo $shopping_cart; ?>">Xem giỏ hàng</a></div>
            </div>
        </div>
        <div class="row footer-link">
            <?php if ($informations) { ?>
            <div class="col-sm-3">
                <h5><?php echo $text_information; ?></h5>
                <ul class="list-unstyled">
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <?php } ?>
            <div class="col-sm-3">
                <h5><?php echo $text_service; ?></h5>
                <div class="sic">                    
                    <a target=_blank" class="fb" href="https://www.facebook.com/asaca.vn"></a>
                    <a target=_blank" class="tw" href="https://www.twitter.com/asaca.vn"></a>
                    <a target=_blank" class="yt" href="https://www.youtube.com/user/asaca.vn"></a>
                </div>
                <ul class="list-unstyled">
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                </ul>
            </div>
            <!--div class="col-sm-3">
                <h5><?php echo $text_extra; ?></h5>
                <ul class="list-unstyled">
                    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                    <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                    <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                </ul>
            </div-->
            <div class="col-sm-3">
                <h5><?php echo $text_customer; ?></h5>
                <ul class="list-unstyled">
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></a></li>                    
                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                    <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                    <li><a href="<?php echo $faq_link; ?>"><?php echo $text_faq; ?></a></li>
                    <li><a href="<?php echo $guide_link; ?>"><?php echo $text_guide; ?></a></li>
                </ul>
            </div>
            <div class="col-sm-3">
                <h5><?php echo $text_paymentmethod; ?></h5>
                <p>Hiện tại chúng tôi hỗ trợ thanh toán qua chuyển khoản ngân hàng hoặc thanh toán khi nhận hàng (COD)</p>                
                <div class="bank"></div>
            </div>
        </div>
        <hr>
        <p class="powered"><?php echo $powered;?></p>        
    </div>
</footer>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalHeader">Modal title</h4>
      </div>
      <div class="modal-body" id="myModalBody">
        ...
      </div>
      <div class="modal-footer" id="myModalFooter">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>
<!--Social & Support-->
<div class="social-sec hidden-xs">
    <div class="fb-like" data-href="http://localhost/asaca" data-layout="box_count" data-action="like" data-show-faces="true" data-share="true"></div>
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
</div>
<!--script type="text/javascript" src="https://mylivechat.com/chatinline.aspx?hccid=72189449"></script-->
</body></html>