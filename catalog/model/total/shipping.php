<?php

class ModelTotalShipping extends Model {

    public function getTotal(&$total_data, &$total, &$taxes) {
        if ($this->cart->hasShipping() && isset($this->session->data['shipping_method'])) {
            $total_data[] = array(
                'code' => 'shipping',
                'title' => $this->session->data['shipping_method']['title'],
                'value' => $this->session->data['shipping_method']['cost'],
                'sort_order' => $this->config->get('shipping_sort_order'),
                'class' => 'fee'
            );

            if ($this->session->data['shipping_method']['tax_class_id']) {
                $tax_rates = $this->tax->getRates($this->session->data['shipping_method']['cost'], $this->session->data['shipping_method']['tax_class_id']);

                foreach ($tax_rates as $tax_rate) {
                    if (!isset($taxes[$tax_rate['tax_rate_id']])) {
                        $taxes[$tax_rate['tax_rate_id']] = $tax_rate['amount'];
                    } else {
                        $taxes[$tax_rate['tax_rate_id']] += $tax_rate['amount'];
                    }
                }
            }

            $total += $this->session->data['shipping_method']['cost'];
        }
    }

    function getCostDefault() {
        $queryString = "SELECT price FROM `" . DB_PREFIX . "vn_ship_price` WHERE zone_id=" . $this->config->get('config_zone_id');
        $query = $this->db->query($queryString);
        $thePrice = 0;
        if ($query->num_rows) {
            $thePrice = (int) $query->rows[0]['price'];
        }
        return $thePrice;
    }

}
