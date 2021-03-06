<?php

class ControllerCommonCart extends Controller {

    public function index() {
        $this->load->language('common/cart');

        // Totals
        $this->load->model('extension/extension');

        $total_data = array();
        $total = 0;
        $taxes = $this->cart->getTaxes();
        
        if(!$this->customer->isLogged()) {        
            if(!isset($this->session->data['shipping_method'])) {
                //modify to show shipping_method if it's not existed        
                $this->load->model('shipping/flat');
                $this->load->language('shipping/flat');
                $this->session->data['shipping_method']['title'] = $this->language->get('text_description');
                $this->session->data['shipping_method']['cost'] = $this->model_shipping_flat->getCost($this->config->get('config_zone_id'));
                $this->session->data['shipping_method']['tax_class_id'] = $this->config->get('flat_tax_class_id');
                $this->session->data['shipping_method']['code'] = 'flat.flat';

                $this->session->data['payment_address']['country_id'] = $this->config->get('config_country_id');
                $this->session->data['payment_address']['zone_id'] = $this->config->get('config_zone_id');
                //End modify
            }
        }
        else {
            if(!isset($this->session->data['payment_address_logged'])) {
                $this->load->model('account/address');
                $defaultAddress = $this->model_account_address->getAddress($this->customer->getAddressId());

                $this->load->model('shipping/flat');
                $this->load->language('shipping/flat');
                $this->session->data['shipping_method']['title'] = $this->language->get('text_description');
                $this->session->data['shipping_method']['cost'] = $this->model_shipping_flat->getCost($defaultAddress['zone_id']);
                $this->session->data['shipping_method']['tax_class_id'] = $this->config->get('flat_tax_class_id');
                $this->session->data['shipping_method']['code'] = 'flat.flat';

                $this->session->data['payment_address']['country_id'] = $defaultAddress['country_id'];
                $this->session->data['payment_address']['zone_id'] = $defaultAddress['zone_id'];
            }
        }
        
        // Display prices
        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {            
        
            $sort_order = array();

            $results = $this->model_extension_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('total/' . $result['code']);

                    $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
                }
            }

            $sort_order = array();

            foreach ($total_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $total_data);
        }

        $data['text_empty'] = $this->language->get('text_empty');
        $data['text_cart'] = $this->language->get('text_cart');
        $data['text_checkout'] = $this->language->get('text_checkout');
        $data['text_recurring'] = $this->language->get('text_recurring');
        $data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
        $data['text_loading'] = $this->language->get('text_loading');

        //Customize
        $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
        $data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
        $data['text_mycart'] = $this->language->get('text_mycart');
        $data['text_number_of_items'] = $this->cart->countProducts();
        $data['text_total_price'] = $this->currency->format($total);

        $data['button_remove'] = $this->language->get('button_remove');

        $this->load->model('tool/image');
        $this->load->model('tool/upload');

        $data['products'] = array();

        foreach ($this->cart->getProducts() as $product) {
            if ($product['image']) {
                $image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
            } else {
                $image = '';
            }

            $option_data = array();

            foreach ($product['option'] as $option) {
                if ($option['type'] != 'file') {
                    $value = $option['value'];
                } else {
                    $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

                    if ($upload_info) {
                        $value = $upload_info['name'];
                    } else {
                        $value = '';
                    }
                }

                $option_data[] = array(
                    'name' => $option['name'],
                    'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
                    'type' => $option['type']
                );
            }

            // Display prices
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }

            // Display prices
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
            } else {
                $total = false;
            }

            $data['products'][] = array(
                'key' => $product['key'],
                'thumb' => $image,
                'name' => $product['name'],
                'model' => $product['model'],
                'option' => $option_data,
                'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
                'quantity' => $product['quantity'],
                'price' => $price,
                'total' => $total,
                'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
            );
        }

        // Gift Voucher
        $data['vouchers'] = array();

        if (!empty($this->session->data['vouchers'])) {
            foreach ($this->session->data['vouchers'] as $key => $voucher) {
                $data['vouchers'][] = array(
                    'key' => $key,
                    'description' => $voucher['description'],
                    'amount' => $this->currency->format($voucher['amount'])
                );
            }
        }

        $data['totals'] = array();

        foreach ($total_data as $result) {
            $data['totals'][] = array(
                'title' => $result['title'],
                'text' => $this->currency->format($result['value']),
                'class' => isset($result['class']) ? $result['class'] : ''
            );
        }

        $data['cart'] = $this->url->link('checkout/cart');
        $data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/cart.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/common/cart.tpl', $data);
        } else {
            return $this->load->view('default/template/common/cart.tpl', $data);
        }
    }

    public function info() {
        $this->response->setOutput($this->index());
    }

}
