<?php

class ControllerModuleSuggestion extends Controller {

    public function index() {
        
        $data['suggestion'] = array();
        
        if (isset($_COOKIE["asaca_product_viewed"])) {
            //get viewed product from cookie
            $viewed_products = json_decode($_COOKIE["asaca_product_viewed"], true);            
            
            //get lastest view product
            $last_item = end($viewed_products);            
            
            //load necessary modules
            $this->load->model('catalog/category');
            $this->load->model('catalog/product');
            $this->load->model('tool/image'); 
            
            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');            
            // Set the last category breadcrumb
            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }
            
            //get all categories of the product
            $categories = $this->model_catalog_product->getCategories($last_item["product_id"]);            

            $recent_cat = array();
            
            //loop to find most recent parent category
            foreach ($categories as $category) {
                $children = $this->model_catalog_category->getCategories($category['category_id']);                               
                
                //if does not find the the most recent parent category, the last parent category will be recent category
                $recent_cat = $category;
                
                //if a category does not have sub category, it will be the most recent parent catgory of a product                
                if (!$children) {
                    $recent_cat = $category;            
                    break;
                }                                                
            }                                                
            
            if(!empty($recent_cat)) //if recent_cat is not empty
            { 
                $filter_data = array(
                    'filter_category_id' => $recent_cat["category_id"],
                    'sort' => 'purchased',
                    'order' => 'DESC',
                    'start' => 0,
                    'limit' => 8
                );                                                    
                
                //get products
                $results = $this->model_catalog_product->getProducts($filter_data);
                                
                foreach ($results as $result) {                    
                    if ($result['image']) {
                        $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                    }

                    if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                    } else {
                        $price = false;
                    }

                    if ((float) $result['special']) {
                        $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));

                        //Customisze
                        if ($price) {
                            $saleoff = (1 - doubleval($result['special']) / doubleval($result['price'])) * 100;
                            $saleoff = round($saleoff);
                        } else {
                            $saleoff = false;
                        }
                    } else {
                        $special = false;
                        $saleoff = false;
                    }

                    if ($this->config->get('config_tax')) {
                        $tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price']);
                    } else {
                        $tax = false;
                    }

                    if ($this->config->get('config_review_status')) {
                        $rating = (int) $result['rating'];
                    } else {
                        $rating = false;
                    }
                                        
                    if(isset($this->request->get['path']))
                    {
                        $path = $this->request->get['path'];
                    }
                    else
                    {
                        $path = "";                        
                    }                    
                    
                    $data['suggestion'][] = array(
                        'product_id' => $result['product_id'],
                        'thumb' => $image,
                        'name' => $result['name'],
                        'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                        'price' => $price,
                        'special' => $special,
                        'saleoff' => $saleoff,
                        'tax' => $tax,
                        'rating' => $result['rating'],
                        'href' => $this->url->link('product/product', 'path=' . $path . '&product_id=' . $result['product_id'] . $url),
                        'purchased' => $result['purchased'],
                        'viewed' => $result['viewed']
                    );                                        
                }
            }
        }
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/suggestion.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/suggestion.tpl', $data);
        }
    }
}
