<?php

class ControllerCommonNewsletter extends Controller {

    public function index() {        
        $json = array();        
        
        if(isset($this->request->post))
        {
            $email = $this->request->post['email'];            
            $json['success'] = $email . ' is added successfully';
        }
        else
        {
            $json['error'] = 'System Error';
        }
        
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

}
