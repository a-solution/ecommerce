<?php

class ControllerCommonHeader extends Controller {

    public function index() {
//        include $_SERVER['DOCUMENT_ROOT'].'/Mobile_Detect.php';
//        $detect = new Mobile_Detect();
//
//        if ($detect->isMobile() && !$detect->isTablet() && $this->config->get('config_store_id')!=1){
//                if (isset($this->request->server['HTTPS'])) {
//                        $mobile_redirect = 'https://m.asaca.vn';
//                } else {
//                        $mobile_redirect = 'http://m.asaca.vn';
//                }
//                if ($_SERVER['REQUEST_URI']) $mobile_redirect .= html_entity_decode($_SERVER['REQUEST_URI']);
//                header('Location: '.$mobile_redirect);
//        }
        $data['title'] = $this->document->getTitle() . ' | ' . $this->config->get('config_name');

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $data['base'] = $server;
        $data['description'] = $this->document->getDescription() ? $this->document->getDescription(): $this->config->get('config_meta_description');
        $data['keywords'] = $this->document->getKeywords();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();
        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');
        $data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
        $data['name'] = $this->config->get('config_name');
        
        //customize images for social network sharing
        //added 13-Mar-2015
        $images = $this->document->getImages();        
        if(empty($images))
        {
            $this->document->addImages('abc','no-image-sharing');            
        }
        $data['images'] = $this->document->getImages();
        //--------------------------------------

        if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
            $data['icon'] = $server . 'image/' . $this->config->get('config_icon');
        } else {
            $data['icon'] = '';
        }

        if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
            $data['logo'] = $server . 'image/' . $this->config->get('config_logo');
        } else {
            $data['logo'] = '';
        }
        
        $data['logged'] = $this->customer->isLogged();
        $data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

        $this->load->language('common/header');

        $data['text_home'] = $this->language->get('text_home');
        $data['text_wishlist'] = $this->language->get('text_wishlist');
        $data['text_wishlist_items'] = isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0;
        $data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
        $data['text_tip'] = $this->language->get('text_tip');
        $data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
        
        $data['customer_name'] = $this->customer->isLogged() ? $this->customer->getFirstName():$this->language->get('text_account');
        
        $data['text_account'] = $this->language->get('text_account');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_login'] = $this->language->get('text_login');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_transaction'] = $this->language->get('text_transaction');
        $data['text_download'] = $this->language->get('text_download');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_checkout'] = $this->language->get('text_checkout');
        $data['text_category'] = $this->language->get('text_category');
        $data['text_all'] = $this->language->get('text_all');

        $data['home'] = $this->url->link('common/home');
        $data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
        $data['logged'] = $this->customer->isLogged();
        $data['account'] = $this->url->link('account/account', '', 'SSL');
        $data['register'] = $this->url->link('account/register', '', 'SSL');
        $data['login'] = $this->url->link('account/login', '', 'SSL');
        $data['order'] = $this->url->link('account/order', '', 'SSL');
        $data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
        $data['download'] = $this->url->link('account/download', '', 'SSL');
        $data['logout'] = $this->url->link('account/logout', '', 'SSL');
        $data['shopping_cart'] = $this->url->link('checkout/cart');        
        $data['contact'] = $this->url->link('information/contact');
        $data['telephone'] = $this->config->get('config_telephone');

        $status = true;

        if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

            foreach ($robots as $robot) {
                if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
                    $status = false;

                    break;
                }
            }
        }

        // Menu
        $this->load->model('tool/image');
        
        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);

//        foreach ($categories as $category) {
//            if ($category['top']) {
//                // Level 2
//                $children_data = array();
//
//                $children = $this->model_catalog_category->getCategories($category['category_id']);
//
//                foreach ($children as $child) {
//                    $filter_data = array(
//                        'filter_category_id' => $child['category_id'],
//                        'filter_sub_category' => true
//                    );
//
//                    $children_data[] = array(
//                        'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
//                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
//                    );
//                }
//
//                // Level 1
//                $data['categories'][] = array(
//                    'name' => $category['name'],
//                    'children' => $children_data,
//                    'column' => $category['column'] ? $category['column'] : 1,
//                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
//                );
//            }
//        }

        foreach ($categories as $category) {
            if ($category['top']) {
                $children_data = array();
                $sister_data = array();
                $children = $this->model_catalog_category->getCategories($category['category_id']);

                foreach ($children as $child) {
                    $sister_data = array();
                    $sisters = $this->model_catalog_category->getCategories($child['category_id']);
                    foreach ($sisters as $sister) {
                        $totalSister = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $sister['category_id']));
                        $sister_data[] = array(
                            'category_id' => $sister['category_id'],
                            'name' => $sister['name'] . ($this->config->get('config_product_count') ? ' (' . $totalSister . ')' : ''),
                            'column' => $sister['column'] ? $sister['column'] : 1,
                            'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $sister['category_id'])
                        );
                    }
                    $total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $child['category_id']));
                    $children_data[] = array(
                        'category_id' => $child['category_id'],
                        'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
                        'column' => $child['column'] ? $child['column'] : 1,
                        'sister' => $sister_data,
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );
                }

                // Level 1                
                $data['categories'][] = array(
                    'category_id' => $category['category_id'],
                    'name' => $category['name'],
                    'image' => $this->model_tool_image->resize($category['image'], 150, 400),
                    'column' => $category['column'] ? $category['column'] : 1,
                    'children' => $children_data,
                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }

        $data['language'] = $this->load->controller('common/language');
        $data['currency'] = $this->load->controller('common/currency');
        $data['search'] = $this->load->controller('common/search');
        $data['cart'] = $this->load->controller('common/cart');

        // For page specific css
        if (isset($this->request->get['route'])) {
            if (isset($this->request->get['product_id'])) {
                $class = ' product-' . $this->request->get['product_id'];
            } elseif (isset($this->request->get['path'])) {
                $class = ' category-' . $this->request->get['path'];
            } elseif (isset($this->request->get['manufacturer_id'])) {
                $class = ' information-' . $this->request->get['manufacturer_id'];
            } else {
                $class = '';
            }

            $data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
        } else {
            $data['class'] = 'common-home';
        }
        
        $data['text_cart_items'] = $this->cart->countProducts();

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
        } else {
            return $this->load->view('default/template/common/header.tpl', $data);
        }
    }

}
