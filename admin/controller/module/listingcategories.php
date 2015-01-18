<?php
class Controllermodulelistingcategories extends Controller {

    private $error = array();

    public function index() {
            
        $this->load->language('module/listingcategories');

        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('catalog/category');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->load->model('setting/setting');

            //For now, just support only one instance of ListingCategories module, that's why I'm hard-coded listingcategories_module[0]
            //$savedDatas = array();
            //$savedDatas['listingcategories_module[0][parent_category_id]'] = $this->request->post['listingcategories_parent_category_id'];
            
            $this->model_setting_setting->editSetting('listingcategories', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->cache->delete('listingcategories');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_module'] = $this->language->get('text_module');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['heading_title'] = $this->language->get('heading_title');
        $data['entry_parent_category'] = $this->language->get('entry_parent_category');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        $data['form_action'] = $this->url->link('module/listingcategories', 'token=' . $this->session->data['token'], 'SSL');

        $data['categories'] = $this->getAllCategories();
        
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->request->post['listingcategories_parent_category_id'])) {
            $data['listingcategories_parent_category_id'] = $this->request->post['listingcategories_parent_category_id'];
        } else {
            $data['listingcategories_parent_category_id'] = $this->config->get('listingcategories_parent_category_id');
        }
        if (isset($this->request->post['listingcategories_status'])) {
            $data['listingcategories_status'] = $this->request->post['listingcategories_status'];
        } else {
            $data['listingcategories_status'] = $this->config->get('listingcategories_status');
        }
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/listingcategories', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/listingcategories.tpl', $data));
    }

    private function validate() {
        if ($this->error) {
            return false;
        } else {
            return true;
        }
    }
    
    private function getAllCategories() {

        $data['categories'] = array();

        $results = $this->model_catalog_category->getAllCategoryDescriptions();

        foreach ($results as $result) {
            $data['categories'][] = array(
                'id'               => $result['category_id'],
                'name'             => $result['name'],
                'language_id'      => $result['language_id']
            );
        }   
        
        return $data['categories'];
    }
}