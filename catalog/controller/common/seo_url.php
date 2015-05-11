<?php
class ControllerCommonSeoUrl extends Controller {
        
        private $custom_mappings = Array(
            "information/contact"   => "lien-he",
            "account/return/add"    => "tra-hang",
            "information/sitemap"   => "so-do",
            
            "product/manufacturer"  => "thuong-hieu",
            "account/voucher"       => "the-qua-tang",
            "affiliate/account"     => "thanh-vien",
            "product/special"       => "khuyen-mai",
            
            "account/account"       => "tai-khoan",
            "account/order"         => "don-hang",
            "account/wishlist"      => "danh-sach-yeu-thich",
            "account/newsletter"    => "ban-tin",
            
            "account/login"         => "dang-nhap",
            "account/register"       => "dang-ky",
        );
        
        private function getRwUrl($url){
            if(isset($this->custom_mappings[$url])){
               return $this->custom_mappings[$url]; 
            }
            return '';
        }
    
        private function getUrl($rwUrl){
            foreach($this->custom_mappings as $k => $v) {
                if($v == $rwUrl){
                    return $k;
                }
            }
            return '';
        }
        
	public function index() {
            
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
                
		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);

			// remove any empty arrays from trailing
			if (utf8_strlen(end($parts)) == 0) {
				array_pop($parts);
			}

                        if(count($parts) > 0){
                            $urlString = implode("/", $parts);
                            if($this->getUrl($urlString)){
                                $this->request->get['route'] = $this->getUrl($urlString);
                                return new Action($this->request->get['route']);    
                            } 
                        }
                        
			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");

				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);

					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}

					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}

					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}
				} else {
					$this->request->get['route'] = 'error/not_found';

					break;
				}
			}

			if (!isset($this->request->get['route'])) {
				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';
				} elseif (isset($this->request->get['path'])) {
					$this->request->get['route'] = 'product/category';
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				} elseif (isset($this->request->get['information_id'])) {
					$this->request->get['route'] = 'information/information';
				}
			}

			if (isset($this->request->get['route'])) {
				return new Action($this->request->get['route']);
			}
		}
	}

	public function rewrite($link) {
            
		$url_info = parse_url(str_replace('&amp;', '&', $link));

		$url = '';

		$data = array();

		parse_str($url_info['query'], $data);

		foreach ($data as $key => $value) {
			if (isset($data['route'])) {
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id')) {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");

					if ($query->num_rows) {
						$url .= '/' . $query->row['keyword'];

						unset($data[$key]);
					}
				} elseif ($key == 'path') {
					$categories = explode('_', $value);

					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");

						if ($query->num_rows) {
							$url .= '/' . $query->row['keyword'];
						} else {
							$url = '';

							break;
						}
					}

					unset($data[$key]);
				} 
                                elseif ($key == 'route' && $value == 'common/home') {
					$url = '/';
				}
				elseif ($key == 'route' && $this->getRwUrl($value)) {
					$url = "/".($this->getRwUrl($value));
				}
			}
		}

		if ($url) {
			unset($data['route']);

			$query = '';

			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . rawurlencode((string)$key) . '=' . rawurlencode((string)$value);
				}

				if ($query) {
					$query = '?' . trim($query, '&');
				}
			}

			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
			return $link;
		}
	}
}