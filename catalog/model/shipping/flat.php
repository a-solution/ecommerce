<?php
class ModelShippingFlat extends Model {
	function getQuote($address) {
		$this->load->language('shipping/flat');

                $queryString = "SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('flat_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')";
                //$queryString = "SELECT gz.zone_to_geo_zone_id, gz.country_id, gz.zone_id, gz.geo_zone_id, gz.date_added, gz.date_modified, shp.price FROM " . DB_PREFIX . "zone_to_geo_zone gz "
                //        . "INNER JOIN `oc_`"
                //        . "WHERE gz.geo_zone_id = '" . (int)$this->config->get('flat_geo_zone_id') . "' AND gz.country_id = '" . (int)$address['country_id'] . "' AND (gz.zone_id = '" . (int)$address['zone_id'] . "' OR gz.zone_id = '0')";
                //$queryString = "SELECT *, (SELECT price FROM `". DB_PREFIX ."vn_ship_price` WHERE `". DB_PREFIX ."vn_ship_price`.zone_id=". DB_PREFIX ."zone_to_geo_zone.zone_id) AS 'price' FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('flat_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')";
                
		$query = $this->db->query($queryString);

		if (!$this->config->get('flat_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$quote_data = array();

                        $theCost = $this->getCost($address['zone_id']);
                        
			$quote_data['flat'] = array(
				'code'         => 'flat.flat',
				'title'        => $this->language->get('text_description'),
				//'cost'         => $this->config->get('flat_cost'),
                                'cost'         => $theCost,
				'tax_class_id' => $this->config->get('flat_tax_class_id'),
				//'text'         => $this->currency->format($this->tax->calculate($this->config->get('flat_cost'), $this->config->get('flat_tax_class_id'), $this->config->get('config_tax')))
                                'text'         => $this->currency->format($this->tax->calculate($theCost, $this->config->get('flat_tax_class_id'), $this->config->get('config_tax')))
			);

			$method_data = array(
				'code'       => 'flat',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('flat_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
        
        function getCost($zone_id){
            $queryString = "SELECT price FROM `".DB_PREFIX."vn_ship_price` WHERE zone_id=".$zone_id;
            $query = $this->db->query($queryString);
            $thePrice = 0;
            if($query->num_rows){
                $thePrice = (int)$query->rows[0]['price'];
            }
            return $thePrice;
        }
}