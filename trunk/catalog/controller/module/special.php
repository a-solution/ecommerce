<?php
class ControllerModuleSpecial extends Controller {
	public function index($setting) {
		$this->load->language('module/special');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();
                
                $data['categories'] = array();

		/*$filter_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit'],
                        'category_ids' => isset($setting['category_ids']) ? $setting['category_ids'] : ''
		);*/
                $filter_data = array(
			'sort'  => 'total_discount',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit'],
                        'category_ids' => isset($setting['category_ids']) ? $setting['category_ids'] : ''
		);
                
		$results = $this->model_catalog_product->getProductSpecials($filter_data);
                
                //If no category is specified, group by 'All'
                if(!isset($setting['category_ids']) || $setting['category_ids'] == ''){
                    $data['categories']['All'] = array();
                    $data['categories']['All']['category_name'] = 'All';
                    $data['categories']['All']['category_id'] = 'All';
                    $data['categories']['All']['type'] = isset($setting['type'])?$setting['type']:'Normal';
                    $data['categories']['All']['products'] = array();
                }
                else{
                    $the_arr = explode(",", $setting['category_ids']);
                    foreach ($the_arr as $the_id) {
                        $data['categories'][$the_id] = array();
                        $data['categories'][$the_id]['category_name'] = '';
                        $data['categories'][$the_id]['category_id'] = '';
                        $data['categories'][$the_id]['products'] = array();                
                    }
                }

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
                                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				    //Customisze
                                    if($price) {
                                        $saleoff = (1 - $special/$price) * 100;
                                        $saleoff = round($saleoff);
                                    }
                                    else {
                                        $saleoff = false;
                                    }
				} else {
                                    $special = false;
                                    $saleoff = false;
				} 

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$theProduct = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
                                        'saleoff'     => $saleoff,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                                        'category_id' => $result['category_id'],
                                        'category_name' => $result['category_name'],
                                        'purchased' => $result['purchased'],
                                        'viewed' => $result['viewed']
				);
                                
                                $data['products'][] = $theProduct;
                                
                                //If no category is specified, group by 'All'
                                if(!isset($setting['category_ids']) || $setting['category_ids'] == ''){
                                    array_push($data['categories']['All']['products'], $theProduct);                    
                                }
                                //If some categories are specified, group by Categories ID
                                else{
                                    $data['categories'][$theProduct['category_id']]['category_name'] = $theProduct['category_name'];
                                    $data['categories'][$theProduct['category_id']]['category_id'] = $theProduct['category_id'];
                                    $data['categories'][$theProduct['category_id']]['type'] = isset($setting['type'])?$setting['type']:'Normal';
                                    array_push($data['categories'][$theProduct['category_id']]['products'], $theProduct);
                                }  
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/special.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/special.tpl', $data);
			} else {
				return $this->load->view('default/template/module/special.tpl', $data);
			}
		}
	}
}