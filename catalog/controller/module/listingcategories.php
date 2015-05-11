<?php

class ControllerModuleListingcategories extends Controller {

    public function index($the_settings) {
        
        $this->load->language('module/listingcategories');

        $data['heading_title'] = $this->language->get('heading_title');
        
        $this->load->model('catalog/category');

        $results = $this->model_catalog_category->getCategoriesDescription($the_settings['parent_category_id']);
        
        $data['categories'] = $results;
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/listingcategories.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/listingcategories.tpl', $data);
        } else {
            return $this->load->view('default/template/module/listingcategories.tpl', $data);
        }
    } 
}