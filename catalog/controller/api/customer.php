<?php
class ControllerApiCustomer extends Controller {
	public function index() {
		$this->load->language('api/customer');

		// Delete past customer in case there is an error
		unset($this->session->data['customer']);

		$json = array();
                
                //Hieu Debug
                $theRequestType = $this->request->post;
                //$theRequestType = $this->request->get; 
                
		if (!isset($this->session->data['api_id'])) {
			$json['error']['warning'] = $this->language->get('error_permission');
		} else {
			// Add keys for missing post vars
			$keys = array(
				'customer_id',
				'customer_group_id',
				'firstname',
				'lastname',
				'email',
				'telephone',
				'fax'
			);

			foreach ($keys as $key) {
				if (!isset($theRequestType[$key])) {
					$theRequestType[$key] = '';
				}
			}

			// Customer
			if ($theRequestType['customer_id']) {
				$this->load->model('account/customer');

				$customer_info = $this->model_account_customer->getCustomer($theRequestType['customer_id']);

				if (!$customer_info) {
					$json['error']['warning'] = $this->language->get('error_customer');
				}
			}

			if ((utf8_strlen(trim($theRequestType['firstname'])) < 1) || (utf8_strlen(trim($theRequestType['firstname'])) > 32)) {
				$json['error']['firstname'] = $this->language->get('error_firstname');
			}

			if ((utf8_strlen(trim($theRequestType['lastname'])) < 1) || (utf8_strlen(trim($theRequestType['lastname'])) > 32)) {
				$json['error']['lastname'] = $this->language->get('error_lastname');
			}

			if ((utf8_strlen($theRequestType['email']) > 96) || (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $theRequestType['email']))) {
				$json['error']['email'] = $this->language->get('error_email');
			}

			if ((utf8_strlen($theRequestType['telephone']) < 3) || (utf8_strlen($theRequestType['telephone']) > 32)) {
				$json['error']['telephone'] = $this->language->get('error_telephone');
			}

			// Customer Group
			if (isset($theRequestType['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($theRequestType['customer_group_id'], $this->config->get('config_customer_group_display'))) {
				$customer_group_id = $theRequestType['customer_group_id'];
			} else {
				$customer_group_id = $this->config->get('config_customer_group_id');
			}

			// Custom field validation
			$this->load->model('account/custom_field');

			$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

			foreach ($custom_fields as $custom_field) {
				if (($custom_field['location'] == 'account') && $custom_field['required'] && empty($theRequestType['custom_field'][$custom_field['custom_field_id']])) {
					$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
				}
			}

			if (!$json) {
				$this->session->data['customer'] = array(
					'customer_id'       => $theRequestType['customer_id'],
					'customer_group_id' => $customer_group_id,
					'firstname'         => $theRequestType['firstname'],
					'lastname'          => $theRequestType['lastname'],
					'email'             => $theRequestType['email'],
					'telephone'         => $theRequestType['lastname'],
					'fax'               => $theRequestType['fax'],
					'custom_field'      => isset($theRequestType['custom_field']) ? $theRequestType['custom_field'] : array()
				);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}