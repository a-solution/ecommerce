<footer>
    <div class="container">        
        <div class="row footer-link">
            <?php if ($informations) { ?>
            <div class="col-md-3 col-sm-6">
                <h5><?php echo $text_information; ?></h5>
                <ul class="list-unstyled">
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                </ul>
                <br />
                <a href="http://online.gov.vn/HomePage/WebsiteDisplay.aspx?DocId=31"><img width="112" src="catalog/view/theme/grasil/image/bct.png" title="" alt=""></a>
            </div>
            <?php } ?>            
            <div class="col-md-3 col-sm-6">
                <h5>Nhận ngay ưu đãi</h5>
                <div class="newsletter" id="nl-form">
                    <div class="row">
                        <div class="col-md-12">
                            <input type="text" class="tnl" placeholder="Địa chỉ Email" />
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <div class="bnl men" onclick="_asaca.addNewsletter('1');">Nam</div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <div class="bnl women" onclick="_asaca.addNewsletter('0');">Nữ</div>
                        </div>                        
                    </div>                 
                </div>
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
                <!--h5><?php echo $text_extra; ?></h5>
                <ul class="list-unstyled">
                    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                    <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                    <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                </ul-->                
            </div>
            <div class="col-md-3 col-sm-6">                
                <h5><?php echo $text_paymentmethod; ?></h5>
                <p>Hiện tại chúng tôi hỗ trợ thanh toán qua chuyển khoản ngân hàng hoặc thanh toán khi nhận hàng (COD)</p>                
                <div class="bank"></div>                
            </div>
            <div class="col-md-3 col-sm-6">
                <h5><?php echo $text_service; ?></h5>
                <div class="sic">                    
                    <a target=_blank" class="fb" href="https://www.facebook.com/asaca.vn"></a>
                    <a target=_blank" class="tw" href="https://www.twitter.com/asaca.vn"></a>
                    <a target=_blank" class="yt" href="https://www.youtube.com/user/asaca.vn"></a>
                </div>
                <div class="fb-page" data-href="https://www.facebook.com/asaca.vn" data-width="280" data-height="300" data-hide-cover="false" data-show-facepile="true" data-show-posts="false"></div>
            </div>
        </div>
        <hr>
        <p class="powered">
            <?php echo $powered; ?><br />
            Phiên bản thử nghiệm - Sản phẩm trên ASACA.VN chỉ để tham khảo chưa thực sự bán hàng
        </p>        
    </div>
</footer>
<script type="text/javascript" src="https://mylivechat.com/chatinline.aspx?hccid=72189449"></script>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=357643941100377&version=v2.3";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</body></html>