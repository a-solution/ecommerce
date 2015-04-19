<?php

class ControllerModuleRecent extends Controller {

    public function index() {
        if (isset($_COOKIE["asaca_product_viewed"])) {
            //parse json to array
            $viewed_products = json_decode($_COOKIE["asaca_product_viewed"], true);
            $data['recent'] = $viewed_products;
        } else {
            $data['recent'] = "";
        }
        
        $data['heading_title'] = "Sản phẩm đã xem";

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/recent.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/recent.tpl', $data);
        }
    }

}
